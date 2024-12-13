create database qltro character set='utf8';
use qltro;


create table tai_khoan (
	ma_tk int primary key,
    ten_dnhap varchar(20),
    mat_khau varchar(30),
    ho_ten varchar(50),
    sdt int,
    email varchar(50)
);
drop table tai_khoan;


insert into tai_khoan values (1, 'hungtg_2002', 'tghung@ctu', 'Trần Gia Hưng', '0982930212', 'tghung@gmail.com');
insert into tai_khoan values (2, 'vytt_2002', 'ttvy@ctu', 'Trương Triệu Vỹ', '0352647896', 'ttvy@gmail.com');
insert into tai_khoan values (3, 'thitk_2002', 'tkt@ctu', 'Trương Khả Thi', '0275489076', 'tkthi@gmail.com');

drop procedure register;

select * from tai_khoan;

select * from tai_khoan;

create table nha_tro (
	ma_tro varchar(6) primary key,
    ten_tro varchar(20) not null,
    dia_chi varchar(100)
);

insert into nha_tro values ('NT001', 'Nhà trọ Văn Đời 1', 'An Khánh, Ninh Kiều, Cần Thơ');
insert into nha_tro values ('NT002', 'Nhà trọ Văn Đời 2', 'Xuân Khánh, Ninh Kiều, Cần Thơ');
insert into nha_tro values ('NT003', 'Nhà trọ Văn Đời 3', 'Hưng Lợi, Ninh Kiều, Cần Thơ');

create table loai_phong (
	ma_loai varchar(6) primary key,
    dien_tich varchar(10),
    co_gac char(1),
    suc_chua int
);
drop table loai_phong;

insert into loai_phong values ('P1N-0', '12m2', 'N', '1');
insert into loai_phong values ('P1N-G', '12m2', 'Y', '1');
insert into loai_phong values ('P2N-0', '15m2', 'N', '2');
insert into loai_phong values ('P2N-G', '15m2', 'Y',  '2');
insert into loai_phong values ('P3N-0', '18m2', 'N', '3');
insert into loai_phong values ('P3N-G', '18m2', 'Y',  '3');

desc phong;
create table phong (
	ma_phong varchar(6) primary key,
    gia_phong int,
    duoc_thue char(1),
    ma_loai varchar(6),
    ma_tro varchar(6),
    chi_so_dien_cu int default 0,
    chi_so_nuoc_cu int default 0,
    chi_so_nuoc_moi int default 0,
    chi_so_dien_moi int default 0,
    foreign key(ma_loai) references loai_phong(ma_loai),
    foreign key(ma_tro) references nha_tro(ma_tro)
);
drop table phong;
insert into phong values ('001',1000000,'N','P1N-G','NT001',0,0,0,0);
insert into phong values ('002',1000000,'N','P1N-G','NT001',0,0,10,10);
insert into phong values ('003',1000000,'N','P1N-G','NT001',0,0,10,10);
insert into phong values ('004',1000000,'N','P1N-G','NT001',0,0,100,120);
insert into phong values ('005',1000000,'N','P1N-G','NT001',0,0,10,10);

insert into phong values ('006',1000000,'N','P1N-G','NT001',0,0,0,0);
insert into phong values ('007',1200000,'N','P2N-0','NT001',0,0,0,0);
insert into phong values ('016',1300000,'N','P2N-G','NT001',0,0,0,0);
insert into phong values ('008',1200000,'N','P2N-0','NT001',0,0,0,0);
insert into phong values ('009',1400000,'N','P3N-G','NT001',0,0,0,0);
insert into phong values ('010',1200000,'N','P2N-G','NT001',0,0,0,0);
insert into phong values ('011',1400000,'N','P3N-G','NT001',0,0,0,0);
insert into phong values ('012',1000000,'N','P1N-G','NT001',0,0,0,0);
insert into phong values ('013',1350000,'N','P3N-0','NT001',0,0,0,0);
insert into phong values ('014',1200000,'N','P2N-G','NT001',0,0,0,0);
insert into phong values ('015',1000000,'N','P1N-G','NT001',0,0,0,0);
select * from phong ;



create table khach_tro (
	ma_khach varchar(6) primary key,
    ho_ten varchar(50),
    ngay_sinh date,
    cmnd long,
    gioi_tinh varchar(3),
    sdt long
);
drop table khach_tro;
insert khach_tro values ('A','TRUONG TRIEU VY','2002-12-2',092202004227,'nam',0789191224);
insert khach_tro values ('B','TRUONG KHA THI','2002-8-2',092202004227,'nam',0775630124);
insert khach_tro values ('C','TRAN GIA HUNG','2002-9-2',092202004227,'nam',0542367891);
insert khach_tro values ('D','NGUYEN VAN A','2001-10-22',092202004227,'nam',0787234524);
insert khach_tro values ('E','NGUYEN VAN B','2002-12-12',092202004227,'nam',0789245631);
insert khach_tro values ('F','NGUYEN VAN C','2002-3-7',092202004227,'nam',0786537894);
insert khach_tro values ('G','NGUYEN VAN D','2002-8-14',092202004227,'nam',0740563089);
insert khach_tro values ('H','NGUYEN VAN E','2001-12-25',092202004227,'nam',0789235456);
select * from khach_tro;
create table hdong_thue (
	ma_hdong int primary key,
	ma_khach varchar(6),
    ma_phong varchar(10),
    ngay_lap date not null,
    ngay_tra_phong date,
    foreign key(ma_khach) references khach_tro(ma_khach),
    foreign key(ma_phong) references phong(ma_phong)
);

insert hdong_thue values (1,'A','001','2022-07-22','2025-07-22');
insert hdong_thue values (2,'B','002','2022-07-22','2025-07-22');
insert hdong_thue values (3,'C','002','2022-07-22','2025-07-22');
insert hdong_thue values (4,'D','003','2022-07-25','2025-07-25');
insert hdong_thue values (5,'E','004','2022-09-10','2025-09-10');
insert hdong_thue values (6,'F','004','2022-09-10','2025-09-10');
insert hdong_thue values (7,'G','005','2022-12-22','2025-12-22');
insert hdong_thue values (8,'H','005','2022-12-22','2025-12-22');

drop table hdong_thue;
select * from hdong_thue;

create table dich_vu (
	ma_dv varchar(4) primary key,
    don_gia_nuoc int,
    don_gia_dien int,
    don_vi_tinh varchar(6)
);
insert dich_vu values ('DN',10000,4000,'VND');

create table phieu_thu (
	ma_pthu int primary key,
    ma_phong varchar(6), 
    ngay_nhap date,
    tien_dien int,
    tien_nuoc int,
    gia_phong int,
    da_dong char(1),
    tong int,
    foreign key(ma_phong) references phong(ma_phong)
);
insert phieu_thu values (1,'001','2023-07-12',100000,100000,1000000,'N',1200000);
insert phieu_thu values (2,'002','2023-07-12',100000,100000,1000000,'N',1200000);
insert phieu_thu values (3,'003','2023-07-12',100000,100000,1000000,'Y',1200000);
drop table phieu_thu;
select * from phieu_thu;

-- 1
--------- /* cap nhap phieu thu */
drop table phieu_thu;
delimiter $
create procedure add_phieuthu(ppid varchar(20),ngay_nhap date)
begin
	declare max_id, dien_cu,nuoc_cu,dien ,nuoc,gia,tong int;
    select max(ma_pthu) into max_id from phieu_thu;
	select don_gia_nuoc from dich_vu where ma_dv ='DN' into dien;
    select don_gia_dien from dich_vu where ma_dv ='DN' into nuoc;
    select (chi_so_dien_moi - chi_so_dien_cu) from phong where ma_phong =ppid into dien_cu;
     select (chi_so_nuoc_moi - chi_so_nuoc_cu)from phong where ma_phong =ppid into nuoc_cu;
     select gia_phong from phong where ma_phong =ppid into gia;
     set tong =dien*dien_cu + nuoc*nuoc_cu + gia;
     insert phieu_thu values(max_id + 1,ppid,ngay_nhap,dien*dien_cu,nuoc*nuoc_cu,gia,'N',tong);
end$
drop procedure add_phieuthu;
call add_phieuthu('001','2023-05-17');
drop procedure if exists add_phieuthu;
select * from phieu_thu;

-- 2
-- cap nhap dien nuoc
delimiter $
create procedure up_diennuoc(ppid varchar(8), chisodien int, chisonuoc int)
begin
	declare temp,temp1 int;
    select chi_so_dien_moi from phong where ma_phong =ppid into temp;
    select chi_so_nuoc_moi from phong where ma_phong =ppid into temp1;
    update phong 
    set chi_so_dien_cu = temp,
     chi_so_nuoc_cu = temp1,
     chi_so_dien_moi = chisodien,
     chi_so_nuoc_moi = chisonuoc
    where ma_phong = ppid;
end$

drop procedure up_diennuoc;



delimiter $
create procedure up_diennuoc(ppid varchar(20))
begin
	declare temp,temp1 int;
    select chi_so_dien_moi from phong where ma_phong =ppid into temp;
    select chi_so_nuoc_moi from phong where ma_phong =ppid into temp1;
    update phong 
    set chi_so_dien_cu = temp,
     chi_so_nuoc_cu = temp1
    where ma_phong =ppid;
end$

drop procedure up_diennuoc;

-- 3 select du lieu tung nha tro
delimiter $
create procedure select_nhatro(pmt varchar(20))
begin
	declare temp,temp1 int;
    select * from phong where ma_tro = pmt;
end$
call select_nhatro('NT001');
 
 -- 4 tong hoa don
delimiter $
create function tong_doanh_thu()
returns int
begin
	return (select sum(tong) from phieu_thu where da_dong = 'Y') ;
end$
 
 select tong_doanh_thu();
drop function tong_doanh_thu;
 
delimiter $
create function doanh_thu_thang(pym varchar(7))
returns int
begin
	return (select sum(tong) from phieu_thu where ngay_nhap like Concat('%',pym,'%') and da_dong='Y') ;
end$

select doanh_thu_thang('2022-07');
drop function doanh_thu_thang;
select * from phieu_thu;

-- 5.cap nhap lai giá dien nuoc
delimiter $
create procedure up_dichvu(nuoc int , dien int)
begin
    update dich_vu
    set don_gia_nuoc = nuoc , don_gia_dien = dien where ma_dv ='DN';
end$

select * from dich_vu;
call up_dichvu(15000,20000);


-- 6 hopdong
desc hdong_thue;
delimiter $
create procedure add_hdong(ma_khach varchar(6), ma_phong varchar(10) , ngay_lap date , ngay_tra_phong date)
begin
	declare max_id int;
    select max(ma_hdong) into max_id from hdong_thue;
		insert hdong_thue values (max_id + 1,ma_khach,ma_phong,ngay_lap,ngay_tra_phong);
		update phong
		set duoc_thue = 'Y' where ma_phong = ma_phong;
end$

drop procedure add_hdong;
select * from hdong_thue;
select * from khach_tro;

-- 6.1 gia han hop dong
delimiter $
create procedure up_hdong(pmp varchar(6), pdate date)
begin 
	declare temp varchar(11);
	select ma_hdong into temp from hdong_thue where ma_phong = pmp;
    update hdong_thue
    set ngay_tra_phong = pdate where ma_hdong = temp;
end$

drop procedure up_hdong;
select * from hdong_thue;

call up_hdong('001', '2027-07-12');


-- 7  them khach tro
delimiter $
create procedure ins_khach(pmk varchar(6), photen varchar(50), pngaysinh date , cmnd long , sex varchar(3) , sdt int )
begin
    insert into khach_tro  values (pmk , photen , pngaysinh  , cmnd  , sex  , sdt );
end$

drop procedure ins_khach;

-- 8 them phong
delimiter $
create procedure ins_phong(ppid varchar(6), pgiaphong int, ploai varchar(6) ,pmatro varchar(6))
begin
    insert into phong values (ppid, pgiaphong, 'N' , ploai, pmatro ,0,0,0,0);
end$

drop procedure ins_phong;

--  9 thay doi thong tin khach tro
delimiter $
create procedure up_khach(pmk varchar(6), photen varchar(50), ava_khach blob , pngaysinh date , cmnd long , sex varchar(3) , sdt long   )
begin
    insert khach_tro  values (pmk , photen , ava_khach  , pngaysinh  , cmnd  , sex  , sdt );
end$

-- 10 truy van thong tin khach tro
delimiter $
create procedure infor(hoten varchar(50))
begin
     select * from khach_tro where ho_ten =hoten;

end$

select * from thong_bao;
-- 11 dang ky 
delimiter $
create procedure register (pten_dnhap varchar(20), pmat_khau varchar(30), pxac_nhan_mk varchar(30), pho_ten varchar(50), psdt int, pemail varchar(50))
begin
	declare max_id int;
    select max(ma_tk) into max_id from tai_khoan;
	insert into tai_khoan values (max_id + 1, pten_dnhap, pmat_khau, pho_ten, psdt, pemail);
end$


-- test
call register('hungtg_2002', 'tghung@ctu', 'tghung@ctu', 'Trần Gia Hưng', '0982930212', 'tghung@gmail.com');
call register('juhht_2002', 'lttrong@ctu', 'lttrong@cta', 'La Thanh Trọng', '0874321145', 'lttrong@gmail.com');
call register('tronglt_2002', 'lttrong@ctu', 'lttrong@ctu', 'La Thanh Trọng', '0874321145', 'lttrong@gmail.com');

drop procedure register;


-- 12 dang nhap
desc tai_khoan;

delimiter $
/*create procedure login (pten_dnhap varchar(20), pmat_khau varchar(30))
begin
	declare mkhau_dung varchar(30);
	if not exists (select ten_dnhap from tai_khoan where ten_dnhap = pten_dnhap) 
    then
		select 'Ten dang nhap khong dung hoac tai khoan khong ton tai';
	else
		select mat_khau into mkhau_dung from tai_khoan where ten_dnhap = pten_dnhap;
		if pmat_khau != mkhau_dung 
        then 
			select 'Sai mat khau';
		else 
			select 'Dang nhap thanh cong!';
		end if;
	end if;
end$
*/
drop procedure login;

call login ('cccc', 'adasda');
call login ('thitk_2002', 'adasda');
call login ('thitk_2002', 'tkt@ctu');

-- 13 tim kiem phong trong
select * from phong where duoc_thue = 'N';

-- 14 hien thi danh sach phong
select  * from phong;

-- 15 tong so dien nuoc trong tháng
delimiter $
create function total_dichvu(pdate date)
returns int
begin
	declare temp , temp1 int;
    select tien_dien into temp from phieu_thu where ngay_thu = pdate;
	select tien_nuoc into temp1 from phieu_thu where ngay_thu = pdate;
	return temp + temp1 ;
end$

drop function total_dichvu;

-- 15.1 tong so khoi dien va nuoc
delimiter $
CREATE FUNCTION total_dien()
RETURNS int 
BEGIN
	declare temp,total int;
		select don_gia_dien into temp from dich_vu where ma_dv='DN';
		select sum(tien_dien / temp) into total from phieu_thu;
     return total;
end$

select * from dich_vu;
drop function total_dien;
select * from phieu_thu;

delimiter $
CREATE FUNCTION total_nuoc()
RETURNS int 
BEGIN
	declare temp1,total1 int;
        select  don_gia_nuoc into temp1 from dich_vu where ma_dv='DN';
        select  sum(tien_nuoc / temp1) into total1 from phieu_thu;
     return  total1;
end$
drop function total_nuoc;
select total_dien('2023-07-12');
select total_nuoc('2023-07-12');

-- 16 xoa khach tro 
delimiter $
create procedure delete_khach(pmakhach varchar(6))
begin
    delete from hdong_thue where ma_khach = pmakhach;
    delete from khach_tro where ma_khach = pmakhach;
end$

drop procedure delete_khach;
call delete_khach('A');

select * from khach_tro;
select * from hdong_thue;

-- 17 tìm kiem hop dong
delimiter $
create procedure infor(hoten varchar(50))
begin
	declare temp varchar(6);
     select ma_khach into temp from khach_tro where ho_ten=hoten;
     select h.ma_hdong, h.ma_khach, k.ho_ten, h.ma_phong, h.ngay_lap, h.ngay_tra_phong from hdong_thue h join khach_tro k on h.ma_khach = k.ma_khach where h.ma_khach = temp;
end$
drop procedure infor;
call infor('TRUONG TRIEU VY');

-- 18  lam trong phong
delimiter $
create procedure up_phong(ppid varchar(6))
begin
	update phong 
    set duoc_thue = false where ma_phong=ppid;
end$

-- 19 set don da dong
delimiter $
create procedure da_dong(pmpt int)
begin
	update phieu_thu
    set da_dong = 'Y' where ma_pthu=pmpt;
end$
call da_dong('001');
drop procedure da_dong;
select *  from phieu_thu;

delimiter $
create procedure da_dong(ten varchar(30))
begin
	declare pmk , ppid   int  ; 
    declare mpt varchar(10);
    select ma_khach from khach_tro where ho_ten =ten into pmk ;
    select ma_phong from hdong_thue where ma_khach = pmk into ppid ;
    select ma_pthu from phieu_thu where ma_phong = ppid into mpt;
    update phieu_thu
    set da_dong = true where ma_pthu=mpt;
end$
drop procedure da_dong;

-- 20 xem danh sach khach hang chua dong tien
delimiter $
create procedure khach_no()
begin
	select k.ma_khach, k.ho_ten, p.ma_phong from phieu_thu p join hdong_thue h on p.ma_phong = h.ma_phong join khach_tro k on k.ma_khach = h.ma_khach where p.da_dong = false;
end$

call khach_no();

desc khach_tro;
delimiter $
create procedure tim_khach(pname varchar(30))
begin 
	select * from khach_tro k where ho_ten like Concat('%',pname,'%');
end$

call tim_khach('vy');

drop procedure khach_no;
/*
delimiter $
CREATE FUNCTION firstName(ppid varchar(20),mpt varchar(10),ngay_nhap date)
RETURNS varchar(50)
BEGIN
 declare dien_cu,nuoc_cu,dien ,nuoc,gia,tong int;
	select don_gia_nuoc from dich_vu where ma_dv ='DN' into dien;
    select don_gia_nuoc from dich_vu where ma_dv ='DN' into nuoc;
    select chi_so_dien_cu from phong where ma_phong =ppid into dien_cu;
     select chi_so_nuoc_cu from phong where ma_phong =ppid into nuoc_cu;
     select gia_phong from phong where ma_phong =ppid into gia;
      set tong =dien*dien_cu + nuoc*nuoc_cu + gia;
     call add_phieuthu(ppid,mpt,ngay_nhap);
     return (dien_cu,nuoc_cu,dien ,nuoc,gia,tong);
END $*/
drop function if exists firstName;
 select firstName('002','2','2022-10-07');

