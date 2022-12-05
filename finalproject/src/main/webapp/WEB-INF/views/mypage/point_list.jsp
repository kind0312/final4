<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="포인트 내역" name="title"/>
</jsp:include>

<style>
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
</style>

<script>
	$(function(){
		$.ajax({
			url:"http://localhost:8888/rest/point_list",
			method:"get",
			dataType:"json",
			success:function(resp){
				var tbody = $("tbody");
				if(resp==null){
					var tr = $("<tr>").attr("class","table-default");
					var td = $("<td>").text("내역이 존재하지 않습니다!");
					tr.append(td);
					tbody.append(tr);
				}else{
					for(var i=0; i<resp.length; i++){
						var tr = $("<tr>").attr("class","table-default");
						var td1 = $("<td>").text(resp[i].pointDate);
						var td2 = $("<td>").text(resp[i].pointStatus);
						
						//구매, 사용에 따라 마이너스, 플러스 버튼 추가 후 td태그에 저장
						var price="";
						if(resp[i].pointStatus=="구매"){
							price = "+"+resp[i].pointPrice;
						}else if(resp[i].pointStatus=="사용"){
							price = "-"+resp[i].pointPrice;
						}
						var td3 = $("<td>").text(price).attr("class","price-font");
						tr.append(td1).append(td2).append(td3);
						tbody.append(tr);
					}
				}
				
				
			}
		});
	});
</script>

<body>
	<nav class="navbar navbar-expand-lg navbar-expand-lg-re navbar-dark bg-blue mypage-top-nav">
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
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/mypage/pet">반려동물</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" style="color:white;" href="${pageContext.request.contextPath}/mypage/point">포인트</a>
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
                 <h4 class="text-center">포인트 내역</h4>
            </div>
        </div>
        
		<div class="row mt-5">
            <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-4">
                 <span class="float-left">보유포인트 : ?</span>
                 <a href="${pageContext.request.contextPath}/pay/point_select" class="btn btn-blue float-end">포인트 구매</a>
                 <br>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-4">   
                 <table class="table table-hover text-center">
					  <thead>
					    <tr>
					      <th scope="col" width="35%">날짜</th>
					      <th scope="col" width="30%">사유/내용</th>
					      <th scope="col" width="35%">포인트</th>
					    </tr>
					  </thead>
					  <tbody>
					    <!-- 비동기화로 목록 처리 -->
					</tbody>
                 </table>
			 </div>
		</div>
		
		<div class="row mt-5 text-center mb-5">
            <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-4">  
			  	<ul class="pagination justify-content-center">
				    <li class="page-item disabled">
				      <a class="page-link" href="#">&laquo;</a>
				    </li>
				    <li class="page-item active page-blue">
				      <a class="page-link page-blue" href="#">1</a>
				    </li>
				    <li class="page-item">
				      <a class="page-link" href="#">2</a>
				    </li>
				    <li class="page-item">
				      <a class="page-link" href="#">3</a>
				    </li>
				    <li class="page-item">
				      <a class="page-link" href="#">4</a>
				    </li>
				    <li class="page-item">
				      <a class="page-link" href="#">5</a>
				    </li>
				    <li class="page-item">
				      <a class="page-link" href="#">&raquo;</a>
				    </li>
			  	</ul>
			</div>
		</div>
    </div>

</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>