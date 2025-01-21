SELECT title , author FROM books ,
 SELECT title, rating FROM Books WHERE rating >= 8;
SELECT title,  review FROM Books WHERE review >= 100;
SELECT title, price FROM Books WHERE price < 20000;
SELECT title, ranking_weeks FROM Books WHERE ranking_weeks >= 4;
SELECT title FROM Books WHERE author = '저자명';
SELECT title FROM Books WHERE author = '김영하';
SELECT title FROM Books WHERE publisher = '출판사';
SELECT title FROM Books WHERE publisher = '문학동네';
 SELECT author, COUNT(*) AS num_books FROM Books GROUP BY author;
SELECT publisher, COUNT(*) AS num_books FROM Books GROUP BY publisher ORDER BY num_books DESC LIMIT 1;
SELECT author, AVG(rating) AS avg_rating FROM Books GROUP BY author ORDER BY avg_rating DESC LIMIT 1;
SELECT title, author FROM Books WHERE ranking = 1;
SELECT title, sales, review FROM Books ORDER BY sales DESC, review DESC LIMIT 10;
SELECT title, publishing FROM Books ORDER BY publishing DESC LIMIT 5;
