#! /bin/bash
file=$1
size=$(wc -c $file | awk '{print $1}')
echo "the file size in bytes is: $size"
lines=$(wc -l $file | awk '{print $1}')
echo "the no. of lines in the file is: $lines"
words=$(wc -w $file | awk '{print $1}')
echo "the no. of words in the file is: $words"

line_count=1
while read -r line
do
	echo "Line No: $line_count - $( echo $line | wc -w )"
	let line_count+=1
done < $1 

tr " " "\n" < $file | tr '~' " " | sed -E '/^$/d' > h.txt

while read line
do
	var=$(grep -o -i $line $1 | wc -l )
	if [[ $var -gt 1 ]]
	then
	echo "$line : $var" #$(grep -o -i $line $1 | wc -l )"
    fi 
done < h.txt > out.txt

awk '!seen[$0]++' < out.txt 

rm ./h.txt
rm ./out.txt
