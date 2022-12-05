<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Bootstrap CSS -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootswatch CDN -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.0.2/cosmo/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="훈련사 목록" name="title"/>
</jsp:include>
<!-- jquery를 사용하기 위하여 라이브러리 js 파일을 불러온다-->
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/hiphop5782/score@latest/score.min.js"></script>
    <script type="text/javascript">
        $(function(){
            $(".star-score").score({
                starColor:"red",//별 색상(기본 : 금색)
                integerOnly:false,
                display: {
                    showNumber:true,//숫자 표시
                    placeLimit:2,//소수점 자리수
                    textColor:"red",//숫자 색상(기본 : 금색)
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
width: 200px;
height: 200px;
}
.btn4{
border: 1px solid #6c7aef;
border-radius: 0.5em;
background-color: #6c7aef;
font-color: #FFF;
font-size: 16px;
font-weight: 700;
width: 100px;
height:50px;
cursor:pointer;
}rsor:pointer;
}
</style>
<div class="row mt-4">
<div class="col-md-10 offset-md-1 mt-100 text-center">
<h1>훈련사를 소개합니다!</h1><br><br>
<c:forEach var="list" items="${list}">
<img src="${pageContext.request.contextPath}/image/kang.png"  width="400" height="250" class="img0"><br>
${list.getMemberName()} 훈련사님<br>
후기 : ${list.getCnt()}개<br>
<div class="col-md-10 offset-md-1 text-center">
            <div class="star-score blue" data-max="5" data-rate="${list.getAvg()}" ></div>
        </div><br>
소개 : ${list.getTrainerProfile()}<a type="button" href="/trainer/detail?memberId=${list.getMemberId()}&trainerNo=${list.getTrainerNo()}"class="btn4">상세보기</a><br> 
</c:forEach>
         </div>
      </div>







<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>