-- member(일반회원)
insert into member
      (member_id, member_pw, member_name , member_email, 
      member_tel, member_post, member_base_address, member_detail_address, 
      member_birth, member_gender, member_status, member_point,member_joindate ,member_goodbye ,member_goodbyedate)
      values
      ('test1231', 'Test1234!', '홍길동', 'test@naver.com', 
      '01012345678', '00000', 'TEST주소입니다', 'TEST주소입니다',
      '1999-04-21','남자' , 'N', 0 , sysdate, 'N' , null);

-- member(훈련사)
insert into member
      (member_id, member_pw, member_name , member_email, 
      member_tel, member_post, member_base_address, member_detail_address, 
      member_birth, member_gender, member_status, member_point,member_joindate ,member_goodbye ,member_goodbyedate)
      values
      ('trainer1', 'trainer1!', '훈련사', 'test1@naver.com', 
      '01012435647', '12564', 'TEST주소입니다', 'TEST주소입니다',
      '1993-04-21','남자' , 'Y', 0 , sysdate, 'N' , null);

-- pet
insert into pet(
pet_no, member_id, pet_type, pet_name, 
pet_gender, pet_breed, pet_birth, pet_weight) 
values(pet_seq.nextval, 'test1233', '고양이', '테스트이름', '남', '품종', '2015-08-15', 4);

--trainer
insert into trainer
(trainer_no, member_id, apply_no, trainer_profile, trainer_profile_content)
values(trainer_seq.nextval, 'trainer1', 6,  '항상 밝게웃는 훈련사 입니다',
'어쩌구 저쩌구 나는 이러이러한 훈련사이고 모ㅗ모모모모모모모 어쩌꾸 저저구');

--apply
insert into apply(
apply_no, member_id, apply_date, apply_motive,
apply_smoke, apply_active, apply_license, apply_status)
values(apply_seq.nextval, 'trainer1', sysdate, '열심히 할게요',
'N', '평일', null, 'Y');
