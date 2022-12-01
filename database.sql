
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

