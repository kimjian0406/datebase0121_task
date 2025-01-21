SELECT 
    author, 
    AVG(rating) AS avg_rating, 
    AVG(sales) AS avg_sales 
FROM Books 
GROUP BY author;
SELECT 
    publishing, 
    AVG(price) AS avg_price 
FROM Books 
GROUP BY publishing;
SELECT 
    publisher, 
    COUNT(*) AS num_books, 
    AVG(review) AS avg_review 
FROM Books 
GROUP BY publisher;
SELECT 
    ranking, 
    AVG(sales) AS avg_sales 
FROM Books 
GROUP BY ranking;
SELECT 
    price, 
    AVG(review) AS avg_review, 
    AVG(rating) AS avg_rating 
FROM Books 
GROUP BY price;