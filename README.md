# 项目说明文档

## 启动

```shell
# 依赖初始化
yarn

# 参数说明
node-red -p [指定端口] -s [指定setting.js文件启动] -u [指定执行目录]

# 以当前目录启动
node-red -s ./settings.js -u ./
```

## 功能说明

其实主要就是对 setting.js 中的一些基础配置进行了更改与自定义

### contextStorage

- 配置参数: localfilesystem(文件存储), flushInterval(刷新时间) 为 5s
- 什么意思呢? 其实 NR 默认配置是 memory(内存存储), 但是这样我们想要保存一些比较持久性的数据时就很麻烦, 因为一旦服务重启存储内存的数据会全部丢失, 在发现这个配置项之前我是通过手动写文件的方式来保存持久化的数据的, 相当麻烦, 有了这个配置项, 很多事情 NR 都帮你做好了, 简直不要太舒服, 刷新时间值得就是多久同步一次数据至存储文件
- 数据存储位置应该是 context/global/global.json

### logging

- 日志模块: logstash 这个完全就是依赖于 log4js 实现的, 有兴趣就直看看代码, 注释应该到位了, API 调用工程师, 可以帮我看看有没有什么 bug?
