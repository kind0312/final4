<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/trainerHeader.jsp">
	<jsp:param value="훈련사프로필" name="title"/>
</jsp:include>

<style>
	.img-circle{
		border-radius: 70%;
    	overflow: hidden;
	}
	.form-control{
		display:inline;
	}
	.table{
		border-color: rgba(0, 0, 0, 0);
		font-size:17px;
		margin-left:auto;
		margin-right:auto;
	}
	table>tbody>tr{
		height:70px;
		vertical-align: middle;
	}

</style>
<script>
	$(function(){
		//회원모드로 전환 이벤트
		$(".mode-change").click(function(){
			location.href="${pageContext.request.contextPath}/";
		});
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
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/trainer/mypage_reservation">예약확인</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" style="color:white;" href="${pageContext.request.contextPath}/trainer/mypage_profile">프로필관리</a>
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

	<fieldset>
	
	    <div class="row text-center mt-5">
	            <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">   
	            	 <h3 class="text-center">프로필 수정</h3>
	            	 <img src="${pageContext.request.contextPath}/download/${filesDto.getFilesNo()}" 
	                 		width="120" height="120" class="img-circle mt-4">    
				</div>
		</div>
	    
	    <!-- 나중에 readonly 기능 시간 되면 넣어보기, 수정버튼 누르면 input창 활성화 기능 -->
	    <div class="row mt-3">
	            <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">   
	            	 <div class="form-group">
					      <label for="exampleInputEmail1" class="form-label mt-4">제목</label>
					      <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
					      value="${trainerDto.getTrainerProfile()}" name="trainerProfile"  readonly>  
					      <div class="invalid-feedback">필수 항목입니다.</div>   
				    </div>   
				</div>
		</div>
		
		 <div class="row mt-3">
	            <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">   
	            	 <div class="form-group">
					      <label for="exampleTextarea" class="form-label mt-4">내용</label>
					      <textarea  class="form-control" id="exampleTextarea" rows="5" 
					      name= "trainerProfileContenct"  readonly>${trainerDto.getTrainerProfileContent()}</textarea>
					      <div class="invalid-feedback">필수 항목입니다.</div>
		    		</div>
				</div>
		</div>
		
		<div class="row mt-4">
	            <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 text-center">   
	            	 <a class="btn btn-blue" href="${pageContext.request.contextPath}/trainer/mypage_profile_edit">수정</a>
				</div>
		</div>
	  
	</fieldset>
</div>


</body>
<script>
	$(function(){

		
	});
</script>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>