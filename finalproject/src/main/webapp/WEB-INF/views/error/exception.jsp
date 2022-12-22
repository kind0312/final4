<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




    <jsp:include page="/WEB-INF/views/template/header_err.jsp">

	   <jsp:param value="exception" name="title"/>
	</jsp:include>
	
	<style>
	 .errimg {
	 width: 400px;
	 height: 400px;
	 margin: 50px; 
	 }
	 
	 .writing {
	 float: right;
	 margin-top: 200px;
	 }
	
	
	
	</style>
	
	
	<!-- 500 -->
	<body>
	
	<div class="mt-5">
	
	</div>
	
		<div class="container-fluid">
	
		 <div class="row mt-100 mb-3">
            <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2">
		
		
		<div class="center">
			<img src="${pageContext.request.contextPath}/image/logo.png" class="errimg">
			<div class="center writing align-center">
			 	<h2>페이지가 작동하지 않습니다</h2>
			 	<h4>현재 요청을 처리할 수 없습니다</h4>
			 	<P>HTTP ERROR 500</P>
			 	
			</div>
		</div>
		
		</div>
	</div>	
		
		
		
	</div>
	
	
	
	</body>
	
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>