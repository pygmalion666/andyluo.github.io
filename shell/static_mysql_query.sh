#!/usr/bin/env bash

# 统计 MySQL 查询次数
while :;
do sleep 1;
    mysql -u user -ppass -h 10.16.6.97 -P 3306 -e 'show status like "Questions";';
done | grep --line-buffered Ques | awk '{print $2 - old; old = $2; fflush();}'