#!/bin/sh

# 运行zdir
run() {
    # 启动 Redis
    redis-server /opt/tcp_mk/conf/redis.conf --daemonize yes

    # 检查 Redis 是否启动成功
    if [ $? -eq 0 ]; then
        echo "Redis started successfully."
    else
        echo "Failed to start Redis."
        exit 1
    fi
    cd /opt/tcp_mk/
    chmod +x sh/*.sh
    # 设置DNS
    # echo "nameserver 223.5.5.5" > /etc/resolv.conf
    # echo "nameserver 119.29.29.29" >> /etc/resolv.conf
    # 后台运行Zdir
    ./tcp_mk start
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