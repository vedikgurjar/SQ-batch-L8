-- Data Type
-- Constraint

-- Value -> Type
-- int x;

-- Table, Column -> Data Type

USE newdb2;

CREATE TABLE test1 (
    rollno INT
);   -- Create -> DDL Statement

INSERT INTO test1 VALUES (10);     -- DML Statement
INSERT INTO test1 VALUES (30);     -- DML Statement

-- Error because of string
INSERT INTO test1 VALUES ('aman');

SELECT * FROM test1;


-- tinyint (1 Byte Memory)

-- 1 Byte = 8 Bit

-- 2^8 = 256

-- -128 to 127

CREATE TABLE test2 (
    rollno TINYINT
);   -- Create -> DDL Statement

INSERT INTO test2 VALUES (127);

INSERT INTO test2 VALUES (-128);

INSERT INTO test2 VALUES (TRUE);

SELECT * FROM test2;

-- TINYINT UNSIGNED

CREATE TABLE test3 (
    rollno TINYINT UNSIGNED
);

INSERT INTO test3 VALUES (29);

INSERT INTO test3 VALUES (255);

-- Error
INSERT INTO test3 VALUES (256);

SELECT * FROM test3;


-- Integer Data Type

-- TINYINT  -> 1 Byte
-- SMALLINT -> 2 Bytes
-- INT      -> 4 Bytes
-- BIGINT   -> 8 Bytes (64-bit)


-- CHAR

CREATE TABLE test4 (
    gender CHAR(10)
);

INSERT INTO test4 VALUES ('Male');

SELECT * FROM test4;

DROP TABLE test4;


-- VARCHAR

CREATE TABLE test5 (
    name VARCHAR(20)
);

INSERT INTO test5 VALUES ('OM');

SELECT * FROM test5;

SHOW TABLE STATUS LIKE 'test5';


-- CHAR vs VARCHAR

CREATE TABLE test6 (
    name CHAR(10),
    name2 VARCHAR(10)
);

INSERT INTO test6 VALUES ('abc', 'abc');
INSERT INTO test6 VALUES ('def', 'def');

SELECT
    name,
    LENGTH(name),
    name2,
    LENGTH(name2)
FROM test6;

SELECT
    table_name,
    data_length
FROM information_schema.tables
WHERE table_schema = DATABASE()
AND table_name IN ('test4', 'test6');

-- NOT NULL Constraint

CREATE TABLE test9 (
    id INT,
    name VARCHAR(20) NOT NULL
);

INSERT INTO test9 VALUES (10, 'abhishek');

-- Error
INSERT INTO test9 VALUES (20, NULL);

SELECT * FROM test9;


-- DEFAULT Constraint

CREATE TABLE test12 (
    id INT,
    name VARCHAR(20) DEFAULT 'regex'
);

INSERT INTO test12 VALUES (10, 'abhishek');

INSERT INTO test12 (id)
VALUES (11);

INSERT INTO test12 (name)
VALUES ('tarboz');

SELECT * FROM test12;


-- UNIQUE Constraint

CREATE TABLE test13 (
    id INT UNIQUE,
    name VARCHAR(20)
);

INSERT INTO test13 VALUES (10, 'abhishek');

-- Error (Duplicate Value)
INSERT INTO test13 VALUES (10, 'vijay');

INSERT INTO test13 VALUES (11, 'abhishek');

INSERT INTO test13 VALUES (NULL, 'happy');

INSERT INTO test13 VALUES (NULL, 'isha');

SELECT * FROM test13;

-- PRIMARY KEY Constraint

CREATE TABLE test14 (
    id INT PRIMARY KEY,
    name VARCHAR(20)
);

INSERT INTO test14 VALUES (10, 'abhishek');

-- Error (Duplicate Primary Key)
INSERT INTO test14 VALUES (10, 'ads');

-- Error (Primary Key cannot be NULL)
INSERT INTO test14 VALUES (NULL, 'ads');

SELECT * FROM test14;


-- CHECK Constraint

CREATE TABLE test15 (
    age INT CHECK (age >= 18)
);

INSERT INTO test15 VALUES (20);

-- Error
INSERT INTO test15 VALUES (15);

SELECT * FROM test15;


-- PRIMARY KEY + AUTO_INCREMENT

CREATE TABLE test16 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20)
);

INSERT INTO test16 (name)
VALUES ('abhishek');

INSERT INTO test16 (name)
VALUES ('aman');

INSERT INTO test16 (name)
VALUES ('rahul');

SELECT * FROM test16;

-- PRIMARY KEY + AUTO_INCREMENT

CREATE TABLE test17 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20)
);

INSERT INTO test17 (name)
VALUES ('Abhishek');

INSERT INTO test17 (name)
VALUES ('Aman');

INSERT INTO test17 (name)
VALUES ('Rahul');

SELECT * FROM test17;


-- DROP TABLE

DROP TABLE test17;


-- DESC Command

DESC test14;


-- SHOW TABLES

SHOW TABLES;


-- SHOW DATABASES

SHOW DATABASES;


-- Current Database

SELECT DATABASE();


-- Delete all records

TRUNCATE TABLE test14;


-- Delete Table

DROP TABLE test14;