<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="CareRegistration" name="title"/>
</jsp:include>
<body>

	<div class="container-fluid">
	<form action="login" method="post" autocomplete="off">
		<div class="row mt-4">
			<div class="col-md-10 offset-md-1 mt-150 text-center">
				<h1>로그인</h1>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<input type="text" name="memberId" class="form-control" placeholder="아이디">
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<input type="password" name="memberPw" class="form-control rounded" placeholder="비밀번호">
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<button type="submit" class="btn btn-blue btn-md">로그인</button>
			</div>
		</div>
	</form>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 text-center">
			<h6>
			<a href="#" style="color:black;">
			아이디 찾기
			</a>
			&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="#" style="color:black;">
			비밀번호 찾기
			</a>
			</h6>
			</div>
		</div>
		<div class="row mt-2">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<hr>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<a href="../member/insert" class="btn btn-yellow btn-md">회원가입</a>
			</div>
		</div>
	</div>

</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>