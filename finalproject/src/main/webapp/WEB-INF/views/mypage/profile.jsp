<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="내 정보수정" name="title"/>
</jsp:include>

<style>
	.img-circle{
		border-radius: 70%;
    	border:none;
    	background-color:black;
    	overflow: hidden;
	}
	.form-control{
		display:inline;
	}
	.underline-out{
		border-bottom:#fff;
	}
	table>tbody>tr{
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
		//첫 화면 버튼 숨김
		$(".confirm-btn").hide();
		$(".cancel-btn").hide();

		//수정버튼 클릭 시 새로운 input창 숨김 및 원래 input창 숨김해제
		$(".edit-btn").click(function(){			
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
						url:"http://localhost:8888/upload",
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
					url:"http://localhost:8888/delete/"+newFilesNo,
					method:"delete",
					data:newFilesNo,
					success:function(resp){
						$("[name=filesNo]").val($("#originFilesNo").val());
						//alert(' 삭제 성공 ! '+resp);
					}
				});
			}
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
			console.log(type);
			console.log(gender);
			console.log(neutralization);
			
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
					url:"http://localhost:8888/rest/pet_edit",
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
		
				
		//선택한 정보 불러오기
		function updateInfo(){
			var petNo = $("[name=petNo]").val();
			$.ajax({
				url:"http://localhost:8888/rest/pet_selectone/"+petNo,
				method:"get",
				dataType:"json",
				data:petNo,
				success:function(resp){
					console.log(resp);
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
	          <a class="nav-link mypage-nav" style="color:white;" href="${pageContext.request.contextPath}/mypage/profile">정보수정</a>
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
            <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-4">
                 <h4 class="text-center">내 정보수정</h4>
            </div>
        </div>

		<div class="row text-center mt-4">
            <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">   
                 <img src="http://localhost:8888/download/${filesNo}" width="120" height="120" class="img-circle">
                 <input type="file" style="display:none;" class="input-file form-control" name="petProfile" accept=".jpg, .png, .gif">
			</div>
		</div>
		
		<form class="update-form">
			<div class="row text-center">
	            <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-3">   
	                 <table class="table mb-4">
						<tbody>
							<tr class="table-default"><td colspan="2"></tr>
							<tr class="table-default underline-out" height="65px">
								<th class="ps-sm-4">이메일</th>
								<td class="ps-sm-4">${member.memberEmail}</td>
							</tr>
							<tr class="table-default underline-out" height="65px">
								<th class="ps-sm-4">휴대폰</th>
								<c:set var="tel" value="${member.memberTel}"></c:set>
								<td class="ps-sm-4">
									${fn:substring(tel, 0, 3)}-${fn:substring(tel, 3, 7)}-${fn:substring(tel, 7, 11)}
								</td>
							</tr>
							<tr class="table-default underline-out" height="65px">
								<th class="ps-sm-4">우편번호</th>
								<td class="ps-sm-4">${member.memberPost}</td>
							</tr>
							<tr class="table-default underline-out" height="65px">
								<th class="ps-sm-4">기본주소</th>
								<td class="ps-sm-4">${member.memberBaseAddress}</td>
							</tr>
							<tr class="table-default underline-out" height="65px">
								<th class="ps-sm-4">상세주소</th>
								<td class="ps-sm-4">${member.memberDetailAddress}</td>
							</tr>
							<tr class="table-default" height="65px">
								<th class="ps-sm-4">생일</th>
								<td class="ps-sm-4">${member.memberBirth}</td>
							</tr>
						</tbody>
					</table>
					<!-- 비동기 처리 위한 데이터-->
					<input type="hidden" value="${member.memberId}" name="memberId">
					<input type="hidden" value="${filesNo}" name="filesNo">
					<input type="hidden" value="${filesNo}" id="originFilesNo">
					
		            <button type="button" class="btn btn-blue text-center edit-btn">수정</button>
		            <button type="submit" class="btn btn-blue text-center confirm-btn">확인</button>
		            <a href="${pageContext.request.contextPath}/mypage/profile" class="btn btn-yellow cancel-btn">취소</a>
					<button type="button" class="btn btn-yellow delete-btn">탈퇴</button>
				</div>
			</div>
		</form>
    </div>
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>