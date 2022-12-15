<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="회원 상세" name="title"/>
</jsp:include>

 <!-- 시간 있을 때 쓰는 것 -->

<h1>회원 상세</h1>

<table border="1" width="800">
<thead>
<tr>
<td>회원이름</td>
<td>회원아이디</td>
<td>이메일</td>
<td>연락처</td>
<td>가입일</td>
<td>성별</td>
</tr>
</thead>
<tbody>


<tr>
<td> ${memberDto.memberName}</td>
<td>${memberDto.memberId}</td>
<td>${memberDto.memberEmail }</td>
<td>${memberDto.memberTel}</td>
<td>${memberDto.memberJoinDate}</td>
<td>${memberDto.memberTel}</td>
</tr>


</tbody>
</table>


<table border="1" width="800">
<thead>
<tr>
<td>반려동물</td>
<td>이름</td>
<td>생일</td>
<td>중성화</td>
</tr>
</thead>
<tbody>
<tr>
<c:forEach var="petDto" items="${petDto}">
<tr>
<td> ${petDto.petType}</td>
<td> ${petDto.petName}</td>
<td> ${petDto.petBirth}</td>
<td> ${petDto.petNeutralization}</td>
<td> ${petDto.petNo}</td>
</tr>
</c:forEach>
</tr>

</tbody>
</table>

<a class="btn btn-dark" href="${pageContext.request.contextPath}/admin/memberPoint?memberId=${memberDto.memberId}">포인트 이용내역</a>
<a class="btn btn-dark">훈련사 이용내역</a>
