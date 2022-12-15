<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="포인트 이용내역" name="title"/>
</jsp:include>

<style>
	.plus-font{
		font-weight:bolder;
		color:#81BDF1;
	}	
	.minus-font{
		font-weight:bolder;
		color:#eb0707;
	}
	.mypoint{
		font-weight:bolder;
		color:#81BDF1;
		font-size:20px;
	}
	.mypage-top-nav{
		margin-top:0.1rem !important
	}
</style>

<script>
	$(function(){
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
        <div class="row mt-80">
              <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-4">
                 <h4 class="text-center">포인트 이용내역</h4>
             </div>
        </div>
        
        <div class="row">
              <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-4">
                 <h6 style="display:inline-block;">현재 보유 포인트 : </h6>
                 <span class="mypoint" >${member.memberPoint} P</span>
             </div>
        </div>
 
        <div class="row mb-3">
             <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-4">
                 	<table class="table table-hover text-center align-middle">
			    		<thead>
			    			<tr>
			    				<th width="25%">이용날짜</th>
			    				<th width="25%">충전금액</th>
			    				<th width="25%">사용금액</th>
			    				<th width="25%">내역</th>
			    			</tr>
			    		</thead>
			    		<tbody>
			    			<c:if test="${list.size()==0}">
			    				<tr>
			    					<td colspan="4" style="height:100px;">이용 내역이 없습니다.</td>
			    				</tr>
			    			</c:if>
			    			<c:forEach var="list" items="${list}">
			    				<c:choose>
			    					<c:when test="${list.pointStatus=='사용'}">
			    						<tr>
					    					<td>${list.pointDate}</td>
					    					<td></td>
					    					<td class="minus-font">- ${list.pointPrice}</td>
					    					<td>${list.pointStatus}</td>
					    				</tr>
			    					</c:when>
			    					<c:when test="${list.pointStatus=='구매'}">
			    						<tr>
					    					<td>${list.pointDate}</td>
					    					<td class="plus-font">+ ${list.pointPrice}</td>
					    					<td></td>
					    					<td>${list.pointStatus}</td>
					    				</tr>
			    					</c:when>
			    					<c:otherwise>
			    						<tr>
					    					<td>${list.pointDate}</td>
					    					<td></td>
					    					<td class="minus-font">- ${list.pointPrice}</td>
					    					<td>${list.pointStatus}</td>
					    				</tr>
			    					</c:otherwise>
			    				</c:choose>
			    			</c:forEach>
			    		</tbody>
			    	</table>
             </div>
        </div>
        
        <!-- 페이지네이션 -->
		<div class="row text-center mb-5">
            <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2">
              
			  	<ul class="pagination justify-content-center">
			  	
			  		<%-- 맨 처음 페이지로 이동 --%>
				    <li class="page-item first-target">
						<c:choose>
							<c:when test = "${vo.isFirst()==false}"> <%-- 맨 처음 페이지가 아니라면 --%>
								<a class="page-link" href = "memberPoint?p=${vo.firstBlock()}&${vo.parameter()}&memberId=${member.memberId}">&laquo;</a> <%-- 첫 번째 페이지로 이동 --%>
							</c:when>
							<c:otherwise> <%-- 그렇지 않다면 --%>
								<a class="page-link" href = "memberPoint?memberId=${member.memberId}">&laquo;</a> <%-- 아무런 페이지 변화가 없도록 --%>
							</c:otherwise>
						</c:choose>
				    </li>
				    
				    <li class="page-item second-target">
					    <%-- 이전 구간의 마지막 페이지로 이동 --%>
						<c:choose>
							<c:when test = "${vo.hasPrev()}"> <%-- 이전 페이지가 있다면 --%>
								<a class="page-link" href = "memberPoint?p=${vo.prevBlock()}&${vo.parameter()}&memberId=${member.memberId}">&lt;</a> <%-- 이전 구간의 마지막 페이지로 이동 --%>
							</c:when>
							<c:otherwise> <%-- 그렇지 않다면 --%>
								<a class="page-link" href = "memberPoint?memberId=${member.memberId}">&lt;</a> <%-- 아무런 페이지 변화가 없도록 --%>
							</c:otherwise>
						</c:choose>
				    </li>
				    
				    <%-- 현재 구간의 페이지 이동 --%>
					<%-- 변수명을 i로 하며 시작과 끝은 vo의 startBlock(), endBlock()의 반환값으로, 간격은 1로 한다  --%>
					<c:forEach var = "i" begin = "${vo.startBlock()}" end = "${vo.endBlock()}" step = "1">
						<li class="page-item blue-box">
							<a class="page-link" href = "memberPoint?p=${i}&${vo.parameter()}&memberId=${member.memberId}">${i}</a>
						</li>
					</c:forEach>
					
					<%-- 다음 구간의 첫 번째 페이지로 이동 --%>
					<li class="page-item last-target">
						<c:choose>
							<c:when test = "${vo.hasNext()}"> <%-- 다음 페이지가 있다면 --%>
								<a class="page-link"  href = "memberPoint?p=${vo.nextBlock()}&${vo.parameter()}&memberId=${member.memberId}">&gt;</a> <%-- 다음 구간의 첫 번째 페이지로 이동 --%>
							</c:when>
							<c:otherwise> <%-- 그렇지 않다면 --%>
								<a class="page-link"  href = "memberPoint?memberId=${member.memberId}">&gt;</a> <%-- 아무런 페이지 변화가 없도록 --%>
							</c:otherwise>
						</c:choose>
					</li>
					
					<%-- 맨 마지막 페이지로 이동 --%>
				    <li class="page-item final-target">
						<c:choose>
							<c:when test = "${vo.isLast()==false}"> <%-- 맨 마지막 페이지가 아니라면 --%>
								<a class="page-link" href = "memberPoint?p=${vo.lastBlock()}&${vo.parameter()}&memberId=${member.memberId}">&raquo;</a> <%-- 맨 마지막 페이지로 이동 --%>
							</c:when>
							<c:otherwise>
								<a class="page-link" href = "memberPoint?memberId=${member.memberId}">&raquo;</a>
							</c:otherwise>
						</c:choose>
				    </li>
			  	</ul>
			</div>
		</div>
		
		<!-- 페이지네이션 이벤트 걸기 위한 데이터 -->
		<input type="hidden" value="${vo.p}" name="pageNo">
	</div>
</body>
 