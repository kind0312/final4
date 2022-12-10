<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="CareFindPw" name="title"/>
</jsp:include>

<body>

	<div class="container-fluid" style="height:100%;">
	<form action="login" method="post" autocomplete="off">
		<div class="row text-center mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-150">
				<h1>비밀번호 찾기</h1>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<input type="text" name="memberId" class="form-control" placeholder="아이디">
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row form-group">
					<div class="input-group">
						<input type="email" name="memberEmail" class="form-control w-75" placeholder="이메일" aria-describedby="email-button" required>
						<button class="btn btn-outline-blue w-25" type="button" id="email-button">인증코드발송</button>
					</div>
					<div class="input-group mt-2">
						<input type="text" id="confirm-input" class="form-control underline w-75" aria-describedby="confirm-button">
						<button class="btn btn-outline-blue w-25" type="button" id="confirm-button">확 인</button>
						<div class="confirmResult"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 text-center">
			<button type="submit" class="btn btn-blue btn-md">확인</button>
			</div>
		</div>
	</form>
	</div>

</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>