create database QLKho;
use QLKho;
create table nhacc(
	mancc char(5) primary key,
    tenncc varchar(50) not null,
    diachi text,
    sdt varchar(20)
);
create table phieuxuat(
	sopx char(5) primary key,
    ngayxuat date default(CURDATE())    
);
create table phieunhap(
	sopn char(5) primary key,
    ngaynhap date default(curdate())
);
create table vattu(
	mavt char(5) primary key,
    tenvt varchar(50) not null unique
);
create table phieuxuatct(
	sopx char(5),
    mavt char(5),
    foreign key (sopx) references phieuxuat(sopx),
    foreign key (mavt) references vattu(mavt),
    primary key(sopx,mavt),
    dgxuat float not null check(dgxuat>0),
    slxuat float not null check(slxuat>0)
);
create table phieunhapct(
	mavt char(5),
    sopn char(5),
    foreign key(mavt) references vattu(mavt),
    foreign key(sopn) references phieunhap(sopn),
    primary key(mavt,sopn),
    dgnhap float not null check(dgnhap>0),
    slnhap float not null check(slnhap>0)
);
create table dondh(
	sodh char(5) primary key,
    ngaydh date default(curdate()),
    mancc char(5),
    foreign key(mancc) references nhacc(mancc)
);
create table dondhct(
	mavt char(5),
    sodh char(5),
    foreign key(mavt) references vattu(mavt),
    foreign key(sodh) references dondh(sodh),
    primary key(mavt,sodh)
);