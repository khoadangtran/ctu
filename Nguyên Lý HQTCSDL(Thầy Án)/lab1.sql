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
