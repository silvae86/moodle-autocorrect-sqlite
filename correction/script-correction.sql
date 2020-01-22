--
-- File generated with SQLiteStudio v3.2.1 on Wed Jan 22 00:09:41 2020
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: clients
DROP TABLE IF EXISTS clients;
CREATE TABLE clients (id INTEGER PRIMARY KEY, username TEXT UNIQUE NOT NULL, password TEXT NOT NULL);
INSERT INTO clients (id, username, password) VALUES (1, 'Rey Mary Sue Skywalker', '4e1243bd22c66e76c2ba9eddc1f91394e57f9f83');
INSERT INTO clients (id, username, password) VALUES (2, 'Emo Kylo', '4e1243bd22c66e76c2ba9eddc1f91394e57f9f83');
INSERT INTO clients (id, username, password) VALUES (3, 'Harrison Please Dont Cast Me Again Solo', '4e1243bd22c66e76c2ba9eddc1f91394e57f9f83');

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
