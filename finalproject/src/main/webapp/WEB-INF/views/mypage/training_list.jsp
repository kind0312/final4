<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="예약 확인" name="title"/>
</jsp:include>

<style>
	.training-table {
	    border-top:1px solid rgba(0, 0, 0, 0.1);
	    height:130px;
	}
	.training-zero-font{
		color:#303030;
		font-size:15px;
	}
	.training-btn{
		background-color:#fff;
		border:none;
		font-weight:bolder;
		color:#303030;
		margin:0 3rem;
		font-size:19px;
	}
	.unselect-btn{
		color:#7B7B7B;
	}
	.img-circle{
		border-radius: 70%;
	   	border:none;
	   	background-color:#fff;
	   	overflow: hidden;
	}
</style>

<script>
	$(function(){
		//시작시 진행예약화면 고정
		ingClick();
		
		//진행 예약 버튼 이벤트
		$(".ing-btn").click(function(){
			ingClick();
		});
		
		//지난 예약 버튼 이벤트
		$(".end-btn").click(function(){
			endClick();
		});

	function ingClick(){
		//버튼 색상 변경
		$(".end-btn").removeClass("unselect-btn");
		$(".ing-btn").removeClass("unselect-btn");
		$(".end-btn").addClass("unselect-btn");
		//진행 예약만 출력
		$(".training-end").children().hide();
		$(".training-ing").children().show();
	}
	
	function endClick(){
		//버튼 색상 변경
		$(".ing-btn").removeClass("unselect-btn");
		$(".end-btn").removeClass("unselect-btn");
		$(".ing-btn").addClass("unselect-btn");
		//지난 예약만 출력
		$(".training-end").children().show();
		$(".training-ing").children().hide();
	}
	
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
	          <a class="nav-link mypage-nav" style="color:white;" href="${pageContext.request.contextPath}/mypage/training">예약확인</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/mypage/pet">반려동물</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/mypage/point">포인트</a>
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
                 <div class="text-center">
                 	<button class="training-btn ing-btn">진행 예약</button>
                 	<button class="training-btn end-btn">지난 예약</button>
                 </div>
            </div>
        </div>

      	<!-- 진행 예약 화면 -->	
        <div class="row training-ing">
            <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-4">
                  	<c:if test="${ingList.size()==0}">
		                 <table class="table table-hover training-table text-center">
		                 	<tbody>
		                 		<tr class="table-default align-middle">
		                 			<td><span class="training-zero-font">아직 예약이 없습니다</span></td>
		                 		</tr>
		                 	</tbody>
		                 </table>
			      	</c:if>
                 <table class="table table-hover training-table text-center">
                 	<tbody>
                 		<c:forEach var="ingList" items="${ingList}">
                 			<tr class="table-default align-middle">
	                 			<td width="30%">
	                 				<img src="http://localhost:8888/download/${ingList.filesNo}" class="img-circle" width="100" height="100">
	                 			</td>
	                 			<td width="40%">
	                 				<fmt:formatDate value="${ingList.trainingDate}" pattern="yyyy-MM-dd (E)"/> ${ingList.trainingStartTime}
	                 			</td>
	                 			<td width="30%">
	                 				<c:choose>
	                 					<c:when test="${ingList.trainingStatus=='예약대기'}">
	                 						<a href="${pageContext.request.contextPath}/mypage/training_detail?trainingNo=${ingList.trainingNo}"
	                 									 class="btn btn-outline-blue training-status">예약대기</a>
	                 					</c:when>
	                 					<c:otherwise>
	                 						<a href="${pageContext.request.contextPath}/mypage/training_detail?trainingNo=${ingList.trainingNo}" 
	                 									class="btn btn-blue training-status">예약확정</a>
	                 					</c:otherwise>
	                 				</c:choose>
	                 			</td>
	                 		</tr>
                 		</c:forEach>
                 	</tbody>
                 </table>
            </div>
        </div>
  
        <!-- 지난 예약 화면 -->
         <div class="row training-end">
            <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-4">
           		 <c:if test="${endList.size()==0}">
		                 <table class="table table-hover training-table text-center">
		                 	<tbody>
		                 		<tr class="table-default align-middle">
		                 			<td><span class="training-zero-font">아직 예약이 없습니다</span></td>
		                 		</tr>
		                 	</tbody>
		                 </table>
			      	</c:if>
                 <table class="table table-hover training-table text-center">
                 	<tbody>
                 		<c:forEach var="endList" items="${endList}">
                 			<tr class="table-default align-middle">
	                 			<td width="30%">
	                 				<img src="http://localhost:8888/download/${endList.filesNo}" class="img-circle" width="100" height="100">
	                 			</td>
	                 			<td width="40%">
	                 				<fmt:formatDate value="${endList.trainingDate}" pattern="yyyy-MM-dd (E)"/>  ${endList.trainingStartTime}
	                 			</td>
	                 			<td width="30%">
	                 				<c:choose>
	                 					<c:when test="${endList.trainingStatus=='예약취소'}">
	                 						<a href="${pageContext.request.contextPath}/mypage/training_detail?trainingNo=${endList.trainingNo}"
	                 									 class="btn btn-outline-yellow training-status">예약취소</a>
	                 					</c:when>
	                 					<c:otherwise>
	                 						<a href="${pageContext.request.contextPath}/mypage/training_detail?trainingNo=${endList.trainingNo}" 
	                 									class="btn btn-yellow training-status">이용완료</a>
	                 					</c:otherwise>
	                 				</c:choose>
	                 			</td>
	                 		</tr>
                 		</c:forEach>
                 	</tbody>
                 </table>
            </div>
        </div>
        
        <!-- 비동기 처리 위한 데이터-->
		<input type="hidden" value="${memberId}" name="memberId">
    </div>

</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>