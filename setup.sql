CREATE DATABASE Demo;
GO
USE Demo;
GO
CREATE TABLE Employees (legajo int PRIMARY KEY, dni int, name nvarchar(max));
GO
INSERT INTO TABLE Employees(legajo, dni, name) VALUES(1, 28695048, 'Diego Rojo');
INSERT INTO TABLE Employees(legajo, dni, name) VALUES(2, 28695049, 'Diego Rojo 2');
INSERT INTO TABLE Employees(legajo, dni, name) VALUES(3, 28695050, 'Diego Rojo 3');
INSERT INTO TABLE Employees(legajo, dni, name) VALUES(4, 28695043, 'Diego Rojo 4');
INSERT INTO TABLE Employees(legajo, dni, name) VALUES(5, 28695338, 'Diego Rojo 5');
INSERT INTO TABLE Employees(legajo, dni, name) VALUES(6, 28625048, 'Diego Rojo 6');
INSERT INTO TABLE Employees(legajo, dni, name) VALUES(7, 28595048, 'Diego Rojo 7');
INSERT INTO TABLE Employees(legajo, dni, name) VALUES(8, 24695048, 'Diego Rojo 8');
GO;