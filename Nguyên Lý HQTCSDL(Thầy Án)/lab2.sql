create database qldiem character set='utf8';

use qldiem;

create table khoa (
	makhoa char(10) primary key, 
	tenkhoa varchar(100) not null);

create table sinhvien (
	mssv char(11) primary key, 
	hoten char(50) not null, 
	makhoa char(10), 
	foreign key (makhoa) references khoa(makhoa));

create table hocphan (
	mahp char(6) primary key, 
	tenhp char(30) not null, 
	tinchi int unsigned not null);


create table ketqua (
	mssv char(11),
	mahp char(6), 
	diem float, 
	primary key (mssv, mahp),
	foreign key (mssv) references sinhvien(mssv),
	foreign key (mahp) references hocphan(mahp)
);

insert into khoa values ('cntt', 'Công nghệ thông tin và Truyền thông');
insert into khoa values ('sp', 'Sư phạm');
insert into khoa values ('kt', 'Kinh tế và quả trị kinh doanh');
insert into khoa values ('kl', 'Khoa luật');

insert into sinhvien values 
	('111', 'Nguyễn Thái Nghe', 'cntt'),
	('222', 'Nguyễn Thanh Hải', 'cntt'),
	('333', 'Trần Công Án', 'sp');

insert into hocphan values ('ct101', 'Lập trình căn bản', 3);
insert into hocphan values ('ct102', 'Cấu trúc dữ liệu', 2);
insert into hocphan values ('ct237', 'Nguyên lý Hệ quản trị CSDL', 3);
insert into hocphan values ('ct107', 'Nguyên lý Hệ điều hành', 3);

insert into ketqua values ('111', 'ct101', 8);
insert into ketqua values ('111', 'ct102', 10);		/* (8*3 + 10*2)/5 */
insert into ketqua values ('222', 'ct101', 8);
insert into ketqua values ('222', 'ct102', 6);			/* (8*3 + 6*2)/5 */
insert into ketqua values ('333', 'ct101', 4);
insert into ketqua values ('333', 'ct102', 6);
insert into ketqua values ('333', 'ct237', 8);



DELIMITER //
CREATE PROCEDURE ADD_STUDENT(
    IN studentID INT,
    IN studentName VARCHAR(255),
    IN studentSex VARCHAR(10),
    IN studentDOB DATE,
    IN studentPOB VARCHAR(255),
    IN studentAddress VARCHAR(255),
    IN departmentName VARCHAR(255)
)
BEGIN
    -- Insert student into Students table
    INSERT INTO Students (StudentID, StudentName, StudentSex, StudentDOB, StudentPOB, StudentAddress, DepartmentName)
    VALUES (studentID, studentName, studentSex, studentDOB, studentPOB, studentAddress, departmentName);
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DEL_STUDENT(
    IN studentID INT
)
BEGIN
    -- Delete student results from ketQua table
    DELETE FROM ketQua WHERE StudentID = studentID;
    
    -- Delete student from SinhVien table
    DELETE FROM SinhVien WHERE StudentID = studentID;
END//
DELIMITER ;

DELIMITER //
CREATE FUNCTION AVG_GRADE(studentID INT)
RETURNS DECIMAL(5, 2)
BEGIN
    DECLARE avgGrade DECIMAL(5, 2);
    
    -- Calculate average grade for the student
    SELECT AVG(Grade) INTO avgGrade
    FROM ketQua
    WHERE StudentID = studentID;
    
    IF avgGrade IS NULL THEN
        RETURN -1;
    ELSE
        RETURN avgGrade;
    END IF;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE AVG_GRADE_DEPT(
    IN departmentID INT
)
BEGIN
    -- Calculate average grade for all students in a department
    SELECT AVG(kq.Grade) AS AverageGrade, sv.StudentName
    FROM SinhVien sv
    JOIN ketQua kq ON sv.StudentID = kq.StudentID
    WHERE sv.DepartmentID = departmentID
    GROUP BY sv.StudentName;
END//
DELIMITER ;



START TRANSACTION;

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

COMMIT;

ROLLBACK;



-- Tạo bảng Accounts
CREATE TABLE Accounts (
    Username VARCHAR(8) PRIMARY KEY,
    Fullname VARCHAR(128),
    Balance INT
);

-- Insert dữ liệu vào bảng Accounts
INSERT INTO Accounts (Username, Fullname, Balance)
VALUES
    ('jones', 'Alice Jones', 82),
    ('bitdiddl', 'Ben Bitdiddle', 65),
    ('mike', 'Michael Dole', 73),
    ('alyssa', 'Alyssa P. Hacker', 79);



-- Connection 1
START TRANSACTION;
SELECT * FROM Accounts;

-- Connection 2
START TRANSACTION;
INSERT INTO Accounts VALUES('chuck', 'Charles Robinson', 55);

-- Connection 1
COMMIT;

-- Connection 1
SELECT * FROM Accounts;

-- Connection 2
ROLLBACK;



/* Connection 1:  */

-- Bắt đầu giao dịch
BEGIN;

-- Thực hiện một UPDATE trên tài khoản 'mike'
UPDATE Accounts
SET balance = balance + 10
WHERE username = 'mike';

-- Để tạo deadlock, chúng ta cần chờ lâu
-- Ví dụ: chờ 10 giây
SELECT SLEEP(10);

-- Tiếp tục thực hiện UPDATE khác
UPDATE Accounts
SET balance = balance - 10
WHERE username = 'alyssa';

-- Commit giao dịch
COMMIT;

/* Connection 2:  */

-- Bắt đầu giao dịch
BEGIN;

-- Thực hiện một UPDATE trên tài khoản 'alyssa' (được chặn bởi Connection 1)
UPDATE Accounts
SET balance = balance - 10
WHERE username = 'alyssa';

-- Để tạo deadlock, chúng ta cũng chờ lâu
-- Ví dụ: chờ 10 giây
SELECT SLEEP(10);

-- Tiếp tục thực hiện UPDATE khác
UPDATE Accounts
SET balance = balance + 10
WHERE username = 'mike';

-- Commit giao dịch
COMMIT;




