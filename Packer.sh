times_compressed=0

if [ $# -eq 1 ]
then
times_compressed=100
else
times_compressed=$2
fi

if [ $# -eq 0 ]
then
echo "give file name!"
else
:
fi

tar -czf $1.tar.gz $1

for (( i=1 ; i < $times_compressed ; i++)) do

if [ $(($i%2)) -eq 1 ]
then
zip $1.zip $1.tar.gz
rm $1.tar.gz
else
tar -czf $1.tar.gz $1.zip
rm $1.zip
fi

done
