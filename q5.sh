#! /bin/bash
str=$1
reverse=$(echo $str | rev)
echo "the reverse string is (part a): $reverse"

echo -n "the reverse string with the replace letters are (part b): "

# replace=$(echo $reverse | tr "[:upper:]" "[:lower:]" )

for ((i=0; i<${#reverse}; i++))
do  
	y=$(echo ${reverse:$i:1})
	y=$(echo "$y" | tr "[a-y]z" "[b-z]a" | tr "[A-Y]Z" "[B-Z]A")
	echo -n "$y"
done
echo ""

let half_length=${#reverse}/2
half_reverse=$(echo ${reverse:half_length:half_length})
# half_reverse=$(echo $half_reverse | rev)
echo -n "the half reversed string is (part c): $half_reverse"
echo ${str:$half_length:$half_length}

