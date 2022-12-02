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
        <div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row">
					<label>
						아이디
						<i class="fa-solid fa-asterisk text-danger"></i>
					<input type="text" name="id" class="form-control underline">
					</label>
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
						<i class="fa-solid fa-asterisk text-danger"></i>
					<input type="text" name="id" class="form-control underline">
					</label>
					<div class="valid-feedback">올바른 아이디 형식입니다</div>
					<div class="invalid-feedback">영문 소문자로 시작하고 숫자가 포함된 8~20자로 작성하세요</div>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row">
					<label>
						비밀번호 재확인
						<i class="fa-solid fa-asterisk text-danger"></i>
					<input type="text" name="id" class="form-control underline">
					</label>
					<div class="valid-feedback">올바른 아이디 형식입니다</div>
					<div class="invalid-feedback">영문 소문자로 시작하고 숫자가 포함된 8~20자로 작성하세요</div>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row">
					<label>
						이메일
						<i class="fa-solid fa-asterisk text-danger"></i>
					<input type="text" name="id" class="form-control underline">
					</label>
					<div class="valid-feedback">올바른 아이디 형식입니다</div>
					<div class="invalid-feedback">영문 소문자로 시작하고 숫자가 포함된 8~20자로 작성하세요</div>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row">
					<label>
						휴대폰
						<i class="fa-solid fa-asterisk text-danger"></i>
					<input type="text" name="id" class="form-control underline">
					</label>
					<div class="valid-feedback">올바른 아이디 형식입니다</div>
					<div class="invalid-feedback">영문 소문자로 시작하고 숫자가 포함된 8~20자로 작성하세요</div>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row">
					<label>
						주소
						<i class="fa-solid fa-asterisk text-danger"></i>
					<input type="text" name="id" class="form-control underline">
					</label>
					<div class="valid-feedback">올바른 아이디 형식입니다</div>
					<div class="invalid-feedback">영문 소문자로 시작하고 숫자가 포함된 8~20자로 작성하세요</div>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row">
					<label>
						생년월일
						<i class="fa-solid fa-asterisk text-danger"></i>
					<input type="text" name="id" class="form-control underline">
					</label>
					<div class="valid-feedback">올바른 아이디 형식입니다</div>
					<div class="invalid-feedback">영문 소문자로 시작하고 숫자가 포함된 8~20자로 작성하세요</div>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row">
					<label>
						성별
						<i class="fa-solid fa-asterisk text-danger"></i>
					<input type="text" name="id" class="form-control underline">
					</label>
					<div class="valid-feedback">올바른 아이디 형식입니다</div>
					<div class="invalid-feedback">영문 소문자로 시작하고 숫자가 포함된 8~20자로 작성하세요</div>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<button type="submit" class="btn btn-primary rounded">회원가입</button>
			</div>
		</div>
    </div>
	
</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>