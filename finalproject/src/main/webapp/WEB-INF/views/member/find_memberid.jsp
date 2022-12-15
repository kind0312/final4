<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="CareFindId" name="title"/>
</jsp:include>

<body>

	<div class="container-fluid">
	<form class="join-form" action="find_memberid" method="post" autocomplete="off">
		<div class="row text-center mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-150">
				<h1>ID 찾기</h1>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2" align="center">
			<input type="text" name="memberName" class="form-control rounded" placeholder="이름" style="width:400px;">
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2" align="center">
			<input type="tel" name="memberTel" class="form-control rounded" placeholder="휴대전화" maxlength="11" style="width:400px;">
			<div class="invalid-feedback" align="left" style="width:400px;">숫자만 입력해주세요</div>
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
		var check = {
				memberNameValid : false, memberNameRegex : /^[a-zA-Z가-힣]{2,7}$/,
				memberTelValid : false, memberTelRegex : /^01[016789][1-9]\d{6,7}$/,
				checkValid : function(){
					return this.memberNameValid && this.memberTelValid;
					}
		};
		
		$("[name]").blur(function(){ 
			var name = $(this).attr("name");
            var value = $(this).val();
            var regex = check[name+"Regex"];
            if(regex.test(value)) {
            	check[name+"Valid"] = true;
                $(this).removeClass("is-valid is-invalid").addClass("is-valid");
            }
            else {
            	check[name+"Valid"] = false;
                $(this).removeClass("is-valid is-invalid").addClass("is-invalid");
            }
        });
		
		$(".join-form").submit(function(e){
	        e.preventDefault();
			
	        if(check.checkValid()){
	        	this.submit();//전송
	        }
	    });
	});
	
	</script>

</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>