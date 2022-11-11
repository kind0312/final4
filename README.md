# 회의록

# 2022.11.08(화)
## 전체 회의
### 회의 내용
- 깃허브 기본설정 (브랜치, 저장소 생성 등...)
    - 브랜치 개설 보류
- 간단한 주제 회의
    - 동적인 사이트가 아닌 역동적인 사이트(ex)결제, 채팅 등...
    - 와요 확정(위치, 결제 등 역동적인 기능이 많음 또한 배운것을 많이 사용할 수 있을거 같음)
    - 와요 홈페이지 분석이 중요할 것 같음(최대한 빠르게)
    - 와요를 벤치마킹 하여 기능 분석 후 뺄거 빼고 구현 가능한 기능 정리해서 설계를 하면 될 것 같음 
    

- 다음 회의 까지 할 일
   - 와요 홈페이지 분석
   - 구글 스프레드 시트 확인하고 적용할거 생각해보기!

### 일정
|기한|내용|비고|
|:--|:--|:--|
|~11/11(금)|개인 분석내용 공유 및 희망 기능 구현 공유|
|~11/14(월)|주말간 ERD 및 flow 그냥 한번 두드려보기(필수아님!)|
|~11월 2|기능 상세 정의|주제에 따라 일정 재산정 예정|
   
---

# 2022.11.11(금)
## 전체 회의
### 회의 내용
#### 펫시터 -> 훈련사로 컨셉 변경(인근 매칭 및 기술적 한계로 전국 출장 개념)


- 기능(공통)
  - 회원가입(주소) :정석, BUT 주소 API사용, 이메일 인증, 펫시터 가입(관리자 승인 필요) or 일반 회원가입
  - 로그인 : 정석(소셜로그인 보류)
  - 계정 : 3개(펫시터, 일반회원, 관리자)
  - 이용후기 조회 : 게시판 형식, 시터에 대해
  
- 기능(회원)  
  - 이용후기 작성 : 게시판 형식, 펫시터에 대해, 별점 기능
  - Q&A 작성 : 일반회원도 답변가능 펫시터답변 신뢰할만한 아이콘으로 표시!
  - 채팅 기능 : 훈련사와 1대1 문의 채팅 기능
  - 알림 기능(토스트 라이브러리) : 채팅 알림, 예약 알림(취소 등...), Q&A 알림, 찜 알림
  - 반려견 등록 : 반려경 특징 등록
  - 케어서비스 신청 : 주소, 방문방법, 결제, 등
  - 매칭() : 공고방식(회원이), 선택받는식(시터가), 
  - 펫시터 프로필 조회 : 별점 및 자기 자신에 대한 소개 및 활동 지역, 사진 , 이름 등...
  - 결제 확정 기능 : 이용후기, 별점, 버튼(보류★)
  
- 기능(시터)  
    - 알림 기능(토스트 라이브러리) : 채팅 알림, 예약 알림(취소 등...), Q&A 알림, 찜 알림, 후기 알림
    - 신청 리스트 : 회원의 신청 list 조회
    - 예약 승인/거절 : 두개로 나뉘어짐 훈련사가 취소하거나 회원이 취소하거나, 즉시결제
    - 채팅 기능 :  알림 및 내용 
    - 활동 내역 
    - 문의 하기
    
    
 - 기능(관리자)   
    - 
    
