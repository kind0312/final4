<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Bootstrap CSS -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootswatch CDN -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.0.2/cosmo/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/basic.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/commons1.css">
  	
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/css/lightpick.css">
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="훈련사 상세" name="title"/>
</jsp:include>

<style>
.calendar{ 
   width: 600px;
}
#short-text-box{
   border: 1px solid #AAAAAA;
   border-radius: 0.5em;
}
.blind{
   position:absolute;
   clip: rect(0 0 0 0);
   width: 1px;
   height: 1px;
   margin: -1px;
   overflow: hidden;
}
h2{
   font-size: inherit;
   line-height: inherit;
   padding: 0;
   display: block;
   margin-block-start: 0.73em;
   margin-block-end: 0.73em;
   margin-inline-start: 0px;
   margin-inline-end: 0px;
   font-weight: bold;
}
#short-text-box{
   border: 2px solid #DDDDDD;
}
.date-box{
   background-color: transparent;
   border: 1px solid transparent;
   border-radius: 0.5em;
   font-size: 16px;
   color: #6c7aef;
   font-weight: 700;
   margin-bottom: 40px;
   margin:0 0 0 25;
}
.date-bx{
   border: 2px solid #6c7aef;
   padding: 20px 160px 20px;
   background-color: #6c7aef;
   color: #FFF;
   font-size: 20px;
   font-weight: 500;
   
}
.single-date-picker{
   text-align: center;
}
.single-date-picker:hover,
.single-date-picker:focus{
   color: #6c7aef;
}
.date-calendar,
#result-1{
   display: inline;
}

div {
   border: 1px dotted transparent;
}

.a-join {
   font-size: 14px;
   font-weight: bold;
   color: #6c7aef;
   cursor: pointer;
}


.a-hover:hover {
   font-weight: bold;
   text-decoration-line: underline;
}
.rows {
   margin: 20px 0;
}
.stbox {
   margin: 8px 0 0 0;
}
.join-p1 {
   margin: 10px 10px 0px 0px;
   font-size: 35px;
   color: #3f3f3f;
}
.join-p2 {
   margin: 2px 0px 0px 0px;
   font-size: 14px;
   color: #3f3f3f;
}
.join-p3 {
   margin: 5px 10px 5px 0px;
   font-size: 12px;
   color: #3f3f3f;
}
.join-p4 {
   margin: 10px 0px 8px 210px;
   font-size: 12px;
   color: #3f3f3f;
}

.join-p5 {
   margin: 10px 0px 8px 210px;
   font-size: 12px;
   color: #3f3f3f;
}
.li-1 {
   list-style: none;
   max-height: 1000000px;
   text-align: -webkit-math-parent;
}
.email-box {
   width: 99%;
   padding: 0 0 0 5px;
}
.email-drop-box {
   width: 235px;
   height: 59px;
   
   
}
.p1{
   font-size: 20px;
   color: #3f3f3f;
   font-weight: bold;
   margin-bottom: 16px;
   padding-top:80px; 
}
.p1-1{
   font-size: 20px;
   color: #3f3f3f;
   font-weight: bold;
   margin-bottom: 10px;
   padding-top:48px; 
}
.p2{
   font-size: 12px;
   color: #3f3f3f;
   margin-bottom:50px;
}
select {
   margin: 0 0 0 0;
   padding: 0 0 0 5px; 
   vertical-align: bottom;
   font-weight: 400;
   writing-mode: horizontal-tb !important;
   text-rendering: auto;
   letter-spacing: normal;
   text-transform: none;
   text-indent: 0px;
   text-shadow: none;
   display: inline-block;
   align-items: center;
   white-space: pre;
   cursor: default;
}
.success-message, .fail-message, .NNNNN-message {
   display: none;
}
.fail-message, .NNNNN-message {
   color: #eb6f7f;
}
.input.success {
   border-color: #6c7aef;
}
.input.success ~ .success-message {
   display: block;
}
.input.fail ~ .fail-message {
   display: block;
}
.input.NNNNN ~ .NNNNN-message {
   display: block;
}

input::placeholder{
font-weight: 400;
font-size: 13px;
text-align: center;
}

.basic{
font-size: 17px;
text-align: center;
border-color: ##000000;
}
.stbox:focus,
.stbox:active,
.stbox:hover{
   border:1px solid  #6c7aef;
   
}
#short-text-box{
   border: 1px solid #AAAAAA;
   border-radius: 0.5em;
   width: 400px;
   height: 40px;
   text-align: center;
}

</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/moment@2.29.4/moment.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/lightpick.js"></script>
<script type="text/javascript">

$(function(){
    var picker1 = new Lightpick({
        //field는 datepicker은 적용 대상을 설정하는 공간 
        field:document.querySelector(".single-date-picker"),
        minDate:moment(), // 오늘자 선택 가능
       format:"YYYY-MM-DD",
        firstDay:0, // 시작일 일요일부터 
        singleDate:true, // 날짜 한개만 선택
        // (+옵션) 표시되는 달의 개수를 지정 
        numberOfMonths:1, //1개의 달씩 보여줘라 
    });
     // 오늘 날짜 기본값으로 자동 선택
    picker1.setDate(moment()); 
     
});
</script>



<div class="container-650">
<div class="row mt-4">
<div class="col-md-10 offset-md-1 mt-30 text-center">
<div class="text-center">
<h3>어디로 갈까요?</h3><br>
<h6>주소를 입력해 주세요!</h6>
<div class="rows">
<form action="reservation" method="post" autocomplete="off">
               <input type="text" name="memberBaseAddress"
               class="input short-text-box short-hover stbox basic" id="text-box1"
                autocomplete="off" value="${member.memberBaseAddress}"><br><br>
               
               <input type="text" name="memberDetailAddress"
               class="input short-text-box short-hover stbox" id="text-box1"
               autocomplete="off" placeholder="상세정보  예) 우편함에 키가 있어요!  ,  현관 비밀번호 : **** ,  집 비밀번호 : ****">
               <br><br><br><br><br><br>
               
               
               <div class="col-md-10 offset-md-1 mt-100 text-center">
               <h3>언제 갈까요?</h3><br>
               <h6>날짜를 입력해주세요!</h6><br>
               <div class="row">
                       <input type="text" class="single-date-picker short-hover date-box" id="short-text-box"  name="startDate" autocomplete="off" placeholder="챌린지 시작일을 정해주세요!">
                       <span class="fail-message">필수 항목 입니다. </span>
                   </div>
               </div>
               <br><br><br><br><br><br>
               <div class="col-md-10 offset-md-1 mt-100 text-center">
               <h3>반려동물에 대해 알려주세요!</h3><br>
               <h6>엄선된 훈련사가 갈거에요!</h6><br>
               </div>
               
</form>
               
         </div>

</div>

</div>


</div>

</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>