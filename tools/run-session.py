#!/usr/bin/env python3
"""Send the PULT archive prelude, forwarding input until the emulator exits."""
import os
import select
import signal
import subprocess
import sys


def main():
    if len(sys.argv) < 3:
        sys.exit('usage: run-session.py <archive> <emulator> [arguments...]')
    archive = sys.argv[1]
    with subprocess.Popen(sys.argv[2:], stdin=subprocess.PIPE) as emulator:
        # The emulator handles terminal interrupts itself (including its
        # debugger); the forwarding process must remain available for input.
        previous = signal.signal(signal.SIGINT, signal.SIG_IGN)
        try:
            try:
                emulator.stdin.write(f'арх {archive},40,100\n{archive}\n'.encode())
                emulator.stdin.flush()
                while emulator.poll() is None:
                    if not select.select([sys.stdin.fileno()], [], [], 0.1)[0]:
                        continue
                    data = os.read(sys.stdin.fileno(), 8192)
                    if not data:
                        break
                    emulator.stdin.write(data)
                    emulator.stdin.flush()
            except BrokenPipeError:
                pass
            finally:
                try:
                    emulator.stdin.close()
                except BrokenPipeError:
                    pass
            status = emulator.wait()
        finally:
            signal.signal(signal.SIGINT, previous)
    return status if status >= 0 else 128-status


if __name__ == '__main__':
    sys.exit(main())
