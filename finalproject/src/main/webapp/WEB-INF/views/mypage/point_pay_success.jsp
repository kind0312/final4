<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="포인트 결제완료" name="title"/>
</jsp:include>

<body>
	
	<div class="container-fluid">
	
		<div class="row mt-4 text-center">
            <div class="col-md-6 offset-md-3">
            	<h1>카카오페이 결제완료화면(나중에 삭제)</h1>
            </div>
        </div>
        
        <div class="row mt-4  text-center">
            <div class="col-md-6 offset-md-3">
            	<i class="fa-solid fa-circle-check fa-2x" style="color:#FADE81;" ></i> 
            	<h3>포인트 구매가 완료되었습니다.</h3>
            	<a href="point_list" class="btn btn-primary">구매내역 보기</a>
            	<a href="/" class="btn btn-warning">메인으로 이동</a>
			</div>
		</div>

    </div>
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>