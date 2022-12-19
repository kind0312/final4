<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="훈련 이용내역" name="title"/>
</jsp:include>
<style>


</style>
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
             <a class="nav-link mypage-nav" style="color:white;" href="${pageContext.request.contextPath}/admin/memberList">일반회원관리</a>
           </li>
           <li class="nav-item">
             <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/admin/applyList">훈련사 전환</a>
           </li>
           <li class="nav-item">
             <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/admin/trainerList">훈련사 관리</a>
           </li>
            <li class="nav-item">
             <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/admin/itemList">포인트상품 관리</a>
           </li>
         </ul>
       </div>
     </div>
</nav>
	
	<div class="container-fluid">
        <div class="row mt-80">
              <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-4">
                 <h4 class="text-center">훈련 이용 내역</h4>
             </div>
        </div>
 
         <div class="row mb-3">
             <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-4">
                 	<table class="table table-hover text-center align-middle">
			    		<thead>
			    			<tr>
			    				<th >주문번호</th>
			    				<th >이용날짜</th>
			    				<th >훈련사</th>
			    				<th >이용상태</th>
			    			</tr>
			    		</thead>
			    		<tbody>
			    			<c:if test="${trainingUsageVO.size()==0}">
			    				<tr>
			    					<td colspan="4" style="height:70px;">내역이 없습니다.</td>
			    				</tr>
			    			</c:if>
			    		<c:forEach var="trainingUsageVO" items="${trainingUsageVO}">
			    		<tr class="table-default align-middle">
							<td>${trainingUsageVO.trainingNo}</td>
							<td>${trainingUsageVO.trainingDate}</td>
							<td>${trainingUsageVO.memberName }</td>
							<td>${trainingUsageVO.trainingStatus}</td>
							<td> <a class="btn btn-blue2"
		                            href="training_detail?trainingNo=${trainingUsageVO.trainingNo}">상세 </td>
						</tr>
						</c:forEach>
			    		</tbody>
			    		</table>
			    		</div>
			    		</div>
			    		
			    		
			    		
	</div>