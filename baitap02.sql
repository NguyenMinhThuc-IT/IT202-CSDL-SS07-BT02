CREATE DATABASE Training_Center_DB;
USE Training_Center_DB;

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    amount DECIMAL(15, 2),
    payment_date DATE
);

-- Chèn dữ liệu mẫu
INSERT INTO Payments (student_id, amount, payment_date) VALUES 
(1, 8000000, '2024-01-10'), (1, 3000000, '2024-02-15'), 
(2, 5000000, '2024-01-12'),                          
(3, 12000000, '2024-03-01'),                          
(4, 9000000, '2024-02-20');       

SELECT 
    SUM(VIP_List.total_spent) AS total_vip_revenue
FROM (
    SELECT 
        student_id, 
        SUM(amount) AS total_spent
    FROM Payments
    GROUP BY student_id
    HAVING SUM(amount) > 10000000
) AS VIP_List; 

/*
Vá lỗi cú pháp: Việc thêm AS VIP_List giúp trình biên dịch của MySQL xác định được phạm vi dữ liệu (Scope).

Logic nghiệp vụ: Bằng cách tách biệt việc "Tính tổng chi tiêu mỗi người" và "Tính tổng doanh thu toàn bộ VIP", 

chúng ta đảm bảo con số cuối cùng là chính xác và không bị lặp lại dữ liệu.
*/