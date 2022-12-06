<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="CareRegistration" name="title"/>
</jsp:include>
<style>
	.form-check-input.is-valid:checked{
		background-color:#4582ec;
		border-color:#4582ec;
	}
</style>

<body>
	
	<div class="container-fluid">

        <div class="row mt-100">
            <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-4">
                 <h1 class="text-center">회원가입</h1>
            </div>
        </div>
        <form class="join-form" action="insert" method="post" enctype="multipart/form-data" autocomplete="off">
        <div class="row mt-4 mb-5">
        	<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 text-center">
        		<img src="${pageContext.request.contextPath}/image/profile_basic.jpg" 
                 		width="120" height="120" class="img-circle">
                <input type="file" style="display:none;" class="form-control input-file" name="memberImg" accept=".jpg, .png, .gif">
        	</div>
        </div>
        <div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row form-group">
					<label>
						아이디
						<i class="fa-solid fa-asterisk blue"></i>
					</label>
					<div class="input-group">
						<input type="text" name="memberId" class="form-control underline w-75 check-input" required aria-describedby="memberId-button">
	      				<button class="btn btn-outline-blue w-25" type="button" id="memberId-button">중복확인</button>
						<div class="valid-feedback"></div>
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
						<input type="password" name="memberPw" class="form-control underline check-input" required>
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
						<input type="password" id="memberPwRe" class="form-control underline" required>
						<div class="valid-feedback"></div>
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
						<input type="text" name="memberName" class="form-control underline check-input" required>
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
						<input type="email" name="memberEmail" class="form-control underline check-input" required>
						<div class="valid-feedback"></div>
	                    <div class="invalid-feedback">형식에 맞게 입력해주세요</div>
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
						<input type="tel" name="memberTel" class="form-control underline check-input" maxlength="11" placeholder="숫자만 입력해주세요" required>
						<div class="valid-feedback"></div>
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
					<div class="input-group">
						<input type="text" name="memberPost" class="form-control underline w-75 check-input" maxlength="6"
						 placeholder="우편번호" required aria-describedby="address-button">
						<button class="btn btn-outline-blue w-25" type="button" id="address-button">주소검색</button>
						<div class="valid-feedback"></div>
	                    <div class="invalid-feedback">우편번호를 입력해주세요</div>
	                </div>
	                <div class="input-group">
						<input type="text" name="memberBaseAddress" class="form-control underline w-100 check-input" placeholder="기본주소" required>
						<div class="valid-feedback"></div>
	                    <div class="invalid-feedback">기본주소를 입력해주세요</div>
					</div>
					<div class="input-group">
						<input type="text" name="memberDetailAddress" class="form-control underline w-100 check-input" placeholder="상세주소" required>
						<div class="valid-feedback"></div>
	                    <div class="invalid-feedback">상세주소를 입력해주세요</div>
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
						<input type="text" name="memberBirth" class="form-control underline single-date-picker" required>
						<div class="valid-feedback"></div>
	                    <div class="invalid-feedback">생년월일을 입력해주세요</div>
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
						<input class="form-check-input mx-1" type="radio" name="memberGender" value="남자" id="genderMan" required>
				        <label class="label" for="genderMan">
				        	<span>남자</span>
				        </label>
				        &nbsp;&nbsp;&nbsp;&nbsp;
					    <input class="form-check-input mx-1" type="radio" name="memberGender" value="여자" id="genderGirl" required>
				        <label class="label" for="genderGirl">
				        	<span>여자</span>
	        			</label>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-4 mb-5 text-center">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<button type="submit" class="btn btn-blue w-75">회원가입</button>
			</div>
		</div>
		</form>
    </div>
	<script type="text/javascript">
	$(function(){
		//프로필 클릭 시 첨부파일 버튼 실행
		$(".img-circle").click(function(){
			$(".input-file").click();
		});
		
		//형식 검사를 위한 객체 생성
		var validChecker = {
			memberIdValid : false, memberIdRegex : /^[a-z][a-zA-Z0-9!@#$-_]{4,19}$/,
			memberPwValid : false, memberPwRegex : /^[a-zA-Z0-9!@#$]{8,16}$/,
			memberPwReValid : false,
			memberNameValid : false, memberNameRegex : /^[a-zA-Z가-힣]{2,7}$/,
			memberEmailValid : false, memberEmailRegex : /^[\w\.-]{1,64}@[\w\.-]{1,125}\.\w{2,4}$/,
			memberTelValid : false, memberTelRegex : /^01[016789][1-9]\d{6,7}$/,
			memberPostValid : false, memberPostRegex : /^\d{5,6}$/,
			memberBaseAddressValid : false, memberBaseAddressRegex : /^[가-힣a-zA-Z0-9-_ ]{1,}$/,
			memberDetailAddressValid : false, memberDetailAddressRegex : /^[가-힣a-zA-Z0-9-_ ]{1,}$/,
			memberBirthValid : false, memberBirthRegex : /^(19|20)\d\d([- /.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])$/,
			memberGenderValid : false,
			isAllValid : function(){
			return this.memberIdValid && this.memberPwValid && this.memberPwReValid && this.memberNameValid
			&& this.memberEmailValid && this.memberTelValid && this.memberPostValid && this.memberBaseAddressValid
			this.memberDetailAddressValid && this.memberBirthValid && this.memberGenderValid;
			}
		};
		
		//형식 검사
		$(".check-input").blur(function(){ 
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
		
		//비밀번호 재확인
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
		
		//주소 검색
		$("#address-button").click(findAddress);
		
		//date-picker
		new Lightpick({
            //field는 datepicker 적용 대상을 설정하는 공간
            field:document.querySelector(".single-date-picker"),
            //format은 선택한 날짜의 적용 형식을 설정
            format:"YYYY-MM-DD",

            //(+옵션) 미래/과거를 선택하지 못하도록 설정(minDate, maxDate)
            // minDate:"",//과거를 선택 못하게 할때 설정
            maxDate:moment(),//미래를 선택 못하게 할때 설정, moment에 아무것도 안적으면 sysdate 느낌이다.

            //(+옵션) 표시되는 달의 개수를 지정
            numberOfMonths:1,

        });
		
		//생일 검사
		$("[name=memberBirth]").change(function(){
			var birth = $("[name=memberBirth]").val();
// 			console.log(birth);
            var regex = validChecker.memberBirthRegex;
//             console.log(regex.test(birth));
            if(regex.test(birth)) {
            	validChecker.memberBirthValid = true;
                $(this).removeClass("is-valid is-invalid").addClass("is-valid");
            }
            else {
            	validChecker.memberBirthValid = false;
                $(this).removeClass("is-valid is-invalid").addClass("is-invalid");
            }
		});
		
		//성별 검사
		$("[name=memberGender]").click(function(){
			var check = $(".form-check-input:checked").val();
			if(check){
                validChecker.memberGenderValid = true;
                $("#genderMan").removeClass("is-valid is-invalid");
                $("#genderGirl").removeClass("is-valid is-invalid");
                $(this).addClass("is-valid");
            }
		});
		
		$(".join-form").submit(function(e){
	        e.preventDefault();
	
// 	        $(this).find("input, textarea, select").blur();//모든 입력창
	        $(this).find("[name]").blur();
			
			console.log(validChecker.memberBirthValid);
	      	console.log(validChecker.memberGenderValid);
	        if(validChecker.isAllValid()){
	            this.submit();//전송
	        }
	    });
	});
	</script>
</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>