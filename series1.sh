# x + x^2/2! + x^3/3! + ... + x^n/n!
# This script is used to calculate

fact(){
  k=$1
  if [ $k -le 1 ]
  then
    echo 1
  else
    echo $(( $k * `fact $(( $k - 1 )) `))
  fi
}

seriesTerm(){
  x=$1
  n=$2
  factorial=`fact $n`
  s=`echo "scale=5; ($x^$n)/$factorial" | bc`
  
}

echo "Enter value of x :"
read x
echo "Enter value of n :"
read n
sum=0
for (( i=1; i<=n; i++ ))
do
  term=`seriesTerm $x $i`
  sum=`echo "scale=5; $sum+$term" | bc`
done
echo "Sum of series is $sum"