for i in `ls` ; do
  if [[ `echo $i | cut -d "." -f 2` == "class" ]] ; then
    file=$(echo $i | cut -d "." -f 1)
    # echo -------- output of "$file".java : executed by afshan \(IT-2K19-03\) ---------
    `xdotool type "java $file" && xdotool key KP_Enter` &> /dev/null
  fi
done
