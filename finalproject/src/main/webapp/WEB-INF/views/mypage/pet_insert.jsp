<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="반려동물 등록" name="title"/>
</jsp:include>

<style>
	.img-circle{
		border-radius: 70%;
    	border:none;
    	background-color:#81BDF1;
    	/* overflow: hidden; 사진 첨부하고 주석풀기*/
	}
</style>

<script>
	$(function(){
		//폼체크
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
        <div class="row mt-80">
            <div class="col-md-6 offset-md-3">
                 <h4 class="text-center">반려동물 등록</h4>
            </div>
        </div>
 
        <div class="row mt-2">
            <div class="col-md-6 offset-md-3">   
                 <hr>
			 </div>
		</div>
		
		<div class="row mt-3 text-center">
            <div class="col-md-6 offset-md-3">   
                 <img src="${pageContext.request.contextPath}/#" 
                 		width="120" height="120" class="img-circle">
			</div>
		</div>
		<form action="#" method="post">
			<div class="row mt-4 text-center">
	            <div class="col-md-6 offset-md-3">
	            	<div>
	            		<span>종류<i class="fa-solid fa-asterisk text-danger"></i></span>
				        <input class="form-check-input" type="radio" name="petType" value="강아지" id="optionsRadios1" required>
				        <label class="label" for="optionsRadios1">
				        	<span>강아지</span>
				        </label>
					    <input class="form-check-input" type="radio" name="petType" value="고양이" id="optionsRadios2" required>
				        <label class="label" for="optionsRadios2">
				        	<span>고양이</span>
				        </label>
		            </div>
		            
		            <div>
		            	<span>이름<i class="fa-solid fa-asterisk text-danger"></i></span>
			            <label class="col-form-label mt-4" for="inputDefault"></label>
		  				<input type="text" name="petName" class="form-control" placeholder="이름" id="inputDefault" required>
		            </div>
		            
		            <div>
	            		<span>성별<i class="fa-solid fa-asterisk text-danger"></i></span>
				        <input class="form-check-input" type="radio" name="petGender" value="남" id="optionsRadios1" required>
				        <label class="label" for="optionsRadios1">
				        	<span>남자아이</span>
				        </label>
					    <input class="form-check-input" type="radio" name="petGender" value="여" id="optionsRadios2" required>
				        <label class="label" for="optionsRadios2">
				        	<span>여자아이</span>
				        </label>
		            </div>
		            
		            <div>
		            	<span>품종<i class="fa-solid fa-asterisk text-danger"></i></span>
			            <label class="col-form-label mt-4" for="inputDefault"></label>
		  				<input type="text" name="petBreed" class="form-control" placeholder="품종" id="inputDefault" required>
		            </div>
		            
		            <div>
		            	<span>생일</span>
			            <label class="col-form-label mt-4" for="inputDefault"></label>
		  				<input type="date" name="petBirth" class="form-control" placeholder="생일" id="inputDefault">
		            </div>
		            
		            <div>
		            	<span>몸무게</span>
			            <label class="col-form-label mt-4" for="inputDefault"></label>
		  				<input type="text" name="petWeight" class="form-control" placeholder="예) 숫자만 입력하세요" id="inputDefault">
		            </div>
		            
		            <div>
	            		<span>중성화<i class="fa-solid fa-asterisk text-danger"></i></span>
				        <input class="form-check-input" type="radio" name="petNeutralization" value="Y" id="optionsRadios1" required>
				        <label class="label" for="optionsRadios1">
				        	<span>했어요</span>
				        </label>
					    <input class="form-check-input" type="radio" name="petNeutralization" value="N" id="optionsRadios2" required>
				        <label class="label" for="optionsRadios2">
				        	<span>안했어요</span>
				        </label>
		            </div>
		            
		            <button type="submit" class="btn btn-blue">등록</button>
		            <a href="${pageContext.request.contextPath}/mypage/pet" class="btn btn-yellow">취소</a>
		            
		            <!-- 비동기 처리 위한 회원id -->
					<input type="hidden" value="${memberId}" name="memberId">
				</div>
			</div>
		</form>
		
    </div>
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>