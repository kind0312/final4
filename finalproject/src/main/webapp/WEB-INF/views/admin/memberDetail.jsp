<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="회원 상세" name="title"/>
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
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/#">포인트상품 관리</a>
	        </li>
	      
     	 </ul>
    	</div>
  	</div>
</nav>

	<div class="container-fluid">
        <div class="row mt-80 mb-3">
              <div class="col-md-6 offset-md-3">
                 <h4 class="text-center">회원상세</h4>
             </div>
        </div>
        
        
     <div class="row">
            <div class="col-md-6 offset-md-3">   
                 <table class="table table-hover pet-table text-center">
    			<thead>
    				<tr class="table-default align-middle">
    				<th width="50%">
    				<p class="font">회원아이디 :  ${memberDto.memberId}</p>
    				<p class="font">이메일    :  ${memberDto.memberEmail}</p>
    				<p class="font">연락처    :  ${memberDto.memberTel}</p>
    				</th>
    			    <th width="50%">
    				<p class="font">회원이름 :  ${memberDto.memberName}</p>
    				<p class="font">가입일    :  ${memberDto.memberJoinDate}</p>
    				<p class="font">성별    :  ${memberDto.memberGender}</p>
    				</th>
    				</tr>	
    				
    				<tr class="table-default align-middle">
    				<c:forEach var="petInsertVO" items="${list}">
    				<th width="50%">
    				
    				<!-- 회원이 안나오는게 아니고 반려동물이 없는거같은데요 출력방법이 잘못됐네요  -->
    				<!-- ${petDto} -->
    				
    				<p class="font">반려동물 :&nbsp;&nbsp;  ${petInsertVO.petType}</p>
    				<p class="font">이름 :&nbsp;&nbsp;  ${petInsertVO.petName}</p>
    				<p class="font">생일 :&nbsp; &nbsp; ${petInsertVO.petBirth}</p>
    				<p class="font">중성화 : &nbsp;&nbsp; ${petInsertVO.petNeutralization}</p>
    				 
    				
    				</th>
    				<th width="50%">
    				
                			
	     	
                    <img src="http://localhost:8888/download/${petInsertVO.filesNo}" class="img-circle" width="100" height="100">
                    
	                 </th>		
                   </tr>
    				
    			    
    			    
    			    </th>
    				</c:forEach>
    				</tr>
    				
    				
    			</table>
    			 
    	</div>
    </div>
    </div>
<!--
<table border="1" width="800">
<thead>
<tr>
<td>회원이름</td>
<td>회원아이디</td>
<td>이메일</td>
<td>연락처</td>
<td>가입일</td>
<td>성별</td>
<td>사진</td>
</tr>
</thead>
<tbody>


<tr>
<td> ${memberDto.memberName}</td>
<td>${memberDto.memberId}</td>
<td>${memberDto.memberEmail }</td>
<td>${memberDto.memberTel}</td>
<td>${memberDto.memberJoinDate}</td>
<td>${memberDto.memberTel}</td>

</tr>


</tbody>
</table>


<table border="1" width="800">
<thead>
<tr>
<td>반려동물</td>
<td>이름</td>
<td>생일</td>
<td>중성화</td>
</tr>
</thead>
<tbody>
<tr>
<c:forEach var="petDto" items="${petDto}">
<tr>
<td> ${petDto.petType}</td>
<td> ${petDto.petName}</td>
<td> ${petDto.petBirth}</td>
<td> ${petDto.petNeutralization}</td>
<td> ${petDto.petNo}</td>
</c:forEach>
<c:forEach var="pet" items="${list}">
                				<tr class="table-default align-middle">
	                 				<th width="30%">
	                 					<img src="http://localhost:8888/download/${pet.filesNo}" class="img-circle" width="100" height="100">
	                 				</th>
</tr>
</c:forEach>
</tr>



</tbody>
</table>
  -->

