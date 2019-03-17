# Messages
- list messages
- list messages for a user
- create a message
- edit a message
- delete a message

## List messages
list messages of this site, limit 30 in one single request

### URL

```
GET /messages 
```

### QueryString
- `sort`

  a string. What to sort results by. 
  Can be either `created`, `updated`.
  Default: `created`
  
- `since`

  a string. Only issues updated at or after 
  this time are returned. This is a timestamp 
  in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
  
### Response
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
]
```

## List messages of a user
list message of a user, 
limit 30 in one single request
### URL
```
GET /users/:username/messages
```

### QueryString
- `sort`

  a string. What to sort results by. 
  Can be either `created`, `updated`.
  Default: `created`
  
- `since`

  a string. Only issues updated at or after 
  this time are returned. This is a timestamp 
  in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
  
### Response
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
]
```

## Get a single message
Max length of a message is 500 character
### URL
```
GET /messages/:id
```

### Response
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

## Create a message
### URL
```
POST /messages
```
### Body
- `content`
  a string as the message content

#### Example
```json
{
  "content": "Hello friends, I post a message"
}
```
### Response
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

## Edit a message
### URL
```
PATCH /messages/:id
```
### Body
- `content`
  a string as the message content

#### Example
```json
{
  "content": "Hello friends, I edit this message"
}
```
### Response
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

## Delete a message
delete a message, be careful with this.
### URL
```
DELETE /messages/:id
```
### Response
```
Status: 200 OK
```

