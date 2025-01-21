import requests
from bs4 import BeautifulSoup
import pymysql

# MySQL 연결 설정
conn = pymysql.connect(
    host='localhost',
    user='root',
    password='yourpassword',  # MySQL 비밀번호
    db='yes24',               # 데이터베이스 이름
    charset='utf8mb4',
    cursorclass=pymysql.cursors.DictCursor
)

# Yes24 베스트셀러 페이지 URL
url = "http://www.yes24.com/24/Category/BestSeller"

# HTTP 요청
response = requests.get(url)
response.raise_for_status()  # HTTP 에러 확인
soup = BeautifulSoup(response.text, 'html.parser')

# 데이터 수집
books = []
book_elements = soup.select('.bestList > ol > li')  # 베스트셀러 목록

for book in book_elements:
    try:
        title = book.select_one('.goodsTxtInfo a').get_text(strip=True)
        author_info = book.select_one('.goodsTxtInfo .authPubInfo').get_text(strip=True)
        author, publisher, publishing = author_info.split('|')[:3]  # 저자, 출판사, 출판일 추출
        rating = book.select_one('.rating').get_text(strip=True) if book.select_one('.rating') else 'N/A'
        review = book.select_one('.rating span').get_text(strip=True) if book.select_one('.rating span') else '0'
        sales = book.select_one('.saleNum').get_text(strip=True) if book.select_one('.saleNum') else 'N/A'
        price = book.select_one('.priceB').get_text(strip=True).replace(',', '').replace('원', '') if book.select_one('.priceB') else '0'
        ranking = book.select_one('.num').get_text(strip=True)
        ranking_weeks = book.select_one('.topNum').get_text(strip=True) if book.select_one('.topNum') else 'N/A'

        books.append({
            'title': title,
            'author': author.strip(),
            'publisher': publisher.strip(),
            'publishing': publishing.strip(),
            'rating': rating,
            'review': int(review.replace('건', '').strip()),
            'sales': sales,
            'price': float(price),
            'ranking': int(ranking),
            'ranking_weeks': ranking_weeks.strip(),
        })
    except Exception as e:
        print(f"Error parsing book: {e}")

# MySQL에 데이터 저장
try:
    with conn.cursor() as cursor:
        # 테이블 생성
        create_table_sql = """
        CREATE TABLE IF NOT EXISTS bestsellers (
            id INT AUTO_INCREMENT PRIMARY KEY,
            title VARCHAR(255),
            author VARCHAR(255),
            publisher VARCHAR(255),
            publishing DATE,
            rating VARCHAR(10),
            review INT,
            sales VARCHAR(50),
            price DECIMAL(10, 2),
            ranking INT,
            ranking_weeks VARCHAR(50)
        );
        """
        cursor.execute(create_table_sql)

        # 데이터 삽입
        insert_sql = """
        INSERT INTO bestsellers 
        (title, author, publisher, publishing, rating, review, sales, price, ranking, ranking_weeks) 
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s);
        """
        for book in books:
            cursor.execute(insert_sql, (
                book['title'],
                book['author'],
                book['publisher'],
                book['publishing'],
                book['rating'],
                book['review'],
                book['sales'],
                book['price'],
                book['ranking'],
                book['ranking_weeks']
            ))
        conn.commit()

finally:
    conn.close()

print("Data saved to MySQL successfully!")
CREATE DATABASE yes24;
