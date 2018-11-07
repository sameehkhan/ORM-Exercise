PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255),
  lname VARCHAR(255)


);



CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255),
  body VARCHAR(255),
  user_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id)
);



CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  questions_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (questions_id) REFERENCES questions(id)

);



CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  subject VARCHAR(255),
  body VARCHAR(255),
  question_id INTEGER,
  parent_id INTEGER,
  author_id INTEGER,


  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (author_id) REFERENCES users(id)
);



CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  question_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
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

INSERT INTO
  question_likes(user_id, question_id)
VALUES
  (1, 3),
  (2, 3),
  (3, 1),
  (1, 2),
  (2, 1),
  (3, 2);



INSERT INTO
  question_follows(user_id, questions_id)
VALUES
  (1, 1),
  (2, 2),
  (1, 3),
  (3, 1),
  (3, 2),
  (2, 1);

INSERT INTO
  replies(subject, body, question_id, parent_id, author_id)
VALUES
  ("App Academy", "This is a good question", 1, 1, 3),
  ("Hack Reactor", "What a waste", 2, 2, 3),
  ("Hack Reactor", "meh", 1, 3, 1);
