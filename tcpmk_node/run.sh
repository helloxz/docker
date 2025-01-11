#!/bin/sh

BASE_DIR="/opt/tcpmk_node"

upgrade_tcpmk_node() {
    cd ${BASE_DIR}
    # 1. Check if /opt/tcpmk_node/tcpmk_node.tar.gz exists
    if [ -f "/opt/tcpmk_node/tcpmk_node.tar.gz" ]; then
        echo "Upgrade package found at /opt/tcpmk_node/tcpmk_node.tar.gz. Starting upgrade..."

        # 2. If it exists, delete the old /opt/tcpmk_node/tcpmk_node file
        if [ -f "/opt/tcpmk_node/tcpmk_node" ]; then
            echo "Deleting old executable file /opt/tcpmk_node/tcpmk_node..."
            rm -f "/opt/tcpmk_node/tcpmk_node"
        fi

        # 3. Extract /opt/tcpmk_node/tcpmk_node.tar.gz
        echo "Extracting upgrade package /opt/tcpmk_node/tcpmk_node.tar.gz..."
        tar -xzf tcpmk_node.tar.gz

        # 4. Grant execute permission to /opt/tcpmk_node/tcpmk_node
        if [ -f "/opt/tcpmk_node/tcpmk_node" ]; then
            echo "Granting execute permission to /opt/tcpmk_node/tcpmk_node..."
            chmod +x "/opt/tcpmk_node/tcpmk_node"
        else
            echo "Error: Extracted file /opt/tcpmk_node/tcpmk_node not found."
            return 1
        fi

        # 5. Delete all *.tar.gz files in /opt/tcpmk_node/
        echo "Cleaning up upgrade package files..."
        rm -f /opt/tcpmk_node/*.tar.gz

        echo "Upgrade completed successfully!"
    else
        echo "Upgrade package not found at /opt/tcpmk_node/tcpmk_node.tar.gz. No action taken."
    fi
}

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

upgrade_tcpmk_node && run