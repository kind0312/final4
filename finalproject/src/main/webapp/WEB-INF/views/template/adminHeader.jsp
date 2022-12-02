<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="${param.title }" name="title"/>
</jsp:include>


<!-- 관리자 메뉴 추가 -->
<div class="row">
	<div id="sidebar">
	    <label class="menu" for="toggle">
	        <i class="fa-solid fa-list fa-2x"></i>
	    </label>
	    <input type="checkbox" class="toggle" id="toggle">
	    <div class="view">
	        <div class="container-150 mt-50">
	            <div class="row center mt-30">
	                <h1>Menu</h1>
	            </div>
	            <div class="row center mt-30">
	                <h2><a href="/member/list">회원목록</a></h2>
	            </div>
	            <div class="row center">
	                <h2><a href="/admin/pocketmon">포켓몬 현황</a></h2>
	            </div>
	            <div class="row center">
	                <h2><a href="/admin/music/play">음원 재생순위</a></h2>
	            </div>
	            <div class="row center">
	                <h2><a href="/admin/music/year">연도별 발매현황</a></h2>
	            </div>
			</div>            
		</div>
	</div>
</div>
   


