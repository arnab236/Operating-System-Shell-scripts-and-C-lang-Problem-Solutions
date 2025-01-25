gcd(){
  if [ $1 % $2 -eq 0 ]
  then
    echo $2
  else
    gcd $2 `expr $1 % $2`
  fi
}

x=$1
y=$2
if [ $x =^-?[0-9]+$ || $y =^-?[0-9]+$ ]
then
  echo "Not Possible"
  break
elif [ $y -eq 0 ]
then
  echo "Not possible"
  break
elif [ $x -eq 0 ]
then
  echo "$x"
  break
else
  ans=$(( gcd $x $y ))
  echo $ans
fi