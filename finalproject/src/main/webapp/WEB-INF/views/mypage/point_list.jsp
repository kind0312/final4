<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="포인트 내역" name="title"/>
</jsp:include>

<style>
	.mt-150{
		margin-top:150px;
	}
	.mt-120{
		margin-top:120px;
	}
	.mt-50{
		margin-top:50px;
	}
	.mt-40{
		margin-top:40px;
	}
	.mt-30{
		margin-top:30px;
	}
	.mt-20{
		margin-top:20px;
	}
	.mt-29{
		margin-top:29px;
	}
	.blue{
		color:#81BDF1;
	}
	.blue-bolder{
		font-weight:bolder;
	}
	.mypage-nav{
		font-size:16px;
		margin-left:10px;
		margin-right:10px;
	}
	.navbar-expand-lg{
		padding-left:1.2em;
		padding-right:1.2em;
	}
	
</style>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-blue">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="#">마이페이지</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse justify-content-end" id="navbarColor01">
	      <ul class="navbar-nav me-5">
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="#">예약확인</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="#">반려동물</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="#">포인트</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="#">찜관리</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="#">후기</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="#">정보수정</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="#">펫시터로 전환</a>
	        </li>
     	 </ul>
    	</div>
  	</div>
</nav>

	<div class="container-fluid">
        <div class="row mt-120">
            <div class="col-md-4 offset-md-4">
                 <h3 class="text-center">포인트 내역</h3>
            </div>
        </div>
		
		<div class="row mt-4">
            <div class="col-md-4 offset-md-4">
                 <span class="float-left">보유포인트 : ?</span>
                 <a href="point_select" class="btn btn-blue float-end">포인트 구매</a>
                 <br>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-4 offset-md-4">   
                 <table class="table table-hover text-center">
					  <thead>
					    <tr>
					      <th scope="col" width="35%">날짜</th>
					      <th scope="col" width="30%">사유/내용</th>
					      <th scope="col" width="35%">포인트</th>
					    </tr>
					  </thead>
					  <tbody>
					    <c:forEach var="point" items="${point}">
                 			<tr class="table-default">
			                 	<td>${point.pointDate}</td>
			                 	<td>${point.pointStatus}</td>
			                 	<td>${point.pointPrice}</td>
			                </tr>
			            </c:forEach>
					</tbody>
                 </table>
			 </div>
		</div>
             <br><br>
             테스트 출력 : ${point}
    </div>

</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>