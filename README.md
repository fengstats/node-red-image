# 项目说明文档

本地启动

```shell
yarn

node-red -p [指定端口] -s [指定setting.js文件启动] -u [指定执行目录]

# 以当前目录启动
node-red -s ./settings.js -u ./
```

## 通过容器的方式来打成一个镜像

```shell
docker commit -a [作者] -m [注释信息] [容器Id] [镜像名称]

# 示例
docker commit -a "shifeng" -m "init" fd6ce4eee686  39.170.118.36:5000/lianhe/node-red:v1.0.1
```
