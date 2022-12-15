<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="훈련사 목록" name="title"/>
</jsp:include>
<style>

</style>
<body>

	<nav class="navbar navbar-expand-lg navbar-expand-lg-re navbar-dark bg-black mypage-top-nav">
	  <div class="container-fluid">
	    <a class="navbar-brand-re footer-link" href="${pageContext.request.contextPath}/adminHome">홈</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse justify-content-end" id="navbarColor01">
	      <ul class="navbar-nav me-0">
	        <li class="nav-item">
	          <a class="nav-link mypage-nav"  href="${pageContext.request.contextPath}/admin/memberList">일반회원관리</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/admin/applyList">훈련사 전환</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" style="color:white;" href="${pageContext.request.contextPath}/admin/trainerList">훈련사 관리</a>
	        </li>
	         <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/#">포인트상품 관리</a>
	        </li>
	      
     	 </ul>
    	</div>
  	</div>
</nav>
<!-- 검색 창 -->
	<div class="container-fluid">
	<fieldset>
        <div class="row mt-80">
            <div class="col-md-6 offset-md-3 col-sm-4 offset-sm-4 mt-4">
                 <div class="text-center">
	<form action="trainerList" method="get">
		  <fieldset>
		  		<div class="col-md-6 offset-md-3">
                 <h4 class="text-center">훈련사 목록</h4>
            </div>
    
	<select name="type" required>
	<option value="member_name"<c:if test="${vo.type=='member_name'}">selected</c:if>>이름</option>
	<option value="member_id"<c:if test="${vo.type=='member_id'}">selected</c:if>>아이디</option>

	</select>
	<input type="search" name="keyword" placeholder="검색어" required value="${vo.keyword}">
	<button class="btn btn-neutral btn-blue" type="submit">검색</button>
	</form>
	</div>
	</div>
	</div>
     
    <div class="row mt-8 training-ing">
            <div class="col-md-6 offset-md-3 col-sm-4 offset-sm-4 mt-4">
<table border="1" width="800" class="table table-hover training-table text-center">
<thead>
<tr>
<td>훈련사 번호</td>
<td>이름</td>
<td>아이디</td>
<td>연락처</td>
</tr>
</thead>
<tbody>
<tr >
<c:forEach var="trainerListVO" items="${trainerList}">
<tr class="table-default align-middle">
<td> ${trainerListVO.trainerNo}</td>
<td> ${trainerListVO.memberName}</td>
<td>${trainerListVO.memberId }</td>
<td>${trainerListVO.memberTel}</td>
<td>

	<a class="btn btn-blue2"
		href="trainerDetail?memberId=${trainerListVO.memberId}">상세</a>
</td>
</tr>
</c:forEach>
</tr>
</tbody>


</tr>
</div>

</div>

<!-- 정렬 
<select name="sort">
	<option value="member_join desc">번호</option>
</select>
-->

</table>
<!--  <div class="row mt-80">
            <div class="col-md-6 offset-md-3 col-sm-4 offset-sm-4 mt-4">
                 <div class="text-center">
<h3>&laquo;&lt;  1 2 3 4 5 &gt;&raquo;</h3>-->
</div>
</div>
</div>