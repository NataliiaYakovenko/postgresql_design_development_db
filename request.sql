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

