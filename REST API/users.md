# Users
- 创建一个用户
- 更换token

## 创建一个用户
### URL
```
POST /users
```
### Body
- `username`

  a string, user's name
  
- `password`

  a string, user's password
#### example
```json
{
  "username": "Jack",
  "password": "123456"
}
```

### Response
```
Status: 201 Created
```
```json
{
  "user_name": "Jack",
  "token": "acsewdsfsdfsdews"
}
```

## 产生一个新的token
旧的token同时失效

### URL
```
PATCH /users/:username/token
```
### Body
- `username`

  a string, user's name
  
- `password`

  a string, user's password
#### example
```json
{
  "username": "Jack",
  "password": "123456"
}
```
### Response
```
Status: 200 OK
```
```json
{
  "username": "Jack",
  "token": "wesfesdfsae"
}
```
