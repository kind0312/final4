<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- <c:set var="login" value="${loginId != null}"></c:set> --%>
<%-- <c:set var="trainer" value="${memberStatus == 'Y'}"></c:set> --%>
<!-- <html> -->
<!--    <head> -->
<!--       <title> -->
<%--          <c:choose> --%>
<%--             <c:when test="${param.title != null}"> --%>
<%--                ${param.title} --%>
<%--             </c:when> --%>
<%--             <c:otherwise> --%>
<!--                CarePet -->
<%--             </c:otherwise> --%>
<%--          </c:choose> --%>
<!--       </title> -->
      
   <!-- 글꼴 cdn -->
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<!--        <link rel="stylesheet" type="text/css" href="/css/reset.css"> -->
<!--        <link rel="stylesheet" type="text/css" href="/css/layout.css"> -->
<!--        <link rel="stylesheet" type="text/css" href="/css/commons.css"> -->
   
       <!-- 외곽 border 점선 -->
<!--        <link rel="stylesheet" type="text/css" href="/css/test.css"> -->

      <!-- Bootstrap CSS -->
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
   
       <!-- Bootswatch CDN-->
       <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.0.2/litera/bootstrap.css">
   
       <!-- 아이콘 -->
       <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
   
       <!-- lightpick 사용을 위한 CDN 추가-->
       <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/css/lightpick.css">
       <script src="https://cdn.jsdelivr.net/npm/moment@2.29.4/moment.min.js"></script>
       <script src="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/lightpick.min.js"></script>
   
       <!-- chart CDN-->
       <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
   
       <!-- jquery를 사용하기 위하여 라이브러리 js 파일을 불러온다. -->
       <!-- 공부할때는 일반 버전으로-->
       <script src="https://code.jquery.com/jquery-3.6.1.js"></script> 
       <!-- 배포할때는 min 버전으로-->
       <!-- <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script> -->
       <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
   
       <!-- summernote 라이브러리(jquery 보다 뒤에 나와야 한다.)-->
       <!-- <link rel="stylesheet" type="text/css" href="./summernote/summernote-lite.css"/> -->
       <!-- <script src="./summernote/summernote-lite.js"></script> -->
       <!-- <script src="./summernote/lang/summernote-ko-KR.min.js"></script> -->
       <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" >
       <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.js"></script>
       <!-- <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script> -->
       <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.min.js"></script>
   
       <!-- score (jquery 보다 뒤에 나와야 한다.)-->
       <script src="https://cdn.jsdelivr.net/gh/hiphop5782/score@0.0.6/score.min.js"></script>
   
       <!-- 주소 검색 -->
       <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
       <script src="${pageContext.request.contextPath}/js/daum-post-api.js"></script>
   
       <!-- 확인 창-->
       <script src="${pageContext.request.contextPath}/js/confirm-link.js"></script><!-- 여기 사이에는 코드를 적으면 script를 고치는 것이다.-->
   
       <!-- 체크박스-->
       <script src="${pageContext.request.contextPath}/js/checkbox.js"></script>
       
       <!-- 카카오 지도-->
       <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=94efcfc3a2fb279ab90052c1c24e8cc6"></script>
   
      <style>
         
/*          <!-- div 확인 점선 --> */
/*            div{ */
/*                  border: 1px dotted gray; */
/*               } */
          /* 태그 스타일 */
          *{
             font-family: 'Noto Sans KR', 산세리프;
          }
        html,
      body {
                height:100%;
        }
        
         body {
        display: flex;
        flex-direction: column;
      }
      
      section {
        flex: 1;
      }
        
        p {
           margin-top: 0;
           margin-bottom: 0;
           font-family: var(--bs-font-sans-serif);
        }
         a {
            text-decoration: none;
         }
         a:hover {
            color: #dfe6e9;
         }
        
         /* 클래스 스타일 */
         .rounded{
            border-radius: 10px !important;
         }
         
          .logo {
             width:80px;
          }
          .mainimg{
             width:100%;
          }
         .navbar {
             font-size: 1.1rem;
              font-weight: bold;
         }
         .underline{
            border:0;
            border-bottom:2px solid rgba(0, 0, 0, 0.1);
         }
         /* 마이페이지 navbar 메뉴별 좌우간격, 글자크기 설정 */
         .mypage-nav{
            font-size:16px;
            margin-left:10px;
            margin-right:10px;
         }
         /* 헤더크기에 맞춰 마이페이지 navbar 바깥으로 나오게 top 설정*/
         .mypage-top-nav{
            margin-top: 3.3rem !important;
         }
         /* 마이페이지 navbar 좌우 간격 수정 */
         .navbar-expand-lg-re{
            padding-left:5rem;
            padding-right:5rem;
         }
         /* navbar 마이페이지(제일 왼쪽 제목) 설정 */
         .navbar-brand-re {
           padding-top: 0.29375rem;
           padding-bottom: 0.29375rem;
           margin-left:10px;
           margin-right:10px;
           font-size: calc(1.2625rem + 0.15vw);
           text-decoration: none;
           white-space: nowrap;
         }
         .footer-link{
            color: #f8f9fa;
         }
         .w-10{
            width: 10% !important;
         }
         .w-30{
            width: 30%;
         }
         .w-70{
            width: 70%;
         }
         .w-90{
            width: 90% !important;
         }
         .mt-150{
            margin-top:150px;
         }
         .mt-120{
            margin-top:120px;
         }
         .mt-100{
            margin-top:100px;
         }
         .mt-80{
            margin-top:80px;
         }
         .mt-70{
            margin-top:70px;
         }
         .mt-50{
            margin-top:50px;
         }
         .mt-40{
            margin-top:40px;
         }
         .mt-30{
            margin-top:30px;
         }
         .mt-29{
            margin-top:29px;
         }
         .mt-20{
            margin-top:20px;
         }
         .blue{
            color:#81BDF1;
         }
         .blue-bolder{
            font-weight:bolder;
         }
         .yellow{
           color:#FADE81;
         }
         
        .btn{
         border-radius: 10px !important;
        }
         
         .btn-blue{
              background-color: #81BDF1;
              border:2px solid #81BDF1;
              font-weight: bolder;
              color:#fff;
              font-size:15px;
           }
           
           .btn-blue:hover {
           color: #fff;
           background-color: #3b6fc9;
           border-color: #3768bd;
         }
           
           .btn-yellow{
              background-color: #FADE81;
              border:2px solid #FADE81;
              color:#303030;
              font-weight: bolder;
              font-size:15px;
           }
           
           .btn-yellow:hover {
           color: #fff;
           background-color: #cc9342;
           border-color: #c08a3e;
         }
         
         .btn-danger{
              border:2px solid #d9534f;
              color:#fff;
              font-weight: bolder;
              font-size:15px;
           }
         
         .btn-outline-blue {
           color: #81BDF1;
           border:2px solid #81BDF1;
           font-weight: bolder;
         }
         
         .btn-outline-blue:hover {
           color: #fff;
           background-color: #81BDF1;
           border-color: #81BDF1;
           font-weight: bolder;
         }
         
         .btn-outline-yellow {
           color: #303030;
           border:2px solid #FADE81;
           font-weight: bolder;
         }
         
         .btn-outline-yellow:hover {
           background-color: #FADE81;
           border-color: #FADE81;
           font-weight: bolder;
         }
         
         .bg-blue{
            background-color: #81BDF1 !important;
         }
         
         .btn-md{
            padding: 0.5rem 1rem;
            width:400px;
            display:inline-block;
            justify-content: center;
         }
         .page-link .page-blue{
            background-color:#81BDF1;
            border-color: #81BDF1;
         }
         
         /* input창 메세지 색상 설정*/
         .valid-feedback {
           color: #81BDF1;
         }
         .form-control.is-valid{
            border-color:#81BDF1;
         }
         .form-control.is-valid:focus {
            border-color: #81BDF1;
            box-shadow: 0 0 0 0.25rem rgba(69, 130, 236, 0.25);
         }
         
         /* 라벨 폰트 두껍게*/
         .label-font-weight{
            font-weight:bold;
         }
         .modal-body{
            font-size:16px;
         }
         
      </style>
      
      <!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/639fc27eb0d6371309d50e06/1gkk2p64m';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->
   </head>
   <body>
   
   <!-- bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
   
      <div class="container-fluid">

       <div class="row mt-4">
         <div class="col-md-10 offset-md-1">
   
           <!-- navbar : 드롭다운 메뉴를 제공하는 상단 메뉴바 -->
           <div class="mt-4">&nbsp;</div>
   
           <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
             <div class="container-fluid">
   
               <!-- Brand : 로고 이미지와 대표 상호를 적는 공간 -->
               <a class="navbar-brand" href="/">
               <span class="visually-hidden">(current)</span>
                  <img class="logo" src="${pageContext.request.contextPath}/image/logo.png">
               </a>
               <!-- 토글 버튼 -->
               <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menu-bar"
                 aria-controls="menu-bar" aria-expanded="false" aria-label="Toggle navigation">
                 <span class="navbar-toggler-icon"></span>
               </button>
   
               
                 
      


         
             </div>
           </nav>
         </div>
       </div>
        </div>
        <section class="">