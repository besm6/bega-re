#!/usr/bin/expect --
spawn $env(HOME)/src/github/dispak/dispak/dispak -s pult2.b6
expect 	"ПУЛЬТ*\r\n-\r"

send	"з буф=тт\r"
expect 	"*\r\n:\033"

#
# Вводим содержимое заданного файла.
#
set fp [open landing.pas]
fconfigure $fp -buffering line
while 1 {
	gets $fp line
	if [eof $fp] break
	if { $line == "" } {
		set line " "
	}
	send	"$line\\\r"
	expect 	":\033"
}
close $fp

send	"//\r"
expect 	"*\r\n-\r"

send	"пас буф\r"
interact
