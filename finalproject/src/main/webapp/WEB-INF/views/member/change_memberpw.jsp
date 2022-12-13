<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="CareChangePw" name="title"/>
</jsp:include>

<body>

	<div class="container-fluid" style="height:100%;">
	<form class="join-form" action="change_memberpw" method="post" autocomplete="off">
		<div class="row text-center mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-150">
				<h1>비밀번호 재설정</h1>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row form-group">
					<label>
						비밀번호
						<i class="fa-solid fa-asterisk blue"></i>
					</label>
					<div class="input-group">
						<input type="hidden" name="memberId" value="${memberDto.memberId}" readonly>
						<input type="password" name="memberPw" class="form-control" required>
						<div class="valid-feedback"></div>
	                    <div class="invalid-feedback">비밀번호는 8~16자 영문 대 소문자, 숫자, </div>
	                    <div class="invalid-feedback">특수문자(!@#$)를 사용하세요.</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row form-group">
					<label>
						비밀번호 재확인
						<i class="fa-solid fa-asterisk blue"></i>
					</label>
					<div class="input-group">
						<input type="password" id="memberPwRe" class="form-control" required>
						<div class="valid-feedback"></div>
	                    <div class="invalid-feedback">비밀번호가 일치하지 않습니다</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-5">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 text-center">
			<button type="submit" class="btn btn-blue btn-md">확인</button>
			</div>
		</div>
	</form>
	</div>
	
	<script>
	
	$(function(){
		
		var checkPw = {
			memberPwValid : false, memberPwRegex : /^[a-zA-Z0-9!@#$]{8,16}$/,
			memberPwReValid : false,
			pwValid : function(){
				return this.memberPwValid && this.memberPwReValid;
				}
		};
		
		//비밀번호 형식검사
		$("[name=memberPw]").blur(function(){ 
			var pw = $(this).val();
			var regex = checkPw.memberPwRegex;
            if(regex.test(pw)){
            	checkPw.memberPwValid = true;
                $(this).removeClass("is-valid is-invalid").addClass("is-valid");
            }
            else {
            	checkPw.memberPwValid = false;
                $(this).removeClass("is-valid is-invalid").addClass("is-invalid");
            }
        });
		
		//비밀번호 재확인
		$("#memberPwRe").blur(function(){
            var pwRe = $(this).val();
            var pw = $("[name=memberPw]").val();

            if(pwRe == pw){
            	checkPw.memberPwReValid = true;
                $(this).removeClass("is-valid is-invalid").addClass("is-valid");
            }
            else {
            	checkPw.memberPwReValid = false;
                $(this).removeClass("is-valid is-invalid").addClass("is-invalid");
            }
        });
		
		$(".join-form").submit(function(e){
	        e.preventDefault();
			
	        if(checkPw.pwValid()){
	        	this.submit();//전송
	        }
	    });
	});
	
	</script>

</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>