<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="훈련사 상세" name="title"/>
</jsp:include>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset2.css">
    <title></title>
</head>
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
width: 200px;
height: 200px;
}
    </style>
<body>

    <div class="trainer">    
        <h2>훈련사를 소개합니다</h2>
        <div class="content">
        <c:forEach var="list" items="${list}">
            <div class="box">
                <div class="imgbox">
                <!-- 이미지 경로 추가 여기 -->
                    <div class="img_area"><img src="http://localhost:8888/download/${list.filesNo}" class="img0"></div>
                </div>
                <div class="textbox">
                    <h2>${list.getMemberName()} 펫시터</h2>
                    <h3>${list.getTrainerProfile()}</h3>
                    <div class="review">
                        <div class="scopebox">
                            <div class="scope_area">
                                <a href="javascript:void(0);" class="scope"></a>   
                                <a href="javascript:void(0);" class="scope"></a>   
                                <a href="javascript:void(0);" class="scope"></a>   
                                <a href="javascript:void(0);" class="scope"></a>   
                                <a href="javascript:void(0);" class="scope"></a>   
                            </div>
                            <span>
            <div class="star-score blue" data-max="5" data-rate="${list.getAvg()}" ></div>
        <br></span>
                        </div>
                        <span>후기 ${list.getCnt()}개</span>
                    </div>
                </div>
                <a href="/trainer/detail?memberId=${list.getMemberId()}&trainerNo=${list.getTrainerNo()}" class="view">상세 보기</a>
            </div>
            </c:forEach>
        </div>
        
    </div>
</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>