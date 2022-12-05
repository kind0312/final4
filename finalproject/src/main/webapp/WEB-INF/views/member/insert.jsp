<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="CareRegistration" name="title"/>
</jsp:include>
<body>
	
	<div class="container-fluid">

        <div class="row mt-4">
            <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-4">
                 <h1 class="text-center">회원가입</h1>
            </div>
        </div>
        <form class="join-form" action="insert" method="post" enctype="multipart/form-data">
        <div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row form-group">
					<label>
						아이디
						<i class="fa-solid fa-asterisk blue"></i>
					</label>
					<div class="input-group">
						<input type="text" name="memberId" class="form-control underline w-75" aria-describedby="memberId-button">
	      				<button class="btn btn-outline-blue w-25" type="button" id="memberId-button">중복 확인</button>
						<div class="valid-feedback">올바른 아이디 형식입니다</div>
						<div class="invalid-feedback">영문 소문자로 시작하고 5~20자의 대 소문자, 숫자와 </div>
						<div class="invalid-feedback">특수기호(!@#$-_)만 사용 가능합니다.</div>
					</div>
				</div>
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
						<input type="password" name="memberPw" class="form-control underline">
						<div class="valid-feedback">올바른 비밀번호 형식입니다</div>
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
						<input type="password" id="memberPwRe" class="form-control underline">
						<div class="valid-feedback">비밀번호가 일치합니다</div>
	                    <div class="invalid-feedback">비밀번호가 일치하지 않습니다</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row form-group">
					<label>
						이름
						<i class="fa-solid fa-asterisk blue"></i>
					</label>
					<div class="input-group">
						<input type="text" name="memberName" class="form-control underline">
						<div class="valid-feedback"></div>
	                    <div class="invalid-feedback">이름은 2~7자 한글 또는 대 소문자 작성하세요</div>
                    </div>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row form-group">
					<label>
						이메일
						<i class="fa-solid fa-asterisk blue"></i>
					</label>
					<div class="input-group">
						<input type="email" name="memberEmail" class="form-control underline">
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
					<div class="input-group">
						<input type="tel" name="memberTel" class="form-control underline" maxlength="11" placeholder="숫자만 입력해주세요">
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
					<div class="input-group">
						<input type="text" name="memberPost" class="form-control underline w-100" maxlength="6" placeholder="우편번호">
						<input type="text" name="memberBaseAddress" class="form-control underline w-100" placeholder="기본주소">
						<input type="text" name="memberDetailAddress" class="form-control underline w-100" placeholder="상세주소">
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row form-group">
					<label>
						생년월일
						<i class="fa-solid fa-asterisk blue"></i>
					</label>
					<div class="input-group">
						<input type="date" name="memberBirth" class="form-control underline">
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-6 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row form-group">
					<label>
						성별
						<i class="fa-solid fa-asterisk blue"></i>
					</label>
					<div class="input-group">
						<div class="col-md-6 offset-md-1 text-center">
						<label>남자
						<input type="checkbox" id="genderMan" name="memberGender" class="memberGender" value="남자">
						</label>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<label>여자
						<input type="checkbox" id="genderGirl" name="memberGender" class="memberGender" value="여자">
						</label>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-4 text-center">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<button type="submit" class="btn btn-blue w-75">회원가입</button>
			</div>
		</div>
		</form>
    </div>
    
	<script type="text/javascript">
	$(function(){
		var validChecker = {
			memberIdValid : false, memberIdRegex : /^[a-z][a-zA-Z0-9!@#$-_]{4,19}$/,
			memberPwValid : false, memberPwRegex : /^[a-zA-Z0-9!@#$]{8,16}$/,
			memberPwReValid : false,
			memberNameValid : false, memberNameRegex : /^[a-zA-Z가-힣]{2,7}$/,
			isAllValid : function(){
			return this.memberIdValid && this.memberPwValid && this.memberPwReValid && this.memberNameValid;
			}
		};
		
		$("[name]").blur(function(){ 
            var name = $(this).attr("name");
            var value = $(this).val();
            var regex = validChecker[name+"Regex"];
            if(regex.test(value)) {
                //+비동기통신(중복검사)
                validChecker[name+"Valid"] = true;
                $(this).removeClass("is-valid is-invalid").addClass("is-valid");
            }
            else {
                validChecker[name+"Valid"] = false;
                $(this).removeClass("is-valid is-invalid").addClass("is-invalid");
            }
        });
		
		$("#memberPwRe").blur(function(){
            var pwRe = $(this).val();
            var pw = $("[name=memberPw]").val();

            if(pwRe == pw){
                validChecker.memberPwReValid = true;
                $(this).removeClass("is-valid is-invalid").addClass("is-valid");
            }
            else {
                validChecker.memberPwReValid = false;
                $(this).removeClass("is-valid is-invalid").addClass("is-invalid");
            }
        });
		
		$(".join-form").submit(function(e){
	        e.preventDefault();
	
	        $(this).find("input, textarea, select").blur();//모든 입력창
// 	        $(this).find("[name]").blur();//name을 가진 입력창
	
	        if(validChecker.isAllValid()){
	            this.submit();//전송
	        }
	    });
	});
	</script>
</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>