SELECT author, AVG(rating) AS avg_rating 
FROM Books 
GROUP BY author;
SELECT publishing, COUNT(*) AS num_books 
FROM Books 
GROUP BY publishing;
SELECT title, AVG(price) AS avg_price 
FROM Books 
GROUP BY title;
SELECT title, review 
FROM Books 
ORDER BY review DESC 
LIMIT 5;
SELECT ranking, AVG(review) AS avg_review 
FROM Books 
GROUP BY ranking;

