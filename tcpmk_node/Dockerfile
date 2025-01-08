from alpine:3.18
RUN mkdir -p /opt/tcpmk_node
WORKDIR /opt/tcpmk_node
#复制启动文件
COPY *.sh /root/
# 安装
RUN sh /root/install.sh
# 暴露文件夹和端口
EXPOSE 5081

# 启动
CMD ["/usr/sbin/run.sh"]