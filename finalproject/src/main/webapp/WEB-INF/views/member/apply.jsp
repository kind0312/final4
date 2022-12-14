<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="CareTrainerApply" name="title"/>
</jsp:include>
<style>
	.form-check-input.is-valid:checked{
		background-color:#4582ec;
		border-color:#4582ec;
	}
	
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
	
	.note-editor.note-frame{
		border-radius: 10px !important;
	}
	.note-editor.note-frame .note-statusbar .note-resizebar{
		background-color: #81BDF1;
		border-bottom-right-radius: 10px !important;
		border-bottom-left-radius: 10px !important;
	}

</style>

<body>
	
	<div class="container-fluid">

        <div class="row mt-100">
            <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-4">
                 <h1 class="text-center">지원서 작성하기</h1>
            </div>
        </div>
        <form class="join-form" action="apply" method="post" autocomplete="off">
        <div class="row mt-80">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<input type="hidden" name="memberId" value="${memberDto.memberId}" readonly>
				<div class="form-group">
					<label class="label-font-weight">
						활동 가능한 시간대
						<i class="fa-solid fa-asterisk blue"></i>
					</label>
					<div class="form-check mt-3">
						<input class="form-check-input" type="checkbox" name="applyActive" value="오전 08:00 ~ 오후 10:00" id="allable">
						<label for="allable">
							풀 타임(오전 08:00 ~ 오후 10:00)
						</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" name="applyActive" value="오전 08:00 ~ 오후 12:00" id="morningTime">
						<label for="morningTime">
							오전 타임(오전 08:00 ~ 오후 12:00)
						</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" name="applyActive" value="오후 12:00 ~ 오후 06:00" id="afternoonTime">
						<label for="afternoonTime">
							오후 타임(오후 12:00 ~ 오후 06:00)
						</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" name="applyActive" value="오후 06:00 ~ 오후 10:00" id="eveningTime">
						<label for="eveningTime">
							저녁 타임(오후 06:00 ~ 오후 10:00)
						</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" name="applyActive" value="time" id="inputTime">
						<label for="inputTime">
							직접 입력
							<input type="text" class="underline" id="inputTime-text" placeholder="예)오전 00:00 ~ 오후 00:00">
						</label>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row form-group">
					<label class="label-font-weight">
						지원동기
						<i class="fa-solid fa-asterisk blue"></i>
					</label>
					<div class="input-group mt-3">
						<textarea id="applyMotive" name="applyMotive" class="form-control rounded summernote-font"></textarea>
						<div class="valid-feedback"></div>
	                    <div class="invalid-feedback"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row form-group">
					<label class="label-font-weight">
						반려동물관련 자격증
					</label>
					<div class="input-group mt-3">
						<input type="text" name="applyLicense" class="form-control underline">
						<div class="valid-feedback"></div>
	                    <div class="invalid-feedback"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-6 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row form-group">
					<label class="label-font-weight">
						흡연여부
						<i class="fa-solid fa-asterisk blue"></i>
						<small class="text-muted">
							직업 특성상 흡연을 하시는 경우, 펫시터 활동이 어려울 수 있습니다
						</small>
					</label>
					<div class="input-group mt-3">
						<div class="col-md-6 offset-md-1 text-center">
						<input class="form-check-input mx-1" type="radio" name="applySmoke" value="Y" id="smokeYes">
				        <label class="label" for="smokeYes">
				        	<span>예</span>
				        </label>
				        &nbsp;&nbsp;&nbsp;&nbsp;
					    <input class="form-check-input mx-1" type="radio" name="applySmoke" value="N" id="smokeNo">
				        <label class="label" for="smokeNo">
				        	<span>아니오</span>
	        			</label>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-5 mb-5 text-center">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<button type="submit" id="insert-btn" class="btn btn-blue w-75">지원하기</button>
			</div>
		</div>
		</form>
    </div>
	<script type="text/javascript">
	$(function(){
		
		//형식 검사를 위한 객체 생성
		var validChecker = {
			applyActiveValid : false,
			applyMotiveValid : false,
			applySmokeValid : false,
			isAllValid : function(){
			return this.applyActiveValid && this.applyMotiveValid && this.applySmokeValid;
			}
		};
		
		//활동시간 선택
		$("[name=applyActive]").click(function(){
			var active = $("[name=applyActive]:checked");
			var count = $("[name=applyActive]:checked").length;
			if($(this).prop("checked")){
				$("[name=applyActive]:checked").prop("checked", false);
				$(this).prop("checked", true);
			}

			if(active.is(":checked")){
                validChecker.applyActiveValid = true;
            }
            else {
                validChecker.applyActiveValid = false;
            }
		});
		
		$("#inputTime-text").on("input", function(){
			var time = $(this).val();
			$("#inputTime").attr("value", time);
		});
		
		//지원 동기
		$("[name=applyMotive]").summernote({
			toolbar: [],
			width:600,
			height: 250, // 높이
            minHeight: 250, // 최소 높이
            placeholder:"지원동기에 대해 적어주세요", // 도움말
            lang:"ko-KR", // 언어설정
            fontFamily:"Noto Sans KR",
        });
		
		$(".note-icon-bar").hide();
		
		function emtpy() {
            if ($("[name=applyMotive]").summernote('isEmpty')) {
                validChecker.applyMotiveValid = false;
            }
            else{
            	validChecker.applyMotiveValid = true;
            }
        }
		
		//흡연 여부
		$("[name=applySmoke]").click(function(){
			var check = $("[name=applySmoke]:checked").val();
			if(check){
                validChecker.applySmokeValid = true;
                $("#smokeYes").removeClass("is-valid is-invalid");
                $("#smokeNo").removeClass("is-valid is-invalid");
                $(this).addClass("is-valid");
            }
		});
		
		$(".join-form").submit(function(e){
	        e.preventDefault();
	        
	        emtpy();

	        if(validChecker.isAllValid()){
	        	this.submit();//전송
	        }
	    });
	});
	</script>
</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>