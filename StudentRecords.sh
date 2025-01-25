#Student records create, read, update and delete

create(){
  echo "Enter name :"
  read name
  echo "Enter the roll number : "
  read roll
  echo "Enter the marks : "
  read marks
  echo "$name | $roll | $marks" >> records.txt
  echo "Inserted"
}

delete(){
  echo "Enter the roll number : "
  read roll
  for i in $(req 1 $line)
  do
    a=`head -n $i records.txt | tail -n 1 | cut -d " | " -f 1`
    b=`head -n $i records.txt | tail -n 1 | cut -d " | " -f 2`
    c=`head -n $i records.txt | tail -n 1 | cut -d " | " -f 3`
    if [ $b -eq $roll ]
    then
      continue
    else
      echo "$a | $b | $c" >> temp.txt
    fi
  done
  mv temp.txt records.txt
  echo "Deleted"
}


delete2(){
  echo "Enter roll to be deleted :"
  read roll
  grep -v "$roll" records.txt > temp.txt
  mv temp.txt records.txt
  echo "Deleted"
}

update(){
  echo "Enter roll to be updated :"
  read roll
  echo "Enter new marks : "
  read marks
  for i in $(req 1 $line)
  do
    a=`head -n $i records.txt | tail -n 1 | cut -d " | " -f 1`
    b=`head -n $i records.txt | tail -n 1 | cut -d " | " -f 2`
    c=`head -n $i records.txt | tail -n 1 | cut -d " | " -f 3`

    if [ "$b" == "$roll" ]
    then
      echo "$a | $b | $marks" >> temp.txt
    else
      echo "$a | $b | $c" >> temp.txt
    fi
  done
  mv temp.txt records.txt
  echo "Updated"
}
update2(){
  echo "Enter roll to be updated :"
  read roll
  echo "Enter new marks : "
  read marks
  grep -v "$roll" records.txt > temp.txt
  echo "$roll | $marks" >> temp.txt
  mv temp.txt records.txt
  echo "Updated"
}


while [ true ]
do
  line=`wc -l < records.txt`
  echo "1. Create"
  echo "2. Delete"
  echo "3. Update"
  echo "4. Display"
  echo "5. Exit"
  echo "Enter your choice : "
  read choice
  case $choice in
    1) create;;
    2) delete;;
    3) update;;
    4) if [ $line -eq 0 ]
       then
         echo "No records"
       else
         echo "Name | Roll | Marks"
         cat records.txt
       fi;;
    5) exit;;
    *) echo "Invalid choice"
  esac
done