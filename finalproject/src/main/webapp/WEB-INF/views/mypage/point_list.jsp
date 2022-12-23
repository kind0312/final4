<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="포인트 내역" name="title"/>
</jsp:include>

<style>
.himg{
width: 35;
margin-left: 5px;
}
	.page-item.active.page-blue .page-link {
	    z-index: 3;
	    color: #fff;
	    background-color: #81BDF1;
	    border-color: #81BDF1;
	}
	.price-font{
		color:#81BDF1;
		font-weight:bolder;
		font-size:17px;
	}
	.minus-price-font{
		color:#d9534f;
		font-weight:bolder;
		font-size:17px;
	}
	.mypoint{
		font-weight:bolder;
		color:#81BDF1;
		font-size:20px;
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
					if(resp=='N'){
						$("#change-modal").modal('show');
					}else if(resp=='Y'){
						location.href="${pageContext.request.contextPath}/trainer/main";
						$("#change-modal").modal('hide');
					}
				}
			});
		});
		
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
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/mypage/review">후기</a>
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
            <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2">
                 <h4 class="text-center">포인트 내역<img src="/image/hand-gesture.png" class="himg"></h4>
            </div>
        </div>

		<div class="row mt-5">
            <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2">
            	 <h6 style="display:inline-block;">
            	 	<img src="${pageContext.request.contextPath}/image/point_list.png" 
            	 		style="width:35px; height:35px;">현재 보유 포인트 : 
            	 </h6>
                 <span class="mypoint" >
                 	<fmt:formatNumber value="${point.memberPoint}" pattern="###,###"></fmt:formatNumber>P
                 </span>
                 <a href="${pageContext.request.contextPath}/pay/list" class="btn btn-yellow float-end" style="margin-left:5px;">구매내역</a>
                 <a href="${pageContext.request.contextPath}/pay/point_select" class="btn btn-blue float-end">포인트 구매</a>
                 <br>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2 ">   
                 <table class="table table-hover point-table text-center">
					  <thead>
					    <tr>
					      <th scope="col" width="35%">날짜</th>
					      <th scope="col" width="30%">사유/내용</th>
					      <th scope="col" width="35%">포인트</th>
					    </tr>
					  </thead>
					  <tbody>
					  	<c:choose>
					  		<c:when test="${page.size()==0}">
					  			<tr class="table-default align-middle">
					  				<td colspan="3" height="130px">내역이 존재하지 않습니다!</td>
					  			</tr>
					  		</c:when>
					  		<c:otherwise>
					  			<c:forEach var="page" items="${page}">
					  				<tr class="table-default align-middle">
						  				<td>${page.pointDate}</td>
						  				<td>${page.pointStatus}</td>
						  				<c:choose>
						  					<c:when test="${page.pointStatus=='사용'}">
						  						<td class="minus-price-font">
						  							<span>
						  								-<fmt:formatNumber value="${page.pointPrice}" pattern="###,###"></fmt:formatNumber>
						  							</span>
						  						</td>
						  					</c:when>
						  					<c:otherwise>
						  						<td class="price-font">
						  							<span>
						  								+<fmt:formatNumber value="${page.pointPrice}" pattern="###,###"></fmt:formatNumber>
						  							</span>
						  						</td>
						  					</c:otherwise>
						  				</c:choose>				  				
						  			</tr>
					  			</c:forEach>	
					  		</c:otherwise>
					  	</c:choose>
					</tbody>
                 </table>
			 </div>
		</div>
		
		<!-- 페이지네이션 -->
		<div class="row mt-5 text-center mb-5">
            <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-4">
              
			  	<ul class="pagination justify-content-center">
			  	
			  		<%-- 맨 처음 페이지로 이동 --%>
				    <li class="page-item first-target">
						<c:choose>
							<c:when test = "${vo.isFirst()==false}"> <%-- 맨 처음 페이지가 아니라면 --%>
								<a class="page-link" href = "point?p=${vo.firstBlock()}&${vo.parameter()}">&laquo;</a> <%-- 첫 번째 페이지로 이동 --%>
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
								<a class="page-link" href = "point?p=${vo.prevBlock()}&${vo.parameter()}">&lt;</a> <%-- 이전 구간의 마지막 페이지로 이동 --%>
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
							<a class="page-link" href = "point?p=${i}&${vo.parameter()}">${i}</a>
						</li>
					</c:forEach>
					
					<%-- 다음 구간의 첫 번째 페이지로 이동 --%>
					<li class="page-item last-target">
						<c:choose>
							<c:when test = "${vo.hasNext()}"> <%-- 다음 페이지가 있다면 --%>
								<a class="page-link"  href = "point?p=${vo.nextBlock()}&${vo.parameter()}">&gt;</a> <%-- 다음 구간의 첫 번째 페이지로 이동 --%>
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
								<a class="page-link" href = "point?p=${vo.lastBlock()}&${vo.parameter()}">&raquo;</a> <%-- 맨 마지막 페이지로 이동 --%>
							</c:when>
							<c:otherwise>
								<a class="page-link" href = "">&raquo;</a>
							</c:otherwise>
						</c:choose>
				    </li>
			  	</ul>

			</div>
		</div>
    </div>
	<!-- 비동기를 위한 회원id -->
	<input type="hidden" value="${point.memberId}" name="memberId">
	<input type="hidden" value="${vo.p}" name="pageNo">
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>