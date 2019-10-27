-- Написать SQL script для создания БД Компьютерная фирма
CREATE TABLE product (
	maker VARCHAR(10) NOT NULL,
	model VARCHAR(50) NOT NULL PRIMARY KEY,
	type VARCHAR(50) NOT NULL
	);

CREATE TABLE pc (
	code INT NOT NULL,
	model VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES product(model),
	speed SMALLINT NOT NULL,
	ram SMALLINT NOT NULL,
	hd REAL NOT NULL,
	cd VARCHAR(10),
	price MONEY NULL
	);

CREATE TABLE laptop (
	code INT NOT NULL,
	model VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES product(model),
	speed SMALLINT NOT NULL,
	ram SMALLINT NOT NULL,
	hd REAL NOT NULL,
	price MONEY,
	screen TINYINT NOT NULL
	);

CREATE TABLE printer (
	code INT NOT NULL,
	model VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES product(model),
	color CHAR(1) NOT NULL,
	type VARCHAR(10) NOT NULL,
	price MONEY
	);

-- sql-ex.ru
-- Task_6
SELECT DISTINCT maker,
	speed
FROM Laptop
INNER JOIN Product ON Laptop.model = Product.model
WHERE Laptop.hd >= 10

-- Task_7
SELECT PC.model,
	PC.price
FROM PC
INNER JOIN Product ON PC.model = Product.model
WHERE Product.maker = 'B'

UNION

SELECT Laptop.model,
	Laptop.price
FROM Laptop
INNER JOIN Product ON Laptop.model = Product.model
WHERE Product.maker = 'B'

UNION

SELECT Printer.model,
	Printer.price
FROM Printer
INNER JOIN Product ON Printer.model = Product.model
WHERE Product.maker = 'B'

-- Task_8
SELECT maker
FROM Product
WHERE type = 'PC'

EXCEPT

SELECT maker
FROM Product
WHERE type = 'Laptop'

-- Task_9
SELECT DISTINCT maker
FROM PC
INNER JOIN Product ON PC.model = Product.model
WHERE PC.speed >= 450

-- Task_10
SELECT model,
	price
FROM Printer
WHERE price = (
		SELECT MAX(price)
		FROM Printer
		)
