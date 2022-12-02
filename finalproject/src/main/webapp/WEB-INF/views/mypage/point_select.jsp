<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="포인트 구매" name="title"/>
</jsp:include>

<body>
	
	<div class="container-fluid">
        <div class="row mt-4">
            <div class="col-md-10 offset-md-1">
                 <h1>포인트 선택</h1>
                 <p>포인트는 현금처럼 이용할 수 있으며 1포인트는 1원과 동일한 가치를 가집니다</p>
            </div>
        </div>

		<div class="row mt-4">
            <div class="col-md-10 offset-md-1">
            	<form action="/mypage/point_pay" method="get">
		            <c:forEach var="item" items="${item}">
		            	<span class="badge bg-Light" data-value="${item.itemNo}" style="width:150; height:150; font-size:20px;">${item.itemName}</span>
		            </c:forEach>
		            <br>
		            <input type="hidden" value="50000" name="itemPrice">
		            <button class="btn btn-primary">구매</button>
		            <a href="point_list" class="btn btn-warning">취소</a>
	            </form>
            </div>
        </div>
        
        <br><br>
        출력 테스트 입력 : ${item}
    </div>

</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>