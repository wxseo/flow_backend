# 使用轻量级JRE镜像
FROM registry.cn-hangzhou.aliyuncs.com/ubuntu/openjdk:11

LABEL maintainer="zhizhan.zhou@biqs.cn"

# 设置工作目录
WORKDIR /app

# 复制JAR文件（名称与您的文件一致）
COPY biqs.jar app.jar

# 暴露端口（与您的应用端口一致）
EXPOSE 8082

# 设置时区（中国时区）
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 启动命令（根据实际情况调整）
# 如果有独立依赖库：java -Xmx512m -Dloader.path=./lib -jar app.jar
ENTRYPOINT ["java", "-Xmx512m", "-jar", "app.jar"]
