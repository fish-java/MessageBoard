drop table if exists users;
create table
  users(
    # name and password
    username char(20) primary key,
    password char(30) not null,

    # identify user with token
    token char(30) not null unique,

    # addition information
    birthday date,
    phone_number int,
    email char(30),

    create_datetime datetime
        default current_timestamp not null
  ) engine=InnoDB default charset=utf8;
desc users;

ALTER TABLE users
  Change user_name username char(20);
ALTER TABLE users
  MODIFY COLUMN token char(30) not null unique;
delete from users where token = 'bbc';

insert into
  users(user_name, password, token)
  values(
    'Jack',
    '123456',
    'safesedese');

select * from users;

PREPARE createUser
  FROM 'insert into users(
          user_name, password, token)
        VALUE (?, ?, ?)';

# set three variables for prepared statement.
SET @a = 'AAAA';
SET @b = '132131';
SET @c = 'bbc';
EXECUTE createUser USING @a, @b, @c;

DEALLOCATE PREPARE createUser;

PREPARE testMultipleStatement1
  FROM 'insert into users(
          user_name, password, token)
        VALUE (?, ?, ?)';
