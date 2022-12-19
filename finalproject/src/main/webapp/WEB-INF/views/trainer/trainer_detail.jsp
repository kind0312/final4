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
<script type="text/javascript">
$(function(){
	//시작시 진행예약화면 고정
	ingClick();
	
	//진행 예약 버튼 이벤트
	$(".ing-btn").click(function(){
		ingClick();
	});
	
	//지난 예약 버튼 이벤트
	$(".end-btn").click(function(){
		endClick();
	});

function ingClick(){
	//버튼 색상 변경
	$(".end-btn").removeClass("unselect-btn select-btn");
	$(".ing-btn").removeClass("unselect-btn select-btn");
	$(".end-btn").addClass("unselect-btn");
	$(".ing-btn").addClass("select-btn");
	//진행 예약만 출력
	$(".training-end").children().hide();
	$(".training-ing").children().show();
}

function endClick(){
	//버튼 색상 변경
	$(".ing-btn").removeClass("unselect-btn select-btn");
	$(".end-btn").removeClass("unselect-btn select-btn");
	$(".ing-btn").addClass("unselect-btn");
	$(".end-btn").addClass("select-btn");
	//지난 예약만 출력
	$(".training-end").children().show();
	$(".training-ing").children().hide();
}
});
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
.like{
margin-left: -7px;
margin-bottom: 7px;
}
.training-btn{
		background-color:#fff;
		border:none;
		color:#303030;
		font-size:17px;
		
	}
	.unselect-btn{
		color:#7B7B7B;
		
}
.select-btn{
color : black;
font-weight: bolder;
}

    </style>
<body>
    <div class="viewmore">    
        <h2>훈련사를 소개합니다</h2>
        <div class="content">
            <div class="box">
                <div class="imgbox">
                    <img src="http://localhost:8888/download/${list.filesNo}" class="img0">
                </div>
                <div class="textbox">
                    <h3>${list.getTrainerProfile()}</h3>
                    <div class="review">
                        <div class="scopebox">
                            <span><div class="star-score blue" data-max="5" data-rate="${list.getAvg()}" ></span>
                        </div>
                        <span>후기 ${list.getCnt()}개</span>
                        <div class="heart">
                            <c:if test="${isLike == null}">
            <a class="heart"><i class="fa-regular fa-heart"></i></a>  
         </c:if>
         <c:if test="${isLike == true}">
            <a href="like?trainerNo=${list.trainerNo}"><span style="color:red"><i class="fa-solid fa-heart"></i></span></a> 
         </c:if>
         <c:if test="${isLike == false}">
            <a href="like?trainerNo=${list.trainerNo}"><span style="color:red"><i class="fa-regular fa-heart"></i></span></a>  
         </c:if>
         <div class="like">
         ${list.trainerLike} 
         </div>
                            <br>
                        </div>
                    </div>
                </div>
                <br>
                <h2>${list.getMemberName()} 훈련사</h2>
<br>
                <div class="sitro">
                    <h3>자기소개</h3>
                    <span>
                       ${list.getTrainerProfileContent()}
                    </span>
                </div>

                <div class="cfcate">
                    <h3>후기 목록</h3>
                    <div class="text-end">
                 	<i class="fa-solid fa-arrow-up-9-1 fa-2xs ing-btn"></i><button class="training-btn ing-btn">평점 높은순</button>
                 	<i class="fa-solid fa-arrow-down-9-1 fa-2xs end-btn"></i><button class="training-btn end-btn">평점 낮은순</button>
                 </div>
                 <div class="row training-ing">
<c:forEach var="review" items="${review}">
<div class="sitro">
<span>
<div class="star-score blue" data-max="5" data-rate="${review.getReviewGood()}" ></div><br>
리뷰 제목 : ${review.getReviewTitle()}<br>
리뷰 내용 : ${review.getReviewContent()}<br>
작성 날짜 : ${review.getReviewWriteTime()}<br>
</span>
</div>
<br><br>
</c:forEach>
                </div>
                </div>
                <div class="cfcate">
                 <div class="row training-end">
<c:forEach var="reviewBad" items="${reviewBad}">
<div class="sitro">
<span>
<div class="star-score blue" data-max="5" data-rate="${reviewBad.getReviewGood()}" ></div><br>
리뷰 제목 : ${reviewBad.getReviewTitle()}<br>
리뷰 내용 : ${reviewBad.getReviewContent()}<br>
작성 날짜 : ${reviewBad.getReviewWriteTime()}<br>
</span>
</div>
<br><br>
</c:forEach>
                </div>
            </div>  
            </div>
        </div>  
        
    </div>
    <a href="/trainer/reservation?trainerNo=${list.trainerNo}" class="btn btn-blue btn-md " class="btn reserve">예약하기</a>
    <a href="/chat/enter?trainerNo=${list.trainerNo}" class="btn inquiry">문의하기</a>
</body>
</html>