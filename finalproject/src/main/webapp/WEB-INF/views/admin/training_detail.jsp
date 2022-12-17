<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
   <jsp:param value="훈련 이용 내역 상세" name="title"/>
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
	    <a class="navbar-brand-re footer-link" href="${pageContext.request.contextPath}/adminHome">홈</a>
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
                 <h4 class="text-center">이용내역 상세</h4>
             </div>
        </div>
        
       <p> ${trainingRequestListVO.trainingNo}</p>
        
      </div>  




