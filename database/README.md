# Tables of Database
我们的项目很简单，就是一个留言板，只要两个表
就行了
- 用户表
- 留言表

下面是表的概述，部分常用的SQL我放到了当前目录的*.sql下，大家可以参考下

## Messages
留言信息

  - `id`: 每个message都应该有个ID，它应该是自动增长的，可以
    由数据库来创建

  - `content`: 留言的具体内容，500个字符足够了

  - `username`: 用户名，应该和用户表对应
    
  - `create_datetime`: 创建时间，可以有数据库自动生成

  - `update_datetime`: 最近一次编辑时间
  
``` sql
create table messages(
  id int unsigned primary key auto_increment,
  content varchar(500) not null,
  username char(20) not null,

  create_datetime datetime
    default current_timestamp not null,
  update_datetime timestamp
    default current_timestamp not null
    on update current_timestamp
);
```
  
## Users
存储用户信息

  - `id`: 用户id，自增主键
  - `username`： 用户名，不可重复
  - `password`： 密码
  - `token`：
  - `birthday`
  - `phone_number`
  - `email`
  - `create_datetime`
  
  ``` sql
  create table users(
  id int unsigned primary key auto_increment,
  username char(20) unique ,
  password char(30) not null,
  token char(30) not null unique,

  birthday date,
  phone_number int unsigned unique ,
  email char(30),

  create_datetime datetime
      default current_timestamp not null
);
```
