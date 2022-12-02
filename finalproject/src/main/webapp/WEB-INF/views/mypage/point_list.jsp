<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="포인트 내역" name="title"/>
</jsp:include>

<body>
	<div class="container-fluid">
		<div class="p-4 navbar-dark bg-primary">
	        <h1>마이페이지</h1>
	    </div>
    </div>

	<div class="container-fluid">
        <div class="row mt-4">
            <div class="col-md-8 offset-md-2">
                 <h1>포인트 내역</h1>
            </div>
        </div>
		
		<div class="row mt-4">
            <div class="col-md-8 offset-md-2">

                 보유포인트 : ?
                 <a href="point_select" class="btn btn-blue">포인트 구매</a>
                 <br>
                 
                 <table class="table table-hover">
					  <thead>
					    <tr>
					      <th scope="col">날짜</th>
					      <th scope="col">사유/내용</th>
					      <th scope="col">포인트</th>
					    </tr>
					  </thead>
					  <tbody>
					    <c:forEach var="point" items="${point}">
                 			<tr class="table-default">
			                 	<td>${point.pointDate}</td>
			                 	<td>${point.pointStatus}</td>
			                 	<td>${point.pointPrice}</td>
			                </tr>
			            </c:forEach>
					</tbody>
                 </table>
			 </div>

             <br><br>
             테스트 출력 : ${point}
        </div>
    </div>

</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>