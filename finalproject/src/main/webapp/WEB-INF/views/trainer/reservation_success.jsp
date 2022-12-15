<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="예약완료 페이지" name="title"/>
</jsp:include>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/basic.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
    div{
		 border: 1px dotted transparent;
    }
        body{
            font-family: sans-serif;
        }
        a{
        line-height:32px;
        } 
        .row-2{
        
        }
        .p-1{
            font-size: 24px;
            font-weight: bold;
            color: #3F3F3F;
            margin-top:50px;
            margin-bottom:22px;
        }
        .p-2{
            font-size: 12px;
            color:#3F3F3F;
            margin-bottom: 50px;

        }
        .btn1{
            margin-top: 40px;
        }
        .fa{
            color:black
        }
        .color{
            color: #425F57;
        }
        .join-btn{
        margin-top: 10px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
     <script type="text/javascript">

     </script>
 <body>
 <div class="container-1200">
        <div class="container-590">
            <div class="row center mt-92">
                <p class="p-1">예약완료!</p>
                <p class="p-2">엄선된 훈련사가 갈거에요!</p>
            </div>
            
            <div class="row center">
               <img src="${pageContext.request.contextPath}/image/logo.png" width="200" height="300">
            </div>

            <div class="row row-2 center">
                <a href="${pageContext.request.contextPath}/mypage/training"><button class="btn btn-blue btn-md">예약 목록 보기</button></a>
                <div class="mt-10">
                <a href="${pageContext.request.contextPath}/trainer/list"><button class="btn btn-blue btn-md" >훈련사 목록 보기</button></a>
                </div>
            </div>
        </div>
</div>
     </body>
</html>
