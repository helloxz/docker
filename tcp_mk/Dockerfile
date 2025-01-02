from redis:7-alpine
RUN mkdir -p /opt/tcp_mk
WORKDIR /opt/tcp_mk
#复制启动文件
COPY *.sh /root/
# 安装
RUN sh /root/install.sh
# 暴露文件夹和端口
VOLUME /opt/tcp_mk
EXPOSE 5080

# 启动
CMD ["/usr/sbin/run.sh"]