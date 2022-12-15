<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="CareFindPw" name="title"/>
</jsp:include>
<style>
    .able ~ .possible {
    	display: block;
	}
	
	.disable ~ .impossible {
		display: block;
	}
    
	.possible {
		display: none;
		width: 100%;
		margin-top: 0.25rem;
		font-size: 0.875em;
		color: #81BDF1;
	}
	
	.impossible {
		display: none;
		width: 100%;
		margin-top: 0.25rem;
		font-size: 0.875em;
		color: #d9534f;
	}
	.form-control:disabled, .form-control[readonly] {
	  background-color: #e5f1fc;
	  opacity: 1;
	}
	div.input-group{
		padding:0;
	}
</style>

<body>

	<div class="container-fluid">
	<form class="join-form" action="find_memberpw" method="post" autocomplete="off">
		<div class="row text-center mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-150">
				<h1>비밀번호 찾기</h1>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2"  align="center" >
			<input type="text" name="memberId" class="form-control rounded" placeholder="아이디" style="width:400px;">
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2" align="center">
				<div class="row form-group" style="width:400px;">
					<div class="input-group">
						<input type="email" name="memberEmail" class="form-control rounded w-70" placeholder="이메일" aria-describedby="email-button" required>
						<button class="btn btn-outline-blue w-30" type="button" id="email-button">인증 코드</button>
						<div class="valid-feedback"></div>
	                    <div class="invalid-feedback" align="left">형식에 맞게 입력해주세요</div>
					</div>
					<div class="input-group mt-2">
						<input type="text" id="confirm-input" class="form-control underline w-70" aria-describedby="confirm-button">
						<button class="btn btn-outline-blue w-30" type="button" id="confirm-button">확 인</button>
						<div class="confirmResult" align="left"></div>
						<div class="valid-feedback"></div>
	                    <div class="invalid-feedback"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-5 mb-5">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 text-center">
			<button type="submit" class="btn btn-blue btn-md">확인</button>
			</div>
		</div>
	</form>
	</div>

	<script>
	$(function(){
		
		var checkEmail = {
			memberIdValid : false, memberIdRegex : /^[a-z][a-zA-Z0-9-_]{4,19}$/,
			memberEmailValid : false, memberEmailRegex : /^[\w\.-]{1,64}@[\w\.-]{1,125}\.\w{2,4}$/,
			emailConfirmValid : false,
			emailValid : function(){
				return this.memberIdValid && this.memberEmailValid && this.emailConfirmValid;
				}
		};
		
		//아이디 형식
		$("[name=memberId]").blur(function(){ 
			var id = $(this).val();
			var regex = checkEmail.memberIdRegex;
            if(regex.test(id)){
            	checkEmail.memberIdValid = true;
                $(this).removeClass("is-valid is-invalid").addClass("is-valid");
            }
            else {
            	checkEmail.memberIdValid = false;
                $(this).removeClass("is-valid is-invalid").addClass("is-invalid");
            }
        });
		
		//이메일 형식
		$("[name=memberEmail]").blur(function(){ 
			var email = $(this).val();
			var regex = checkEmail.memberEmailRegex;
            if(regex.test(email)){
            	checkEmail.memberEmailValid = true;
                $(this).removeClass("is-valid is-invalid").addClass("is-valid");
            }
            else {
            	checkEmail.memberEmailValid = false;
                $(this).removeClass("is-valid is-invalid").addClass("is-invalid");
            }
        });
		
		//이메일 인증
		
		var confirmbtn = $("#confirm-button");
		confirmbtn.prop("disabled", true);
		
		$("#email-button").click(function(){
			var email = $("[name=memberEmail]").val();
			if(email.length == 0) return;
			
			var emailbtn = $(this);
			emailbtn.prop("disabled", true);
			
			$.ajax({
				url:"${pageContext.request.contextPath}/rest/member/emailcert",
				method:"post",
				data:{emailcertEmail:email},
				success:function(resp){
					//성공했다면 메일은 전송되었다고 볼 수 있다.
					console.log("메일 전송 완료");
					emailbtn.prop("disabled", false);
					confirmbtn.prop("disabled", false);
					
					$("#confirm-button").click(function(){
						var serial = $("#confirm-input").val();
						if(serial.length != 6) return;//6자리 아니면 검사 안함
						
						$.ajax({
							url:"${pageContext.request.contextPath}/rest/member/confirmcert",
							method:"post",
							data:{
								emailcertEmail:email,
								emailcertSerial:serial
							},
							success:function(resp){
								console.log(resp);
								if(resp){
									$("[name=memberEmail]").attr("readonly", "readonly");
									$("#confirm-input").attr("readonly", "readonly");
									checkEmail.emailConfirmValid = true;
									emailbtn.prop("disabled", true);
									confirmbtn.prop("disabled", true);
									$(".confirmResult").removeClass("possible impossible").addClass("possible").text("인증이 완료되었습니다");
                               		$("#confirm-input").removeClass("is-valid is-invalid able disable").addClass("is-valid").addClass("able");
								}
								else{
									$(".confirmResult").removeClass("possible impossible").addClass("impossible").text("인증번호 다시 확인해주세요");
                               		$("#confirm-input").removeClass("is-valid is-invalid able disable").addClass("is-invalid").addClass("disable");
								}
							}
						});
					});
				}
			});
		});
		
		$(".join-form").submit(function(e){
	        e.preventDefault();
			
	        if(checkEmail.emailValid()){
	        	this.submit();//전송
	        }
	    });
	});
	
	</script>
</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>