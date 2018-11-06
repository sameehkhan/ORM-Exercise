PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255),
  lname VARCHAR(255)


);

DROP TABLE IF EXISTS questions;


CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255),
  body VARCHAR(255),
  user_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;


CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  questions_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (questions_id) REFERENCES questions(id)

);

DROP TABLE IF EXISTS replies;


CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  subject VARCHAR(255),
  author_id INTEGER,
  replier_id INTEGER,
  body VARCHAR(255),

  FOREIGN KEY (replier_id) REFERENCES users(id),
  FOREIGN KEY (author_id) REFERENCES user(id)
);


DROP TABLE IF EXISTS question_likes;


CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  liker_id INTEGER,
  ref_id INTEGER,
  question_id INTEGER,

  FOREIGN KEY (liker_id) REFERENCES users(id),
  FOREIGN KEY (ref_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES question(id)
);

INSERT INTO
  users(fname,lname)
VALUES
  ('Ned', 'Question'),
  ('Kush', 'Question'),
  ('Earl', 'Question');


INSERT INTO
  questions(title,body,user_id)
VALUES
  ('Ned Question', 'NED NED NED', 1),
  ('Kush Question', ' KUSH KUSH K',  2),
  ('Earl Question',  'MEOW MEOW M',  3);
