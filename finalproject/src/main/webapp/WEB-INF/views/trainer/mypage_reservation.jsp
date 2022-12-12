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
   	background-color:#81BDF1;
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
		
		//회원모드로 전환 이벤트
		$(".mode-change").click(function(){
			location.href="${pageContext.request.contextPath}/";
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

	});
</script>

<body>
	<nav class="navbar navbar-expand-lg navbar-expand-lg-re navbar-dark bg-blue mypage-top-nav">
	  <div class="container-fluid">
	    <a class="navbar-brand-re footer-link" href="${pageContext.request.contextPath}/trainer/mypage_reservation">마이페이지</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse justify-content-end" id="navbarColor01">
	      <ul class="navbar-nav me-0">
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" style="color:white;" href="${pageContext.request.contextPath}/trainer/mypage_reservation">예약확인</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/trainer/mypage_profile">프로필관리</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/#">정산관리</a>
	        </li>
	        <li>
	          <a class="nav-link mypage-nav" href="#" data-bs-toggle="modal" data-bs-target="#change-modal">회원모드로 전환</a>
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
	        회원 모드로 전환하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-yellow mode-change" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>

	<div class="container-fluid">
        <div class="row mt-80">
            <div class="col-md-6 offset-md-3 col-sm-4 offset-sm-4 mt-4">
                 <div class="text-center">
                 	<button class="training-btn ing-btn">진행 예약</button>
                 	<button class="training-btn end-btn">지난 예약</button>
                 </div>
            </div>
        </div>
 
      	<!-- 진행 예약 화면 -->	
        <div class="row mt-8 training-ing">
            <div class="col-md-6 offset-md-3 col-sm-4 offset-sm-4 mt-4">
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
                 		<tr class="align-middle">
                 			<th width="20%">이름</th>
                 			<th width="20%">지역</th>
                 			<th width="20%">날짜</th>
                 			<th width="10%">시간</th>
                 			<th colspan="2" ></th>
                 		</tr>
                 		<c:forEach var="ingList" items="${ingList}">
                 			<tr class="table-default align-middle">
	                 			<td>${ingList.memberName}</td>
	                 			<td>${ingList.trainingBasicAddress}</td>
	                 			<td>${ingList.trainingDate}</td>
	                 			<td>${ingList.trainingStartTime}</td>
	                 			<td>
	                 				<a href="${pageContext.request.contextPath}/trainer/mypage_reservation_detail?trainingNo=${ingList.trainingNo}" class="btn btn-blue">상세</a>
	                 				<a href="#" class="btn btn-yellow">채팅</a>
	                 			</td>
	                 		</tr>
                 		</c:forEach>
                 	</tbody>
                 </table>
            </div>
        </div>
  
        <!-- 지난 예약 화면 -->
         <div class="row mt-12 training-end">
            <div class="col-md-6 offset-md-3 col-sm-4 offset-sm-4 mt-4">
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
                 		<tr class="align-middle">
                 			<th width="20%">이름</th>
                 			<th width="20%">지역</th>
                 			<th width="20%">날짜</th>
                 			<th width="10%">시간</th>
                 			<th width="15%">수익금</th>
                 			<th></th>
                 		</tr>
                 		<c:forEach var="endList" items="${endList}">
                 			<tr class="table-default align-middle">
	                 			<td>${endList.memberName}</td>
	                 			<td>${endList.trainingBasicAddress}</td>
	                 			<td>${endList.trainingDate}</td>
	                 			<td>${endList.trainingStartTime}</td>
	                 			<td>
	                 				<fmt:formatNumber value="${endList.trainingPurchasePrice*0.9}" pattern="###,###"></fmt:formatNumber>
	                 			</td>
	                 			<td>
	                 				<a href="${pageContext.request.contextPath}/trainer/mypage_reservation_detail?trainingNo=${endList.trainingNo}" class="btn btn-blue">상세</a>
	                 			</td>
	                 		</tr>
                 		</c:forEach>
                 		
                 		
                 	</tbody>
                 </table>
            </div>
        </div>
        
    </div>

</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>