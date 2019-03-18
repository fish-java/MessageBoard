# Tables of Database
我们的项目很简单，就是一个留言板，只要两个表
就行了
- 用户表
- 留言表

下面是表的概述，部分常用的SQL我放到了当前目录的*.sql下，大家可以参考下
## Messages
留言大概需要下面几个字段

- `messages`: table name.
  - `id`: 每个message都应该有个ID，它应该是自动增长的，可以
    由数据库来创建

  - `content`: 留言的具体内容，500个字符足够了

  - `username`: 用户名，应该和用户表对应
    
  - `create_datetime`: 创建时间，可以有数据库自动生成

  - `update_datetime`: 最近一次编辑时间
  
## Users
- `users`: 存储用户信息

  - `username`
  - `password`
  - `token`

