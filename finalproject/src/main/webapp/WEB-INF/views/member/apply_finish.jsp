<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="CareTrainerApplyFinish" name="title"/>
</jsp:include>

<body>

	<div class="container-fluid" style="height:100%;">
		<div class="row text-center mt-100">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-150">
				<h1><i class="fa-solid fa-circle-check yellow"></i></h1>
			</div>
		</div>
		<div class="row mt-100 text-center">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<h1>
				지원이 완료되었습니다.
			</h1>
			<h3>
				<small class="text-muted">(면접 일자 및 합격여부는 추후 개별 통보예정)</small>
			</h3>
			</div>
		</div>
		<div class="row mt-100 mb-5">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 text-center">
			<a href="${pageContext.request.contextPath}/" class="btn btn-blue btn-md">홈으로</a>
			</div>
		</div>
	</div>

</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>