-- 외래 키 옵션 해제
SET foreign_key_checks = 0;

-- 1. customerNumber 496 고객 삭제
DELETE FROM customers WHERE customerNumber = 496;

-- 2. products 테이블에서 S24_3856 제품 삭제
DELETE FROM products WHERE productCode = 'S24_3856';

-- 3. employees 테이블에서 employeeNumber 2000 직원 삭제
DELETE FROM employees WHERE employeeNumber = 2000;

-- 4. offices 테이블에서 제주도 사무실 삭제
DELETE FROM offices WHERE officeCode = 8;

-- 5. orders 테이블에서 orderNumber 10426 주문 삭제
DELETE FROM orders WHERE orderNumber = 10426;

-- 6. orderdetails 테이블에서 orderNumber 10426 주문 상세 삭제
DELETE FROM orderdetails WHERE orderNumber = 10426;

-- 7. payments 테이블에서 customerNumber 501 지불 내역 삭제
DELETE FROM payments WHERE customerNumber = 501;

-- 8. productlines 테이블에서 productLine 'New Line' 제품 라인 삭제
DELETE FROM productlines WHERE productLine = 'New Line';

-- 9. customers 테이블에서 nyc 지역의 모든 고객 삭제
DELETE FROM customers WHERE city = 'nyc';

-- 10. products 테이블에서 'Motorcycles' 카테고리의 모든 제품 삭제
DELETE FROM products WHERE productLine = 'Motorcycles';

-- 외래 키 옵션 설정
SET foreign_key_checks = 1;