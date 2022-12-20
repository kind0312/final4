<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="CareReviewList" name="title"/>
</jsp:include>
<style>
	.wifi{
		vertical-align:super;
	}
/* 	<!-- div 확인 점선 --> 1200이상 xl, 1200이하 lg, 990이하 md, 768이하 sm  */
/*   	div{ */
/*   		border: 1px dotted gray; */
/*   	} */
/* 	<!-- 별점 공백 없애는 스타일 --> 0.0.6 사용으로 더이상 사용 X */
/* 	.star-score { */
/* 		white-space: nowrap; */
/* 	} */
	.reviewborder{
		border-radius:10px;
		box-shadow: rgb(235 235 235) 0px 2px 12px 0px;
	}
</style>

<body>

	<div class="container-fluid" style="height:100%;">
		<div class="row text-center mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-150">
				<h1>이용 후기<i class="fa-solid fa-rss wifi blue"></i>
				</h1>
			</div>
		</div>
		<div class="row mt-100">
			<div class="row mt-4">
				<div class="col-xl-3 offset-xl-2 col-lg-3 offset-lg-2 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
					<h3>${count}개의 후기</h3>
				</div>
			</div>
			<div class="row mt-4">
				<div class="col-md-10 offset-md-1">
					<div class="row mt-4 list">
						<c:forEach var="reviewDto" items="${reviewList}">
							<div class="col-xl-5 offset-xl-1 col-lg-5 offset-lg-1 col-md-10 offset-md-1 col-sm-10 offset-sm-1 mt-4 reviewborder">
								<a href="${pageContext.request.contextPath}/review/fulldetail?reviewNo=${reviewDto.reviewNo}">
								<div class="row">
									<img class="col-xl-1 offset-xl-0 col-lg-1 offset-lg-0 col-md-4 offset-md-0 col-sm-4 offset-sm-0 mt-4" src="${pageContext.request.contextPath}/download/${reviewDto.filesNo}" style="width:100px; height: 85px; border-radius: 70%;">
									<div class="col-xl-8 offset-xl-0 col-lg-8 offset-lg-0 col-md-8 offset-md-0 col-sm-8 offset-sm-0 mt-4">

									<h3 class="text-dark" style="word-break:break-word;">${reviewDto.reviewTitle}</h3>
										<div class="row">
											<div class="col">
												<div class="star-score" data-max="5" data-rate="${reviewDto.reviewGood}"></div>
											</div>
										</div>
										<div class="row mt-3 mb-4">
											<div class="col">
												<h5 class="text-primary">${reviewDto.memberId}</h5>
											</div>
										</div>
									</div>
								</div>
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
<!-- 		<div class="row mt-100"> -->
<!--             <div class="col-md-10 offset-md-1 d-flex justify-content-center"> -->
<!-- 			  <ul class="pagination"> -->
<%-- 			    맨 처음 페이지로 이동 --%>
<!-- 			    <li class="page-item first-target"> -->
<%-- 					<c:choose> --%>
<%-- 						<c:when test = "${vo.isFirst()==false}"> 맨 처음 페이지가 아니라면 --%>
<%-- 							<a class="page-link" href = "fulllist?p=${vo.firstBlock()}&${vo.parameter()}">&laquo;</a> 첫 번째 페이지로 이동 --%>
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> 그렇지 않다면 --%>
<%-- 							<a class="page-link" href = "">&laquo;</a> 아무런 페이지 변화가 없도록 --%>
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
<!-- 			    </li> -->
			    
<!-- 			    <li class="page-item second-target"> -->
<%-- 				    이전 구간의 마지막 페이지로 이동 --%>
<%-- 					<c:choose> --%>
<%-- 						<c:when test = "${vo.hasPrev()}"> 이전 페이지가 있다면 --%>
<%-- 							<a class="page-link" href = "fulllist?p=${vo.prevBlock()}&${vo.parameter()}">&lt;</a> 이전 구간의 마지막 페이지로 이동 --%>
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> 그렇지 않다면 --%>
<%-- 							<a class="page-link" href = "">&lt;</a> 아무런 페이지 변화가 없도록 --%>
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
<!-- 			    </li> -->
			    
<%-- 			    현재 구간의 페이지 이동 --%>
<%-- 				변수명을 i로 하며 시작과 끝은 vo의 startBlock(), endBlock()의 반환값으로, 간격은 1로 한다  --%>
<%-- 				<c:forEach var = "i" begin = "${vo.startBlock()}" end = "${vo.endBlock()}" step = "1"> --%>
<!-- 					<li class="page-item blue-box"> -->
<%-- 						<a class="page-link" href = "fulllist?p=${i}&${vo.parameter()}">${i}</a> --%>
<!-- 					</li> -->
<%-- 				</c:forEach> --%>
				
<%-- 				다음 구간의 첫 번째 페이지로 이동 --%>
<!-- 				<li class="page-item last-target"> -->
<%-- 					<c:choose> --%>
<%-- 						<c:when test = "${vo.hasNext()}"> 다음 페이지가 있다면 --%>
<%-- 							<a class="page-link"  href = "fulllist?p=${vo.nextBlock()}&${vo.parameter()}">&gt;</a> 다음 구간의 첫 번째 페이지로 이동 --%>
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> 그렇지 않다면 --%>
<%-- 							<a class="page-link"  href = "">&gt;</a> 아무런 페이지 변화가 없도록 --%>
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
<!-- 				</li> -->
				
<%-- 				맨 마지막 페이지로 이동 --%>
<!-- 			    <li class="page-item final-target"> -->
<%-- 					<c:choose> --%>
<%-- 						<c:when test = "${vo.isLast()==false}"> 맨 마지막 페이지가 아니라면 --%>
<%-- 							<a class="page-link" href = "fulllist?p=${vo.lastBlock()}&${vo.parameter()}">&raquo;</a> 맨 마지막 페이지로 이동 --%>
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
<!-- 							<a class="page-link" href = "">&raquo;</a> -->
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
<!-- 			    </li> -->
<!-- 			  </ul> -->
<!-- 		  	</div> -->
<!-- 		</div> -->
			<i class="fa-solid fa-circle-arrow-up fa-3x blue go_top" style="position: fixed; right: 30; bottom: 100; z-index: 1080;"></i>
	</div>
	
	<script type="text/javascript">
		$(function(){
			 $(".star-score").score({
	                starColor: "#81BDF1",
	                backgroundColor: "transparent", //배경 색상
	                editable: false, //점수 변경 가능 여부
	                integerOnly: false, //정수만 설정 가능 여부(false면 소수점 가능)
	                zeroAvailable:true,//0 설정 가능 여부
	                display: {
	                    showNumber: true, //설정된 숫자 표시 가능 여부(false면 숫자 off, true면 숫자 on)
	                    placeLimit: 1, //소수점 자리수 표시 길이
	                    textColor:"#81BDF1",
	                },
	                point: {
	                    max: 5,//최대 점수(data-max로 대체 가능)
	                    rate: 0,//실제 점수(data-rate로 대체 가능)
	                }
	         });
		
		var page = 1 + ${vo.p};
		var size = ${vo.size};
		var count = ${count};
		
		
			$(window).scroll(function(){
	
	//             퍼센트 = (현재스크롤위치) / (문서높이 - 창높이) * 100
	//             var percent = $(window).scrollTop() / ($(document).height() - $(window).height()) * 100;
	//             console.log(percent);
					console.log(page > (count + size - 1) / size);
	            
				if($(document).height() <= $(window).scrollTop() + $(window).height() + 100){
		            if(page > (count + size - 1) / size) return;
					fulllist();
		            page++;
				}
	        });
		
		
			function fulllist(){
				$.ajax({
					url:"${pageContext.request.contextPath}/rest/review/fulllist?p="+page+"&size="+size,
					method:"get",
					data:{
						
					},
					success:function(resp){
	// 					console.log(resp.length);
						for(var i = 0; i < resp.length; i++){
							$(".list").append($("<div>").attr("class","col-xl-5 offset-xl-1 col-lg-5 offset-lg-1 col-md-10 offset-md-1 col-sm-10 offset-sm-1 mt-4 reviewborder")
									.append($("<a>").attr("href","${pageContext.request.contextPath}/review/fulldetail?reviewNo="+resp[i].reviewNo)
											.append($("<div>").attr("class","row")
													.append($("<img>").attr("class","col-xl-1 offset-xl-0 col-lg-1 offset-lg-0 col-md-4 offset-md-0 col-sm-4 offset-sm-0 mt-4")
													.attr("src","${pageContext.request.contextPath}/download/"+resp[i].filesNo)
													.attr("style","width:100px; height: 85px; border-radius: 70%;"))
														.append($("<div>").attr("class","col-xl-8 offset-xl-0 col-lg-8 offset-lg-0 col-md-8 offset-md-0 col-sm-8 offset-sm-0 mt-4")
																.append($("<h3>").attr("class","text-dark").attr("style","word-break:break-word;").append(resp[i].reviewTitle))
																			.append($("<div>").attr("class","row")
																					.append($("<div>").attr("class","col")
																							.append($("<div>").attr("class","star-score").attr("data-max","5").attr("data-rate",resp[i].reviewGood))))
																							.append($("<div>").attr("class","row mt-3 mb-4")
																									.append($("<div>").attr("class","col")
																											.append($("<h5>").attr("class","text-primary").append(resp[i].memberId))))))));
	// 						console.log(resp[i]);
						}
					}
				});
			}
			
			$(".go_top").click(function(){
				$(window).scrollTop(0);
			});
		
		});
		
	</script>

</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>