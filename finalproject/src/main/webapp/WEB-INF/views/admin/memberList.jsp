<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반회원 목록</title>
</head>
<body>
<!-- 검색 창 -->
<form action="memberList" method="get">
<select name="type" required>
<option value="member_name"><c:if test="${param.type=='member_name'}">selected</c:if>회원이름</option>
<option value="member_id"><c:if test="${param.type=='member_id'}">selected</c:if>회원아이디</option>
</select>

<input type="search" name="keyword" placeholder="검색어" required value="${param.keyword}">
</form>
<table border="1" width="800">
<thead>
<tr>
<td>회원이름</td>
<td>회원아이디</td>
<td>이메일</td>
<td>연락처</td>
</tr>
</thead>
<tbody>
<tr>
<c:forEach var=memberDto" items=${memberList}">
<td> ${memberDto.memberName}</td>
<td>${memberDto.memberId }</td>
<td>${memberDto.memberEmail }</td>
<td>${memberDto.memberTel}</td>
</c:forEach>
</tr>
</tbody>


</tr>




</table>
 