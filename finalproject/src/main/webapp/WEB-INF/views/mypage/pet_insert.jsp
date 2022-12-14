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

<script>
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
					url:"${pageContext.request.contextPath}/upload",
					method:"post",
					data:formData,
					//multipart 요청을 위해 아래 2가지 꼭 보내줘야함
					processData:false, 
                    contentType:false,
                    success:function(resp){
                    	$(".img-circle").attr("src",resp);
                    	var check = resp.lastIndexOf("/"); //경로에서 /위치 찾기
                    	var filesNo = resp.substr(check+1); //fileNo 꺼내기
                    	$("[name=filesNo]").val(filesNo); //하단 파일no input태그에 값 넣기
                    }
				});
			}else{ //파일 없거나 있던 파일 삭제
				$(".img-circle").attr("src","${pageContext.request.contextPath}/image/profile_basic.jpg");
			}
		});
		
		//상태 판정
		check={
				petProfile:false,
				petName:false,
				petBreed:false,
				petWeight:false, weightRegex:/^[0-9]{1,5}$/,
				allValid:function(){
					return this.petName && this.petBreed && 
									this.petWeight && this.petProfile;
				}
		};
		
		//사진검사 함수
		function profileCheck(){
			var value = $("[name=petProfile]").val();
			$("[name=petProfile]").removeClass("is-valid is-invalid");
			if(value.length>0){
				$("[name=petProfile]").addClass("is-valid");
				check.petProfile=true;
			}else{
				$("[name=petProfile]").addClass("is-invalid");
				check.petProfile=false;
			}
		}

		//이름검사
		$("[name=petName]").blur(function(e){
			$(this).removeClass("is-valid is-invalid");
			if($(this).val().length>0){
				$(this).addClass("is-valid");
				check.petName=true;
			}else{
				$(this).addClass("is-invalid");
				check.petName=false;
			}	
		});
		
		//품종검사
		$("[name=petBreed]").blur(function(e){
			$(this).removeClass("is-valid is-invalid");
			if($(this).val().length>0){
				$(this).addClass("is-valid");
				check.petBreed=true;
			}else{
				$(this).addClass("is-invalid");
				check.petBreed=false;
			}	
		});
		
		//몸무게 숫자만 입력 검사
		$("[name=petWeight]").blur(function(e){
			$(this).removeClass("is-valid is-invalid");
			var value = $(this).val();
			if(value.length==0){
				check.petWeight=true;
			}else{
				var regex = check.weightRegex;
				if(regex.test(value)){
					$(this).addClass("is-valid");
					check.petWeight=true;
				}else{
					$(this).addClass("is-invalid");
					check.petWeight=false;
				}
			}
		});
		
		$(".insert-form").submit(function(e){
			//기본이벤트 차단
			e.preventDefault();
			//필수항목 체크
			$("[name=petName]").blur();
			$("[name=petBreed]").blur();
			$("[name=petWeight]").blur();
			profileCheck();

			if(check.allValid()){//등록처리
				this.submit();
			}	
		});
		
		//이후 날짜 선택되지 않도록 제한
		$(".input-calendar").click(function(){
			var now = Date.now(); //현재 날짜 밀리초로 변환
			var calcul = new Date().getTimezoneOffset()*60000; //현재 시간과의 차이를 분 단위로 반환
			var today = new Date(now-calcul).toISOString(); //2022-12-08T17:50:05.809Z 형식으로 출력됨
			var max = today.substring(0,10); //필요한 범위(연/월/일)까지만 문자열 자르기
			$(this).attr("max",max);
		});
		
		//훈련사 전환 이벤트
		$(".trainer-change").click(function(e){
			e.preventDefault();
			$("#change-modal").modal('hide');
			//1. 회원의 훈련사 여부 비동기로 확인
			//2. y를 반환할 경우 훈련사 메인화면으로 이동
			//3. n을 반환할 경우 훈련사 전환이 불가능한 회원입니다. 라는 문구 모달로 출력
			var memberId = $("[name=memberId]").val();
			$.ajax({
				url:"${pageContext.request.contextPath}/rest/member/trainer_change/"+memberId,
				method:"get",
				data:memberId,
				success:function(resp){
					if(resp=='N'){
						$("#change-modal").modal('show');
					}else if(resp=='Y'){
						location.href="${pageContext.request.contextPath}/trainer/main";
						$("#change-modal").modal('hide');
					}
				}
			});
		});	
		
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
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/mypage/training">예약확인</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" style="color:white;" href="${pageContext.request.contextPath}/mypage/pet">반려동물</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/mypage/point">포인트</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/mypage/like">찜관리</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/mypage/review">후기</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/mypage/profile">정보수정</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav trainer-change" href="#">훈련사로 전환</a>
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
	        훈련사 전환이 불가능한 회원입니다.
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-yellow" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 비동기화를 위한 데이터 -->
	<input type="hidden" name="memberId" value="${memberId}">
	
	<div class="container-fluid">
        <div class="row mt-80">
            <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-4">
                 <h4 class="text-center">반려동물 등록</h4>
            </div>
        </div>
 
        <div class="row mt-2">
            <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">   
                 <hr>
			 </div>
		</div>
		
		<div class="row text-center mt-3">
            <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">   
                 <img src="${pageContext.request.contextPath}/image/profile_basic.jpg" 
                 		width="120" height="120" class="img-circle">
                 <input type="file" style="display:none;" class="input-file form-control" name="petProfile" accept=".jpg, .png, .gif">
                 <div class="invalid-feedback">사진을 등록해주세요!</div>
			</div>
		</div>
		
		<form class="insert-form" action="/mypage/pet_insert" method="post">
			<div class="row text-center">
	            <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-4">   
	                 <table class="table">
						<tbody>
							<tr class="table-default">
								<th>종류 <i class="fa-solid fa-asterisk blue"></i></th>
								<td>
									<input class="form-check-input mx-1" type="radio" name="petType" value="강아지" id="optionsRadios1" required>
							        <label class="label" for="optionsRadios1">
							        	<span>강아지</span>
							        </label>
								    <input class="form-check-input mx-1" type="radio" name="petType" value="고양이" id="optionsRadios2" required>
							        <label class="label" for="optionsRadios2">
							        	<span>고양이</span>
				        			</label>
								</td>
							</tr>
							<tr>
								<th>이름 <i class="fa-solid fa-asterisk blue"></i></th>
								<td>
		  							<input type="text" name="petName" class="underline form-control" placeholder="예) 흰둥이" required>
									<div class="invalid-feedback">필수 항목입니다.</div>
								</td>
							</tr>
							<tr>
								<th>성별 <i class="fa-solid fa-asterisk blue"></i></th>
								<td>
									<input class="form-check-input mx-1" type="radio" name="petGender" value="남" id="optionsRadios3" required>
							        <label class="label" for="optionsRadios3">
							        	<span>남자아이</span>
							        </label>
								    <input class="form-check-input mx-1" type="radio" name="petGender" value="여" id="optionsRadios4" required>
							        <label class="label" for="optionsRadios4">
							        	<span>여자아이</span>
							        </label>
								</td>
							</tr>
							<tr class="my-2">
								<th>품종 <i class="fa-solid fa-asterisk blue"></i></th>
								<td>
									<input type="text" name="petBreed" class="underline form-control" placeholder="예) 말티즈" required>
									<div class="invalid-feedback">필수 항목입니다.</div>
								</td>
							</tr>
							<tr class="my-2">
								<th>생일 <i class="fa-solid fa-asterisk blue"></i></th>
								<td>
		  							<input type="date" name="petBirth" class="form-control underline input-calendar" placeholder="생일" required>
								</td>
							</tr>
							<tr class="my-2">
								<th>몸무게 <i class="fa-solid fa-asterisk blue"></i></th>
								<td>
									<input type="text" name="petWeight" class="underline form-control" placeholder="숫자만 입력해주세요" required>
									<div class="invalid-feedback">숫자만 입력해주세요</div>
								</td>
							</tr>
							<tr class="my-2">
								<th>중성화 <i class="fa-solid fa-asterisk blue"></i></th>
								<td>
							        <input class="form-check-input mx-1" type="radio" name="petNeutralization" value="유" id="optionsRadios5" required>
							        <label class="label" for="optionsRadios5">
							        	<span>했어요</span>
							        </label>
								    <input class="form-check-input mx-1" type="radio" name="petNeutralization" value="무" id="optionsRadios6" required>
							        <label class="label" for="optionsRadios6">
							        	<span>안했어요</span>
							        </label>
								</td>
							</tr>
						</tbody>
					</table>
					<!-- 파일no-->
					<input type="hidden" value="" name="filesNo">
					
		            <button type="submit" class="btn btn-blue text-center check-btn">등록</button>
		            <a href="${pageContext.request.contextPath}/mypage/pet" class="btn btn-yellow">취소</a>
				</div>
			</div>
		</form>
    </div>
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>