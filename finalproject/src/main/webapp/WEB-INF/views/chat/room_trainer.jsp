<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<jsp:include page="/WEB-INF/views/template/trainerHeader.jsp">
	<jsp:param value="트레이너 채팅 방" name="title"/>
</jsp:include>




<style>
	.chat-message {
		display: inline-block;
	    width: 400px;
	    padding: 10px;
	    margin-top: 7px;
	    font-size: 13px;
	    border-radius: 10px;
	    margin-left: 10px;
		
	   
	     
	    
		
	}
	.img-circle{
		border-radius: 70%;
    	border:none;
    	background-color:#81BDF1;
    	overflow: hidden;
    	width : 45px;
    	height : 45px;
    	
    	
	}
	#chattext {
		font-size: 13px;
	}
	.header {
	text-align: center;
	}
	
	#message-input {
	width: 80%;
	}
	
	.mine {
	float: right;
	}
	
	.your {
	float:left;
	}
	
	.partner {
	
	}
	.textbox {
	
    display: inline-block;
    width: 400px;
    padding: 10px;
    margin-top: 7px;
    font-size: 13px;
    border-radius: 10px;
    margin-left: 10px;
      

	}
	
	.chat {
		
	}
	.time {
	font-size: 5px;
	}
	.tb-mine {
	 background-color: #AFDAFF;
	 color: white;
	 
	}
	.tb-your {
	 background-color: E7E7E7;
	 border-color: black;
	 
	}
	.input-div {
	    margin-right: 10px;
	
	}
	
	* {
            box-sizing: border-box;
        }
        .message-wrapper {
           
            padding: 15px;
        }
        .message::after {
            content:"";
            display: block;
            clear: both;
        }
        .message > div {
            float:left;
        }
        .message > .profile {
            overflow: hidden;
            border-radius: 50%;
        }
        .message > .content {
            max-width: 75%;
        }
        .message > .content > .text {
            background-color: #E7E7E7;
            padding: 10px;
            margin-left: 10px;
            border-radius: 10px;
            word-break: break-all;
        }
        .message > .content > .time {
            text-align: right;
        }

        .message.my > div {
            float: right;
        }
        .message.my > .profile {
            display: none;
        }
        .message.my > .content > .text {
            background-color: #AFDAFF;
            padding: 10px;
            margin-right: 10px;
            border-radius: 10px;
        }
        .message.my > .content > .time {
            text-align: left;
        }
        
         .chatBox {
        min-height: 350px;
       
        }

	
</style>


<body>

<div class="container-fluid">
        <div class="row mt-80 mb-3">
            <div class="col-md-6 offset-md-3">
                 <h4 class="text-center"></h4>
            </div>
        </div>


 


<div class="chat_wrap">
        <div class="header">
          <div>
	        	<div style="display:flex; flex-direction:row; align-items:center;">
	        		<a href="${pageContext.request.contextPath}/chat/list_trainer" 
	        			style="display:inline-block; position:absolute; margin-left:20px;">
						<img src="${pageContext.request.contextPath}/image/return-btn.png"
	            			width="36" height="36">
	            	</a>
	            	<h2 style="display:inline-block; margin-left:auto; margin-right:auto;">${partner.memberName} 회원</h2>
	        	</div>
            </div> 
          
          
          	<hr>
        </div>
        
          <div class="message-wrapper">     
	        <!-- 이전채팅 -->
	        <div class="chat row mt-60 mb-3 "  >
	        	<div class="col-md-6 offset-md-3">
        
       			 <c:forEach var="chatHistory" items="${chatHistory}">
       			 	<c:choose>
	       			 	<c:when test="${myId eq chatHistory.memberId}">
	       			 	
	       			 		<div class="message my">
					            <div class="profile"><img src="${pageContext.request.contextPath}/download/${chatHistory.filesNo}" class="img-circle"></div>
					            <div class="content">
					                <div class="text">${chatHistory.chatMessage}</div>
					                <div class="time">${chatHistory.chatCreateAt}</div>
					            </div>
					       </div>
	       			 	
	       			 	
	       			 	</c:when>
	       			 	<c:otherwise>
	       			 	
					 		<div class="message">
					            <div class="profile"><img src="${pageContext.request.contextPath}/download/${chatHistory.filesNo}" class="img-circle"></div>
					            <div class="content">
					                <div class="text">${chatHistory.chatMessage}</div>
					                <div class="time">${chatHistory.chatCreateAt}</div>
					            </div>
					       </div>
					       
					     </c:otherwise>
        			</c:choose>
        		</c:forEach>
        	
		       
        		<!-- 새 채팅  -->	
       		 <div class=" align-middle chatBox overflow-auto" id="live-message">
                  
                  <!-- 동적생성 -->       
                                 
         	</div>   
         	
        
        
        
     
			
			
			<div class="input-group  input-div" >
				  <input type="text" class="form-control input-div" id="message-input" placeholder="메세지를 입력해주세요" style="margin-top: 40px">
				  <button class="btn btn-outline-secondary btn btn-blue" type="button" id="message-send" style="margin-top: 40px">전송</button>
			</div>
			
			
			
			</div> 
        	
         </div>
       </div>
        
        
	</div>

</div>


</body>

<script>
$(function(){
	const userId = "${myId}";
	
	//목표
	//1. 시작하자마자 웹소켓 연결을 생성
	//2. 나가기 전에 웹소켓 연결을 제거
	//3. 전송버튼을 누르면 웹소켓으로 입력된 메세지를 전송
	
	//1.
	//웹소켓 연결 생성
	//- sockjs를 사용하면 주소를 http로 설정할 수 있다.
	//- 절대경로 표시를 추가할 수 있다.
	var uri = "${pageContext.request.contextPath}/ws/chat";
	
	//- 접속 시 생성하는 객체가 WebSocket이 아니라 SockJS로 바뀐다
	socket = new SockJS(uri);
	
	//(+추가) 웹소켓이 연결되었는지 종료되었는지 어떻게 아나?
	// - 웹소켓 객체가 기본 제공하는 4가지 이벤트를 설정해서 처리
	//console.log(socket);
	socket.onopen = function(){
		//접속하자마자 서버로 입장메세지를 보냄
		var data = {
				type :1,
				room : "${roomNo}"
		};
		socket.send(JSON.stringify(data)); 		
	};
	
	socket.onclose = function(){
		//console.log("close");
	};
	socket.onerror = function(){
		//console.log("error");
	};
	socket.onmessage = function(e){
		//수신된 e.data는 JSON 문자열
		var data = JSON.parse(e.data);
		console.log(data);  
		
	
		var imgNo = data.filesNo; //이미지 파일 번호 
		var p = $("<p>").addClass("chat-message");		
		var time = moment(data.time).format("hh:mm");
		var w = $("<p>").text(data.memberId); //콘솔에 key로 들어오는 값을 찍어줘야 나옴
		var t = $("<p>").addClass("time").text(time);
		var c = $("<span>").text(data.chatMessage);
		//
		var newChat = $("<div>").addClass("message");
		var imgbox = $("<div>").addClass("profile");
		var innerbox = $("<div>").addClass("content");
		var text = $("<div>").addClass("text").text(data.chatMessage);
		var ttime = $("<div>").addClass("time").text(time);
		
		// 내 사진 번호만 가져와서 태그 만들어서 붙이면 될거같은데 
		//<img src="http://localhost:8888/download/${myimg}">
	    

		var img = $("<img>").addClass("img-circle").attr('id','imgID').attr( "src","${pageContext.request.contextPath}/download/"+imgNo);
		
			
		var img = imgbox.append(img); 
		var con = innerbox.append(text).append(ttime);
		var newnew = newChat.append(img).append(con);
		
		if(userId == data.memberId){
			newChat.addClass("my");
		}		
		
		$("#live-message").append(newnew);
		
		
		
		//스크롤 하단으로 이동
		var height = $(document).height();
		$(window).scrollTop(height);
	};
	
	//2.
	$(window).on("beforeunload", function(){
		//웹소켓 연결 종료
		socket.close();
	});
	
	//3
	$("#message-send").click(function(){
		var text = $("#message-input").val();
		
		
		if(text.length == 0) return; //채팅 쓴거 없으면 return
		
		//JSON으로 변환해서 전송
		//- JSON.stringify(객체) : 객체를 문자열로
		//- JSON.parse(문자열) : 문자열을 객체로
		
		var data = {
			type : 2,
			room : "${roomNo}",
			text : text
		};
		socket.send(JSON.stringify(data));
		$("#message-input").val("");  //텍스트 창 비우기
		
	});
	
	//4 엔터키 이벤트
	$("#message-input").on("keyup",function(key){
        if(key.keyCode==13) {            
	        $("#message-send").click();
        }
    });

	
	

	
	
});


</script>

</html>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
