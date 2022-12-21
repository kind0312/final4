<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    


 <!--fullcalendar css-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

    <!-- fullcalendar CDN -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    <!-- fullcalendar 언어 CDN -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
    <!-- moment CDN (format사용하기 위해)-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
    <script type="text/javascript"></script>




<jsp:include page="/WEB-INF/views/template/trainerHeader.jsp">
	<jsp:param value="스케줄" name="title"/>
</jsp:include>

<style>
	a{
		color:black;
	}
	.fc .fc-button-primary{
		background-color:#81BDF1;
		border-color:#81BDF1;
	}
	.fc .fc-button-primary:hover{
		color: #fff;
		background-color: #3b6fc9;
		border-color: #3768bd;
	}
	.fc .fc-button:focus{
		border-color:none;
		box-shadow: none;
	}
	.fc .fc-button-primary:not(:disabled):active:focus,
  	.fc .fc-button-primary:not(:disabled).fc-button-active:focus {
    	box-shadow: none;
  	}
	.margin-10{
		margin-left:10px;
		margin-right:10px;
	}
	.select-font{
		font-weight:bolder;
		font-size:20px;
	}
	.schedule-table{
		background-color:#81BDF1;
		color:#fff;
	}
	table>tbody>tr>td{
		height:50px;
		vertical-align: middle;
	}
	.fc-theme-standard .fc-scrollgrid{
		border-radius: 0.5rem;
	}
	.fc-theme-standard .fc-scrollgrid {
    	border: 1px solid #ddd; 
  	}
  	.fc-bg-event{
  		background-color:#fcee9a;
  	}
  	.fc-event-today {
	    background-color: #adf181 !important;
	}


</style>

<script>
	$(function(){		
		//회원모드로 전환 이벤트
		$(".mode-change").click(function(){
			location.href="${pageContext.request.contextPath}/";
		});

		//풀캘린더
		var calendarEl = $('#calendar')[0];
	      // full-calendar 생성하기
	      var trainerNo = $("[name=trainerNo]").val();
      
	      var calendar = new FullCalendar.Calendar(calendarEl, {
	        aspectRatio: 1.3, //달력의 가로 세로 비율 설정
	       // height: '500px', // calendar 높이 설정
	        expandRows: true, // 화면에 맞게 높이 재설정
	        // 해더에 표시할 툴바
	        headerToolbar: {
	          left: 'prev',
	          center: 'title',
	          right: 'next'
	        },
	        navLinkDayClick: function (date, jsEvent) {
	           // console.log(date.toString()); //Sat Dec 03 2022 00:00:00 GMT+0900 (한국 표준시) 형태로 출력됨
	           var careDate = moment(date).format('YYYY-MM-DD');
	            //console.log(careDate); //2022-12-03 형식으로 변경
	            $(".careDate").text(careDate);
	            
	            var trainingDate = $(".careDate").text();

	            data={
	            		trainingDate:trainingDate,
	            		trainerNo:trainerNo
	            }
	            $.ajax({
		    		  url:"${pageContext.request.contextPath}/rest/schedule/"+trainingDate+"/"+trainerNo,
		    		  method:"get",
		    		  date:data,
		    		  success:function(resp){
		    			 console.log(resp);
		    			 var tbody = $(".ajax-content");
		 	        	$(".ajax-content").empty();
		    			 if(resp.length>0){
		    				 for(var i=0; i<resp.length; i++){ 
		    					 var tr =  $("<tr>").attr("class","table-default align-middle"); 
		    					 var td1 = $("<td>").text(resp[i].memberName);
		    					 var td2 = $("<td>").text(resp[i].trainingBasicAddress);
		    					 var td3 = $("<td>").text(resp[i].trainingDate);
		    					 var td4 = $("<td>").text(resp[i].trainingStartTime);
		    					 var td5 = $("<td>");
		    					 var a = $("<a>").attr("href",
		    						"${pageContext.request.contextPath}/trainer/mypage_reservation_detail?trainingNo="+resp[i].trainingNo	 
		    					 ).attr("class","btn btn-yellow").text('상세');
		    					 td5.append(a);
		    					 tr.append(td1).append(td2).append(td3).append(td4).append(td5);
		    					 tbody.append(tr);
		    				 }
		    			 }else{ 
		    				 var tr =  $("<tr>").attr("class","table-default align-middle");
		    				 var td = $("<td>").attr("colspan","5").text('예약이 없습니다');
		    				 tr.append(td);
		    				 tbody.append(tr);
		    			 } 
		    		  }
		    	  });
	        }, 
	        navLinks: true,
	        editable: true,
	        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
	        //initialDate: '2022-12-13', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
	        nowIndicator: true, // 현재 시간 마크
	        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
	        locale: 'ko', // 한국어 설정
	        events: [
	            
	        	$.ajax({
	        		url:"${pageContext.request.contextPath}/rest/schedule/"+trainerNo,
	        		method:"get",
	        		data:trainerNo,
	        		success:function(resp){
	        			console.log(resp);
	        			if(resp.length!=0){
	        				for(var i=0; i<resp.length; i++){
	        					if(resp[i].trainingStatus=='예약확정'){
	        						calendar.addEvent({
		        						 start: resp[i]['trainingDate'],
		        						 display: ['background'],
		        						 color : ['#81BDF1']
	                                 })
	        					}else if(resp[i].trainingStatus=='이용완료'){
	        						calendar.addEvent({
		        						 start: resp[i]['trainingDate'],
		        						 display: ['background'],
		        						 color : ['#FADE81']
	                                 })
	        					}
	        				}
	        			}
	        		}
	        	})
	        	
           	]
	      });
	      // 캘린더 랜더링
	      calendar.render();
	});
</script>

<body>

	<!-- Modal -->
	<div class="modal fade" id="change-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-body">
	        회원 모드로 전환하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-yellow mode-change" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>

	<div class="container-fluid">
	
        <div class="row mt-80">
            <div class="col-md-6 offset-md-3 col-sm-4 offset-sm-4 mt-4">
                 <div class="text-center">
                 	<h3>일정</h3>
                 </div>
            </div>
        </div>
 
 		<div class="row mt-5">
            <div class="col-md-6 offset-md-3 col-sm-4 offset-sm-4">
                 <div class="text-center" id="calendar"></div>
                 <div class="text-center mt-2">
<!--                  	<span class="margin-10"><i class="fa-solid fa-circle"  style="color:#fcee9a;"></i> 오늘</span> -->
                 	<span class="margin-10"><i class="fa-solid fa-circle blue"></i> 훈련</span>
                 	<span class="margin-10"><i class="fa-solid fa-circle blue"  style="color:#FADE81;"></i> 완료</span>
                 </div>
            </div>
        </div>
        
		<div class="row mt-5">
            <div class="col-md-6 offset-md-3 col-sm-4 offset-sm-4">
                 <div class="text-center">
                 	<span class="select-font">선택 날짜 : </span>
                 	<span class="careDate select-font blue"></span>
                 </div>
            </div>
        </div>
        
        <div class="row mt-5">
            <div class="col-md-6 offset-md-3 col-sm-4 offset-sm-4">
                 <div class="text-center">
                 	<table class="table text-center">
                 		<thead>
                 			<tr class="align-middle schedule-table">
                 				<th width="20%">이름</th>
                 				<th width="20%">지역</th>
                 				<th width="20%">날짜</th>
                 				<th width="20%">방문시간</th>
                 				<th>상세</th>
                 			</tr>
                 		</thead>
                 		<tbody class="ajax-content">
                 			<!-- 비동기화 목록 출력 -->
                 		</tbody>
                 	</table>
                 </div>
            </div>
        </div>
        
        <div class="row mt-3 mb-5">
            <div class="col-md-6 offset-md-3 col-sm-4 offset-sm-4">
                 <div class="text-center">
                 </div>
            </div>
        </div>
        
    </div>
    
    <!-- 비동기화 출력을 위해 필요한 데이터 trainerNo -->
	<input type="hidden" name="trainerNo" value="${trainerNo}">
	
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

