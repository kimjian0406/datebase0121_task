UPDATE Books 
SET price = 30000 
WHERE title = 'New Book Title';
UPDATE Books 
SET title = 'Updated Title' 
WHERE author = '홍길동';
DELETE FROM Books 
DELETE FROM Books 
WHERE sales = (SELECT sales FROM (SELECT MIN(sales) AS sales FROM Books) AS temp);
UPDATE Books 
SET rating = rating + 1 
WHERE publisher = '민음사';