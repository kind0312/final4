<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="결제 내역" name="title"/>
</jsp:include>

<style>
	
</style>
<script>
$(function(){
	//훈련사 전환 이벤트
	$(".trainer-change").click(function(e){
		e.preventDefault();
		$("#change-modal").modal('hide');
		//1. 회원의 훈련사 여부 비동기로 확인
		//2. y를 반환할 경우 훈련사 메인화면으로 이동
		//3. n을 반환할 경우 훈련사 전환이 불가능한 회원입니다. 라는 문구 모달로 출력
		var memberId = $("[name=memberId]").val();
		$.ajax({
			url:"http://localhost:8888/rest/member/trainer_change/"+memberId,
			method:"get",
			data:memberId,
			success:function(resp){
				console.log(resp);
				if(resp=='N'){
					$("#change-modal").modal('show');
				}else if(resp=='Y'){
					location.href="${pageContext.request.contextPath}/trainer/main";
					$("#change-modal").modal('hide');
				}
			}
		});
	});
});

</script>
<body>
<nav class="navbar navbar-expand-lg navbar-expand-lg-re navbar-dark bg-blue mypage-top-nav">
	  <div class="container-fluid">
	    <a class="navbar-brand-re footer-link" href="${pageContext.request.contextPath}/mypage/training">마이페이지</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse justify-content-end" id="navbarColor01">
	      <ul class="navbar-nav me-0">
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/mypage/training">예약확인</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/mypage/pet">반려동물</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" style="color:white;" href="${pageContext.request.contextPath}/mypage/point">포인트</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/mypage/like">찜관리</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/#">후기</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/mypage/profile">정보수정</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav trainer-change" href="#">훈련사로 전환</a>
	        </li>
     	 </ul>
    	</div>
  	</div>
</nav>
	
		<!-- Modal -->
	<div class="modal fade" id="change-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-body">
	        훈련사 전환이 불가능한 회원입니다.
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-yellow" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="container-fluid">
        
        <div class="row mt-80">
            <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-4">
                 <h4 class="text-center">결제 내역</h4>
            </div>
        </div>			
		
		<div class="row mt-5">
            <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2">
                 <table class="table table-hover text-center align-middle">
                 	<thead>
                 		<tr>
                 			<th width="20%">상품명</th>
                 			<th width="15%">금액</th>
                 			<th width="20%">날짜</th>
                 			<th width="20%">결제수단</th>
                 			<th width="10%">거래</th>
                 			<th width="15%"></th>
                 		</tr>
                 	</thead>
                 	<tbody>
                 		<c:forEach var="list" items="${list}">
                 			<tr>
	                 			<td>${list.itemName}</td>
	                 			<td>
	                 				<fmt:formatNumber value="${list.pointPurchasePrice}" pattern="###,###"></fmt:formatNumber>
	                 			</td>
	                 			<td>${list.pointPurchaseDate}</td>
	                 			<td>${list.pointPurchasePayment}</td>
	                 			<td>${list.pointPurchaseStatus}</td>
	                 			<td>
	                 				<a href="#" class="btn btn-yellow btn-sm">취소</a>
	                 			</td>
	                 		</tr>
                 		</c:forEach>
                 	</tbody>
                 </table>
            </div>
        </div>
<%-- ${list} --%>

    </div>
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>