l='wc -l < test.txt'
m='wc -l < temp.txt'
a=0
for (( j=1;j<=m;j++ ))
do
  a=`head -n $j temp.txt | tail -n 1`
  echp "$a"
  f=0
  for (( i=1;i<=l;i++ ))
  do
    x=`head -n $i test.txt | tail -n 1 | cut -d " " -f 1`
    y=`head -n $i test.txt | tail -n 1 | cut -d " " -f 1`
    z=`head -n $i test.txt | tail -n 1 | cut -d " " -f 1`
    out=`sh ./gcd1.sh $x $y`
    if [ $out -ne $z ]
    then
      f=$((f+1))
      break
    fi
  done
  if [ $f -eq 0 ]
  then
    echo "Passed"
  else
    echo "Failed $((l-f)) testcases passed"
  fi
done