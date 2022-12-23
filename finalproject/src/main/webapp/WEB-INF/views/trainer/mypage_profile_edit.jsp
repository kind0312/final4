<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/trainerHeader.jsp">
	<jsp:param value="훈련사프로필수정" name="title"/>
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
	
	$(function(){
		//프로필 클릭 시 첨부파일 버튼 실행
		$(".img-circle").click(function(){
			$(".input-file").click();
		});

		//프로필 파일 저장 및 미리보기
		$(".input-file").change(function(){
			var value = $(this).val();
			if(value.length>0){ //파일 있음(비동기화로 파일 불러오기)
				//서버에 전송할 formdate 만들기
				var formData = new FormData();
				formData.append("files", this.files[0]);
                
				$.ajax({
					url:"http://localhost:8888/upload",
					method:"post",
					data:formData,
					//multipart 요청을 위해 아래 2가지 꼭 보내줘야함
					processData:false, 
                    contentType:false,
                    success:function(resp){
                    	$(".img-circle").attr("src",resp);
                    	var check = resp.lastIndexOf("/"); //경로에서 /위치 찾기
                    	var filesNo = resp.substr(check+1); //fileNo 꺼내기
                    	$("[name=filesNo]").val(filesNo); //파일no input태그에 값 넣기

                    }
				});
			}			
		});

		//form 상태 판정
		check={
				profile:false,
				title:false,
				content:false,
				allValid:function(){
					return this.profile && this.title && this.content;
				}
		};
		
		//사진검사 함수
		function profileCheck(){
			var value = $("[name=filesNo]").val();
			$("[name=profile]").removeClass("is-valid is-invalid");
			if(value!=null){
				$("[name=profile]").addClass("is-valid");
				check.profile=true;
			}else{
				$("[name=profile]").addClass("is-invalid");
				check.profile=false;
			}
		}
		
		//제목체크 검사
		$("[name=trainerProfile]").blur(function(e){
			$(this).removeClass("is-valid is-invalid");
			if($(this).val().length>0){
				$(this).addClass("is-valid");
				check.title=true;
			}else{
				$(this).addClass("is-invalid");
				check.title=false;
			}	
		});
		
		//내용체크 검사
		$("[name=trainerProfileContent]").blur(function(e){
			$(this).removeClass("is-valid is-invalid");
			if($(this).val().length>0){
				$(this).addClass("is-valid");
				check.content=true;
			}else{
				$(this).addClass("is-invalid");
				check.content=false;
			}	
		});
		
		//폼 검사 이벤트
		$(".insert-form").submit(function(e){
			e.preventDefault();
			
			profileCheck();
			$("[name=trainerProfile]").blur();
			$("[name=trainerProfileContent]").blur();
			
			if(check.allValid()){
				this.submit();
			}
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

<form class="insert-form" action="mypage_profile_edit" method="post">
	<fieldset>

	    <div class="row text-center mt-5">
	            <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">   
	            	 <h3 class="text-center">프로필 수정</h3>
	            	 <img src="${pageContext.request.contextPath}/download/${filesDto.getFilesNo()}" 
	                 		width="120" height="120" class="img-circle mt-4">
	                 <input type="file" style="display:none;" class="input-file form-control" name="profile" accept=".jpg, .png, .gif">
	                 <div class="invalid-feedback">필수 항목입니다.</div>
	                 <input type="hidden" value="${filesDto.getFilesNo()}" name="filesNo">
				</div>
		</div>
	    
	    <div class="row mt-3">
	            <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">   
	            	 <div class="form-group">
					      <label for="exampleInputEmail1" class="form-label mt-4">제목</label>
					      <textarea class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
					       name="trainerProfile" style="resize:none;">${trainerDto.getTrainerProfile()}</textarea>
					      <div class="invalid-feedback">필수 항목입니다.</div>   
				    </div>   
				</div>
		</div>
		
		 <div class="row mt-3">
	            <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">   
	            	 <div class="form-group">
					      <label for="exampleTextarea" class="form-label mt-4">내용</label>
					      <textarea  class="form-control" id="exampleTextarea" rows="5" 
					      name= "trainerProfileContent">${trainerDto.getTrainerProfileContent()}</textarea>
					      <div class="invalid-feedback">필수 항목입니다.</div>
		    		</div>
				</div>
		</div>
		
		<div class="row mt-4">
	            <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 text-center">   
	            	 <button type="submit" class="btn btn-blue">수정</button>
				</div>
		</div>
	
	   	<!-- 넘겨야 될 데이터 준비 -->
	   <input type="hidden" value="${trainerDto.getTrainerNo()}" name="trainerNo">
   	   <input type="hidden" value="${trainerDto.getMemberId()}" name="memberId">
	</fieldset>
</form>
    
</div>


</body>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>