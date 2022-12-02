<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="훈련사 목록" name="title"/>
</jsp:include>
<h1>훈련사를 소개합니다!</h1>
<c:forEach var="list" items="${list}">
${list.getMemberName()} 훈련사님<br>
후기 : ${list.getCnt()}개<br>
평점 : ${list.getAvg()}점<br>
제목 : ${list.getTrainerProfile()}&nbsp; &nbsp;<a type="button" href="/trainer/detail" style="background-color: 81BDF1" class="btn">상세보기</a><br> 
소개내용 : ${list.getTrainerProfileContent()}<br><br>

</c:forEach>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>