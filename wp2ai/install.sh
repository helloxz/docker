#!/bin/sh

BASE_DIR="/opt/wp2ai"

# 初始化环境
init() {
    # 导入公钥
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0E98404D386FA1D9 6ED0E7B82643E131 F8D2585B8783D481 54404762BBB6E853 BDE6D2B9216EC7A8
    echo "already import"

    # 更新软件
    apt-get update
    
    # 安装必要软件
    apt-get install -y curl wget build-essential && rm -rf /var/lib/apt/lists/*

    # 拷贝运行文件
    chmod +x /root/run.sh
    cp /root/run.sh /usr/sbin/
}

# 下载包
install() {
    cd ${BASE_DIR}
    wget https://soft.xiaoz.org/UniBin/wp2ai/wp2ai.tar.gz
    tar -zxvf wp2ai.tar.gz
    rm -rf wp2ai.tar.gz
    chmod +x wp2ai
}

init && install