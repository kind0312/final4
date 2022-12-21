<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/trainerHeader.jsp">
	<jsp:param value="trainerMain" name="main"/>
</jsp:include>



<body>

	<div class="container-fluid">
	

		<div class="row mt-100" >
			<h1>펫훈련,</h1> 
			<h1>CarePet에서 함께해요!</h1> 
	    </div>
		
		<div class="row mt-4">
		<p>훈련사의 체계적인 교육</p>
		<p>반려견과 보호자님 모두의 행복한 동행을 위해 와요가 든든한 교육 파트너가 되어드립니다</p>		
		</div>
		
		<div>
			<img class="mainimg" src="${pageContext.request.contextPath}/image/trainnerMain2.jpg">
		</div>
		
	</div>


</body>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>