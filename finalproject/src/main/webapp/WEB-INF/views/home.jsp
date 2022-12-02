<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="CareMainPage" name="title"/>
</jsp:include>

<body>

	<div class="container-fluid">

        <div class="row mt-4">
            <div class="col-md-10 offset-md-1">
              <div class=" p-4 navbar-dark bg-primary rounded">
                 <h1 class="text-center">메인</h1>
                 <h2> 내용</h2>
              </div>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-10 offset-md-1">
                 <h1 class="text-center">내용</h1>
            </div>
        </div>
        
    </div>

</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>