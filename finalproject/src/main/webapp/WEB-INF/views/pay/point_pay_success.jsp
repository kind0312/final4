<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="결제완료" name="title"/>
</jsp:include>

<body>
	
	<div class="container-fluid">
        
        <div class="row text-center mt-150">
            <div class="col-md-6 offset-md-3">
            	<i class="fa-solid fa-circle-check fa-2x" style="color:#FADE81;" ></i> 
            	<h4 class="mt-50">포인트 구매가 완료되었습니다.</h4>
			</div>
		</div>
		<div class="row mt-50">
			<div class="col-md-6 offset-md-3 text-center">
				<a href="${pageContext.request.contextPath}/mypage/point_list" class="btn btn-blue btn-md">구매내역 보기</a><br>
            	<a href="${pageContext.request.contextPath}/" class="btn btn-yellow btn-md mt-3">메인으로 이동</a>
			</div>
		</div>

    </div>
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>