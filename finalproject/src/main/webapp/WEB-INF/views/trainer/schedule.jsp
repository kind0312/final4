<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
	
	.select-date{
		border:1px solid rgba(0, 0, 0, 0.1);
		width:95%;
		padding:0.5rem 1.1rem;
		outline:none;
		font-size:15px;
		border-radius: 0.5rem;
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
	      var calendar = new FullCalendar.Calendar(calendarEl, {
	        height: '600px', // calendar 높이 설정
	        expandRows: true, // 화면에 맞게 높이 재설정
	        // 해더에 표시할 툴바
	        headerToolbar: {
	          left: 'prev',
	          center: 'title',
	          right: 'next'
	        },
	        navLinkDayClick: function (date, jsEvent) {
	           // console.log(date.toString()); //Sat Dec 03 2022 00:00:00 GMT+0900 (한국 표준시) 형태로 출력됨
	           var careDate = moment(date).format('YYYY-MM-DD');;
	            //console.log(careDate); //2022-12-03 형식으로 변경
	            $(".careDate").text(careDate);
	            
	            var trainingDate = $(".careDate").text();
	            var trainerNo = $("[name=trainerNo]").val();
	            
	            data={
	            		trainingDate:trainingDate,
	            		trainerNo:trainerNo
	            }
	            $.ajax({
		    		  url:"http://localhost:8888/rest/schedule/"+trainingDate+"/"+trainerNo,
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
		    					 var td2 =  $("<td>").text(resp[i].trainingBasicAddress);
		    					 var td3 =  $("<td>").text(resp[i].trainingDate);
		    					 var td4 =  $("<td>").text(resp[i].trainingStartTime);
		    					 tr.append(td1).append(td2).append(td3).append(td4);
		    					 tbody.append(tr);
		    				 }
		    			 }else{ 
		    				 var tr =  $("<tr>").attr("class","table-default align-middle");
		    				 var td = $("<td>").attr("colspan","4").text('예약이 없습니다');
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
                 <div class="text-center">
                 	<span>현재 날짜</span>
                 	<span>예약 있음</span>
                 </div>
            </div>
        </div>
        
		<div class="row mt-3">
            <div class="col-md-6 offset-md-3 col-sm-4 offset-sm-4">
                 <div class="text-center">
                 	<span>선택 날짜 : </span>
                 	<span class="careDate"></span>
                 </div>
            </div>
        </div>
        
        <div class="row mt-3">
            <div class="col-md-6 offset-md-3 col-sm-4 offset-sm-4">
                 <div class="text-center">
                 	<table class="table table-hover text-center">
                 		<thead>
                 			<tr class="align-middle">
                 				<th>이름</th>
                 				<th>지역</th>
                 				<th>날짜</th>
                 				<th>방문시간</th>
                 				
                 			</tr>
                 		</thead>
                 		<tbody class="ajax-content">
                 			<!-- 비동기화 목록 출력 -->
                 		</tbody>
                 	</table>
                 </div>
            </div>
        </div>
        
    </div>
    
    <!-- 비동기화 출력을 위해 필요한 데이터 trainerNo -->
	<input type="hidden" name="trainerNo" value="${trainerNo}">
	
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>