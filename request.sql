--відобразити інформацію про замовлення конкретного клієнта
SELECT u.first_name, last_name, t.name AS Name_tour, target_trip, c.name AS Name_country, s.created_at
FROM users AS u INNER JOIN sales AS s ON u.id = s.user_id
                INNER JOIN tours AS t ON s.tour_id =t.id
                INNER JOIN countries AS c ON t.country_id = c.id
WHERE u.id = 1;

--перелік турів, оформлених сьогодні
SELECT t.name AS Name_tour, s.created_at AS Current_date
FROM users AS u INNER JOIN sales AS s ON u.id = s.user_id
                INNER JOIN tours AS t ON s.tour_id =t.id
WHERE DATE(s.created_at) = CURRENT_DATE; 

--сумарна вартість замовлень кожного клієнта
SELECT u.first_name|| ' ' ||last_name AS Fullname, sum(t.price)
FROM users AS u INNER JOIN sales AS s ON u.id = s.user_id
                INNER JOIN tours AS t ON s.tour_id =t.id
GROUP BY Fullname;      

--перелік продажів за конкретний тиждень
SELECT t.name, COUNT(*) AS sales_count
FROM tours AS t INNER JOIN sales AS s ON t.id = s.tour_id
WHERE EXTRACT(WEEK FROM s.created_at) =27 AND
      EXTRACT(YEAR FROM s.created_at) = 2025
GROUP BY t.name
ORDER BY sales_count DESC;

--Виручка за місяць (сума всіх замовлень за місяць)
SELECT sum(t.price) AS total_summa
FROM tours AS t INNER JOIN sales AS s ON t.id = s.tour_id
WHERE EXTRACT(MONTH FROM s.created_at) = 5 AND
      EXTRACT(YEAR FROM s.created_at) = 2025;

--список клієнтів, які обслуговувалися цього місяця
SELECT u.first_name|| ' ' ||last_name AS Fullname, s.created_at 
FROM users AS u INNER JOIN sales AS s ON u.id = s.user_id
WHERE EXTRACT(MONTH FROM s.created_at)= EXTRACT(MONTH FROM CURRENT_DATE) AND
      EXTRACT(YEAR FROM s.created_at) = 2025 ;

--топ 5 турів за рік
SELECT t.name, COUNT(t.id) AS count_tours
FROM tours AS t INNER JOIN sales AS s ON t.id = s.tour_id
WHERE EXTRACT(YEAR FROM s.created_at) = 2025
GROUP BY t.name
ORDER BY Count_tours DESC
LIMIT 5;

--ваш прибуток від продажу за місяць, за умови, що ваш Додаток отримує 3% від суми замовлення
SELECT sum(t.price) * 3 / 100 AS profit
FROM tours AS t INNER JOIN sales AS s ON t.id = s.tour_id
WHERE EXTRACT(MONTH FROM s.created_at) = 5 AND
      EXTRACT(YEAR FROM s.created_at) = 2025;
