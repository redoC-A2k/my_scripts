#!/usr/bin/bash

for item in ./*; do
  if [[ `file "${item}" | cut -d':' -f2` == " directory" ]]; then
    cd "$item"
    echo "In directory = $item"
    total_videos=`ls -l | grep mp4 | wc -l`
    i=1
    for file in ./* ; do
      if [[ `echo "$file" | cut -d'.' -f3` == "mp4" ]]; then
        echo "+++++++++  Processing ... $i/$total_videos"
        echo $file
        video_name=`echo "$file" | cut -d'.' -f2`
        video_name=${video_name:1}
        ffmpeg -hide_banner -i "$file" -vf scale=-2:720 -c:a copy -c:v h264_qsv "out_$video_name.mp4"
        echo "done !"
        mv "out_$video_name.mp4" "$video_name.mp4"
        i=$((i + 1))
      fi
    done
    cd ..
  fi
done
