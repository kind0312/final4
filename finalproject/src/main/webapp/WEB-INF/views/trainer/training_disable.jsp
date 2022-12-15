<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/trainerHeader.jsp">
	<jsp:param value="훈련요청 승인 불가" name="title"/>
</jsp:include>



<body>
	
	<div class="container-fluid">
        
        <div class="row text-center mt-150">
            <div class="col-md-6 offset-md-3">
            	<i class="fa-solid fa-circle-check fa-2x" style="color:#FADE81;" ></i> 
            	<h4 class="mt-50">승인이 불가합니다. 해당 날짜는 이미 예약이 완료 되었습니다</h4>
			</div>
		</div>
		<div class="row mt-50">
			<div class="col-md-6 offset-md-3 text-center">				
            	<a href="${pageContext.request.contextPath}/trainer/request_list" class="btn btn-yellow btn-md mt-3 mb-5">목록으로 이동</a>
			</div>
		</div>

    </div>
</body>





<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>