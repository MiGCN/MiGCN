#!/bin/bash
del_date=`date +%Y-%m-%d -d "now"`
for n in `ls *.log  -1`;do
    m=`echo $n | awk -F. '{print $(NF-1)}'`
    m=`echo ${m:0-0:10}`
    if [ ! $m ]; then
        echo "IS NULL"
        continue
    fi
    if [[ $m < $del_date || $m = $del_date ]];then
        echo file $n will be deleted.
        rm -rf $n
    fi
done
