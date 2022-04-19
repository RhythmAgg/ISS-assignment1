#! /bin/bash
file=$1
sed -E '/^$/d' < $file >q1_a.txt

awk '!seen[$0]++' < q1_a.txt 
