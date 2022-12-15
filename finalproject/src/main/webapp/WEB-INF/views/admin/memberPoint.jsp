<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="포인트 이용내역" name="title"/>
</jsp:include>

<style>
	
	.nav-link{
		font-weight:bolder;
		font-size:20px;
	}
</style>

<script>

</script>

<body>
	
	<div class="container-fluid">
	
        <div class="row mt-80">
            <div class="col-md-10 offset-md-1"> 
                 <div class="col-2 float-start" style="width:20%;">
	        		<nav class="nav flex-column">
						  <a class="nav-link" href="${pageContext.request.contextPath}/">고객문의</a>
						  <a class="nav-link" href="${pageContext.request.contextPath}/admin/memberList">일반회원 관리</a>
						  <a class="nav-link" href="${pageContext.request.contextPath}/admin/applyList">훈련사 전환</a>
						  <a class="nav-link" href="${pageContext.request.contextPath}/admin/trainerList">훈련사 관리</a>
						  <a class="nav-link" href="${pageContext.request.contextPath}/">포인트상품 관리</a>
					 </nav>
	        	</div>
			    <div class="col-8 float-start text-center" style="width:80%;">
			    	<h2>포인트 이용내역</h2>
			    	
			    	<table>
			    		<thead>
			    			<tr>
			    				<th>이용날짜</th>
			    				<th>충전금액</th>
			    				<th>사용금액</th>
			    				<th>내역</th>
			    			</tr>
			    		</thead>
			    		<tbody>
			    			<c:forEach var="list" items="${list}">
			    				<c:choose>
			    					
			    					<c:when test="${list.pointStatus=='사용'}">
			    						<tr>
					    					<td>${list.pointDate}</td>
					    					<td></td>
					    					<td>- ${list.pointPrice}</td>
					    					<td>${list.pointStatus}</td>
					    				</tr>
			    					</c:when>
			    					<c:when test="${list.pointStatus=='충전'}">
			    						<tr>
					    					<td>${list.pointDate}</td>
					    					<td>+ ${list.pointPrice}</td>
					    					<td></td>
					    					<td>${list.pointStatus}</td>
					    				</tr>
			    					</c:when>
			    					<c:otherwise>
			    						<tr>
					    					<td>${list.pointDate}</td>
					    					<td></td>
					    					<td>- ${list.pointPrice}</td>
					    					<td>${list.pointStatus}</td>
					    				</tr>
			    					</c:otherwise>
			    				</c:choose>
			    			</c:forEach>
			    		</tbody>
			    	</table>
			    </div>
			    
            </div>
        </div>

        

        
        
	</div>
</body>
 