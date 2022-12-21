<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Bootstrap CSS -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootswatch CDN -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/css/lightpick.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.0.2/cosmo/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/basic.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/commons1.css">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset2.css">
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="훈련사 예약" name="title"/>
</jsp:include>
<style>
textarea::placeholder{
   font-size: 14px;
   color: #AAAAAA;
   }
textarea{
   width: 600px;
   height: 200px;
   padding: 10px;
   box-sizing: border-box;
   border: solid 2px #DDDDDD;
   border-radius: 0.5em;
   font-size: 16px;
   resize: none;
}
calendar{ 
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

.gyul{
 width: 435px;
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
.img1{
display: flex; 
}

.map{
float : left;
margin-right: 20px;
}

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
#short-text-box{
   border: 1px solid ##81BDF1;
   border-radius: 0.5em;
   width: 400px;
   height: 40px;
   text-align: center;
   

}
.img0{
border-radius: 50%;
width: 200px;
height: 200px;
display:inline-block;
}
.map{
float : left;
margin-right: 20px;

}
.col{
 border: solid 2px #81BDF1;
 
}

.col:hover,
.col:focus,
.col:active
{
 border: solid 2px #81BDF1;
 

 
}

.row{
text-align: center;
}


.row1{
display: flex;
flex-direction:row;
flex-wrap: wrap;
}
.pay1{
	margin-left: 140px;
}
.pay2{
	margin-left: 80px;
}
.hr1{
	width: 450px;
}
.address-box{
	border: solid 2px #DDDDDD;
}
.textarea-hover:hover{
border: 2px solid #81BDF1;
}

.textarea-hover:focus{
border: 2px solid #81BDF1;
outline-color: #81BDF1;
}
.basecol{
border: none;
padding:11px;
}
.basecol:hover{
border: none;
padding:11px;
}
/* input 숨겨준다 */
input#check_btn{
  display:none;
  }

input#check_btn + label{
  cursor:pointer;
 }

input#check_btn + label > span{
  vertical-align: middle;
  padding-left: 5px;
 }

/* label:before에 체크하기 전 상태 CSS */
input#check_btn + label:before{
  content:"";
  display:inline-block;
  width:17px;
  height:17px;
  border:2px solid #F47C7C;
  border-radius: 4px;
  vertical-align:middle;
  }
  
/* label:before에 체크 된 상태 CSS */  
input#check_btn:checked + label:before{
  content:"";
  background-color:#F47C7C;
  border-color:#F47C7C;
  background-image: url('check_btn.png');
  background-repeat: no-repeat;
  background-position: 50%;
  }
  
.select {
  -o-appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
    width: 150px;
  height: 35px;
  background: url('https://cdn-icons-png.flaticon.com/512/8313/8313541.png') calc(100% - 5px) center no-repeat;
  background-size: 20px;
  padding: 5px 30px 5px 10px;
  border-radius: 4px;
  outline: 0 none;
   margin-left: 146px;
}
}

</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/moment@2.29.4/moment.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/lightpick.js"></script>
<script type="text/javascript">

$(function(){
    $(".helper-text2").on("input", function(){
        var text = $(this).val();
        $(this).next().text(text.length);
        if(text.length > 300){
            $(this).next();
        }
        else {
            $(this).next().css("color", "#3f3f3f");
        }
    });
});

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
        onSelect : function(date){
//         	var select = $("#short-text-box").text(date);
        	var select = date.format('YYYY-MM-DD');
//         	console.log(select);
        	var memberId = $("[name=memberId]").val();
//         	console.log(memberId);
        	var trainerNo = $("[name=trainerNo]").val();
//         	console.log(trainerNo);
        	var time = moment().format('HH');
        	$("[name=trainingDate]").attr("value", select);
        	var today = moment().format('YYYY-MM-DD');
//         	console.log(today);
        	console.log("현재 시각 : " + time);
        	if(select == today){
        		console.log("같은 날짜");
        		$("[name=trainingStartTime]").empty();
        		
        		if(time >= 18){
        			$("[name=trainingStartTime]").append($("<option>").text("현재 가능한 예약시간이 없습니다"));
        			check.time=false;
        			console.log("가능 시간 : " + check.time);
        		}
        		else if(time < 9){
        			for(var i = 9; i <= 18; i++){
        				if(i == 9){
        					$("[name=trainingStartTime]").append($("<option>").attr("value", "0"+i+":00").text("0"+i+"시"));
    	            		check.time=true;
    	        			console.log("가능 시간 : " + check.time);
    	        			i++;
        				}
    	        		$("[name=trainingStartTime]").append($("<option>").attr("value", i+":00").text(i+"시"));
	            		check.time=true;
	        			console.log("가능 시간 : " + check.time);
            		}
        		}
        		else{
        			for(var i = time; i < 18; i++){
        				if(time == 9){
        					$("[name=trainingStartTime]").append($("<option>").attr("value", "0"+i+":00").text("0"+i+"시"));
    	            		check.time=true;
    	        			console.log("가능 시간 : " + check.time);
    	        			i++;
        				}
    	        		$("[name=trainingStartTime]").append($("<option>").attr("value", i+":00").text(i+"시"));
    	        		check.time=true;
    	    			console.log("가능 시간 : " + check.time);
            		}
        		}
        	}
        	else{
        		console.log("다른 날짜");
        		$("[name=trainingStartTime]").empty();
        		for(var i = 09; i <= 18; i++){
        			if(i == 9){
    					$("[name=trainingStartTime]").append($("<option>").attr("value", "0"+i+":00").text("0"+i+"시"));
	            		check.time=true;
	        			console.log("가능 시간 : " + check.time);
	        			i++;
    				}
	        		$("[name=trainingStartTime]").append($("<option>").attr("value", i+":00").text(i+"시"));
	        		check.time=true;
	    			console.log("가능 시간 : " + check.time);
        		}
        	}
        	
        	$.ajax({
                url:"${pageContext.request.contextPath}/rest/reservation?memberId="+memberId+"&trainingDate="+select+"&trainerNo="+trainerNo,
                method:"get",
                success:function(resp){
                    if(resp == "possible"){
                    	check.date=true;
                    	console.log("선택 날짜 : " + check.date);
                    }
                    else if(resp == "impossible"){
                    	alert("이미 예약된 날짜입니다");
                    	check.date=false;
                    	console.log("선택 날짜 : " + check.date);
                    }
                }
            });
        	
        }
    });
     // 오늘 날짜 기본값으로 자동 선택
//     picker1.setDate(moment());
//     console.log(picker1);
     
});

$(function(){
	//첫 화면 고정금액 출력
	$(".total-price").text(0);
	var firstMyPoint = parseInt($(".myPoint").text());
	var firstTotalPrice = parseInt($(".total-price").text());
	$(".price").text(firstMyPoint-firstTotalPrice);
	
	//하단 금액 자동계산
	$("[name=trainingDetailPetName]").on("input", function(){
	      var cnt = 0;
	      $("[name=trainingDetailPetName]").each(function(){
	         //체크여부에 따라 ture/false 반환
	         //console.log($(this).prop("checked"));  
	         if($(this).prop("checked")){
	            cnt++; // 체크되어있으면 cnt추가
	         }
	      });
	      
	      //현재 내 포인트
	      var myPoint = parseInt($(".myPoint").text());
	      if(cnt>1){
	         $(".total-price").text(100000+(cnt-1)*50000);
	         var totalPrice = parseInt($(".total-price").text());
	         $(".price").text(myPoint-totalPrice);
	         $("[name=trainingPurchasePrice]").val(totalPrice);
	         
	      }else{
	         $(".total-price").text(cnt*100000);
	         var totalPrice = parseInt($(".total-price").text());
	         $(".price").text(myPoint-totalPrice);
	         $("[name=trainingPurchasePrice]").val(totalPrice);
	         $("[name=purchaseDetailPrice]").val(cnt*100000);
	      }
	});
	
	//폼 보내기 전에 반드시 체크해야 할 것
	check={
		// 1. 반려동물 선택(체크박스 선택없을 경우) - 함수 petSelectCheck()
		// 2. 결제금액과 보유포인트 확인(결제금액>보유포인트) - pointCheck()
		checkbox:false,
		point:false,
		time:false,
		date:false,
		allValid:function(){
			return this.checkbox && this.point && this.time && this.date;
		}
	};
	
	//펫 선택 체크박스 검사
	function petSelectCheck(){
		//feedback 문구 삭제
  		$("[name=trainingDetailPetName]").removeClass("is-invalid");
		
		// 목표 : (1)체크박스 개수 확인 후 (2)input창 생성 및 value에 가격 적용
		//(1)
		var cnt = 0;
      	$("[name=trainingDetailPetName]").each(function(){
	         if($(this).prop("checked")){
	            cnt++; // 체크되어있으면 cnt추가
	         }
	    });

      	//(2)
      	var detailPriceTag = $(".detailPrice");
      	if(cnt>1){ //수량이 1 이상일 경우
      		for(var i=0; i<cnt; i++){
      			if(i==0){ //value값에 처음만 10만원
      				var input = $("<input>").attr("type","hidden").attr("name","purchaseDetailPrice")
      				.attr("value","100000");
      				detailPriceTag.append(input);
      			}else{ //나머지는 5만원
      				var input = $("<input>").attr("type","hidden").attr("name","purchaseDetailPrice")
      				.attr("value","50000");
      				detailPriceTag.append(input);
      			}
      		}
      		check.checkbox=true; //폼 체크박스 검사 false를 true로 변경
      	}else if(cnt==1){ //수량이 1
      		var input = $("<input>").attr("type","hidden").attr("name","purchaseDetailPrice")
			.attr("value","100000");
      		detailPriceTag.append(input);
      		check.checkbox=true;
      	}else{ // 수량이 0
      		$("[name=trainingDetailPetName]").addClass("is-invalid");
      		check.checkbox=false;
      	}
	}
	
	//보유 포인트 검사
	function pointCheck(){
		var myPoint = parseInt($(".myPoint").text());
		var totalPrice = parseInt($(".total-price").text());
		
		//feedback 문구 삭제
  		$(".afterpoint").removeClass("is-invalid");
		if(myPoint<totalPrice){
			$(".afterpoint").addClass("is-invalid");
			check.point=false;
		}else if(totalPrice ==0){
			check.point=false;
		}else{
			check.point=true;
		}
		
	}
	
	//form 전송 submit 이벤트
	$(".form-check").submit(function(e){
		//처음 화면에서 form 전송 막기
		e.preventDefault();
		
		//함수 실행
		petSelectCheck();
		pointCheck();
		
		console.log("체크박스 :" + check.checkbox);
		console.log("포인트 :" + check.point);
		console.log("시간 :" + check.time);
		console.log("날짜 :" + check.date);
		//폼 체크가 전부 true이면 전송하기
		if(check.allValid()){
			this.submit();
		}
	});
	
});
</script>
<div class="container-450 mt-100">
<div class="row">
<h3>어디로 갈까요?</h3><br>
<div class="mt-20">
<h6>주소를 입력해 주세요!</h6>
</div>
</div>
<form class="form-check" action="reservation" method="post">
<input type="hidden" name="memberId"  value="${member.memberId}">
<input type="hidden" name="trainingPurchasePrice" value="">
<input type="hidden" name="trainerNo" value="${trainerNo}">
<div class="detailPrice">
<!-- hidden으로 보낼 값 계산 name=purchaseDetailPrice -->
</div>
<div class="row">
<input type="text" name="trainingBasicAddress"
               class="input short-text-box address-box basic col" id="text-box1" required
                autocomplete="off" value="${member.memberBaseAddress}">
</div>
<div class="row">
<input type="text" name="trainingDetailAddress"
               class="input short-text-box address-box basic col" id="text-box1" required
               autocomplete="off" value="${member.memberDetailAddress}">
</div>
<br><br><br><br>
<div class="row mt-100">
<h3>언제 갈까요?</h3><br>
<div class="mt-20">
<h6>날짜를 선택해 주세요!</h6><br>
</div>
</div>
 <div class="row">
                       <input type="text" class="single-date-picker short-hover date-box" id="short-text-box" 
                        name="trainingDate" autocomplete="off">
                   </div>
                    <div class="row mt-50">
                   <h6>시간을 선택해 주세요!</h6><br>
                   <div class="row">
                   <select name="trainingStartTime" class="select">
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
</div>

<br><br><br>
<div class="row mt-100">
<h3>반려동물에 대해 알려주세요!</h3><br><br><br>
<h6>엄선된 훈련사가 갈거에요!</h6><br>
</div>
<div class="row1">
<div class="row">
<c:forEach var="pet" items="${pet}">
<div class="col basecol">
<img src="http://localhost:8888/download/${pet.filesNo}" width="400" height="250" class="img0">
<p>${pet.petName}</p>
<input type="checkbox" class ="petCheck" name="trainingDetailPetName" value="${pet.petName}">

</div>
</c:forEach>
<div class="invalid-feedback">반려견을 선택해주세요!</div>
</div>
</div>
<div class="row">
 <div class="mt-20">
 
 <p class="p2" style="font-size:15px"> 반려견 추가시 1마리당 50000포인트의 추가요금이 발생합니다.<br>(기본 100000포인트)</p>
 </div>
  </div>
<div class="row">
<textarea class="helper-text2 textarea-hover" name="trainingMemo" required  placeholder="요청사항 예) 까미는 ~간식을 못먹어요!, 자주 물어요!" maxlength="300" ></textarea>
</div>


 <div class="payment mt-100">    
        <h3 class="pay1">결제화면</h3><br>
        <span class="pay2">보유하신 포인트에서 차감돼요!</span>
        <div class="row">
        <div class="content">
            <div class="point nowpoint">
                <span>현재 내 포인트</span>
                <span class="myPoint">${member.memberPoint}</span>P
            </div>
            <div class="point totalpoint">
                <span>총 결제 포인트</span>
                <span class="total-price">0</span>P
            </div>
            <hr class="hr1">
            <div class="point afterpoint">
                <span>결제 후 포인트</span>
                <span class="price"></span>P
            </div>
            <span class="invalid-feedback gyul">결제할 포인트가 부족합니다!</span>
            </div>
            </div>
            </div>
<div class="row">
<button class="btn btn-blue" type="submit">신청하기!</button>
</div>

</form>
</div>





<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>