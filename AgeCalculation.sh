echo "Enter the date of birth (dd/mm/yyyy) : "
read dob
IFS="/"
set $dob
d=$1
m=$2
y=$3
echo "Date of birth : $d/$m/$y"
dd=`date +%d`
mm=`date +%m`
yy=`date +%Y`
echo "Current date : $dd/$mm/$yy"

ad=`expr $dd - $d`
am=`expr $mm - $m`
ay=`expr $yy - $y`

if [ $dd -lt $d ]
then
  ad=`expr $ad + 30`
  am=`expr $am - 1`
fi

if [ $mm -lt $m ]
then
  am=`expr $am + 12`
  ay=`expr $ay - 1`
fi

echo "Age : $ay years $am months $ad days "
