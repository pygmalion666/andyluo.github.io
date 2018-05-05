#!/usr/bin/env bash

# The commands come from a funny site--https://commandlinefu.cn/

# 在gz内查找
zcat /usr/share/man/man1/grep.1.gz | grep "color"

# 从当前目录递归删除所有0kb大小的文件
find . -empty -type f -delete

# 杀死所有进程(用firefox举例)
ps aux | grep -i firefox | grep -v grep | awk '{print $2}' | xargs -t -i kill -9 {}

# 查看指定进程的打开的文件描述符
lsof -c <process name> -r

# 进制转换 (60进制 时间转换)
bc <<< 'obase=60;299'

# 测试dns响应时间
# yum install bind-utils
server=8.8.8.8; host="apple.com"; queries=128; for i in `seq $queries`; do let x+=`dig @${server} $host | grep "Query time" | cut -f 4 -d " "`; done && echo "scale=3;($x/${queries})" | bc

# 比较远程和本地文件
diff <(ssh user@host cat /path/to/remotefile) /path/to/localfile

# 批量修改大小
mogrify -resize 852x480 *.png

# 目录管理
alias md='mkdir -p'; alias rd='rmdir'; mcd () { mkdir "$@" && cd "$_"; }

# 从Apache访问日志文件末尾，打印用户访问时的独立IP地址
tail -f /var/log/apache2/access.log | awk -W interactive '!x[$1]++ {print $1}'

# 复制工作目录，在显示进度的同时进行压缩
tar -cf - . | pv -s $(du -sb . | awk '{print $1}') | gzip > out.tgz

# 获取ffmpeg的信息
ffmpeg -i filename.flv

# 使用cut反选一列
cut -f5 --complement

# 从火狐缓存中获取MP3音频文件
find ~/.mozilla/firefox/*/Cache -exec file {} \; | awk -F ': ' 'tolower($2)~/mpeg/{print $1}'

# 把路径压到目录栈
pushd /tmp

# 在Debian配置Runlevel
rcconf

# 清理空行
sed '/^$/d' /tmp/data.txt > /tmp/output.txt

# 图片重命名工具
ls -1 *.jpg | while read fn; do export pa=`exiv2 "$fn" | grep timestamp | awk '{ print $4 " " $5 ".jpg"}' | tr ":" "-"`; mv "$fn" "$pa"; done

# 删除vim的临时文件
find . -name "*~" -exec rm {} \;

# kde4 锁屏命令
qdbus org.freedesktop.ScreenSaver /ScreenSaver Lock


# 交互式地查询某台服务器能否ping通
echo -n "IP Address or Machine Name: "; read IP; ping -c 1 -q $IP >/dev/null 2>&1 && echo -e "\e[00;32mOnline\e[00m" || echo -e "\e[00;31mOffline\e[00m"

# 计算 1+1
echo $(( 1+1 ))

# 监控最新修改的文件
watch 'ls -tr1 | tail -n1 | xargs tail'

# 以root身份运行上一条命令
sudo !-1

# 给文件内容加上文件名前缀
for i in *; do sed -i "s/^/$i: /" $i; done

# 用Python一行秒杀FizzBuzz问题
python -c'for i in range(1,101):print"FizzBuzz"[i*i%3*4:8--i**4%5]or i'

# 获取当前目录下所有文件夹的大小，按人类可读形式排序
du -h | sort -hr

# 隐私模式（进入不纪录命令历史的模式）
alias private_mode='unset HISTFILE && echo -e "\033[1m[\033[0m\033[4m*\033[0m\033[1m] \033[0m\033[4mprivate mode activated.\033[0m"'

# 运行php语法检查
find . -name "*.php" -exec php -l {} \; | sed -e "/^No syntax/d"

# 设置终端不换行
function nowrap { export COLS=`tput cols` ; cut -c-$COLS ; unset COLS ; }

# 今天是第几周
ruby -e 'require "date"; puts DateTime.now.cweek'

# 检查笔记本是电池供电还是线缆供电
acpi -b

# 查看证书详情
openssl x509 -in filename.crt -noout -text

# 查看apache在干什么
pidof httpd | sed 's/ / -p /g' | xargs strace -fp

# 限制scp所占用的带宽
scp -l10 pippo@serverciccio:/home/zutaniddu/* .

# 批量替换配置中的关键字
find -type f -name '*.conf' -exec sed -Ei 's/foo/bar/' '{}' \;

# 把30天前修改的文件移动到 old 目录
find . -mtime +30 -exec mv {} old/ \;

# 打开ascii 表
man ascii

# 查看打开的端口
lsof -i -P | grep -i "listen"

# 生成wifi热点二维码
qrencode -s 7 -o qr-wifi.png "WIFI:S:$(zenity --entry --text="Network name (SSID)" --title="Create WiFi QR");T:WPA;P:$(zenity --password --title="Wifi Password");;"

# 导出mdb
mdb-export -H -I -R database.mdb table >table.sql

# 查看known_hosts信息
ssh-keygen -l -f ~/.ssh/known_hosts

# 升级所有perl mod
perl -MCPAN -e 'CPAN::Shell->install(CPAN::Shell->r)'

# Url Encode
# echo "$@" | sed 's/ /%20/g;s/!/%21/g;s/"/%22/g;s/#/%23/g;s/\$/%24/g;s/\&/%26/g;s/'\''/%27/g;s/(/%28/g;s/)/%29/g;s/:/%3A/g'

# 每5行打印其中3行
sed -n '1~5{N;N;p}' file.txt

# 用awk求和
ps -ylC httpd --sort:rss | awk '{ SUM += $8 } END { print SUM/1024 }'

# 如何不用uname查看内核版本
strings /boot/kernel-file | grep 2.6

# 找出写入大于1000k的
iotop -o -b -d 1 -P -k|awk '/^[1-9]/{if($6>1000){print $0}}'

#监听一个端口(33210)(telnet 可以发送内容)
nc -l 33210

# 自动ssh密码
SSHPASS='your_password' sshpass -e ssh me@myhost.com

# 递归列出包含给定搜索字符串的文件
find /path/to/dir -type f -print0 | xargs -0 grep -l "foo"

# 列求和
awk '{s+=$1}END{print s}' /tmp/test.log

# 生成MD5
echo -n "String to MD5" | md5sum | cut -b-32

# 递归的计算行数
find ./ -not -type d | xargs wc -l | cut -c 1-8 | awk '{total += $1} END {print total}'  ​​​

# 查看 TCP 和 UDP 链接
netstat -nlput

# 用tee命令和进程替换机制，把标准输出传给多个命令当作输入文件
some_command | tee >(command1) >(command2) >(command3) ... | command4

# 递归的计算行数
find ./ -not -type d | xargs wc -l | cut -c 1-8 | awk '{total += $1} END {print total}'

# 导出mysql为.csv
echo "SELECT * FROM table; " | mysql -u root -p${MYSQLROOTPW} databasename | sed 's/\t/","/g;s/^/"/;s/$/"/;s/\n//g' > outfile.csv

# 获得脚本的运行路径
BASEDIR=$(dirname $(readlink -f $0))

# 列出50个大文件
find . -type f -name '*.pm' -printf '%6s %p\n' | sort -nr | head -n 50 

# 密码生成器
pwgen --alt-phonics --capitalize 9 10

# 获取所有 mac 地址
ip link show

# 统计访问量多余20次的ip
tail -n2000 /var/www/domains/*/*/logs/access_log | awk '{print $1}' | sort | uniq -c | sort -n | awk '{ if ($1 > 20)print $1,$2}'

# 发送请求到远程服务
curl -D - -X POST -H 'Content-type: text/xml' -d @XML http://remote_server:8080/web-service/soap/WSName 

# 目录树
tree -d

# 查看 CPU 信息
lscpu

# 定时启动wget下载
echo 'wget url' | at 01:00

# 提取文件中的标签
awk -vRS="</Tag2>" '/<Tag2>/{gsub(/.*<Tag2>/,"");print}' file 

# 查看 tcp 连接 osx 也支持
sudo lsof -i -n -P | grep TCP

# 就地查找/替换后备日期戳 
sed -i.`date +%Y%m%d` -e 's/pattern/replace' [filename]

# 按 ip 分组的 netstat
netstat -nt | awk -F":" '{print $2}' | sort | uniq -c

# 列出2到100的素数
for num in `seq 2 100`;do if [ `factor $num|awk '{print $2}'` == $num ];then echo -n "$num ";fi done;echo

# 列出2到100之间的质数
seq 2 100 | factor | sed '/ .* / d ; s/:.*//'

# 获取网页的所有连接
lynx -dump http://www.domain.com | grep http| awk '{print $2 }'

# 获取网页的所有连接
lynx -dump http://www.domain.com | awk '/http/{print $2}'

# 获取网页的全部链接
lynx -dump http://domaim.com | egrep -o -e 'http://[/0-9a-z.]+html'

# 获取一个网站上的所有链接
lynx -dump http://www.domain.com | awk '/http/{print $2}' | egrep "^https{0,1}"

# 提供一个正则表达式，获取一个网站上所有匹配该模式的URL
lynx --dump "http://www.google.com.br" | egrep -o "http:.*"

# 显示所有静态调用的PHP类文件列表
find . -name "*\.php" | xargs grep -o --color "\w\+::\w\+" | cut -d":" -f2 | sort | uniq -c

# 检查所有的MySQL表
myisamchk /path/to/mysql/files/*.MYI

# 清空文件
: > file.txt

# 如何查看大文件的某行
sed '1000000!d;q' < massive-log-file.log

# 快速创建一个文件的备份
cp file.txt{,.bak}

# 创建一个不包含svn目录的zip压缩包
zip -r myfile.zip * -x \*.svn\*

# 带有压缩的scp
tar czv file1 file2 folder1 | ssh user@server tar zxv -C /destination

# 比较远程和本地文件
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -

# 比较两个未排序的文件
diff <(sort file1) <(sort file2)

# 查看所有没有被注释掉的行
grep -v "^#" file.txt | more

# 持续观察eth0上的数据变化
watch ifconfig eth0

# 统计 httpd 的进程数量和内存使用
ps awwwux | grep httpd | grep -v grep | awk '{mem = $6; tot = $6 + tot; total++} END{printf("Total procs: %d\nAvg Size: %d KB\nTotal Mem Used: %f GB\n", total, mem / total, tot / 1024 / 1024)}'

# 查询 mysql 的查询数量
echo "SHOW PROCESSLIST\G" | mysql -u root -p | grep "Info:" | awk -F":" '{count[$NF]++}END{for(i in count){printf("%d: %s\n", count[i], i)}}' | sort -n

# 计算 pow
bc -l <<< "x=2; p=0.5; e(l(x)*p)" 

# 如何对齐显示结果
df -P | column -t

# 以表格的形式列出当前已挂载的文件系统
mount | column -t

# 备份所有mysql数据库到单独的文件
for I in $(mysql -e 'show databases' -s --skip-column-names); do mysqldump $I | gzip > "$I.sql.gz"; done

# 读取设备的ip
/sbin/ip -f inet addr | sed -rn 's/.*inet ([^ ]+).*(eth[[:digit:]]*(:[[:digit:]]+)?)/\2 \1/p' | column -t

# 查看所有 ipv4d 地址
alias ips='ip a | awk '\''/inet /&&!/ lo/{print $NF,$2}'\'' | column -t'

# 格式化文本为表格
cat /etc/passwd | column -ts: 

# 列出当前目录下占用空间最大的十个文件或目录
du -sb *|sort -nr|head|awk '{print $2}'|xargs du -sh 

# 在当前目录不超过两级深度的范围内查找最近五天修改过的文件
find . -maxdepth 3 -mtime -5 -type f

# 解决通配符提示 Arguments too long 一种方法
find . -name "*.txt" -exec WHATEVER_COMMAND {} \;

# 快而粗暴的文件树比对方式
ls -Rl dir1/ > /tmp/dir1.ls; ls -Rl dir2/ > /tmp/dir2.ls; meld /tmp/dir1.ls /tmp/dir2.ls  