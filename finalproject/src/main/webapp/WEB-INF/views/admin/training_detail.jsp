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
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/admin/itemList">포인트상품 관리</a>
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
        
         
         </div>
          
         <div class="row mb-3">
             <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-4">
                 <table class="table table-hover align-middle">
           
            <tr>
            <th width="30%">주문번호</th>
            <td>${trainingMemberVO.trainingNo}</td>
            </tr>
            <tr>
            <th width="30%">이용날짜</th>
            <td>${trainingMemberVO.trainingDate}</td>
            </tr>
            <tr>
            <th width="30%">훈련사 </th>
            <td>${trainingMemberVO.memberName}</td>
            </tr>
            <tr>
             <c:choose>
             <c:when test="${trainingMemberVO.trainingStatus=='예약취소'}">
             <th width="30%">환불포인트 </th>
             <td> ${trainingMemberVO.trainingPurchasePrice}</td>
             </c:when>
              <c:otherwise>
              <th width="30%">사용포인트 </th>
              <td> ${trainingMemberVO.trainingPurchasePrice}</td>
             </c:otherwise>
              </c:choose>
           
               </th>
                
               </tr> 
                  
                <tr class="table-default align-middle">
                <c:forEach var="reservationDetailListVO" items="${list}">
                <th width="50%">
                
    
                
                <p class="font">반려동물 :&nbsp;&nbsp;  ${reservationDetailListVO.petType}</p>
                <p class="font">이름 :&nbsp;&nbsp;  ${reservationDetailListVO.petName}</p>
                <p class="font">생일 :&nbsp; &nbsp; ${reservationDetailListVO.petBirth}</p>
                <p class="font">중성화 : &nbsp;&nbsp; ${reservationDetailListVO.petNeutralization}</p>
                 
                
                </th>
                 <th width="50%">
                
                         
           
                    <img src="http://localhost:8888/download/${reservationDetailListVO.filesNo}" class="img-circle" width="100" height="100">
                    
               </th> 
               </tr>
               
               </th>
               </c:forEach>  
               </tr>
               </table>
               </div>
               </div>
               
   
               
                
        
    
        
      
        
    




