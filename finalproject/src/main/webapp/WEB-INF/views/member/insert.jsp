<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="CareRegistration" name="title"/>
</jsp:include>
<body>
	
	<div class="container-fluid">

        <div class="row mt-4">
            <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-4">
                 <h1 class="text-center">회원가입</h1>
            </div>
        </div>
        <form action="insert" method="post" enctype="multipart/form-data">
        <div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row form-group">
					<label>
						아이디
						<i class="fa-solid fa-asterisk blue"></i>
					</label>
					<div class="input-group">
						<input type="text" name="memberId" class="form-control underline w-75" aria-describedby="memberId-button">
	      				<button class="btn btn-outline-blue w-25" type="button" id="memberId-button">중복 확인</button>
					</div>
					<div class="valid-feedback">올바른 아이디 형식입니다</div>
					<div class="invalid-feedback">영문 소문자로 시작하고 숫자가 포함된 8~20자로 작성하세요</div>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row">
					<label>
						비밀번호
						<i class="fa-solid fa-asterisk blue"></i>
					<input type="password" name="memberPw" class="form-control underline">
					</label>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row">
					<label>
						비밀번호 재확인
						<i class="fa-solid fa-asterisk blue"></i>
					<input type="password" name="memberPwRe" class="form-control underline">
					</label>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row">
					<label>
						이름
						<i class="fa-solid fa-asterisk blue"></i>
					<input type="text" name="memberName" class="form-control underline">
					</label>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row">
					<label>
						이메일
						<i class="fa-solid fa-asterisk blue"></i>
					<input type="email" name="memberEmail" class="form-control underline">
					</label>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row">
					<label>
						휴대폰
						<i class="fa-solid fa-asterisk blue"></i>
					<input type="tel" name="memberTel" class="form-control underline" maxlength="11" placeholder="숫자만 입력해주세요">
					</label>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row">
					<label>
						주소
						<i class="fa-solid fa-asterisk blue"></i>
					<input type="text" name="memberPost" class="form-control underline" maxlength="6" placeholder="우편번호">
					<input type="text" name="memberBaseAddress" class="form-control underline" placeholder="기본주소">
					<input type="text" name="memberDetailAddress" class="form-control underline" placeholder="상세주소">
					</label>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row">
					<label>
						생년월일
						<i class="fa-solid fa-asterisk blue"></i>
					<input type="date" name="memberBirth" class="form-control underline">
					</label>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-6 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row">
					<label>
						성별
						<i class="fa-solid fa-asterisk blue"></i>
					</label>
						<div class="row">
							<div class="col-md-6 offset-md-1 text-center">
							<label>남자
							<input type="checkbox" id="genderMan" name="memberGender" class="memberGender" value="남자">
							</label>
							&nbsp;&nbsp;
							<label>여자
							<input type="checkbox" id="genderGirl" name="memberGender" class="memberGender" value="여자">
							</label>
							</div>
						</div>
				</div>
			</div>
		</div>
		<div class="row mt-4 text-center">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<button type="submit" class="btn btn-blue w-75">회원가입</button>
			</div>
		</div>
		</form>
    </div>
	
</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>