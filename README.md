# Node-RED 自定义基础镜像

## 前言

其实主要就是对 setting.js 文件中所提供的一些基础配置更改。

### contextStorage

- module: localfilesystem（文件存储）
- flushInterval: 5s（刷新时间）

**什么意思呢?**

其实 NR 默认 module 是 memory（内存存储），但是这样我们想要保存一些比较持久性的数据时就很麻烦，一旦服务突然重启，存储内存的数据就会全部丢失。

在启用 localfilesystem 这个配置项前都是通过手动写文件的方式来保存持久化的数据的，每次定时多久去读取同步一下数据，有了这个配置项，很多事情 NR 都帮你做好了，简直不要太舒服，刷新时间值得就是多久同步一次数据至存储文件。

数据存储位置应该是 `context/global/global.json`

### logging

- logstash 这个完全就是依赖于 `log4js` 实现的
- 有兴趣就直看看代码，注释有一点，纯 API 调用工程师，帮我看看有没有什么 BUG？😊

## 如何使用 ❓

### 初始化

```shell
npm install
# or
yarn
# or
pnpm
```

### 作为本地配置加载

⚠️ 需要安装 node-red

```shell
node-red -s ./settings.js -u ./ -p 1880 -f flows.json

# 参数说明
node-red -p [指定端口] -s [指定setting.js文件启动] -u [指定执行目录] -f [指定流文件]
```

### 打包成 Docker 镜像使用

⚠️ 需要安装 docker

```shell
docker build -t node-red-custom:1.0.1 .

# 参数说明
docker build -t 镜像名称:版本号 打包目录

# 扩展：镜像名称也可以拆成 “组织/项目名称” 的方式，当然像我一样只用项目名称也可以
```
