#!/usr/bin/env bash

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
