# Message  Board
- 一个在线留言板
- 乞丐版的全栈开发

[项目在线地址](https://mb.bitfish.xyz/#/messages)

服务器在美国，国内第一次访问可能有点慢

[![](https://badge.juejin.im/entry/5c8f074ff265da680f7306f9/likes.svg?style=flat)](https://juejin.im/post/5c8ef5d4f265da68141661b1)

### 技术点
- 前后端分离，REST API规范
- MySQL数据表的设计，常用的SQL语句

- 前端： Vue + Antd + axiso
- 后端：Spring Boot + MyBaits
- 运维：托管在DigitalOcean，使用Docker容器管理应用

项目很简陋，所用到的技术点都是入门级的。如果有同学希望了解全栈开发的话，可以来交流一下。

## 目录
我觉得比较合适的开发流程是
1. 设计数据的库表结构
  先把数据库设计好，很多看似复杂的业务逻辑就会显得很清晰了

2. 根据REST规范，制定前后端的接口API
  
3. 上面两个规范写好，前后端就可以同时开发了

4. 开发完成后交给运维人员，发布上线

所以我推荐读者按照上面的顺序阅读我的博客。

- 数据库和REST API都在这个Repo两个目录下

- [前端的在这里](https://github.com/fish56/MessageBoardVue)

- [后端的在这里](https://github.com/fish56/MessageBoardJava)

- 运维的在这里。
