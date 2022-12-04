<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="login" value="${loginId != null}"></c:set>
<c:set var="admin" value="${mg == '관리자'}"></c:set>
<html>
	<head>
		<title>
			<c:choose>
				<c:when test="${param.title != null}">
					${param.title}
				</c:when>
				<c:otherwise>
					CarePet
				</c:otherwise>
			</c:choose>
		</title>
		
		<!-- 글꼴 cdn -->
		<link rel="preconnect" href="//fonts.googleapis.com">
		<link rel="preconnect" href="//fonts.gstatic.com" crossorigin>
		<link href="//fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">
	
	    <link rel="stylesheet" type="text/css" href="/css/reset.css">
	    <!-- <link rel="stylesheet" type="text/css" href="/css/layout.css"> -->
	    <link rel="stylesheet" type="text/css" href="/css/commons.css">
	
	    <!-- 외곽 border 점선 -->
<!-- 	    <link rel="stylesheet" type="text/css" href="/css/test.css"> -->

		<!-- Bootstrap CSS -->
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
	
	    <!-- Bootswatch CDN-->
	    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.0.2/Litera/bootstrap.min.css">
	
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
	    <script src="https://cdn.jsdelivr.net/gh/hiphop5782/score@latest/score.min.js"></script>
	
	    <!-- 주소 검색 -->
	    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	    <script src="./daum-post-api.js"></script>
	
	    <!-- 확인 창-->
	    <script src="./confirm-link.js"></script><!-- 여기 사이에는 코드를 적으면 script를 고치는 것이다.-->
	
	    <!-- 체크박스-->
	    <script src="./checkbox.js"></script>
	    
	    <!-- 카카오 지도-->
	    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=94efcfc3a2fb279ab90052c1c24e8cc6"></script>
	
		<style>
/* 			<!-- div 확인 점선 --> */
/* 			div{ */
/*          		border: 1px dotted gray; */
/*       		} */
    		/* 태그 스타일 */
		    body {
		     	height:10000px;
		    }
		    p {
			  margin-top: 0;
			  margin-bottom: 0;
			}
			a {
				color: #f8f9fa;
				text-decoration: none;
			}
			a:hover {
				color: #dfe6e9;
			}

			/* 클래스 스타일 */
		    .logo {
		    	width:80px;
		    }
			.navbar {
			    font-size: 1.1rem;
 			    font-weight: bold;
			}
			.underline{
				border:0;
				border-bottom:2px solid rgba(0, 0, 0, 0.1);
			}
			
			.btn-blue{
  				background-color: #81BDF1;
  				border:2px solid #81BDF1;
  				font-weight: bolder;
  				color:#fff;
  			}
  			
  			.btn-blue:hover {
			  color: #fff;
			  background-color: #3b6fc9;
			  border-color: #3768bd;
			}
  			
  			.btn-yellow{
  				background-color: #FADE81;
  				border-color:#FADE81;
  				color:#303030;
  				font-weight: bolder;
  			}
  			
  			.btn-yellow:hover {
			  color: #fff;
			  background-color: #cc9342;
			  border-color: #c08a3e;
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

		</style>
		
		<script type="text/javascript"> 
			
		
		</script>
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
	              CarePet
	            </a>
	
	            <!-- 토글 버튼 -->
	            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menu-bar"
	              aria-controls="menu-bar" aria-expanded="false" aria-label="Toggle navigation">
	              <span class="navbar-toggler-icon"></span>
	            </button>
	
	            <!-- 메뉴 영역 -->
	            <div class="collapse navbar-collapse" id="menu-bar">
	              <ul class="navbar-nav me-auto">
	
	                <!-- 
	                    메뉴 항목
	                    - .active는 활성화된 메뉴(현재 메뉴), 상황에 따라 맞는 메뉴에 추가
	                -->
	                <li class="nav-item">
	                  <a class="nav-link active" href="#">채팅
	                    <span class="visually-hidden">(current)</span>
	                  </a>
	                </li>
	                <li class="nav-item">
	                  <a class="nav-link" href="#">훈련서비스</a>
	                </li>
	                <li class="nav-item">
	                  <a class="nav-link" href="#">스케줄</a>
	                </li>
	                <li class="nav-item dropdown">
	                  <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" 
	                  role="button" aria-haspopup="true" aria-expanded="false" href="#">마이페이지</a>
	                  <div class="dropdown-menu">
	                    <a class="dropdown-item" href="#">예약확인</a>
	                    <div class="dropdown-divider"></div><!-- 중간 중간 선으로 구분하는 것-->
	                    <a class="dropdown-item" href="#">프로필관리</a>
	                     <div class="dropdown-divider"></div><!-- 중간 중간 선으로 구분하는 것-->
	                     <a class="dropdown-item" href="#">정산관리(뺄수있음)</a>
	                     <div class="dropdown-divider"></div><!-- 중간 중간 선으로 구분하는 것-->
	                     <a class="dropdown-item" href="#">회원모드로 전환</a>	                    
	                  </div>
	                </li>
	                <li class="nav-item">
	                  <a class="nav-link" href="#">로그아웃</a>
	                </li>
	
	              </ul>
	
	              <!-- 검색 form (혹시 모르니 주석 처리) -->
<!-- 	              <form class="d-flex"> -->
<!-- 	                <input class="form-control me-sm-2" type="text" placeholder="Search"> -->
<!-- 	                <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button> -->
<!-- 	              </form> -->
	            </div>
	          </div>
	        </nav>
	      </div>
	    </div>
	
  </div> 