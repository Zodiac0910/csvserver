a=0
while [ $a -lt $1 ]
do 
echo "$a,$RANDOM" >>inputFile
a=`expr $a + 1` 
done
