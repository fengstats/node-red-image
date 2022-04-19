FROM nodered/node-red:2.2.2

# 设置时区
ENV TZ=Asia/Shanghai
# 切换镜像源
RUN npm config set registry https://registry.npm.taobao.org

# 设置工作区: 其实就是cd
WORKDIR /data

# 拷贝镜像资源文
COPY package.json /data/package.json
COPY settings.js /data/settings.js
# COPY flows_cred.json /data/flows_cred.json
COPY flows.json /data/flows.json
# 安装依赖
RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production

# 切回去
WORKDIR /usr/src/node-red
# 指定持久化目录: 让外部可以挂载(没有效果呜呜呜)
# VOLUME /data