<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="CareChangePwSuccess" name="title"/>
</jsp:include>

<body>

	<div class="container-fluid" style="height:100%;">
		<div class="row text-center mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-150">
				<h1><i class="fa-solid fa-lock yellow"></i></h1>
			</div>
		</div>
		<div class="row mt-100 text-center">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<h1>
				회원님의 비밀번호가
			</h1>
			<h1>
				정상적으로 변경되었습니다
			</h1>
			</div>
		</div>
		<div class="row mt-100 mb-5">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 text-center">
			<a href="${pageContext.request.contextPath}/member/login" class="btn btn-blue btn-md">로그인</a>
			</div>
		</div>
	</div>

</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>