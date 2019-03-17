drop table if exists messages;
create table
  messages(
    # identify a message
    id int unsigned primary key auto_increment,

    # the content of each message
    content varchar(500) not null,

    # the author name
    username char(20) not null,

    create_datetime datetime
      default current_timestamp not null,
    update_datetime timestamp
      default current_timestamp not null
      on update current_timestamp
  )engine = InnoDB default charset = utf8;

ALTER TABLE messages
  Change user_name username char(20);

select * from messages
order by update_datetime desc ;

select id,content,username,
       create_datetime,
       update_datetime
from messages limit 10 offset 2;

insert into
  messages(content, user_name)
  values (
    'hello world, this is first message',
    'Jon');

select
  id,content,username,update_datetime
from messages
order by update_datetime desc limit 10 offset 0;
