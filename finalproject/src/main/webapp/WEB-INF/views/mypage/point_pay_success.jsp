<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="결제완료" name="title"/>
</jsp:include>

<style>
	.mt-180{
		margin-top:180px;
	}
	.mt-50{
		margin-top:50px;
	}
</style>

<body>
	
	<div class="container-fluid">
        
        <div class="row text-center mt-180">
            <div class="col-md-6 offset-md-3">
            	<i class="fa-solid fa-circle-check fa-2x" style="color:#FADE81;" ></i> 
            	<h4 class="mt-50">포인트 구매가 완료되었습니다.</h4>
			</div>
			<div class="mt-50">
				<a href="point_list" class="btn btn-blue">구매내역 보기</a>
            	<a href="/" class="btn btn-yellow">메인으로 이동</a>
			</div>
		</div>

    </div>
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>