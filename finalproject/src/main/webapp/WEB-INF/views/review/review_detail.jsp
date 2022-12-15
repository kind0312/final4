<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="CareReviewWrite" name="title"/>
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
	.note-editor.note-frame{
		border-radius: 10px !important;
	}
	.note-editor.note-frame .note-statusbar .note-resizebar{
		background-color: #81BDF1;
		border-bottom-right-radius: 10px !important;
		border-bottom-left-radius: 10px !important;
	}
	
	.form-control:disabled, .form-control[readonly] {
	  background-color: transparent;
	}
</style>

<body>

	<div class="container-fluid">
		<div class="row text-center mt-100">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-150">
				<h1>후기 상세</h1>
			</div>
		</div>
		<form class="join-form" action="write" method="post" autocomplete="off">
		<div class="row mt-80">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row form-group">
					<label class="label-font-weight">
						제목
					</label>
					<div class="input-group mt-3">
						<input type="hidden" name="trainingNo" class="form-control rounded" value="${reviewDto.trainingNo}" readonly>
						<input type="hidden" name="trainerNo" class="form-control rounded" value="${reviewDto.trainerNo}" readonly>
						<input type="hidden" name="memberId" class="form-control rounded" value="${reviewDto.memberId}" readonly>
						<input type="text" name="reviewTitle" class="form-control rounded" value="${reviewDto.reviewTitle}" readonly>
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
						별점
					</label>
					<div class="input-group mt-3">
						<h4>
							<div class="star-score-edit" data-max="5" data-rate="${reviewDto.reviewGood}"></div>
						</h4>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="row form-group">
					<label class="label-font-weight">
						내용
					</label>
					<div class="input-group mt-3">
						<textarea id="review-content" name="reviewContent" class="form-control rounded" readonly></textarea>
						<div class="valid-feedback"></div>
	                    <div class="invalid-feedback"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-100 mb-5">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 text-center">
				<button type="submit" class="btn btn-blue text-center">수정</button>
            	<a href="${pageContext.request.contextPath}/#" class="btn btn-yellow">목록</a>
            	<a href="${pageContext.request.contextPath}/#" class="btn btn-danger">삭제</a>
			</div>
		</div>
		</form>
	</div>
	
<script>
$(function(){
	
	//후기 작성
	$("[name=reviewContent]").summernote({
		toolbar: [],
		width:600,
		height: 250, // 높이
           minHeight: 250, // 최소 높이
           placeholder:"${reviewDto.reviewContent}", // 도움말
           lang:"ko-KR", // 언어설정
       });
	
	$(".note-icon-bar").hide();
	
	function emtpy() {
		if ($("[name=reviewContent]").summernote('isEmpty')) {
			console.log("비어있음");
			validChecker.applyMotiveValid = false;
		}
		else{
			console.log("내용있음");
			validChecker.applyMotiveValid = true;
		}
     }
	

	$(".star-score-edit").score({
		starColor: "#81BDF1",
        backgroundColor: "transparent", //배경 색상
        editable: false, //수정 가능하도록 설정
        integerOnly:true, //정수만
        zeroAvailable:false,//0 설정 가능 여부
        display:{
            showNumber:true,
            placeLimit: 0,
        },
        send:{
            sendable:false, //전송 가능 설정
            name:"reviewGood", //전송 파라미터
        },
     });
});
</script>

</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>