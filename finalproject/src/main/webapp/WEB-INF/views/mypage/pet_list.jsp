<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="반려동물" name="title"/>
</jsp:include>

<style>
	.pet-table>thead,
	.pet-table>tbody{
		height:130px;
	}
	.insert-font{
		color:black;
		font-weight:bolder;
		font-size:15px;
	}
	.name-font{
		font-weight:bolder;
	}
	.gender-font{
		color:#7B7B7B;
	}
	.img-circle{
		border-radius: 70%;
    	border:none;
    	background-color:#81BDF1;
    	/* overflow: hidden; 사진 첨부하고 주석풀기*/
	}
</style>

<script>
	$(function(){
		//펫 목록 출력
		var memberId = $("[name=memberId]").val();
		$.ajax({
			url:"http://localhost:8888/rest/pet_list/"+memberId,
			method:"get",
			dataType:"json",
			data:memberId,
			success:function(resp){
				var thead = $("thead");
				if(resp==null){
					var tr = $("<tr>").attr("class","table-default");
					var th = $("<th>").attr("scope", "col").attr("colspan","3").text("내역이 존재하지 않습니다!");
					tr.append(th);
					tbody.append(tr);
				}else{
					for(var i=0; i<resp.length; i++){
						var tr = $("<tr>").attr("class","table-default align-middle");
						//첫번째 칸(펫 프로필 이미지)
						var th1 = $("<th>");
						var img = $("<img>").attr("src","#").attr("class","img-circle")
											.attr("width","100").attr("height","100");
						th1.append(img);
						//두번째 칸(펫 이름/성별)
						var th2 = $("<th>");
						var p1 = $("<p>").attr("class","name-font").text(resp[i].petName);
						var p2 = $("<p>").attr("class","gender-font")
										.text(resp[i].petType+" / "+resp[i].petGender+" / "+resp[i].petWeight+"kg");
						th2.append(p1).append(p2);
						//세번째 칸
						var th3 = $("<th>")
						var a = $("<a>").attr("class","btn btn-blue")
										.attr("href","${pageContext.request.contextPath}/mypage/pet_detail")
										.text("상세");
						th3.append(a);
						//최종
						tr.append(th1).append(th2).append(th3);
						thead.append(tr);
					}
				}
			}
		});
	});
</script>

<body>
	<nav class="navbar navbar-expand-lg navbar-expand-lg-re navbar-dark bg-blue">
	  <div class="container-fluid">
	    <a class="navbar-brand-re" href="#">마이페이지</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse justify-content-end" id="navbarColor01">
	      <ul class="navbar-nav me-0">
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/mypage/training">예약확인</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" style="color:white;" href="${pageContext.request.contextPath}/mypage/pet">반려동물</a>
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
        <div class="row mt-80 mb-3">
            <div class="col-md-6 offset-md-3">
                 <h4 class="text-center">반려동물</h4>
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-6 offset-md-3">   
                 <table class="table table-hover pet-table text-center">
                 		<thead>
                 			<!-- 비동기 처리(목록출력) -->
                 		</thead>
					  	<tbody>
						    <tr class="table-default align-middle">
					    		<td scope="row" colspan="3">
						    		<i class="fa-solid fa-plus" style="color:#81BDF1;"></i>
						    	 	<a href="${pageContext.request.contextPath}/mypage/pet_insert">
						    	 		<span class="insert-font">반려동물 추가</span>
						    	 	</a>
					    		</td>
						    </tr>
					  	</tbody>
					  
                 </table>
			 </div>
		</div>
    </div>
    <!-- 비동기 처리 위한 회원id -->
    <input type="hidden" value="${memberId}" name="memberId">

</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>