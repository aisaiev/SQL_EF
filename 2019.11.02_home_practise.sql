-- sql-ex.ru
-- Task_11
SELECT AVG(speed)
FROM PC

-- Task_12
SELECT AVG(speed)
FROM Laptop
WHERE price > 1000

-- Task_13
SELECT AVG(speed)
FROM PC
INNER JOIN Product ON PC.model = Product.model
WHERE Product.maker = 'A'

-- Task_14
SELECT Classes.class,
	Ships.name,
	Classes.country
FROM Classes
INNER JOIN Ships ON Classes.class = Ships.class
WHERE numGuns >= 10

-- Task_15
SELECT hd
FROM PC
GROUP BY hd
HAVING COUNT(*) >= 2

-- Task_19
SELECT Product.maker,
	AVG(Laptop.screen)
FROM Laptop
INNER JOIN Product ON Laptop.model = Product.model
GROUP BY Product.maker

-- Task_21
SELECT Product.maker,
	MAX(PC.price)
FROM PC
INNER JOIN Product ON PC.model = Product.model
GROUP BY Product.MAKER

-- Task_22
SELECT speed,
	AVG(price)
FROM PC
WHERE speed > 600
GROUP BY speed

-- Task_28
SELECT COUNT(*)
FROM (
	SELECT Product.maker
	FROM Product
	GROUP BY maker
	HAVING COUNT(model) = 1
	) AS maker_count

-- Task_31
SELECT class,
	country
FROM Classes
WHERE bore >= 16

-- Task_33
SELECT ship
FROM Outcomes
WHERE battle = 'North Atlantic'
	AND result = 'sunk'

-- Task_38
SELECT country
FROM Classes
WHERE type = 'bb'

INTERSECT

SELECT country
FROM Classes
WHERE type = 'bc'

-- Task_42
SELECT ship,
	battle
FROM Outcomes
WHERE result = 'sunk'

-- Task_44
SELECT name
FROM Ships
WHERE name LIKE 'R%'

UNION

SELECT ship
FROM Outcomes
WHERE ship LIKE 'R%'

-- Task_45
SELECT name
FROM Ships
WHERE name LIKE '% % %'

UNION

SELECT ship
FROM Outcomes
WHERE ship LIKE '% % %'

UNION

SELECT class
FROM Classes
WHERE class LIKE '% % %'

-- Task_49
SELECT Ships.name
FROM Ships
INNER JOIN Classes ON Ships.class = Classes.class
WHERE Classes.bore = 16

UNION

SELECT Outcomes.ship
FROM Outcomes
INNER JOIN Classes ON Outcomes.ship = Classes.class
WHERE Classes.bore = 16

-- Task_50
SELECT DISTINCT Outcomes.battle
FROM Outcomes
INNER JOIN Ships ON Outcomes.ship = Ships.name
WHERE Ships.class = 'Kongo'
