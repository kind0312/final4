<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="관리자 록인" name="mg"/>
</jsp:include>
<form action="login" method="post">

<div class="row">
				<input type="text" name="adminId" class="login-input" placeholder="아이디">
			</div>
			<div class="row">
				<input type="password" name="adminPw" class="login-input" placeholder="비밀번호">
			</div>
			
<div class="row">
				<button type="submit" class="btn btn-positive login-btn">로그인</button>
				</form>
<!-- 이상인 경우만 나오는 화면 -->
<div class="row center">
			<c:if test="${param.error != null}">
				<h2 style="color: red">입력한 정보가 맞지 않습니다</h2>
			</c:if>
		</div>
				
				