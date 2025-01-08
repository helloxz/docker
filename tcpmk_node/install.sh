#!/bin/sh

BASE_DIR="/opt/tcpmk_node"

# 初始化环境
init() {
    #更新软件
    apk update
    #安装timezone
    apk add -U tzdata
    #安装必要软件
    apk add curl wget
    #查看时区列表
    ls /usr/share/zoneinfo
    #拷贝需要的时区文件到localtime
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    #查看当前时间
    date
    #为了精简镜像，可以将tzdata删除了
    apk del tzdata
    #拷贝运行文件
    chmod +x /root/run.sh
    cp /root/run.sh /usr/sbin/
}

# 下载包
install() {
    cd ${BASE_DIR}
    wget https://soft.xiaoz.org/UniBin/tcpmk_node/tcpmk_node.tar.gz
    tar -zxvf tcpmk_node.tar.gz
    rm -rf tcpmk_node.tar.gz
    chmod +x tcpmk_node
}

init && install