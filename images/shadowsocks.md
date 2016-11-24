shadowsocks 翻墙小结

这个东西是完全开源在程序员界最大的代码分享网站，Github 的，https://github.com/shadowsocks/，不放心可以去验证哈。

配置一台国外的服务器，需要 paypal 付款，注册 paypal 很简单。
联通的网，用 https://www.vultr.com/ 的 日本节点，5 美元一个月的，操作系统选择，ubuntu 14.04。
电信的网，用 https://hostus.us/kvm-vps.html 的 洛杉矶节点，4.75 美元一个月，操作系统选择，ubuntu 14.04。

创建完毕会分配一个 ip 地址。

然后用 ssh 连接到你配置的服务器上，如果是 mac 电脑，直接用 terminal，windows 下载一个 putty。

输入命令 

ssh root@ip地址

会提示输入密码。hostus 会有提醒，vultr 的会显示在网页上。（命令行下输入密码是不会有显示的，尽管输就可以）

想省事，直接运行，我自己写了一个自动安装的脚本...

wget https://gist.githubusercontent.com/judi0713/df258be5bad4b1361a7cf1669fbfdc28/raw/958e0a063ae6fb1627686f25cd524e565496a3d6/SS.sh

如果不放心脚本，可以在浏览器直接输入 https://gist.githubusercontent.com/judi0713/df258be5bad4b1361a7cf1669fbfdc28/raw/958e0a063ae6fb1627686f25cd524e565496a3d6/SS.sh 和我下面的每一步说明具体比对一下。

然后再运行

bash SS.sh

从 https://github.com/shadowsocks/shadowsocks-android/releases 下载安卓客户端
从 https://github.com/shadowsocks/shadowsocks-windows/releases 下载 windows 客户端
从 https://github.com/shadowsocks/shadowsocks-iOS/releases 下载 Mac 客户端
从 app store 下载 shadowrocket 或者 土豆丝，iOS 版本

输入的 ip 地址就是分配的。
端口号是 8388 或者 443。
输入的密码是 test。下面有说怎么修改。
输入的加密方式试 aes-256-cfb
其他都默认。





下面的方法就是我写的脚本的具体内容只不过需要一步一步去做。建议就用我写的脚本...

先更新系统。

`apt-get update`

之后安装 emacs 和 python-pip。

`apt-get install emacs python-pip`

用 pip 安装 shadowsocks。

`pip install shadowsocks`

增加 shadowsocks 的配置文件。

`emacs /etc/shadowsocks.json`

{
    "server":"45.55.xx.xx",
    "server_port":8388,
    "local_address": "127.0.0.1",
    "local_port":1080,
    "password":"test",
    "timeout":300,
    "method":"aes-256-cfb",
    "fast_open": false
}

server 填上你的服务器地址。
server_port 是你的远程端口号。
password 是密码。
method 是加密方式。
其他可以不变。

如果想配置多端口。

{
"server":"0.0.0.0",
"port_password":
{
"8388": "raisevps1",
"443": "raisevps1"
},
"local_address": "127.0.0.1",
"local_port":1080,
"timeout":300, 
"method":"aes-256-cfb",
"fast_open": true
}

之后启动。

`ssserver -c /etc/shadowsocks.json -d start`

暂停是

`ssserver -c /etc/shadowsocks.json -d stop`

重启是

`ssserver -c /etc/shadowsocks.json -d restart`


shadowsocks 官方 Optimizing Shadowsocks

修改 `limits.conf`

`emacs /etc/security/limits.conf`

```
* soft nofile 51200
* hard nofile 51200
```

`ulimit -n 51200`

`emacs /etc/sysctl.d/local.conf`

```
# max open files
fs.file-max = 51200
# max read buffer
net.core.rmem_max = 67108864
# max write buffer
net.core.wmem_max = 67108864
# default read buffer
net.core.rmem_default = 65536
# default write buffer
net.core.wmem_default = 65536
# max processor input queue
net.core.netdev_max_backlog = 4096
# max backlog
net.core.somaxconn = 4096

# resist SYN flood attacks
net.ipv4.tcp_syncookies = 1
# reuse timewait sockets when safe
net.ipv4.tcp_tw_reuse = 1
# turn off fast timewait sockets recycling
net.ipv4.tcp_tw_recycle = 0
# short FIN timeout
net.ipv4.tcp_fin_timeout = 30
# short keepalive time
net.ipv4.tcp_keepalive_time = 1200
# outbound port range
net.ipv4.ip_local_port_range = 10000 65000
# max SYN backlog
net.ipv4.tcp_max_syn_backlog = 4096
# max timewait sockets held by system simultaneously
net.ipv4.tcp_max_tw_buckets = 5000
# turn on TCP Fast Open on both client and server side
net.ipv4.tcp_fastopen = 3
# TCP receive buffer
net.ipv4.tcp_rmem = 4096 87380 67108864
# TCP write buffer
net.ipv4.tcp_wmem = 4096 65536 67108864
# turn on path MTU discovery
net.ipv4.tcp_mtu_probing = 1

# for high-latency network
net.ipv4.tcp_congestion_control = hybla

# for low-latency network, use cubic instead
# net.ipv4.tcp_congestion_control = cubic
```

之后

`sysctl --system`


