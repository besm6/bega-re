#!/usr/bin/env python3
"""Verify launcher exit with a terminal still open, without an extra Enter."""
import hashlib
import os
from pathlib import Path
import pty
import shutil
import signal
import subprocess
import sys
import tempfile


ROOT = Path(__file__).resolve().parents[1]


def terminal_session(command, text, env, status=0):
    master, slave = pty.openpty()
    try:
        proc = subprocess.Popen(command, stdin=slave, stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE, env=env, start_new_session=True)
        os.close(slave)
        slave = None
        try:
            if text:
                os.write(master, text.encode())
            output, errors = proc.communicate(timeout=5)
        finally:
            if proc.poll() is None:
                os.killpg(proc.pid, signal.SIGKILL)
                proc.communicate()
        assert proc.returncode == status, (command, proc.returncode, output, errors)
        return output.decode()
    finally:
        if slave is not None:
            os.close(slave)
        os.close(master)


def main():
    sources = {}
    with tempfile.TemporaryDirectory(prefix='launcher-check-', dir=ROOT/'build') as temp:
        for name, directory, commands, marker in (
            ('jinn', ROOT/'build/jinn/volumes', 'кон\n', 'ДО СВИДАНИЯ !'),
            ('bega', ROOT/'build/bega/volumes', 'кон\nконец\n', 'ВРЕМЯ РЕШ:'),
            ('bibl', ROOT/'build/volumes', 'кон\nконец\n', 'ВРЕМЯ РЕШ:'),
        ):
            private = Path(temp)/name
            private.mkdir()
            for volume in ('2068','2048','2060','kalah.bin'):
                source = directory/volume
                if source.exists():
                    sources[source] = hashlib.sha256(source.read_bytes()).hexdigest()
                    shutil.copy2(source, private/volume)
            output = terminal_session([str(ROOT/f'run-{name}.sh')], commands,
                                      dict(os.environ, **{name.upper()+'_VOLUMES':str(private)}))
            assert marker in output, (name, output)
        terminal_session([sys.executable, str(ROOT/'tools/run-session.py'),
                          'диал', sys.executable, '-c', 'raise SystemExit(7)'],
                         '', dict(os.environ), status=7)
    for path, digest in sources.items():
        assert hashlib.sha256(path.read_bytes()).hexdigest() == digest, path
    print('PASS: JINN, BEGA and BIBL exited with terminal input still open; emulator status retained')


if __name__ == '__main__':
    main()
