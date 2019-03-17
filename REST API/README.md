# REST API
这是Message Board 的前后端REST API约定。

## 前言
- 所有的请求都是基于`https://api.mb.bitfish.xyz`这个url
- 前后端所有数据的传输都应该是JSON格式

## 登录认证
部分明显需要登录才能进行的操作，需要才请求头中添加token.
例如：
```
Authorization: bearer sdfewsadfewasfe
```

如果登录失败，会返回这样的信息
``` json
HTTP/1.1 401 Unauthorized
{
  "message": "Bad credentials",
  "reason": "。。。。。。。"
}
```

你可以从这里获得token。
[here](./users.md).


## 文档风格

---------------
---------------

# 标题
- 内容一
- 内容二

## 细节
_关于这个API调用的一些细节_

### URL
_对应的url (只使用path, 不包括root url)_

### 查询字符串
_可以添加哪些查询字符串_

### Header
_有哪些合法的请求头字段_

### Body
_请求正文的内容_

### Response
响应报文
```
Response Status
```
```
Response Headers
```
```
Response Body
```

