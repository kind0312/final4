<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="/WEB-INF/views/template/trainerHeader.jsp">
	<jsp:param value="" name=""/>
</jsp:include>



<body>
훈련 요청 목록 

<!-- 결과화면 -->
<table>
	<thead>
		<tr>
			<th>훈련사 번호</th>
			<th>아이디</th>
			<th>훈련신청 날짜</th>
			<th>방문 시간</th>
			<th>기본주소</th>
			<th>상세주소</th>
			<th>요청사항</th>
			<th>상태</th>
			<th>상태변경날짜</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="trainingDto" items="${requestList}">
		<tr>
			<td>${trainingDto.trainingNo}</td>
			<td>${trainingDto.memberId}</td>
			<td>${trainingDto.trainingDate}</td>
			<td>${trainingDto.trainingStartTime}</td>
			<td>${trainingDto.trainingBasicAddress}</td>
			<td>${trainingDto.trainingDetailAddress}</td>
			<td>${trainingDto.trainingMemo}</td>
			<td>${trainingDto.trainingStatus}</td>
			<td>${trainingDto.trainingChangeDate}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>





</body>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>