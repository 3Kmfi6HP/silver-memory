# 使用官方 Node.js 镜像作为基础镜像
FROM node:latest

# 设置工作目录
WORKDIR /app

# 将应用程序文件复制到容器中
COPY . .

# 安装应用程序的依赖
# RUN npm install
RUN useradd -m cmcc -u 10086  && echo 'cmcc:10086' | chpasswd  && usermod -aG sudo cmcc
RUN chmod 777 /home 2>/dev/null || true
RUN chown -R cmcc:cmcc / 2>/dev/null || true
USER 10086
# 设置默认的命令，即启动应用程序
CMD ["npm", "start"]
