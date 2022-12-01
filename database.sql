-- member 회원
drop table member;
create table member(
member_id varchar2(20) primary key check(regexp_like(member_id,'^[a-z][a-zA-Z0-9!@#$-_]{4,19}$')),
member_pw varchar2(16) not null check(regexp_like(member_pw, '^[a-zA-Z0-9!@#$]{8,16}$')),
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

-- pet 반려동물
drop table pet;
create table pet(
pet_no number primary key,
member_id references member(member_id) on delete cascade,
pet_type char(9) not null,
pet_name varchar2(30) not null,
pet_gender char(1) not null check(pet_gender in('Y','N')),
pet_breed varchar2(90) not null,
pet_birth date,
pet_weight number
);

drop sequence pet_seq;
create sequence pet_seq;

-- traning 훈련서비스 신청
drop table training;
create table training(
training_no number primary key,
member_id references member(member_id) on delete set null,
training_date date not null,
training_starttime date not null,
training_basic_address varchar2(150) not null,
training_detail_address varchar2(150) not null,
training_memo varchar2(300) not null,
training_status varchar2(12) not null check(training_status in('예약대기','예약확정','취소완료','이용완료')),
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
purchase_detail_pet_no number not null,
purchase_detail_price number not null,
purchase_detail_status char(6) not null check(purchase_detail_status in('승인','취소'))
);

drop sequence purchase_detail_seq;
create sequence purchase_detail_seq;



create table training_detail( ------훈련서비스 상세
training_no references training(training_no) on delete cascade,
training_detail_pet_no number not null
); 

create table schedule(-------스케쥴
schedule_no number primary key,
trainer_no references trainer(trainer_no) on delete cascade,
schedule_date date
);

create sequence schedule_seq;

create table linked_list(-------연결테이블
training_no references training(training_no) on delete cascade,
trainer_no references trainer(trainer_no) on delete cascade
);

create table pet_img(-------반려동물 이미지
files_no references files(files_no) on delete cascade,
pet_no references pet(pet_no) on delete cascade
);

create table trainer(-------훈련사
trainer_no number primary key,
member_id references member(member_id) on delete cascade,
apply_no references apply(apply_no) on delete cascade,
trainer_profile varchar2(90) not null,
trainer_profile_content varchar2(4000) not null
);

create sequence trainer_seq;

create table review(-------별점
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

create sequence review_no;

create table admin(

admin_id varchar2(20)  primary key,
admin_pw varchar2(16)  not null
);

