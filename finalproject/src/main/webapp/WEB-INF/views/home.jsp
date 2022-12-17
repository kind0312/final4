<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="CareMainPage" name="title"/>
</jsp:include>

<body>

	<div class="container-fluid">

        <div class="row mt-4">
	            <img class="mainimg" src="${pageContext.request.contextPath}/image/pet main.png">
        </div>
        <div class="row mt-4">
            <div class="col-md-10 offset-md-1">
                <h1 class="row">언제 어디서든 펫훈련사를 부르세요!</h1>
                <div class="row mt-4">
					<p class="lead mt-4">
						혼자 남겨진 반려동물을 생각하며, 외출을 망설인 적이 있으신가요?
					</p>
					<p class="lead mt-3">
						이제는 CarePet에게 맡기고, 여러분의 소중한 일상을 마음 편히 보내세요
					</p>
					<p class="lead mt-3">
						언제 어디서든 ‘CarePet’ 방문 서비스를 예약할 수 있어요!
					</p>
                </div>
                <div class="row mt-4">
					<h5 class="text-muted">
						* 이용요금 : 돌봄 30분 (₩19,000) / 돌봄 60분 (₩27,000) / 돌봄 120분 (₩39,000)
					</h5>
					<p class="text-muted">
						* 반려동물 추가 또는 연휴 할증, 방문 시간 연장에 따라 추가요금이 발생할 수 있습니다
					</p>
                </div>
            </div>
        </div>
        <div class="row mt-4">
	            <img class="mainimg" src="${pageContext.request.contextPath}/image/pet main2.png">
        </div>
        <div class="row mt-4">
            <div class="col-md-10 offset-md-1">
            	<h1 class="row">언제 어디서든 펫훈려사를 부르세요!</h1>
            	<div class="row mt-4">
            		<p class="lead mt-4">
            			CarePet의 모든 훈련사는 신분증 사본, 등초본, 실제면접 몇 자격증까지 4단계로 까다롭게 신원을 검증하며,
            		</p>
					<p class="lead mt-3">
						펫시터로서 필요한 지식과 실력을 갖출 수 있도록 3주간의 교육 및 연수를 이행합니다.!
					</p>
            	</div>
            </div>
            <div class="row mt-5 mb-5">
            	<div class="col-md-10 offset-md-1 text-center">
            	<a href="${pageContext.request.contextPath}/trainer/list" class="btn btn-blue btn-md" >신청하기</a>
            	</div>
            </div>
        </div>
        
    </div>

</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>