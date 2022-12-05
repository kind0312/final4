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
		margin:0 4.5rem;
		font-size:19px;
	}
	.unselect-btn{
		color:#7B7B7B;
	}

</style>

<script>
	$(function(){
		//시작시 진행예약화면 고정
		$(".end-btn").removeClass("unselect-btn");
		$(".end-btn").addClass("unselect-btn");
		ingTrainingList();
		
		//진행 예약건 태그 생성
		var memberId = $("[name=memberId]").val();
		$.ajax({
			url:"http://localhost:8888/rest/training_ing/"+memberId,
			method:"get",
			data:memberId,
			success:function(resp){
					var tbody = $(".tbody-ing");
					for(var i=0; i<resp.length; i++){
						var tr = $("<tr>").attr("class","table-default align-middle");
						//첫번째 칸(훈련사 프로필 이미지)
						var th1 = $("<th>").attr("width","30%");
						var img = $("<img>").attr("src","#").attr("class","img-circle")
											.attr("width","100").attr("height","100");				
						th1.append(img);
						//두번째 칸(예약 날짜)
						var th2 = $("<th>").attr("width","40%");
						var p = $("<p>").attr("class","training-date").text(resp[i].trainingDate);
						th2.append(p);
						//세번째 칸
						var th3 = $("<th>").attr("width","30%");
						var a = $("<a>");
						if(resp[i].trainingStatus=='예약대기'){
							a = a.attr("class","btn btn-outline-blue training-status")
							.attr("href","${pageContext.request.contextPath}/mypage/training?trainingNo="+resp[i].trainingNo)
							.text("예약대기");
						}else{
							a = a.attr("class","btn btn-blue")
							.attr("href","${pageContext.request.contextPath}/mypage/training?trainingNo="+resp[i].trainingNo)
							.text("예약확정");
						}
						th3.append(a);
						//최종
						tr.append(th1).append(th2).append(th3);
						tbody.append(tr);
					}
			}
		});
		
		//지난 예약건 태그생성
		var memberId = $("[name=memberId]").val();
		$.ajax({
			url:"http://localhost:8888/rest/training_end/"+memberId,
			method:"get",
			data:memberId,
			success:function(resp){
					var tbody = $(".tbody-end");
					for(var i=0; i<resp.length; i++){
						var tr = $("<tr>").attr("class","table-default align-middle");
						//첫번째 칸(훈련사 프로필 이미지)
						var th1 = $("<th>").attr("width","30%");
						var img = $("<img>").attr("src","#").attr("class","img-circle")
											.attr("width","100").attr("height","100");				
						th1.append(img);
						//두번째 칸(예약 날짜)
						var th2 = $("<th>").attr("width","40%");
						var p = $("<p>").attr("class","training-date").text(resp[i].trainingDate);
						th2.append(p);
						//세번째 칸
						var th3 = $("<th>").attr("width","30%");
						var a = $("<a>");
						if(resp[i].trainingStatus=='예약취소'){
							a = a.attr("class","btn btn-outline-yellow training-status")
							.attr("href","${pageContext.request.contextPath}/mypage/training?trainingNo="+resp[i].trainingNo)
							.text("예약취소");
						}else{
							a = a.attr("class","btn btn-yellow")
							.attr("href","${pageContext.request.contextPath}/mypage/training?trainingNo="+resp[i].trainingNo)
							.text("이용완료");
						}
						th3.append(a);
						//최종
						tr.append(th1).append(th2).append(th3);
						tbody.append(tr);
					}
			}
		});
		
		//진행 예약 버튼 이벤트
		$(".ing-btn").click(function(){
			ingClick();
			ingTrainingList();
		});
		
		//지난 예약 버튼 이벤트
		$(".end-btn").click(function(){
			endClick();
			endTrainingList();
		});
		
	//진행 예약 출력함수
	function ingTrainingList(){
		var memberId = $("[name=memberId]").val();
		$.ajax({
			url:"http://localhost:8888/rest/training_ing/"+memberId,
			method:"get",
			data:memberId,
			success:function(resp){
				if(resp==null){
					//예약없음div 숨김해제 + 지난예약, 진행예약div 숨김
					$(".training-zero").children().show();
					$(".training-end").children().hide();
					$(".training-ing").children().hide();
				}else{
					//진행예약div 숨김해제 + 지난예약, 예약없음div 숨김
					$(".training-zero").children().hide();
					$(".training-end").children().hide();
					$(".training-ing").children().show();
					//태그에 db값 넣기
					for(var i=0; i<resp.length; i++){
						$(".training-date").val(resp[i].trainingDate);
						$(".training-status").val(resp[i].trainingStatus);
					}
				}
			}
		});
	}
	
	//지난 예약 출력함수
	function endTrainingList(){
		var memberId = $("[name=memberId]").val();
		$.ajax({
			url:"http://localhost:8888/rest/training_end/"+memberId,
			method:"get",
			data:memberId,
			success:function(resp){
				if(resp==null){
					//예약없음div 숨김해제 + 지난예약, 진행예약div 숨김
					$(".training-zero").children().show();
					$(".training-end").children().hide();
					$(".training-ing").children().hide();
				}else{
					//지난예약div 숨김해제 + 진행예약, 예약없음div 숨김
					$(".training-zero").children().hide();
					$(".training-end").children().show();
					$(".training-ing").children().hide();
					//태그에 db값 넣기
					for(var i=0; i<resp.length; i++){
						$(".training-date").val(resp[i].trainingDate);
						$(".training-status").val(resp[i].trainingStatus);
					}
				}
			}
		});
	}
	
	function ingClick(){
		//버튼 색상 변경
		$(".end-btn").removeClass("unselect-btn");
		$(".ing-btn").removeClass("unselect-btn");
		$(".end-btn").addClass("unselect-btn");
	}
	
	function endClick(){
		//버튼 색상 변경
		$(".ing-btn").removeClass("unselect-btn");
		$(".end-btn").removeClass("unselect-btn");
		$(".ing-btn").addClass("unselect-btn");
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
	          <a class="nav-link mypage-nav" style="color:white;" href="${pageContext.request.contextPath}/mypage/training">예약확인</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/mypage/pet">반려동물</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/mypage/point">포인트</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/#">찜관리</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/#">후기</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/#">정보수정</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/#">펫시터로 전환</a>
	        </li>
     	 </ul>
    	</div>
  	</div>
</nav>

	<div class="container-fluid">
	
        <div class="row mt-80">
            <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-4">
                 <div class="text-center">
                 	<button class="training-btn ing-btn">진행 예약</button>
                 	<button class="training-btn end-btn">지난 예약</button>
                 </div>
            </div>
        </div>
        
        <!-- 예약이 없을 경우의 화면 -->
        <div class="row mt-4 training-zero">
            <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-4">
                 <table class="table table-hover training-table text-center">
                 	<tbody>
                 		<tr class="table-default align-middle">
                 			<td><span class="training-zero-font">아직 예약이 없습니다</span></td>
                 		</tr>
                 	</tbody>
                 </table>
            </div>
        </div>
        
        <!-- 진행 예약 화면 -->
         <div class="row mt-8 training-ing">
            <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-4">
                 <table class="table table-hover training-table text-center">
                 	<tbody class="tbody-ing">
                 		<!-- 비동기 처리 -->
                 	</tbody>
                 </table>
            </div>
        </div>
        
        <!-- 지난 예약 화면 -->
         <div class="row mt-12 training-end">
            <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-4">
                 <table class="table table-hover training-table text-center">
                 	<tbody class="tbody-end">
                 		<!-- 비동기 처리 -->
                 	</tbody>
                 </table>
            </div>
        </div>
        
        <!-- 조회를 위한 회원id (model로 전달받음) -->
        <input type="hidden" name="memberId" value="${memberId}">
    </div>

</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>