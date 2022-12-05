<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="훈련사 상세" name="title"/>
</jsp:include>

<!-- jquery를 사용하기 위하여 라이브러리 js 파일을 불러온다-->
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/hiphop5782/score@latest/score.min.js"></script>
    <script type="text/javascript">
        $(function(){
            $(".star-score").score({
                starColor:"#81BDF1",//별 색상(기본 : 금색)
                integerOnly:false,
                display: {
                    showNumber:true,//숫자 표시
                    placeLimit:2,//소수점 자리수
                    textColor:"#81BDF1",//숫자 색상(기본 : 금색)
                }
            });

            $(".star-score-edit").score({
                editable:true,//수정 가능하도록 설정
                integerOnly:true,//정수만 가능
                display:{
                    showNumber:true,
                },
                send: {
                    sendable:true,//전송가능 설정
                    name:"reviewScore"//전송 파라미터 명 설정
                }
            });
        });
    </script>
<style>
.img0{
border-radius: 50%;
width: 300px;
height: 300px;
}
</style>

<div class="row mt-4">
         <div class="col-md-10 offset-md-1 mt-150 text-center">
         <h1>훈련사를 소개합니다!</h1>
         <img src="${pageContext.request.contextPath}/image/kang.png"  width="400" height="250" class="img0"><br>
<a type="button" href="/trainer/conversation" class="btn btn-blue btn-md ">예약하기</a><br><br>
<!-- 태림누나 추가 요망 -->
<a type="button" href="#" class="btn btn-blue btn-md ">문의하기</a><br>
${list.getMemberName()} 훈련사님<br>
후기 : ${list.getCnt()}개<br>
<div class="col-md-10 offset-md-1 text-center">
            <div class="star-score blue" data-max="5" data-rate="${list.getAvg()}" ></div>
        </div><br>
제목 : ${list.getTrainerProfile()}<br>
자기소개 : ${list.getTrainerProfileContent()}<br><br>
<h2>후기 목록</h2>
<c:forEach var="review" items="${review}">
작성자 : ${review.getMemberId()}<br>
리뷰 제목 : ${review.getReviewTitle()}<br>
리뷰 내용 : ${review.getReviewContent()}<br>
작성 시각 : ${review.getReviewWriteTime()}<br>
<div class="col-md-10 offset-md-1 text-center">
            <div class="star-score blue" data-max="5" data-rate="${list.getAvg()}" ></div>
        </div><br><br>
</c:forEach>
         </div>
      </div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>