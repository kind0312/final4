<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Bootstrap CSS -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootswatch CDN -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.0.2/cosmo/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/basic.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/commons1.css">
  	
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="훈련사 상세" name="title"/>
</jsp:include>

<style>
.calendar{ 
   width: 300px;
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
.img0{
border-radius: 50%;
width: 200px;
height: 200px;
display:inline;
}

.map{
float : left;
margin-right: 20px;
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

$(function(){
	$("traingDetailPetName").click(function(e){
		console.log(e.target);
	});
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
<input type="hidden" name="memberId" value="${member.memberId}">

               <input type="text" name="trainingBasicAddress"
               class="input short-text-box short-hover stbox basic" id="text-box1"
                autocomplete="off" value="${member.memberBaseAddress}"><br><br>
               
               
               
               
               
               <input type="text" name="trainingDetailAddress"
               class="input short-text-box short-hover stbox basic" id="text-box1"
               autocomplete="off" value="${member.memberDetailAddress}">
               <br><br><br><br><br><br>
               
               
               
               
               
               
               
               <div class="col-md-10 offset-md-1 mt-100 text-center">
               <h3>언제 갈까요?</h3><br>
               <h6>날짜를 선택해 주세요!</h6><br>
               <div class="row">
                       <input type="text" class="single-date-picker short-hover date-box" id="short-text-box" 
                        name="trainingDate" autocomplete="off">
                   </div>
                   <br><br>
                   <h6>시간을 선택해 주세요!</h6><br>
                   <select name="trainingStartTime">
                   <option value="09:00">09시</option>
                   <option value="10:00">10시</option>
                   <option value="11:00">11시</option>
                   <option value="12:00">12시</option>
                   <option value="13:00">13시</option>
                   <option value="14:00">14시</option>
                   <option value="15:00">15시</option>
                   <option value="16:00">16시</option>
                   <option value="17:00">17시</option>
                   <option value="18:00">18시</option>
                   </select>
               </div>
               
               
               
               
               
               
               <br><br><br><br><br><br>
               <div class="col-md-10 offset-md-1 mt-100 text-center">
               <h3>반려동물에 대해 알려주세요!</h3><br>
               <h6>엄선된 훈련사가 갈거에요!</h6><br>
                <c:forEach var="pet" items="${pet}">
   <div class="map">
      <img src="http://localhost:8888/download/${pet.filesNo}" width="400" height="250" class="img0">
      <p>${pet.petName}</p>
      <input type="checkbox" name="traingDetailPetName">
   </div>
</c:forEach>
               </div>
               <br><br><br><br><br><br>
               <input type="text" name="trainingMemo">
               
               
               
               
               
               <br><br><br><br><br><br>
               <div class="col-md-10 offset-md-1 mt-100 text-center">
               <h3>결제 화면</h3><br>
               <h6>보유하신 포인트에서 차감돼요!</h6><br>
               현재 내 포인트 : ${member.memberPoint}<br>
               총 결제 포인트 : 100000<br>
               
               보유포인트 : 1002202002
               
               <button type ="submit">신청하기</button>
               
</form>
               
         </div>

</div>

</div>


</div>

</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>