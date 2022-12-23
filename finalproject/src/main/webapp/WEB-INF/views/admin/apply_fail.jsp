<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="훈련사 지원 반려" name="title"/>
</jsp:include>

<body>

	


	<div class="container-fluid" style="height:50%;">
        
        <div class="row text-center mt-150">
            <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
            	
            	<h4 class="mt-50">반려되었습니다.</h4>
			</div>
		</div>
		<div class="row mt-50 mb-5">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 text-center">
				<a href="${pageContext.request.contextPath}/admin/applyList" class="btn btn-blue btn-md">목록으로</a><br>
			</div>
		</div>

    </div>
</body>	
