#!/usr/bin/env bash
# suppose I have .srt files (i.e subtitles files) having name like xyz_en.srt,abc_en.srt... so on
# in current directory and I want to rename them as xyz.srt, abc.srt then just run this script

for i in *.srt
do
  newname=`echo "$i" | cut -d'_' -f1`
  mv $i $newname.srt
done;
