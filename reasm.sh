#!/bin/sh
~/src/github/dispak/besmtool/besmtool dump 1234 --start=0200 --length=6 --to-file=re-bega.o
./dtran -f 02642 -n -E entry.txt -d re-bega.o > re-bega.asm
