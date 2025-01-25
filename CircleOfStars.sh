//Circle of Stars using Shell script

echo "Enter the radius : "
read r
for (( i=0; i<=360; i++ )) {
  th1=`echo "scale=5; $i*3.14/180" | bc | awk '{print cos($1)}'`
  th2=`echo "scale=5; $i*3.14/180" | bc | awk '{print sin($1)}'`

  x=`echo "scale=5; $r*$th1" | bc | awk '{print int($1)}'`
  y=`echo "scale=5; $r*$th2" | bc | awk '{print int($1)}'`

  x=$((x+12))
  y=$((y+40))

  tput cup $x $y
  echo "*"
}
tput cup $(tput lines)