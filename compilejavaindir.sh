for i in `ls` ; do
  if [[ `echo $i | cut -d "." -f 2` == "java" ]]  ; then
    file=$(echo $i)
    echo -------- compiling : "$file" ---------
    javac $file -Xlint:unchecked
  fi
done
