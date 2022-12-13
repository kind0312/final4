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
        height: '700px', // calendar 높이 설정
        expandRows: true, // 화면에 맞게 높이 재설정
        // 해더에 표시할 툴바
        headerToolbar: {
          left: 'prev',
          center: 'title',
          right: 'next'
        },
        navLinkDayClick: function (date, jsEvent) {
            console.log(date.toString());
            var careDate = moment(date).format('YYYY-MM-DD');;
            console.log(careDate);
            $("[name=careDate").val(careDate);
        }, 
        navLinks: true,
        editable: true,
        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
        initialDate: '2022-12-13', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
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
 
 		<div class="row mt-80">
            <div class="col-md-6 offset-md-3 col-sm-4 offset-sm-4 mt-4">
                 <div class="text-center" id="calendar"></div>
            </div>
        </div>
        
		<div class="row mt-80">
            <div class="col-md-6 offset-md-3 col-sm-4 offset-sm-4 mt-4">
                 <div class="text-center">
                 	선택 날짜 : <input type="text" name="careDate" required>
                 </div>
            </div>
        </div>
        
    </div>

</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>