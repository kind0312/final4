<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="CareRegistrationSuccess" name="title"/>
</jsp:include>
<body>
	
	<div class="container-fluid">
        
        <div class="row text-center mt-150">
            <div class="col-md-10 offset-md-1">
            	<i class="fa-solid fa-circle-check fa-2x" style="color:#FADE81;" ></i> 
            	<h4 class="mt-50">회원가입이 완료되었습니다.</h4>
			</div>
		</div>
		<div class="row mt-50">
			<div class="col-md-10 offset-md-1 text-center">
				<a href="${pageContext.request.contextPath}/#" class="btn btn-blue btn-md">로그인</a><br>
			</div>
		</div>

    </div>
	
</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>