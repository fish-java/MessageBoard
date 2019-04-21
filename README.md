

一个在线留言板，提供用户登录注册、发表消息的功能。包含了最常用增删改查的任务，非常适合作为学习新技术的入门项目。



这个项目主要是基于前后端分离的情况下：REST API的设计以及数据库表的设计。这要在学习不同的新技术的时候，可以复用同一套业务逻辑。



一些实际的项目

- 基于SpringBoot技术的

  https://mb.bitfish.xyz/



# 数据库设计

我们的项目很简单，就是一个留言板，只要两个表就行了

- 用户表
- 留言表

下面是表的概述，部分常用的SQL我放到了当前目录的*.sql下，大家可以参考下

### Messages

记录留言信息

- `id`: 每个message都应该有个ID，它应该是自动增长的，可以
  由数据库来创建
- `content`: 留言的具体内容，500个字符足够了
- `username`: 留言的用户
- `create_datetime`: 创建时间
- `update_datetime`: 最近一次编辑时间

```sql
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

### Users

存储用户信息

- `id`: 用户id，自增主键
- `username`： 用户名，不可重复
- `password`： 密码
- `token`：作为一般API调用的认证口令
- `birthday`
- `phone_number`
- `email`
- `create_datetime`

```sql
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



# REST API

这是Message Board 的前后端REST API约定。

## 登录认证

部分明显需要登录才能进行的操作，需要才请求头中添加token.
例如：

```
Authorization: bearer sdfewsadfewasfe
```

如果登录失败，会返回这样的信息

```json
HTTP/1.1 401 Unauthorized
{
  "message": "Bad credentials",
  "reason": "。。。。。。。"
}
```



## Users

- 创建一个用户
- 更换token

### 创建一个用户

#### URL

```
POST /users
```

#### 参数

- `username`

  用户名

- `password`

  用户注册密码

### 示例

```
post /users?username=fish56&password=123456
```

#### 成功后的响应

```
Status: 201 Created
```

```json
{
  "user_name": "Jack",
  "token": "acsewdsfsdfsdews"
}
```

响应体中会包含用户的token

### 更新token

获得新的token，旧的token同时失效

#### URL

```
PATCH /users/:username/token
```

#### 参数

- `password`

  a string, user's password

因为修改token是比较敏感的行为，所以需要用户提供登录密码

#### 示例

```json
PATHC /users/fish56/token?password=123456
```

#### 成功后的响应

```
Status: 200 OK
```

```json
{
  "username": "fish56",
  "token": "wesfesdfsae"
}
```

## Messages

- List messages 获得消息列表
- list messages for a user 获得某个用户发表的消息
- create a message 创建一个消息
- edit a message 编辑一个消息
- delete a message 删除一个消息

查询报文列表时，单次请求做多返回30条数据。

创建、修改报文时。报文不能超过500个字符。

### 获得消息列表

#### URL

URL有两种：

- 获得报文列表

  ```
  GET /messages 
  ```

- 获得某一个用户发表的报文的列表

  ```
  GET /users/:username/messages
  ```

  

#### 参数

- `sort`

  通过哪种方式排序。可选值有： `create_datetime`, `update_datetime`。
  默认： `created`

- `direction`

  排序方式，可选值有：`asc` `desc`。默认`desc`

- `since`

  在某个时间点之后更新的消息，格式为 `yyyy-MM-dd-HH:mm:ss`。

  比如 `1999-10-10-11:11:11`。

- `page`

  查询第几页的消息，默认是1。每页消息的数量强制规定为30。

#### 成功后的响应

```
Status: 200 OK
```

```json
[
  {
    "id": "123",
    "content": "this is a message",
    "user": {
      "username": "Jack"
    }
  }
  ...
]
```



### 通过报文id获得一个消息

#### URL

```
GET /messages/:id
```

#### 成功后的响应

```
Status: 200 OK
```

```json
[
  {
    "id": "123",
    "content": "this is a message"
  }
]
```

### 创建一个报文

#### URL

```
POST /messages
```

#### 请求体

- `content`
  a string as the message content

#### 示例

```json
{
  "content": "Hello friends, I post a message"
}
```

#### 成功后的响应

```
Status: 201 Created
```

```json
{
    "id": "324",
    "content": "Hello friends, I post a message",
    "user": {
      "username": "Jack"
    }
  }
```

### 修改一个报文

#### URL

```
PATCH /messages/:id
```

#### 请求体

- `content`
  报文主体

#### 示例

```json
{
  "content": "Hello friends, I edit this message"
}
```

#### 成功后的响应

```
Status: 200 OK
```

```json
{
    "id": "324",
    "content": "Hello friends, I edit this message",
    "user": {
      "username": "Jack"
    }
  }
```

### 删除一个报文

#### URL

```
DELETE /messages/:id
```

#### 成功后的响应

```
Status: 200 OK
```

