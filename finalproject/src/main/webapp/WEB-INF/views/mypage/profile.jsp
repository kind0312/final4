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
	.btn{
		border-radius: 10px !important;
	}

</style>

<script>
	$(function(){
		detailBtn();
		//버튼 숨김 함수
		function detailBtn(){
			$(".confirm-btn").hide();
			$(".cancel-btn").hide();
			$(".edit-btn").show();
			$(".delete-btn").show();
			$(".new-input").hide();
			$(".origin-table").show();
		}
		//버튼 표시 함수
		function editBtn(){
			$(".edit-btn").hide();
			$(".delete-btn").hide();
			$(".confirm-btn").show();
			$(".cancel-btn").show();
			$(".origin-table").hide();
			$(".new-input").show();
		}
		
		//목록버튼(돌아가기) 이벤트 - 새로 추가한 첨부파일 db에서 삭제
		$(".cancel-btn").click(function(){
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

		//수정버튼 클릭 시 새로운 input창 표시 및 원래 input창 숨김
		$(".edit-btn").click(function(){
			editBtn();
			$(".input-test").show();
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
			//우편번호, 기본/상세 input창 클릭할 경우 다음 주소 api 팝업창 열림
			$("[name=memberPost]").click(function(){
				findAddress();
			});
			$("[name=memberBaseAddress]").click(function(){
				findAddress();
			});

			

		});

		//상태 판정
		check={
				memberImgValid : false,
				memberNameValid : false, memberNameRegex : /^[a-zA-Z가-힣]{2,7}$/,
				memberEmailValid : false, memberEmailRegex : /^[\w\.-]{1,64}@[\w\.-]{1,125}\.\w{2,4}$/,
				emailConfirmValid : false, 
				memberTelValid : false, memberTelRegex : /^01[016789][1-9]\d{6,7}$/,
				memberPostValid : false,
				memberBaseAddressValid : false,
				memberDetailAddressValid : false, memberDetailAddressRegex : /^[가-힣a-zA-Z0-9-_ ]{1,}$/,
				allValid:function(){
					return this.memberImgValid && this.memberNameValid && 
									this.memberEmailValid && this.emailConfirmValid
									&& this.memberTelValid && this.memberPostValid
									&& this.memberBaseAddressValid && this.memberDetailAddressValid;
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
		
		//메일검사
		
		//휴대폰검사
		
		//주소검사
		
		
		
		
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
			//var filesNo = $("[name=filesNo]").val();
			//var petNo = $("[name=petNo]").val();
			//var memberId = $("[name=memberId]").val();
			//var type=$("[name=petType]:checked").val();
			
			//data에 묶음
			data={
				//filesNo:filesNo,
			}
			if(check.allValid()){//수정처리
				$.ajax({
					url:"",
					method:"put",
					//async:false,
					contentType:"application/json",
					data:JSON.stringify(data),
					success:function(resp){

					}
				});
			}
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
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/#">훈련사로 전환</a>
	        </li>
     	 </ul>
    	</div>
  	</div>
</nav>

테스트 출력 : ${member}
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
		<div class="new-input">
			<div class="row mt-4">
				<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
					<div class="row">
						<label>
							이름
							<i class="fa-solid fa-asterisk blue"></i>
						</label>
						<div class="input-group">
							<input type="text" name="memberName" value="${member.memberName}"
								class="form-control underline" required>
		                    <div class="invalid-feedback">이름은 2~7자 한글 또는 대 소문자 작성하세요</div>
	                    </div>
					</div>
				</div>
			</div>
			<div class="row mt-4">
				<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
					<div class="row">
						<label>
							이메일
							<i class="fa-solid fa-asterisk blue"></i>
						</label>
						<div class="input-group">
							<input type="email" name="memberEmail" class="form-control underline w-75" 
								aria-describedby="email-button" value="${member.memberEmail}" required>
							<button class="btn btn-outline-blue w-25" type="button">인증코드발송</button>
		                    <div class="invalid-feedback">형식에 맞게 입력해주세요</div>
						</div>
						<div class="input-group mt-2">
							<input type="text" class="form-control underline w-75" aria-describedby="confirm-button">
							<button class="btn btn-outline-blue w-25" type="button">확 인</button>
		                    <div class="invalid-feedback"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="row mt-4">
				<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
					<div class="row form-group">
						<label>
							휴대폰
							<i class="fa-solid fa-asterisk blue"></i>
						</label>
						<div class="mt-2">
							<input type="tel" name="memberTel" class="form-control underline" value="${member.memberTel}"
							 maxlength="11" placeholder="숫자만 입력해주세요" required>
		                    <div class="invalid-feedback">형식에 맞게 입력해주세요</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row mt-4">
				<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
					<div class="row form-group">
						<label>
							주소
							<i class="fa-solid fa-asterisk blue"></i>
						</label>
						<div class="input-group mt-2">
							<input type="text" name="memberPost" class="form-control underline w-75" maxlength="6"
							 placeholder="우편번호" required aria-describedby="address-button" value="${member.memberPost}" readonly>
							<button class="btn btn-outline-blue w-25" type="button" id="address-button">주소검색</button>
		                    <div class="invalid-feedback">우편번호를 입력해주세요</div>
		                </div>
		                <div class="input-group mt-2">
							<input type="text" name="memberBaseAddress" class="form-control underline w-100" 
								placeholder="기본주소" value="${member.memberBaseAddress}" readonly required>
		                    <div class="invalid-feedback">기본주소를 입력해주세요</div>
						</div>
						<div class="input-group mt-2">
							<input type="text" name="memberDetailAddress" value="${member.memberDetailAddress}"
							 class="form-control underline w-100" placeholder="상세주소" required>
		                    <div class="invalid-feedback">상세주소를 입력해주세요</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 기존 input창 -->
		<div class="row text-center">
            <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-3">
                 <table class="table mb-4 origin-table">
					<tbody>
						 <tr class="table-default"><td colspan="2"></td></tr>
						<tr class="table-default underline-out" height="65px">
							<th class="ps-sm-4">이름</th>
							<td class="ps-sm-4">${member.memberName}</td>
						</tr>
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
						<tr class="table-default" height="65px">
							<th class="ps-sm-4">상세주소</th>
							<td class="ps-sm-4">${member.memberDetailAddress}</td>
						</tr>
					</tbody>						
				</table>
				<!-- 기존 input창 끝 -->
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
					<%-- <!-- 새로운 input창-->
					<table class="table mb-4 new-table">
						<tbody>
							<tr class="table-default"><td colspan="2"></td></tr>
							<tr class="table-default underline-out" height="65px">
								<th class="ps-sm-4">이름</th>
								<td class="ps-sm-4">
									<input type="text" class="underline form-control" value="${member.memberName}" required>
									<div class="invalid-feedback">이름은 2~7자 한글 또는 대 소문자 작성하세요</div>
								</td>
							</tr>
							<tr class="table-default underline-out" height="65px">
								<th class="ps-sm-4">이메일</th>
								<td class="ps-sm-4">
									<input type="text" class="underline form-control w-75" value="${member.memberEmail}" required>
									<button class="btn btn-outline-blue w-25" type="button" id="email-button">인증코드발송</button>
									<div class="invalid-feedback">형식에 맞게 입력해주세요</div>
								</td>
							</tr>
							<tr class="table-default underline-out" height="65px">
								<th class="ps-sm-4">휴대폰</th>
								<c:set var="tel" value="${member.memberTel}"></c:set>
								<td class="ps-sm-4">
									<input type="text" class="underline form-control" value="${member.memberTel}" required>
									<div class="invalid-feedback">형식에 맞게 입력해주세요</div>
								</td>
							</tr>
							<tr class="table-default underline-out" height="65px">
								<th class="ps-sm-4">우편번호</th>
								<td class="ps-sm-4">
									<input type="text" class="underline form-control w-75" value="${member.memberPost}" maxlength="6" required>
									<button class="btn btn-outline-blue w-25" type="button" id="address-button">주소검색</button>
									<div class="invalid-feedback">주소 검색을 클릭해주세요</div>
								</td>
							</tr>
							<tr class="table-default underline-out" height="65px">
								<th class="ps-sm-4">기본주소</th>
								<td class="ps-sm-4">
									<input type="text" class="underline form-control" value="${member.memberBaseAddress}" required>
								</td>
							</tr>
							<tr class="table-default" height="65px">
								<th class="ps-sm-4">상세주소</th>
								<td class="ps-sm-4">
									<input type="text" class="underline form-control" value="${member.memberDetailAddress}" required>
									<div class="invalid-feedback">상세주소를 입력해주세요</div>
								</td>
							</tr>
						</tbody>						
					</table> --%>
					<!-- 비동기화 처리 -->
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>