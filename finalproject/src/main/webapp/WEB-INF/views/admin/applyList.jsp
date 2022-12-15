<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="훈련사 신청 목록" name="title"/>
</jsp:include>



<body>

	<nav class="navbar navbar-expand-lg navbar-expand-lg-re navbar-dark bg-black mypage-top-nav">
	  <div class="container-fluid">
	    <a class="navbar-brand-re footer-link" href="${pageContext.request.contextPath}/admin/adminHome">홈</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse justify-content-end" id="navbarColor01">
	      <ul class="navbar-nav me-0">
	        <li class="nav-item">
	          <a class="nav-link mypage-nav"  href="${pageContext.request.contextPath}/admin/memberList">일반회원관리</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" style="color:white;"href="${pageContext.request.contextPath}/admin/applyList">훈련사 전환</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/admin/trainerList">훈련사 관리</a>
	        </li>
	         <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/#">포인트상품 관리</a>
	        </li>
	      
     	 </ul>
    	</div>
  	</div>
</nav>


	<div class="container-fluid">
        <div class="row mt-80 mb-3">
              <div class="col-md-6 offset-md-3">
                 <h4 class="text-center">훈련사 신청/전환</h4>
             </div>
        </div>
     <div class="row mt-8 training-ing">
            <div class="col-md-6 offset-md-3 col-sm-4 offset-sm-4 mt-4">
<table border="1" width="800" class="table table-hover training-table text-center">
<thead>
<tr>
<td>지원번호</td>
<td>회원아이디</td>
<td>신청날짜</td>
<td>승인상태</td>
</tr>
</thead>
<tbody>
<tr >
<c:forEach var="applyDto" items="${applyDto}">
<tr class="table-default align-middle">
<td>${applyDto.applyNo }</td>
<td>${applyDto.memberId}</td>
<td>${applyDto.applyDate }</td>
<td>${applyDto.applyStatus}</td>
<td>
		<a class="btn btn-blue2"
		href="applyDetail?memberId=${applyDto.memberId}">상세</a>
</td>
</tr>
</c:forEach>
</tr>
</tbody>

</tr>
</div>

</div>

</table>
</div>
</div>
</div>
        
        
