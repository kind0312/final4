<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="포인트 구매" name="title"/>
</jsp:include>


<body>
	
	<div class="container-fluid">

        <div class="row mt-150">
            <div class="col-md-6 offset-md-3">
            	<table class="table table-hover">
					  <tbody>
					  		<tr>
					  			<th colspan="2"><h3><span class="blue">${itemPrice}</span> 포인트를 구매합니다</h3></th>
					  		</tr>
						    <tr>
							      <th scope="col">
							      		<p>현재 내 포인트</p>
							      		<p>충전 예정 포인트</p>
							      </th>
							      <td scope="col" class="text-end">
							      		<p>?P</p>
							      		<p>(+) <span>${itemPrice}</span>P</p>
							      </td>
						    </tr>
					  </tbody>
				</table>
			</div>	
		</div>
		
		<div class="row mt-4">
         	<div class="col-md-6 offset-md-3">
				<span>총 결제 금액</span>
				<span class="blue blue-bolder float-end">${itemPrice}원</span>
			</div>
      	</div>
      	
      	<div class="row mt-4">
         	<div class="col-md-6 offset-md-3 text-center">
				<img src="${pageContext.request.contextPath}/image/kakaopaylogo.png" width="80" height="35">
			</div>
      	</div>
        

    </div>
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>