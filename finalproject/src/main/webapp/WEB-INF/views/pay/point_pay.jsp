<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="포인트 구매" name="title"/>
</jsp:include>

<style>
	.kakaoPayBtn{
		border:none;
		background-color:#fff;
	}
</style>

<body>
	
	<div class="container-fluid">

        <div class="row mt-120">
            <div class="col-md-6 offset-md-3">
            	<table class="table table-hover">
					  <tbody>
					  		<tr>
					  			<th colspan="2"><h3><span class="blue">${item.itemPrice}</span> 포인트를 구매합니다</h3></th>
					  		</tr>
						    <tr>
							      <th scope="col">
							      		<p>현재 내 포인트</p>
							      		<p>충전 예정 포인트</p>
							      </th>
							      <td scope="col" class="text-end">
							      		<p>?P</p>
							      		<p>(+) <span>${item.itemPrice}</span>P</p>
							      </td>
						    </tr>
					  </tbody>
				</table>
			</div>	
		</div>
		
		<div class="row mt-4">
         	<div class="col-md-6 offset-md-3">
				<span>총 결제 금액</span>
				<span class="blue blue-bolder float-end">${item.itemPrice}원</span>
			</div>
      	</div>
      	
      	<!-- 카카오페이 결제 위한 폼 데이터 준비 및 전송 -->
      	<form action="${pageContext.request.contextPath}/pay/point_pay" method="post">
	      	<div class="row mt-4">
	         	<div class="col-md-6 offset-md-3 text-center">
	         		<button type="submit" class="kakaoPayBtn mb-5"><img src="${pageContext.request.contextPath}/image/kakaopaylogo.png" width="80" height="35" alt=""></button>
					<input type="hidden" value="${item.itemName}" name="item_name">
					<input type="hidden" value="${item.itemPrice}" name="total_amount">
				</div>
	      	</div>
        </form>

    </div>
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>