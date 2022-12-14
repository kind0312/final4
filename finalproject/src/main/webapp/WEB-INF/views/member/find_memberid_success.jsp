<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="CareFindIdSuccess" name="title"/>
</jsp:include>

<body>

	<div class="container-fluid">
		<div class="row text-center mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-150">
				<h1>ID 찾기</h1>
			</div>
		</div>
		<div class="row mt-70 text-center">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2" align="center">
			<h2 class="underline" style="width:400px;">
			  회원님의 아이디는
			  <small class="blue">${memberDto.memberId}</small>
			  입니다
			</h2>
			</div>
		</div>
		<div class="row mt-100 mb-5">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 text-center">
			<a href="${pageContext.request.contextPath}/member/find_memberpw" class="btn btn-blue btn-md">비밀번호 찾기</a>
			</div>
		</div>
		<div class="row mt-5 mb-5">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 text-center">
			<a href="${pageContext.request.contextPath}/member/login" class="btn btn-yellow btn-md">로그인</a>
			</div>
		</div>
	</div>

</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>