
-- admin 관리자
drop table admin;
create table admin(
admin_id varchar2(20)  primary key,
admin_pw varchar2(16)  not null
);


-- member 회원
drop table member;
create table member(
member_id varchar2(20) primary key check(regexp_like(member_id,'^[a-z][a-zA-Z0-9!@#$-_]{4,19}$')),
member_pw varchar2(60) not null,
member_name varchar2(21) not null check(regexp_like(member_name, '^[a-zA-Z가-힣]{2,7}$')),
member_email varchar2(30) not null check(regexp_like(member_email,'@')),
member_tel char(11) not null check(regexp_like(member_tel,'^01[016789][1-9]\d{6,7}$')),
member_post varchar2(6) not null check(regexp_like(member_post, '^\d{5,6}$')),
member_base_address varchar2(150) not null,
member_detail_address varchar2(150),
member_birth date not null,
member_gender char(6) not null check(member_gender in('남자','여자')),
member_status char(1) default 'N' check(member_status in('Y','N')),
member_point number default 0 check(member_point >=0),
member_joindate date default sysdate,
member_goodbye char(1) default 'N' check(member_goodbye in('Y','N')),
member_goodbyedate date
); 


--항목 item
drop table item;
create table item(
item_no number primary key,
item_name varchar2(30) not null,
item_price number not null,
item_date date default sysdate not null,
item_changedate date default sysdate not null,
item_disabled char(1) not null
);

drop sequence item_seq;
create sequence item_seq;


-- 포인트 구매내역 point_purchase
drop table point_purchase;
create table point_purchase(
point_purchase_no number primary key,
member_id varchar2(20) not null,
item_no number not null,
point_purchase_price number not null check(point_purchase_price >= 0),
point_purchase_date date default sysdate,
point_purchase_payment char(15) not null check(point_purchase_payment in('카카오페이')),
point_purchase_status char(6) not null check(point_purchase_status in ('승인', '취소')) ,
tid varchar2(300) not null
);

drop sequence point_purchase_seq;
create sequence point_purchase_seq;


-- 포인트 사용내역 point
drop table point;
create table point(
point_no number primary key,
member_id varchar2(20) not null,
point_status char(6) not null check(point_status in('구매','사용','환불')),
point_price number not null,
point_date date default sysdate
);

drop sequence point_seq;
create sequence point_seq;



-- pet 반려동물
drop table pet;
create table pet(
pet_no number primary key,
member_id references member(member_id) on delete cascade,
pet_type char(9) not null,
pet_name varchar2(30) not null,
pet_gender varchar2(6),
pet_breed varchar2(90) not null,
pet_birth date,
pet_weight number
);
alter table pet add pet_neutralization varchar2(3)  not null;

drop sequence pet_seq;
create sequence pet_seq;



-- traning 훈련서비스 신청
drop table training;
create table training(
training_no number primary key,
member_id references member(member_id) on delete set null,
training_date date not null,
training_starttime varchar2(10) not null,
training_basic_address varchar2(150) not null,
training_detail_address varchar2(150) not null,
training_memo varchar2(300) not null,
training_status varchar2(12) not null check(training_status in('예약대기','예약확정','예약취소','이용완료')),
training_changedate date default sysdate
);

drop sequence training_seq;
create sequence training_seq;



-- training_purchase 훈련서비스 결제
drop table training_purchase;
create table training_purchase(
training_purchase_no number primary key,
training_no references training(training_no) on delete cascade,
training_purchase_price number not null,
training_purchase_payment char(9) not null,
training_purchase_date date default sysdate
);

drop sequence training_purchase_seq;
create sequence training_purchase_seq;


-- training_purchase_detail 훈련서비스 결제상세내역
drop table purchase_detail;
create table purchase_detail(
purchase_detail_no number primary key,
training_purchase_no references training_purchase(training_purchase_no) on delete cascade,
purchase_detail_pet_name varchar2(30) not null,
purchase_detail_price number not null,
purchase_detail_status char(6) not null check(purchase_detail_status in('승인','취소'))
);

drop sequence purchase_detail_seq;
create sequence purchase_detail_seq;


-- training_detail 훈련서비스 상세
drop table training_detail;
create table training_detail( 
training_no references training(training_no) on delete cascade,
training_detail_pet_name varchar2(30) not null
); 

-- apply 훈련사 지원
drop table apply;
create table apply(
apply_no number primary key,
member_id varchar2(20) not null,
apply_date date default sysdate not null,
apply_motive varchar2(4000)not null,
apply_smoke char(1)not null,
apply_active varchar2(100) not null,
apply_license varchar2(100),
apply_status char(6) default '신청' not null check(apply_status in('신청','승인','반려'))
);

create sequence apply_seq;
drop sequence apply_seq;



-- trainer 훈련사
drop table trainer;
create table trainer(
trainer_no number primary key,
member_id references member(member_id) on delete cascade,
apply_no references apply(apply_no) on delete cascade,
trainer_profile varchar2(90) not null,
trainer_profile_content varchar2(4000) not null
);

drop sequence trainer_seq;
create sequence trainer_seq;





-- trainer_like 훈련사 찜
drop table trainer_like;
create table trainer_like(
member_id references member(member_id) on delete cascade not null,
trainer_no references trainer(trainer_no) on delete cascade not null,
trainer_like_date date default sysdate,
primary key(member_id, trainer_no)
);


-- linked_list 연결테이블
drop table linked_list;
create table linked_list(
training_no references training(training_no) on delete cascade,
trainer_no references trainer(trainer_no) on delete cascade
);


-- 스케쥴
drop table schedule;
create table schedule(
schedule_no number primary key,
trainer_no references trainer(trainer_no) on delete cascade,
schedule_date date
);

drop sequence schedule_seq;
create sequence schedule_seq;


-- review 후기
drop table review;
create table review(
review_no number primary key,
training_no references training(training_no) on delete cascade,
trainer_no references trainer(trainer_no) on delete cascade,
member_id references member(member_id) on delete cascade,
review_title varchar2(90) not null,
review_content varchar2(4000) not null,
review_writetime date default sysdate not null,
review_updatetime date,
review_good number not null
);

drop sequence review_seq;
create sequence review_seq;


--첨부파일 테이블
drop table files;
create table files(
files_no number PRIMARY KEY,
files_original_name varchar2(256) not null,
files_type varchar2(30) not null,
files_size number not null,
files_date date DEFAULT sysdate not null
);

-- pet_img 반려동물 이미지
drop table pet_img;
create table pet_img(
files_no references files(files_no) on delete cascade,
pet_no references pet(pet_no) on delete cascade
);

drop SEQUENCE files_seq;
create SEQUENCE files_seq; --files테이블의 시퀀스번호


--회원 프로필 이미지 연결 테이블
drop table member_img;
create table member_img( 
files_no REFERENCES files(files_no) on DELETE CASCADE ,
member_id REFERENCES member(member_id) on DELETE CASCADE
);


 --채팅유저 테이블
drop table chat_user;
create table chat_user(
member_id REFERENCES member(member_id) on DELETE set null,
room_no REFERENCES room(room_no) on DELETE CASCADE,
member_name varchar2(21) not null,
member_status char(1) not null
);



--채팅방 테이블
drop table room;
create table room( 
room_no number PRIMARY key,
room_create_at date DEFAULT sysdate not null,
room_update_at date
);

drop SEQUENCE room_seq;
create SEQUENCE room_seq;


--채팅 테이블
drop table chat;
create table chat ( 
chat_no number PRIMARY key,
room_no REFERENCES room(room_no),
member_id REFERENCES member(member_id) on DELETE set null,
chat_create_at date DEFAULT sysdate not null,
chat_message VARCHAR2(3000) not null,
chat_message_status CHAR(1) default null
);
ALTER TABLE chat MODIFY chat_message VARCHAR2(3000) NULL;


drop SEQUENCE chat_seq;
create SEQUENCE chat_seq;


--채팅 이미지 연결 테이블
drop table chat_img;
create table chat_img( 
files_no REFERENCES files(files_no) on DELETE set null,
chat_no REFERENCES chat(chat_no) on DELETE CASCADE
);

-- emailcert 이메일인증
drop table emailcert;
create table emailcert(
emailcert_email varchar2(60) primary key,
emailcert_serial char(6) not null,
emailcert_send date default sysdate not null
);
