TRUNCATE TABLE reviews, payments, bookings, properties, users RESTART IDENTITY CASCADE; --убрать конфликты ключей

INSERT INTO users (first_name, last_name, email, phone)
VALUES 
('Alice', 'Smith', 'alice@example.com', '123-456-7890'),
('Bob', 'Johnson', 'bob@example.com', '234-567-8901'),
('Charlie', 'Brown', 'charlie@example.com', '345-678-9012');

INSERT INTO properties (owner_id, name, address, price_per_night)
VALUES
(1, 'house1', 'street1', 50.00),
(2, 'house2', 'street2', 120.00),
(1, 'house3', 'street3', 80.00);

INSERT INTO bookings (user_id, property_id, start_date, end_date, status)
VALUES
(1, 2, '2025-09-01', '2025-09-05', 'confirmed'),
(2, 1, '2025-08-15', '2025-08-20', 'pending'),
(3, 3, '2025-08-10', '2025-08-12', 'canceled');

INSERT INTO payments (booking_id, amount, payment_method)
VALUES
(1, 480.00, 'card'),   -- одно бронирование = один платеж
(2, 250.00, 'cash');

INSERT INTO reviews (user_id, property_id, rating, comment)
VALUES
(1, 2, 5, 'highly recommend'),
(2, 1, 4, 'great location'),
(3, 3, 3, 'was okay');
