from debian:11-slim
RUN mkdir -p /opt/wp2ai
WORKDIR /opt/wp2ai
#复制启动文件
COPY *.sh /root/
# 安装
RUN sh /root/install.sh
# 暴露文件夹和端口
EXPOSE 2080

# 启动
CMD ["/usr/sbin/run.sh"]