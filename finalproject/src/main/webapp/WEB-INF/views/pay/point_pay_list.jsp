<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="결제 내역" name="title"/>
</jsp:include>

<style>
	.blue-font{
		color:#81BDF1;
		font-weight:bolder;
		font-size:16px;
	}
	.yellow-font{
		color:#d9534f;
		font-weight:bolder;
		font-size:16px;
	}
	table>tbody>tr{
		height:60px;
	}
	
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
	
	//결제 취소 버튼 이벤트
	$(".cancel-btn").click(function(){
		var pointPurchaseNo = $(this).next().val();
		
		$(".cancel-confirm-btn").click(function(){
			location.href=
				"${pageContext.request.contextPath}/pay/cancel?pointPurchaseNo="
						+pointPurchaseNo;
		});
	});
	
	//페이지네이션
	//제일 처음 막기
	pageStart();

	//제일 앞으로, 이전버튼 막기
	$(".page-item").click(function(e){
		pageStart();
	});
	
	$(".blue-box").click(function(e){
		e.target.css("background-color","#81BDF1");
	});

	//함수
	function pageStart(){
		var pageNo = $("[name=pageNo]").val();
		$(".first-target").removeClass("disabled");
		$(".second-target").removeClass("disabled");
		if($("[name=pageNo]").val()==1){
			$(".first-target").addClass("disabled");
			$(".second-target").addClass("disabled");
		}
	}
	
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
	        <span style="font-size:17px;">훈련사 전환이 불가능한 회원입니다.</span>
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
		
		<div class="row mt-3">
            <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2">
            	<a href="${pageContext.request.contextPath}/mypage/point" class="btn btn-blue">&lt; 목록</a>
                 <table class="table table-hover text-center align-middle mt-3">
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
	                 			<td>
	                 				<c:choose>
	                 					<c:when test="${list.pointPurchaseStatus=='승인'}">
	                 						<span class="blue-font">${list.pointPurchaseStatus}</span>
	                 					</c:when>
	                 					<c:otherwise>
	                 						<span class="yellow-font">${list.pointPurchaseStatus}</span>
	                 					</c:otherwise>
	                 				</c:choose>
	                 			</td>
	                 			<td>
	                 				<c:if test="${list.pointPurchaseStatus=='승인'}">
	                 					<a href="#" class="btn btn-yellow btn-sm cancel-btn" 
	                 				data-bs-toggle="modal" data-bs-target="#cancel-modal">취소</a>
	                 				</c:if>
	                 				<!-- 취소이벤트 처리위한 데이터 준비 -->
									<input type="hidden" name="pointPurchaseNo" value="${list.pointPurchaseNo}">
	                 			</td>
	                 		</tr>
                 		</c:forEach>
                 	</tbody>
                 </table>
            </div>
        </div>
		<!-- Modal -->
		<div class="modal fade" id="cancel-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h6 class="modal-title" id="exampleModalLabel">카카오페이 결제가 취소됩니다.</h6>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
	      	  <div class="modal-body">
		        	<span style="font-size:15px;">정말 취소하시겠습니까?</span>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-blue cancel-confirm-btn" data-bs-dismiss="modal">확인</button>
		        <button type="button" class="btn btn-yellow" data-bs-dismiss="modal">취소</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- 페이지네이션 -->
		<div class="row mt-5 text-center mb-5">
            <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2">
              
			  	<ul class="pagination justify-content-center">
			  	
			  		<%-- 맨 처음 페이지로 이동 --%>
				    <li class="page-item first-target">
						<c:choose>
							<c:when test = "${vo.isFirst()==false}"> <%-- 맨 처음 페이지가 아니라면 --%>
								<a class="page-link" href = "list?p=${vo.firstBlock()}&${vo.parameter()}">&laquo;</a> <%-- 첫 번째 페이지로 이동 --%>
							</c:when>
							<c:otherwise> <%-- 그렇지 않다면 --%>
								<a class="page-link" href = "">&laquo;</a> <%-- 아무런 페이지 변화가 없도록 --%>
							</c:otherwise>
						</c:choose>
				    </li>
				    
				    <li class="page-item second-target">
					    <%-- 이전 구간의 마지막 페이지로 이동 --%>
						<c:choose>
							<c:when test = "${vo.hasPrev()}"> <%-- 이전 페이지가 있다면 --%>
								<a class="page-link" href = "list?p=${vo.prevBlock()}&${vo.parameter()}">&lt;</a> <%-- 이전 구간의 마지막 페이지로 이동 --%>
							</c:when>
							<c:otherwise> <%-- 그렇지 않다면 --%>
								<a class="page-link" href = "">&lt;</a> <%-- 아무런 페이지 변화가 없도록 --%>
							</c:otherwise>
						</c:choose>
				    </li>
				    
				    <%-- 현재 구간의 페이지 이동 --%>
					<%-- 변수명을 i로 하며 시작과 끝은 vo의 startBlock(), endBlock()의 반환값으로, 간격은 1로 한다  --%>
					<c:forEach var = "i" begin = "${vo.startBlock()}" end = "${vo.endBlock()}" step = "1">
						<li class="page-item blue-box">
							<a class="page-link" href = "list?p=${i}&${vo.parameter()}">${i}</a>
						</li>
					</c:forEach>
					
					<%-- 다음 구간의 첫 번째 페이지로 이동 --%>
					<li class="page-item last-target">
						<c:choose>
							<c:when test = "${vo.hasNext()}"> <%-- 다음 페이지가 있다면 --%>
								<a class="page-link"  href = "list?p=${vo.nextBlock()}&${vo.parameter()}">&gt;</a> <%-- 다음 구간의 첫 번째 페이지로 이동 --%>
							</c:when>
							<c:otherwise> <%-- 그렇지 않다면 --%>
								<a class="page-link"  href = "">&gt;</a> <%-- 아무런 페이지 변화가 없도록 --%>
							</c:otherwise>
						</c:choose>
					</li>
					
					<%-- 맨 마지막 페이지로 이동 --%>
				    <li class="page-item final-target">
						<c:choose>
							<c:when test = "${vo.isLast()==false}"> <%-- 맨 마지막 페이지가 아니라면 --%>
								<a class="page-link" href = "list?p=${vo.lastBlock()}&${vo.parameter()}">&raquo;</a> <%-- 맨 마지막 페이지로 이동 --%>
							</c:when>
							<c:otherwise>
								<a class="page-link" href = "">&raquo;</a>
							</c:otherwise>
						</c:choose>
				    </li>
			  	</ul>
			</div>
		</div>
		
		<!-- 페이지네이션 버튼 막기 위한 데이터 준비 -->
		<input type="hidden" value="${vo.p}" name="pageNo">
		
    </div>
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>