<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    </main>
    
	<footer class="container-fluid text-light bg-dark">
		<div class="row mt-4">
			<div class="col-md-7 offset-md-1">
				<div class="row mt-3">Final Four | 사업자등록번호 : 444-44-444444 | 서울 강남 제4444-04호</div>
				<div class="row mt-2">조장 : 권정환 | 조원 : 고태림, 이승정, 정하나, 조민재</div>
				<div class="row mt-2">위치 : 서울특별시 영등포구 선유동2로 57 이레빌딩(구관) 19F, 20F</div>
			</div>
			<div class="col-md-2 offset-md-1">
				<div class="row mt-3"><a href="#" class="footer-link"><h5>자주하는 질문</h5></a></div>
				<div class="row mt-5"><a href="#" class="footer-link"><h5>고객센터</h5></a></div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-md-10 offset-md-1">
				<div class="row">Copyright © ??? All rights reserved.</div>
			</div>
		</div>
	</footer>
	loginId : ${sessionScope.loginId} <br>
			로그인 : ${sessionScope.loginId != null} <br>

	</body>
</html>
	