<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
테스트용 home

<c:choose>
	<c:when test="${loginId == null}">
		<form action="testlogin" method="post"><!--action에 매핑주소 -->
			<input type="text" name="memberId">
			<input type="password" name="memberPw">
			<button type="submit">로그인</button>
		</form>
	</c:when>
	<c:otherwise>
		<h2><a href="logout">로그아웃</a></h2>
	</c:otherwise>
</c:choose>

<!-- 상태 판정 출력 -->
<h2>아이디 : ${loginId}</h2>
<h2>닉네임 : ${loginName}</h2>
<h2>권한 : ${loginStatus}</h2>


</body>
</html>