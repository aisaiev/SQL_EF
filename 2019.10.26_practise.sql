-- 2019.10.26_practise
-- Задание_1
-- Написать SQL script для создания таблички Planets. Заполнить значениями из примера:
CREATE TABLE planets (
	Id INT IDENTITY(1, 1) PRIMARY KEY,
	PlanetName VARCHAR(255),
	Radius INT,
	SunSeason FLOAT,
	OpeningYear SMALLINT CHECK (OpeningYear < YEAR(getdate())),
	HavingRings BIT,
	Opener VARCHAR(255)
	);

INSERT INTO planets (
	PlanetName,
	Radius,
	SunSeason,
	OpeningYear,
	HavingRings,
	Opener
	)
VALUES (
	'Mars',
	3396,
	687,
	1659,
	0,
	'Christiaan Huygens'
	),
	(
	'Saturn',
	60268,
	10759.22,
	NULL,
	1,
	NULL
	),
	(
	'Neptune',
	24764,
	60190,
	1846,
	1,
	'John Couch Adams'
	),
	(
	'Mercury',
	2439,
	115.88,
	1631,
	0,
	'Nicolaus Copernicus'
	),
	(
	'Venus',
	6051,
	243,
	1610,
	0,
	'Galileo Galilei'
	)

-- Задание_2
-- Используя оператор SQL WHERE вывести записи, значение радиуса (Radius) которых находится в пределах от 3000 до 9000.
SELECT *
FROM planets
WHERE Radius BETWEEN 3000
		AND 9000

-- Задание_3
-- Используя оператор SQL WHERE вывести название планеты (PlanetName), год ее открытия (OpeningYear) и имя первооткрывателя (Opener), планет, чье название не начинается и не заканчивается на букву «s».
SELECT PlanetName,
	OpeningYear,
	Opener
FROM planets
WHERE PlanetName NOT LIKE 's%'
	AND PlanetName NOT LIKE '%s'

-- Задание_4
-- Используя операторы SQL WHERE  вывести записи планет, у которых радиус планеты меньше 10000 и открытых (OpeningYear) после 1620.
SELECT PlanetName
FROM planets
WHERE Radius < 10000
	AND OpeningYear > 1620

-- Задание_5
-- Используя операторы SQL WHERE вывести записи планет, названия которых начинаются с буквы «N» или заканчиваются на букву «s» и не имеющие колец.
SELECT PlanetName
FROM planets
WHERE (
		PlanetName LIKE '%s'
		AND HavingRings = 'FALSE'
		)
	OR (
		PlanetName LIKE 'N%'
		AND HavingRings = 'FALSE'
		)

-- Задание_6
-- С помощью оператора SQL UPDATE изменить название планеты Neptune на Pluton.
UPDATE planets
SET PlanetName = 'Pluton'
WHERE PlanetName = 'Neptune'

-- Задание_7
-- С помощью оператора SQL UPDATE у первых трех записей таблицы изменить значение наличия колец (HavingRings) на «No».
UPDATE TOP (3) planets
SET HavingRings = 'FAlSE'

-- Задание_8
-- С помощью оператора SQL SELECT INTO вставить записи из таблицы Planets, которые имеют кольца в таблицу PlanetsWithRings.
SELECT *
INTO PlanetsWithRings
FROM planets
WHERE HavingRings = 'TRUE'

-- Задание_9
-- Вывести на экран табличку.
SELECT *
FROM planets

-- Задание_10
-- Используя оператор DELETE удалить из таблицы записи без колец и с незаполненными полями.
DELETE
FROM planets
WHERE HavingRings = 'FALSE'
	AND (
		PlanetName IS NULL
		OR Radius IS NULL
		OR SunSeason IS NULL
		OR OpeningYear IS NULL
		OR Opener IS NULL
		)

-- sql-ex.ru
-- Task_1
SELECT model,
	speed,
	hd
FROM PC
WHERE price < 500

-- Task_2
SELECT DISTINCT maker
FROM Product
WHERE type = 'Printer'

-- Task_3
SELECT model,
	ram,
	screen
FROM Laptop
WHERE price > 1000

-- Task_4
SELECT *
FROM Printer
WHERE color = 'y'

-- Task_5
SELECT model,
	speed,
	hd
FROM PC
WHERE (
		cd = '12x'
		OR cd = '24x'
		)
	AND price < 600
