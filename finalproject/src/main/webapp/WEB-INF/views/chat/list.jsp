<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>




<body>
일반회원 채팅목록

목록을 누르면 해당 훈련사와의 채팅방으로 연결
<button type="button" onclick="location.href='http://localhost:8888/chat/room/1'">1번room 채팅</button>
<button type="button" onclick="location.href='http://localhost:8888/chat/room/2'">2번room 채팅</button>
<button type="button" onclick="location.href='http://localhost:8888/chat/room/3'">3번room 채팅</button>

<!-- 목록마다 다른 room/${room}을 가져와야 하는데 이거 어케 가져오지?
- 룸 생성 시점은 : 훈련사가 승인을 눌러서 예약이 확정되면 -> 자동으로 예약날짜 채팅이 가야함)
- 디비에서 방번호를 생성해주고(seq라 번호가 다른 방 자동생성가능) -> 메세지 isnert를 해주면 list 불러오기 가능


 -->

</body>


<script>
	
</script>

</html>