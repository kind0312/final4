<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="반려동물 상세" name="title"/>
</jsp:include>

<style>
	.img-circle{
		border-radius: 70%;
    	border:none;
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
	.btn-danger{
		font-weight:bolder;
		font-size:15px;
	}
	.form-control[readonly] {
	  background-color: #fff;
	}


</style>

<script>
	$(function(){
		//입력창 태그 및 확인(수정)버튼 숨김
		tdHide();
		
		var petNo = $("[name=petNo]").val();
		
		//pet_no로 상세 불러오기
		$.ajax({
			url:"${pageContext.request.contextPath}/rest/pet_selectone/"+petNo,
			method:"get",
			dataType:"json",
			data:petNo,
			success:function(resp){
				var trType=$(".trType");
				var tdType=$("<td>").attr("class","newtdType");
				var inputType=$("<input>").attr("name","petType").val(resp.petType)
									.attr("type","text").attr("readonly","readonly")
									.attr("style","border-color:rgba(0, 0, 0, 0.1); box-shadow:none;")
									.attr("class","underline form-control text-center")
									.attr("id","newType");
				tdType.append(inputType);
				trType.append(tdType);
				
				var trName=$(".trName");
				var tdName=$("<td>").attr("class","newtdName");
				var inputName=$("<input>").attr("name","petName").val(resp.petName)
											.attr("type","text").attr("readonly","readonly")
											.attr("style","border-color:rgba(0, 0, 0, 0.1); box-shadow:none;")
											.attr("class","underline form-control text-center")
											.attr("id","newName");
				tdName.append(inputName);
				trName.append(tdName);
				
				var trGender=$(".trGender");
				var tdGender=$("<td>").attr("class","newtdGender");
				var inputGender=$("<input>").attr("name","petGender").val(resp.petGender)
											.attr("type","text").attr("readonly","readonly")
											.attr("style","border-color:rgba(0, 0, 0, 0.1); box-shadow:none;")
											.attr("class","underline form-control text-center")
											.attr("id","newGender");
				tdGender.append(inputGender);
				trGender.append(tdGender);
				
				var trBreed=$(".trBreed");
				var tdBreed=$("<td>").attr("class","newtdBreed");
				var inputBreed=$("<input>").attr("name","petBreed").val(resp.petBreed)
											.attr("type","text").attr("readonly","readonly")
											.attr("style","border-color:rgba(0, 0, 0, 0.1); box-shadow:none;")
											.attr("class","underline form-control text-center")
											.attr("id","newBreed");
				tdBreed.append(inputBreed);
				trBreed.append(tdBreed);
				
				var trBirth=$(".trBirth");
				var tdBirth=$("<td>").attr("class","newtdBirth");
				var inputBirth=$("<input>").attr("name","petBirth").val(resp.petBirth)
											.attr("type","text").attr("readonly","readonly")
											.attr("style","border-color:rgba(0, 0, 0, 0.1); box-shadow:none;")
											.attr("class","underline form-control text-center")
											.attr("id","newBirth");
				tdBirth.append(inputBirth);
				trBirth.append(tdBirth);
				
				var trWeight=$(".trWeight");
				var tdWeight=$("<td>").attr("class","newtdWeight");
				var inputWeight=$("<input>").attr("name","petWeight").val(resp.petWeight)
											.attr("type","text").attr("readonly","readonly")
											.attr("style","border-color:rgba(0, 0, 0, 0.1); box-shadow:none;")
											.attr("class","underline form-control text-center")
											.attr("id","newWeight");
				tdWeight.append(inputWeight);
				trWeight.append(tdWeight);
				
				var trNeutralization=$(".trNeutralization");
				var tdNeutralization=$("<td>").attr("class","newtdNeutralization");
				var inputNeutralization=$("<input>").attr("name","petNeutralization").val(resp.petNeutralization)
											.attr("type","text").attr("readonly","readonly")
											.attr("style","border-color:rgba(0, 0, 0, 0.1); box-shadow:none;")
											.attr("class","underline form-control text-center")
											.attr("id","newNeutralization");
				tdNeutralization.append(inputNeutralization);
				trNeutralization.append(tdNeutralization);
			}
		});
		
		//수정버튼 클릭 시 새로운 input창 숨김 및 원래 input창 숨김해제
		$(".edit-btn").click(function(){
			//수정버튼 숨김 및 확인버튼 숨김해제
			$(this).hide();
			$(".confirm-btn").show();
			//숨김
			newtdHide();
			//숨김해제
			tdShow();
			
			//정보 불러와서 찍기
			updateInfo();
			
			//프로필 클릭 시 첨부파일 버튼 실행
			$(".img-circle").click(function(){
				$(".input-file").click();
			});
			
			//프로필 클릭 이벤트
			$(".input-file").change(function(){
				var value = $(this).val();
				if(value.length>0){ //파일 있음
					var formData = new FormData();
					formData.append("files", this.files[0]);
					$.ajax({
						url:"${pageContext.request.contextPath}/upload",
						method:"post",
						data:formData,
						processData:false, 
	                    contentType:false,
	                    success:function(resp){
	                    	$(".img-circle").attr("src",resp);
	                    	var check = resp.lastIndexOf("/"); //경로에서 /위치 찾기
	                    	var newFilesNo = resp.substr(check+1); //fileNo 꺼내기
	                    	$("[name=filesNo]").val(newFilesNo); //하단 파일no input태그에 값 넣기
				        }
					});
				}
			});
		});
		
		
		//목록버튼(돌아가기) 이벤트 - 새로 추가한 첨부파일 db에서 삭제
		$(".list-btn").click(function(){
			var newFilesNo = $("[name=filesNo]").val();
			var originFilesNo = $("#originFilesNo").val();
			if(newFilesNo!=originFilesNo){
				$.ajax({
					url:"${pageContext.request.contextPath}/delete/"+newFilesNo,
					method:"delete",
					data:newFilesNo,
					success:function(resp){
						$("[name=filesNo]").val($("#originFilesNo").val());
						//alert(' 삭제 성공 ! '+resp);
					}
				});
			}
		});
		
		//삭제버튼 이벤트
		$(".delete-confirm").click(function(){
			var petNo = $("[name=petNo]").val();
			$.ajax({
				url:"${pageContext.request.contextPath}/rest/pet_delete/"+petNo,
				method:"delete",
				data:petNo,
				success:function(resp){
					location.href="${pageContext.request.contextPath}/mypage/pet";
					//alert(' 삭제 성공 ! '+resp);
				}
			});
		});
		
	
		//변경된 정보 비동기화 수정처리
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
			var value = $("[name=filesNo]").val();
			$("[name=petProfile]").removeClass("is-valid is-invalid");
			if(value!=null){
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
		
		//수정 폼 이벤트
		$(".update-form").submit(function(e){
			//기본이벤트 차단
			e.preventDefault();
			//필수항목 체크
			$("[name=petName]").blur();
			$("[name=petBreed]").blur();
			$("[name=petWeight]").blur();
			profileCheck();

			//비동기화 데이터 준비
			var filesNo = $("[name=filesNo]").val();
			var petNo = $("[name=petNo]").val();
			var memberId = $("[name=memberId]").val();
			var type=$("[name=petType]:checked").val();
			var name=$("[name=petName]").val();
			var gender=$("[name=petGender]:checked").val();
			var breed=$("[name=petBreed]").val();
			var birth=$("[name=petBirth]").val();
			var weight=$("[name=petWeight]").val();
			var neutralization=$("[name=petNeutralization]:checked").val();
			
			//data에 묶음
			data={
				filesNo:filesNo,
				memberId:memberId,
				petNo:petNo,
				petType:type,
				petName:name,
				petGender:gender,
				petBreed:breed,
				petBirth:birth,
				petWeight:weight,
				petNeutralization:neutralization
			}
			if(check.allValid()){//수정처리
				$.ajax({
					url:"${pageContext.request.contextPath}/rest/pet_edit",
					method:"put",
					async:false,
					contentType:"application/json",
					data:JSON.stringify(data),
					success:function(resp){
						$(".edit-btn").show();
						tdHide();
						newtdShow();
					}
				});
			}
			loadList();
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
		
		//펫 정보 출력
		function loadList(){
			var petNo = $("[name=petNo]").val();
			$.ajax({
				url:"${pageContext.request.contextPath}/rest/pet_selectone/"+petNo,
				method:"get",
				dataType:"json",
				data:petNo,
				success:function(resp){
					$("#newType").val(resp.petType);
					$("#newName").val(resp.petName);
					$("#newGender").val(resp.petGender);
					$("#newBreed").val(resp.petBreed);
					$("#newBirth").val(resp.petBirth);
					$("#newWeight").val(resp.petWeight);
					$("#newNeutralization").val(resp.petNeutralization);
				}
			});
		}
		
		//선택한 정보 불러오기
		function updateInfo(){
			var petNo = $("[name=petNo]").val();
			$.ajax({
				url:"${pageContext.request.contextPath}/rest/pet_selectone/"+petNo,
				method:"get",
				dataType:"json",
				data:petNo,
				success:function(resp){
					$("[name=petName]").val(resp.petName);
					$("[name=petBreed]").val(resp.petBreed);
					$("[name=petBirth]").val(resp.petBirth);
					$("[name=petWeight]").val(resp.petWeight);
					
					//$("input[name='radio의 name'][value='선택할 값']").prop("checked", true);
					$("[name=petType][value="+resp.petType+"]").prop("checked", true);
					$("[name=petGender][value="+resp.petGender+"]").prop("checked", true);
					$("[name=petNeutralization][value="+resp.petNeutralization+"]").prop("checked", true);				
				}
			});
		}

		function tdHide(){
			$(".tdType").hide();
			$(".tdName").hide();
			$(".tdGender").hide();
			$(".tdBreed").hide();
			$(".tdBirth").hide();
			$(".tdWeight").hide();
			$(".tdNeutralization").hide();
			$("i").hide();
			$(".confirm-btn").hide();
		}
		
		function tdShow(){
			//숨김해제
			$(".tdType").show();
			$(".tdName").show();
			$(".tdGender").show();
			$(".tdBreed").show();
			$(".tdBirth").show();
			$(".tdWeight").show();
			$(".tdNeutralization").show();
			$("i").show();
			$(".petProfile").show();
		}
		
		function newtdHide(){
			$(".newtdType").hide();
			$(".newtdName").hide();
			$(".newtdGender").hide();
			$(".newtdBreed").hide();
			$(".newtdBirth").hide();
			$(".newtdWeight").hide();
			$(".newtdNeutralization").hide();
		}
		
		function newtdShow(){
			$(".newtdType").show();
			$(".newtdName").show();
			$(".newtdGender").show();
			$(".newtdBreed").show();
			$(".newtdBirth").show();
			$(".newtdWeight").show();
			$(".newtdNeutralization").show();
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
	        <span style="font-size:17px;">훈련사 전환이 불가능한 회원입니다.</span>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-yellow" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>

	<div class="container-fluid">
        <div class="row mt-80">
            <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-4">
                 <h4 class="text-center">반려동물 상세</h4>
            </div>
        </div>
 
        <div class="row mt-2">
            <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">   
                 <hr>
			 </div>
		</div>
		
		<!-- 이미지 -->
		<div class="row text-center mt-3">
            <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">   
                 <img src="${pageContext.request.contextPath}/download/${filesNo}" width="120" height="120" class="img-circle">
                 <input type="file" style="display:none;" class="input-file form-control" name="petProfile" accept=".jpg, .png, .gif">
			</div>
		</div>
		
		<!-- 폼 시작 -->
		<form class="update-form">
		<div class="row text-center">
            <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-4">   
                 <table class="table">
					<tbody>
						<tr class="table-default trType text-center">
							<th>종류<i class="fa-solid fa-asterisk text-danger"></i></th>
							<td class="tdType">
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
						<tr class="trName text-center">
							<th>이름<i class="fa-solid fa-asterisk text-danger"></i></th>
							<td class="tdName">
	  							<input type="text" name="petName" class="underline form-control" placeholder="이름" required>
								<div class="invalid-feedback">필수 항목입니다.</div>
							</td>
						</tr>
						<tr class="trGender text-center">
							<th>성별<i class="fa-solid fa-asterisk text-danger"></i></th>
							<td class="tdGender">
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
						<tr class="my-2 trBreed text-center">
							<th>품종<i class="fa-solid fa-asterisk text-danger"></i></th>
							<td class="tdBreed">
								<input type="text" name="petBreed" class="underline form-control" placeholder="예) 흰둥이" required>
								<div class="invalid-feedback">필수 항목입니다.</div>
							</td>
						</tr>
						<tr class="my-2 trBirth text-center">
							<th>생일<i class="fa-solid fa-asterisk text-danger"></i></th>
							<td class="tdBirth">
	  							<input type="date" name="petBirth" class="form-control underline" placeholder="생일" required>
							</td>
						</tr>
						<tr class="my-2 trWeight text-center">
							<th>몸무게<i class="fa-solid fa-asterisk text-danger"></i></th>
							<td class="tdWeight">
								<input type="text" name="petWeight" class="underline form-control" placeholder="숫자만 입력해주세요" required>
								<div class="invalid-feedback">숫자만 입력해주세요</div>
							</td>
						</tr>
						<tr class="my-2 trNeutralization text-center">
							<th>중성화<i class="fa-solid fa-asterisk text-danger"></i></th>
							<td class="tdNeutralization">
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
				<!-- 비동기 처리 위한 펫no + 파일no-->
				<input type="hidden" value="${memberId}" name="memberId">
				<input type="hidden" value="${petNo}" name="petNo">
				<input type="hidden" value="${filesNo}" name="filesNo">
				<input type="hidden" value="${filesNo}" id="originFilesNo">
				
	            <button type="button" class="btn btn-blue text-center edit-btn">수정</button>
	            <button type="submit" class="btn btn-blue text-center confirm-btn">확인</button>
	            <a href="${pageContext.request.contextPath}/mypage/pet" class="btn btn-yellow list-btn">목록</a>
				<button type="button" class="btn btn-danger delete-btn"  data-bs-toggle="modal" data-bs-target="#delete-modal">삭제</button>
				<!-- <a href="${pageContext.request.contextPath}/mypage/pet_delete?petNo=${petNo}" class="btn btn-danger delete-btn">삭제</a>-->
			</div>
		</div>
		</form>

		<!-- Modal -->
		<div class="modal fade" id="delete-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		    	<div class="modal-header">
			        <h6 class="modal-title" id="exampleModalLabel">등록한 반려동물이 삭제됩니다.</h6>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		        </div>
	      	    <div class="modal-body">
		        	<span style="font-size:15px;">정말 삭제하시겠습니까?</span>
		        </div>
		      <div class="modal-footer">
		      	<button type="button" class="btn btn-blue delete-confirm">확인</button>
		        <button type="button" class="btn btn-yellow" data-bs-dismiss="modal">취소</button>
		      </div>
		    </div>
		  </div>
		</div>
    </div>
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>