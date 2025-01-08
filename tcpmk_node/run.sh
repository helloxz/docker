#!/bin/sh

# 运行zdir
run() {
    cd /opt/tcpmk_node
    chmod +x sh/*.sh
    # 设置DNS
    # echo "nameserver 223.5.5.5" > /etc/resolv.conf
    # echo "nameserver 119.29.29.29" >> /etc/resolv.conf
    # 后台运行Zdir
    ./tcpmk_node start
    # 判断架构
    # get_arch=$(arch)
    # if [[ "${get_arch}" == "x86_64" ]]
    # then
    #     ./zdir start
    # elif [[ "${get_arch}" == "aarch64" ]]
    # then
    #     ./zdir_arm64 start
    # else
    #     ./zdir_arm start
    # fi
}

run