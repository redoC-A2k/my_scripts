for i in `ls` ; do
  if [[ $i != *"$"* && `echo $i | cut -d "." -f 1` =~ ^prog  &&  `echo $i | cut -d "." -f 2` == "class" ]] ; then
    file=$(echo $i | cut -d "." -f 1)
    echo -------- "$file".java : output ---------
    java $file
  fi
done
