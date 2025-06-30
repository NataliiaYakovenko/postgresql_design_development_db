CREATE DATABASE travel;


CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(64) CHECK(first_name != ' ') NOT NULL,
  last_name VARCHAR(64) CHECK(last_name != ' ') NOT NULL,
  phone_number CHAR(13) UNIQUE NOT NULL,
  international_passport VARCHAR(8) CHECK(international_passport ~ '^[A-Z]{2}[0-9]{6}$') UNIQUE NOT NULL
);

INSERT INTO users(first_name, last_name, phone_number, international_passport)
VALUES 
  ('Alex', 'Alexandrov', '+380661234568', 'FL224366'),
  ('Ben', 'Benovich', '+380681234568', 'LL325987'),
  ('Candy', 'Coul', '+380995559988', 'KJ564879'),
  ('Debora', 'Dubrova', '+380501116548', 'FK456221'),
  ('Ivon', 'Ivonovich', '+380683256677', 'DF741852'),
  ('Feona', 'Feonova', '+380661886648', 'PO415263'),
  ('Jek', 'Jekson', '+380998854213', 'SA223344'),
  ('Leonard', 'Leonardov', '+380986654178', 'MN445577'),
  ('Mila', 'Milanovska', '+380971234567', 'CV568972'),
  ('Stefan', 'Stefanenko', '+380995648899', 'GH897765');


CREATE TABLE countries (
  id SERIAL PRIMARY KEY,
  name VARCHAR(250) CHECK(name != ' ') NOT NULL,
  visa_cost NUMERIC(10,2) CHECK(visa_cost >= 0 AND visa_cost < 10000)
);

INSERT INTO countries(name, visa_cost)
VALUES 
  ('Australia', 550),
  ('Brazil', NULL),
  ('Ecuador', NULL),
  ('Canada', 300),
  ('Turkey', NULL),
  ('Egypt', NULL),
  ('USA', 400),
  ('Thailand', NULL),
  ('Cyprus', NULL);


CREATE TABLE tours (
  id SERIAL PRIMARY KEY,
  name VARCHAR(250) CHECK(name != ' ') NOT NULL,
  country_id INT REFERENCES countries(id) ON DELETE CASCADE,
  target_trip TEXT,
  price NUMERIC(10,2) CHECK(price > 0) NOT NULL
);

INSERT INTO tours(name, country_id, target_trip , price)
VALUES  
  ('Wild Australia', 1, 'excursion', 10000.50),
  ('Improving knowledge', 1, 'education', 20000.30),
  ('Hot vacation', 1, 'relaxation', 5000),
  ('Warm winter in Brazil', 2, 'relaxation', 3000.10), 
  ('Brazilian Carnival', 2, 'education', 4000.25), 
  ('Fashion in Sao Paulo', 2, 'shop_tour', 3600), 
  ('Step towards knowledge', 3, 'education', 15000), 
  ('From dress to heels', 3, 'shop_tour', 6000), 
  ('Center of the planet', 3, 'excursion', 6000), 
  ('Restoration', 4, 'treatment', 40000),
  ('Affordable education', 4, 'education', 25000),
  ('Defile in Canada', 4, 'shop_tour', 4000),
  ('Oriental kiss', 5, 'relaxation', 1200),
  ('The Magnificent Age of the Sultans', 5, 'excursion', 1000), 
  ('Refined Istanbul', 5, 'shop_tour', 800.50), 
  ('Arabian Night', 6, 'relaxation', 1300),
  ('Arabian podium', 6, 'excursion', 1150), 
  ('Refined Istanbul', 6, 'shop_tour', 800.50), 
  ('No restrictions', 7, 'treatment', 45000),
  ('Harvard World', 7, 'education', 30000),
  ('New York Fashion Week', 7, 'shop_tour', 10000),
  ('Mysterious islands of Thailand', 8, 'relaxation', 5000), 
  ('Around the tropics', 8, 'excursion', 6000), 
  ('Stylish Asia', 8, 'shop_tour', 7000), 
  ('Only the sea', 9, 'relaxation', 256.50), 
  ('Turtle Bay', 9, 'excursion', 1600), 
  ('Swimwear this summer', 9, 'shop_tour', 3000); 


CREATE TABLE sales (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id) ON DELETE CASCADE,
  tour_id INT REFERENCES tours(id) ON DELETE CASCADE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO sales(user_id, tour_id, created_at)
VALUES 
  (1, 6, '2025-04-15'),
  (1, 24, '2025-05-06'),
  (2, 10, '2025-06-11'),
  (2, 19, '2025-05-02'),
  (2, 25, '2025-04-18'),
  (3, 8, '2025-05-30'),
  (3, 12, '2025-04-25'),
  (3, 27, '2025-06-20'),
  (4, 2, '2025-01-05'),
  (4, 1, '2025-05-07'),
  (4, 3, '2025-06-28'),
  (5, 22, '2025-06-19'),
  (5, 16, '2025-05-25'),
  (5, 4, '2025-04-13'),
  (6, 17, '2025-06-08'),
  (6, 23, '2025-05-03'),
  (6, 26, '2025-04-11'),
  (7, 5, '2025-05-12'),
  (7, 14, '2025-03-04'),
  (8, 7, '2024-09-01'), 
  (8, 18, '2025-01-02'), 
  (8, 21, '2025-06-13'), 
  (9, 11, '2023-09-05'),
  (9, 13, '2024-07-06'), 
  (9, 27, '2025-06-27'), 
  (10, 20, '2024-09-04'),
  (10, 16, '2024-08-08'),
  (10, 23, '2025-02-15'),
  (1, 21, '2025-06-10'),
  (2, 21, '2025-06-10'),
  (3, 21, '2025-06-10'),
  (3, 11, '2024-09-01'),
  (4, 11, '2024-09-01'),
  (5, 11, '2024-09-01'),
  (3, 13, '2024-04-02'),
  (7, 13, '2024-03-02'),
  (10, 13, '2024-01-02'),
  (1, 26, '2024-03-02'),
  (2, 26, '2024-04-02'),
  (3, 26, '2024-05-02'),
  (4, 26, '2024-06-02'),
  (5, 26, '2024-07-02'),
  (6, 26, '2024-08-02'),
  (7, 26, '2024-09-02'),
  (8, 26, '2024-10-02'),
  (9, 26, '2024-11-02'),
  (10, 26, '2024-12-02'),
  (6, 5, '2025-06-05'),
  (7, 5, '2025-06-05'),
  (8, 5, '2025-06-05'),
  (9, 5, '2025-06-05'),
  (10, 5, '2025-06-05');


INSERT INTO sales(user_id, tour_id)
VALUES 
  (1, 15),
  (7, 9),
  (6, 22),
  (7, 22),
  (8, 22),
  (9, 22),
  (10, 22);
