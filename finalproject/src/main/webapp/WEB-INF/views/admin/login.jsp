<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<
<jsp:include page="/WEB-INF/views/template/adminHeaderlogin.jsp">
	<jsp:param value="관리자 로그인" name="mg"/>
</jsp:include>

 <style>
 .exception{
    font-size:20px;
 }
 </style>
 
 <body>
 <div class="container-fluid" style="height:100%;">
<form action="login" method="post" autocomplete="off">

		<div class="row text-center mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-150">
				<h1>로그인</h1>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<input type="text" name="adminId" class="form-control" placeholder="아이디">
			</div>
		</div>
		<div class="row mt-4">	
		      <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<input type="password" name="adminPw" class="form-control rounded" placeholder="비밀번호">
		      </div>
		</div>
			
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 text-center">
			<button type="submit" class="btn btn-blue btn-md">로그인</button>
			</div>
		</div>
		<!-- 이상인 경우만 나오는 화면 -->
		 <div class="row mt-4">
		   	<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 text-center">
			<c:if test="${param.error != null}">
				<h2 class="exception" style="color: red">입력한 정보가 맞지 않습니다</h2>
			</c:if>
			</div>
		</div>
		</form>
</body>
   
				
				