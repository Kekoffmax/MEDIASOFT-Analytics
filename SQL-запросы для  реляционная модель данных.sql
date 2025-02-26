CREATE TABLE Покупатели (
    Идентификатор  INT AUTO_INCREMENT PRIMARY KEY,
    Имя  VARCHAR(50) NOT NULL,
    Фамилия  VARCHAR(150) NOT NULL,
    Дата_рождения  DATE NOT NULL
);

CREATE TABLE Товары (
    Идентификатор INT AUTO_INCREMENT PRIMARY KEY,
    Название VARCHAR(30) NOT NULL,
    Стоимость DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Покупки (
    Идентификатор INT AUTO_INCREMENT PRIMARY KEY,
    Ключ_покупателя INT,
    Ключ_товара INT,
    Дата_покупки DATE,
    FOREIGN KEY (Ключ_покупателя) REFERENCES Покупатели(Идентификатор),
    FOREIGN KEY (Ключ_товара) REFERENCES Товары(Идентификатор)
);

INSERT INTO Покупатели VALUES (1, 'Злата', 'Воробьева', '1995-06-23');
INSERT INTO Покупатели VALUES (2, 'Иван', 'Митрофанов', '1997-02-01');
INSERT INTO Покупатели VALUES (3, 'Ольга', 'Голикова', '1999-07-27');
INSERT INTO Покупатели VALUES (4, 'Василиса', 'Захарова', '1981-10-15');
INSERT INTO Покупатели VALUES (5, 'Алёна', 'Старикова', '1975-12-19');
INSERT INTO Покупатели VALUES (6, 'Полина', 'Малышева', '2001-08-11');
INSERT INTO Покупатели VALUES (7, 'Ангелина', 'Седова', '1995-03-10');
INSERT INTO Покупатели VALUES (8, 'Диана', 'Ушакова', '2005-09-29');
INSERT INTO Покупатели VALUES (9, 'Анна', 'Александрова', '1996-04-14');
INSERT INTO Покупатели VALUES (10, 'Ника', 'Васильева', '2003-05-18');

INSERT INTO Товары VALUES (1, 'Маффин', 50);
INSERT INTO Товары VALUES (2, 'Рогалик', 60);
INSERT INTO Товары VALUES (3, 'Вафля', 70);
INSERT INTO Товары VALUES (4, 'Хлеб', 80);
INSERT INTO Товары VALUES (5, 'Эклер', 100);
INSERT INTO Товары VALUES (6, 'Круассан', 150);
INSERT INTO Товары VALUES (7, 'Пончик', 200);
INSERT INTO Товары VALUES (8, 'Пирожок с картошкой', 200);
INSERT INTO Товары VALUES (9, 'Пирожок с мясом', 250);
INSERT INTO Товары VALUES (10, 'Пирожок с вишней', 250);

INSERT INTO Покупки VALUES (1, 1, 5, '2025-02-10');
INSERT INTO Покупки VALUES (2, 3, 9, '2025-02-10');
INSERT INTO Покупки VALUES (3, 5, 8, '2025-02-10');
INSERT INTO Покупки VALUES (4, 7, 4, '2025-02-10');
INSERT INTO Покупки VALUES (5, 9, 1, '2025-02-10');
INSERT INTO Покупки VALUES (6, 4, 7, '2025-02-10');
INSERT INTO Покупки VALUES (7, 10, 3, '2025-02-10');
INSERT INTO Покупки VALUES (8, 8, 10, '2025-02-10');
INSERT INTO Покупки VALUES (9, 6, 2, '2025-02-10');
INSERT INTO Покупки VALUES (10, 2, 6, '2025-02-10');

SELECT * FROM Покупатели ;
SELECT * FROM Товары;
SELECT * FROM Покупки;

SELECT 
    p.Имя, 
    p.Фамилия, 
    COUNT(pu.Идентификатор) AS Количество_покупок
FROM 
    Покупатели p
LEFT JOIN 
    Покупки pu ON p.Идентификатор = pu.Ключ_покупателя
GROUP BY 
    p.Идентификатор;
    
    SELECT 
    p.Имя, 
    p.Фамилия, 
    SUM(t.Стоимость) AS Общая_стоимость
FROM 
    Покупатели p
JOIN 
    Покупки pu ON p.Идентификатор = pu.Ключ_покупателя
JOIN 
    Товары t ON pu.Ключ_товара = t.Идентификатор
GROUP BY 
    p.Идентификатор
ORDER BY 
    Общая_стоимость DESC;
    
    SELECT 
    p.Имя, 
    p.Фамилия
FROM 
    Покупатели p
JOIN 
    Покупки pu ON p.Идентификатор = pu.Ключ_покупателя
GROUP BY 
    p.Идентификатор
HAVING 
    COUNT(pu.Ключ_товара) = 1;