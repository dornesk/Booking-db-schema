SELECT * FROM users;

-- просмотр всех объектов аренды
SELECT * FROM properties;

-- просмотр всех бронирований с JOIN для пользователя и объекта
SELECT 
    b.booking_id,
    u.first_name || ' ' || u.last_name AS user_name,
    p.name AS property_name,
    b.start_date,
    b.end_date,
    b.status
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id;

-- просмотр всех платежей с деталями бронирования
SELECT 
    pay.payment_id,
    b.booking_id,
    u.first_name || ' ' || u.last_name AS user_name,
    pay.amount,
    pay.payment_method,
    pay.payment_date
FROM payments pay
JOIN bookings b ON pay.booking_id = b.booking_id
JOIN users u ON b.user_id = u.user_id;

-- просмотр всех отзывов с рейтингом и комментариями
SELECT 
    r.review_id,
    u.first_name || ' ' || u.last_name AS user_name,
    p.name AS property_name,
    r.rating,
    r.comment,
    r.created_at
FROM reviews r
JOIN users u ON r.user_id = u.user_id
JOIN properties p ON r.property_id = p.property_id;


-- бронирования пользователя с ID = 1
SELECT * FROM bookings WHERE user_id = 1;

-- активные бронирования (status = 'confirmed')
SELECT * FROM bookings WHERE status = 'confirmed';

-- объекты с ценой меньше 100 за ночь
SELECT * FROM properties WHERE price_per_night < 100;

-- отзывы с рейтингом 5
SELECT * FROM reviews WHERE rating = 5;

-- сортировка бронирований по дате начала
SELECT * FROM bookings ORDER BY start_date ASC;

-- сортировка пользователей по дате создания
SELECT * FROM users ORDER BY created_at DESC;

-- просмотр всех избранных объектов для пользователя с user_id = 1
SELECT 
    uf.user_id,
    p.property_id,
    p.name,
    p.address,
    p.price_per_night
FROM user_favorites uf
JOIN properties p ON uf.property_id = p.property_id
WHERE uf.user_id = 1;

-- просмотр всех пользователей, которые добавили объект с property_id = 1 в избранное
SELECT
    uf.property_id,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM user_favorites uf
JOIN users u ON uf.user_id = u.user_id
WHERE uf.property_id = 1;

-- вывести все связи user_favorites для проверки
SELECT * FROM user_favorites;