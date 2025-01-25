echo "Total number of arguments : $#"

for i in $*
do
  if [ -f $i ]
  then
    echo "File $i exists"
    if [ ! -x $i ]
    then
      chmod g+x $i
      ls -l $i
    fi
  else
    echo "File $i does not exist"
  fi
done