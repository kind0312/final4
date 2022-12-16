<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="훈련사 지원 상세" name="title"/>
</jsp:include>
<style>
	.pet-table>tbody{
		height:130px;
		
	}

	.font{
		color:#303030;
		text-align:left;
	}
	.img-circle{
		border-radius: 70%;
    	border:none;
    	background-color:#81BDF1;
    	overflow: hidden;
	}
	.pet-table {
	    border-top:1px solid rgba(0, 0, 0, 0.1);
	    height:130px;
	   
	}
</style>

<script>
	$(function(){
		
	});
</script>


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
	
        <div class="row mt-80">
              <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-4">
                 <h4 class="text-center">훈련사 지원 상세</h4>
             </div>
        </div>
        
         <div class="row mb-3">
             <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-4">
             	
             	<form action="applyDetail" method="post">
                 	<table class="table table-hover align-middle">
			    		<tbody>
			    			<tr>
			    				<th width="30%">지원 날짜</th>
			    				<td>${detail.applyDate}</td>
			    			</tr>
			    			<tr>
			    				<th width="30%">지원 번호</th>
			    				<td>${detail.applyNo}</td>
			    			</tr>
			    			<tr>
			    				<th width="30%">이름</th>
			    				<td>${detail.memberName}</td>
			    			</tr>
			    			<tr>
			    				<th width="30%">아이디</th>
			    				<td>${detail.memberId}</td>
			    			</tr>
			    			<tr>
			    				<th width="30%">성별</th>
			    				<td>${detail.memberGender}</td>
			    			</tr>
			    			<tr>
			    				<th width="30%">이메일</th>
			    				<td>${detail.memberEmail}</td>
			    			</tr>
			    			<tr>
			    				<th width="30%">연락처</th>
			    				<td>${detail.memberTel}</td>
			    			</tr>
			    			<tr>
			    				<th width="30%">지원 동기</th>
			    				<td>${detail.applyMotive}</td>
			    			</tr>
			    			<tr>
			    				<th width="30%">흡연여부</th>
			    				<td>${detail.applySmoke}</td>
			    			</tr>
			    			<tr>
			    				<th width="30%">주 활동 시간</th>
			    				<td>${detail.applyActive}</td>
			    			</tr>
			    			<c:if test="${detail.applyActive!=null}">
			    				<tr>
				    				<th width="30%">자격증</th>
				    				<td>${detail.applyActive}</td>
				    			</tr>
			    			</c:if>
			    			<tr>
			    				<th width="30%">지원 상태</th>
			    				<td class="applyStatus">${detail.applyStatus}</td>
			    			</tr>

			    		</tbody>
        			</table>
        			
        			<div class="mt-4 text-center">
        				<c:if test="${detail.applyStatus!='신청' || detail.applyStatus!='반려'}">
        					<button type="submit" class="btn btn-blue2 approve-btn">승인</button>
		        			<button class="btn btn-yellow reject-btn">반려</button>
						</c:if>
							<a class="btn btn-outline-blue" href="${pageContext.request.contextPath}/admin/applyList">목록</a>
					</div>
					
					<!-- form 데이터 준비 -->
					<input type="hidden" name="memberId" value="${detail.memberId}">
					<input type="hidden" name="applyNo" value="${detail.applyNo}">
					<input type="hidden" name="trainerLike" value="0">
					
					
				</form>
        	</div>
        </div>
        
    </div>  
        
  
        
