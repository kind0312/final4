package com.kh.finalproject.websocket;

import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.finalproject.entity.ChatDto;
import com.kh.finalproject.entity.RoomDto;
import com.kh.finalproject.repository.ChatDao;
import com.kh.finalproject.vo.ReceiveVO;
import com.kh.finalproject.vo.channel.Channel;
import com.kh.finalproject.vo.channel.Room;
import com.kh.finalproject.vo.channel.User;


import lombok.extern.slf4j.Slf4j;

/**
 * 회원들간의 그룹채팅이 가능하도록 구현한 서버
 * - User, Room, Channel 클래스를 활용
 * - 대기실을 구현
 */



@Slf4j
@Service
public class ChatWebSocketServer extends TextWebSocketHandler{

		//대기실
		private Room waitingRoom = new Room();
		
		//채널
		private Channel channel = new Channel();
		
		
		//@Autowired
		//디비에 저장하는 Dao를 만들어서 연결해야함
		//채팅이 올때마다 chat테이블에 chatDao에 있는 insert 메소드를 이용해서
		
		//채팅을 들어와서 시작하기 전에 이전에 있는 채팅 내역을 미리 찍어놔야 -> 채팅이 이어지게 보임
		// Dao에서 해당 룸(Room_no) list를 가져와야겠고
		
		
		//@Autowired
		//private ChatDao chatDao;
		
		//ChatDao에 있는 insert 메소드를 생성해야 하는데
		//훈련사 controller 에서 승인 버튼을 누르면 채팅방을 만들어야 함
		//
		// chatDao.createRoom();  //????? 방을 생성하고 방 번호를 줘야함 하....ㅠ모르겠어ㅠㅠ
		 
		
		
		
		@Override
		public void afterConnectionEstablished(WebSocketSession session)  {
			//접속 시 대기실로 입장
			Map<String, Object> attr = session.getAttributes();
			User user = User.builder()
									.memberId((String)attr.get("loginId"))
									.memberName((String)attr.get("loginName"))
									.memberStatus((String)attr.get("loginStatus"))
									.session(session)
									.build();
			waitingRoom.enter(user);
			log.debug("대기실 입장 - 현재 {}명", waitingRoom.size());
			}
		
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			//사용자가 나가면...
			//- 대기실에 있을지 채널에 있을지 알 수 없다
			Map<String, Object> attr = session.getAttributes();
			User user = User.builder()
									.memberId((String)attr.get("loginId"))
									.memberName((String)attr.get("loginName"))
									.memberStatus((String)attr.get("loginStatus"))
									.session(session)
									.build();
			waitingRoom.leave(user);//대기실에서 사용자 삭제
			channel.exit(user);//채널에서 사용자 삭제
			log.debug("사용자 퇴장 - {}", user.getMemberId());
		}
		
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			//사용자 정보 꺼내기 -> 메시지 종류별로 구분하기
			Map<String, Object> attr = session.getAttributes();
			User user = User.builder()
									.memberId((String)attr.get("loginId"))
									.memberName((String)attr.get("loginName"))
									.memberStatus((String)attr.get("loginStatus"))
									.session(session)
									.build();
			
			//메세지 해석
			ObjectMapper mapper = new ObjectMapper();
			ReceiveVO receiveVO = mapper.readValue(  
									message.getPayload(), ReceiveVO.class);
			log.debug("receiveVO = {}", receiveVO);
			
			if(receiveVO.getType() == 1) {
				//사용자가 입장하려고 하는 경우(방이름을 사용자가 보냄)
				//- 대기실에서 사용자를 삭제
				waitingRoom.leave(user);
				//- 해당하는 방에 사용자(user)를 입장시킨다
				channel.join(user, receiveVO.getRoom());
				log.debug("{} 방에 {} 입장", receiveVO.getRoom(), user.getMemberId());
			}
			else if(receiveVO.getType() == 2) {
				//사용자가 채팅을 보내는 경우(채팅내용을 사용자가 보냄)
				//- 해당하는 방의 모든 사용자에게 메세지를 전송
				
			ChatDto chatDto = ChatDto.builder()
													.memberId(user.getMemberId())	
													.roomNo(receiveVO.getRoom())
													.chatMessage(receiveVO.getText())
													.chatCreateAt(new Date())
												.build();
				String json = mapper.writeValueAsString(chatDto);
				TextMessage msg = new TextMessage(json);
				channel.send(user, msg);
			}
			
		}
	
}
