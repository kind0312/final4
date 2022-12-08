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
    	/* overflow: hidden; 사진 첨부하고 주석풀기*/
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
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}//trainer/mypage_reservation">예약확인</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" style="color:white;" href="${pageContext.request.contextPath}/trainer/mypage_profile">프로필 관리</a>
	        </li>      
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/#">회원페이지로 전환</a>
	        </li>
     	 </ul>
    	</div>
  	</div>
</nav>








<div class="container-fluid">
    <div class="row mt-4">
        <div class="col-md-10 offset-md-1 p-4 rounded">



<form class="insert-form">
  <fieldset>
    <legend>훈련사 프로필 관리</legend>
    
    
    <div class="row text-center mt-3">
            <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">   
             <img src="${pageContext.request.contextPath}/download/${filesDto.getFilesNo()}" 
                 		width="120" height="120" class="img-circle">
                <input type="file" style="display:none;" class="input-file form-control" name="memProfileImg" accept=".jpg, .png, .gif">              
				<div class="invalid-feedback">사진을 등록해주세요!</div> 			 
			</div>
	</div>
    
    <!-- 나중에 readonly 기능 시간 되면 넣어보기, 수정버튼 누르면 input창 활성화 기능 -->
    <div class="form-group">
      <label for="exampleInputEmail1" class="form-label mt-4">제목</label>
      <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
      value="${trainerDto.getTrainerProfile()}" name="trainerProfile"  readonly>  
      <div class="invalid-feedback">필수 항목입니다.</div>   
    </div>

	
    <div class="form-group">
      <label for="exampleTextarea" class="form-label mt-4">내용</label>
      <textarea  class="form-control" id="exampleTextarea" rows="5" 
      name= "trainerProfileContenct"  readonly>${trainerDto.getTrainerProfileContent()}</textarea>
      <div class="invalid-feedback">필수 항목입니다.</div>
    </div>
    
   	<!-- input 으로 넘겨야 하는데 안써도 되는건 히든으로 넘겨야함 -->
   <input type="hidden" value="${trainerDto.getTrainerNo()}" name="trainerNo">
   <input type="hidden" value="${trainerDto.getMemberId()}" name="memberId"> 
   <input type="hidden" value="${trainerDto.getApplyNo()}" name="applyNo">
   
   
   
   	<p></p>
     <button type="button" class="btn btn-blue" onclick="location.href='http://localhost:8888/trainer/mypage_profile_edit' ">수정</button>        
   
    </fieldset>
    </form>
    

   			</div>
   	 </div>
  </div>





</body>

<script>
	$(function(){
		//프로필 클릭 시 첨부파일 버튼 실행
// 		$(".img-circle").click(function(){
// 			$(".input-file").click();
// 		});
		
		//프로필 파일 저장 및 미리보기
		$(".input-file").change(function(){
			//console.log($(".input-file").val()); //선택된 파일 경로와 이름이 나옴
			//console.log(this.files); //선택한 파일들(배열)이 나옴
			//console.log(this.files[0].name); //선택한 파일의 첫번째 값의 이름
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
                    	//console.log(resp); //이미지 경로 반환
                    	$(".img-circle").attr("src",resp);
                    	var check = resp.lastIndexOf("/"); //경로에서 /위치 찾기
                    	var filesNo = resp.substr(check+1); //fileNo 꺼내기
                    	$("[name=filesNo]").val(filesNo); //하단 파일no input태그에 값 넣기
                    }
				});
			}
			else	{ //파일 없거나 있던 파일 삭제
				$(".img-circle").attr("src","${pageContext.request.contextPath}/image/profile_basic.jpg");
			}
		});
		
// 		//상태 판정
// 		check={
// 				memProfileImg:false,
// 				trainerProfile:false,
// 				trainerProfileContenct:false,				
// 				allValid:function(){
// 					return this.trainerProfile && this.trainerProfileContenct &&	this.memProfileImg;
// 				}
// 		};
		
// 		//사진검사
// 		function profileImgCheck(){
// 			var value = $("[name=trainerProfileImg]").val();
	
// 			$("[name=trainerProfileImg]").removeClass("is-valid is-invalid");
			
// 			if(value.length>0){
// 				$("[name=trainerProfileImg]").addClass("is-valid");
// 				check.memProfileImg=true;
// 			}else{
// 				$("[name=trainerProfileImg]").addClass("is-invalid");
// 				check.memProfileImg=false;
// 			}	
// 		}
		
// 		//제목title 검사
// 		$("[name=trainerProfile]").blur(function(e){
// 			$(this).removeClass("is-valid is-invalid");
// 			if($(this).val().length>0){
// 				$(this).addClass("is-valid");
// 				check.trainerProfile=true;
// 			}else{
// 				$(this).addClass("is-invalid");
// 				check.trainerProfile=false;
// 			}	
// 		});
		
// 		//자기소개 검사
// 		$("[name=trainerProfileContencts]").blur(function(e){
// 			$(this).removeClass("is-valid is-invalid");
// 			if($(this).val().length>0){
// 				$(this).addClass("is-valid");
// 				check.trainerProfileContenct=true;
// 			}else{
// 				$(this).addClass("is-invalid");
// 				check.trainerProfileContenct=false;
// 			}	
// 		});		
		
		
// 		$(".insert-form").submit(function(e){
// 			//기본이벤트 차단
// 			e.preventDefault();
// 			//필수항목 체크
// 			$("[name=trainerProfile]").blur();
// 			$("[name=trainerProfileContencts]").blur();			
// 			$("[name=trainerProfileImg]").change();

// 			// 필수입력사항만 보낼경우 value값에 null이 들어가 db에 등록되지 않음
// 			// 필수, 전체입력 다 받을 경우만 ajax로 전송 및 db저장 되는 상태..
// 			console.log("check valid", check.allValid());
			
// 			if(check.allValid()){//등록처리
// 				//비동기화 데이터 준비
// 				var filesNo = $("[name=filesNo]").val();	
// 				var trainerNo = $("[name=trainerNo]").val();
// 				var memberId = $("[name=memberId]").val();
// 				var title =$("[name=trainerProfile]").val();
// 				var applyNo = $("[name=applyNo]").val();
// 				var content =$("[name=trainerProfileContencts]").val();
				
// 				//data에 묶음
// 				data={
// 					//filesNo:filesNo,
// 					trainerNo:trainerNo,
// 					memberId:memberId,
// 					applyNo:applyNo,
// 					trainerProfile:title,
// 					trainerProfileContent:content					
// 				}

// 				$.ajax({
// 					url:"http://localhost:8888/trainer/post/mypage_profile",
// 					method:"post",
// 					contentType:"application/json",
// 					data:JSON.stringify(data),
// 					success:function(resp){
// 						location.href="${pageContext.request.contextPath}/trainer/mypage_profile";
// 					}
// 				});
// 			}
// 		}); 
	});
</script>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>