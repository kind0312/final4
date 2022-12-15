<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="포인트 구매" name="title"/>
</jsp:include>

<style>
	.point-selectbox{
		width:150px;
		height:140px;
		font-size:20px;
		border:1px solid #81BDF1;
		background-color:#fff;
		color:#81BDF1;
		font-weight:bolder;
	}
	.point-selectbox:hover{
		background-color:#81BDF1;
		color:#fff;
		font-weight:bolder;
	}
	
	.explain{
		color:#7B7B7B;
		font-size:15px;
	}
</style>

<script>
	$(function(){
		$(".point-selectbox").click(function(e){
			var no = e.target.dataset.no;
			if(no.length>0){
				$("[name=itemNo]").val(no);
			}else{
				e.preventDefault();
			}
			
		});
	});
</script>

<body>
	
	<div class="container-fluid">
        <div class="row mt-120">
            <div class="col-md-10 offset-md-1 text-center">
                 <h3>포인트 구매</h3>
                 <p class="explain mt-4">포인트는 현금처럼 이용할 수 있으며 1포인트는 1원과 동일한 가치를 가집니다</p>
            </div>
        </div>

		<div class="row mt-5">
            <div class="col-md-10 offset-md-1 text-center">
            	<form action="${pageContext.request.contextPath}/pay/point_pay" method="get">
		            <c:forEach var="item" items="${item}">
		            	<button type="submit" class="point-selectbox rounded-3" data-no="${item.itemNo}">${item.itemName}</button>
		            </c:forEach>
		            <br>
		            <input type="hidden" value="" name="itemNo">
		            <a href="${pageContext.request.contextPath}/mypage/point" class="btn btn-yellow btn-md mt-5 mb-5">취소</a>
	            </form>
            </div>
        </div>
    </div>

</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>