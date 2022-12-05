<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="훈련사 상세" name="title"/>
</jsp:include>
<h1>훈련사를 소개합니다!</h1>
<a type="button" href="#" class="btn btn-blue btn-md ">예약하기</a><br><br>
<!-- 태림누나 추가 요망 -->
<a type="button" href="#" class="btn btn-blue btn-md ">문의하기</a><br>
${list.getMemberName()} 훈련사님<br>
후기 : ${list.getCnt()}개<br>
평점 : ${list.getAvg()}점<br>
제목 : ${list.getTrainerProfile()}<br>
자기소개 : ${list.getTrainerProfileContent()}<br><br>
<h2>자격증</h2>
<h3>없음</h3>
<h2>후기 목록</h2>
<c:forEach var="review" items="${review}">
작성자 : ${review.getMemberId()}<br>
리뷰 제목 : ${review.getReviewTitle()}<br>
리뷰 내용 : ${review.getReviewContent()}<br>
작성 시각 : ${review.getReviewWriteTime()}<br>
평점 : ${review.getReviewGood()}점<br><br>
</c:forEach>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>