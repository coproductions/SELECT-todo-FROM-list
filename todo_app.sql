DROP USER michael;
CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';
DROP DATABASE todo_app;
CREATE DATABASE todo_app;
\C todo_app;
CREATE TABLE tasks
(
id serial,
title varchar(255) NOT NULL,
description text NULL,
created_at timestamp without time zone NOT NULL DEFAULT now(),
updated_at timestamp without time zone NOT NULL,
completed boolean NOT NULL DEFAULT FALSE,
PRIMARY KEY (id)
);

ALTER TABLE tasks
  DROP COLUMN completed;

ALTER TABLE tasks
  ADD COLUMN completed_at timestamp without time zone NULL DEFAULT NULL;

ALTER TABLE tasks
  ALTER COLUMN updated_at SET NOT NULL ;

ALTER TABLE tasks
  ALTER COLUMN updated_at SET DEFAULT now();



INSERT INTO tasks VALUES (DEFAULT, 'Study SQL', 'Complete this exercise', NOW(),NOW(),NUll);

INSERT INTO tasks (title,description)
  VALUES ('Study PostreSQL','Read all the documentation');

SELECT title FROM tasks WHERE completed_at is null;

UPDATE tasks SET completed_at = now() WHERE title = 'Study SQL';

SELECT title, description FROM tasks WHERE completed_at is NULL;

SELECT * FROM tasks ORDER BY created_at DESC;

INSERT INTO tasks (title,description)
  VALUES ('mistake1','a test entry');


INSERT INTO tasks (title,description)
  VALUES ('mistake2','another test entry');

SELECT title FROM tasks WHERE title LIKE '%mistake%';

SELECT * FROM tasks ORDER BY title ASC;

