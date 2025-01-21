SELECT title, rating 
FROM Books 
WHERE rating > (SELECT AVG(rating) FROM Books);
SELECT title, price 
FROM Books 
WHERE price > (SELECT AVG(price) FROM Books);
SELECT title, review 
FROM Books 
WHERE review > (SELECT MAX(review) FROM Books);
SELECT title, sales 
FROM Books 
WHERE sales < (SELECT AVG(sales) FROM Books);
SELECT title, publishing 
FROM Books 
WHERE author = (
    SELECT author 
    FROM Books 
    GROUP BY author 
    ORDER BY COUNT(*) DESC 
    LIMIT 1
) 
ORDER BY publishing DESC 
LIMIT 1;