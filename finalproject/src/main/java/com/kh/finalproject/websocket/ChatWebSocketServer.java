package com.kh.finalproject.websocket;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.finalproject.entity.ChatDto;
import com.kh.finalproject.entity.FilesDto;
import com.kh.finalproject.entity.RoomDto;
import com.kh.finalproject.repository.ChatDao;
import com.kh.finalproject.repository.FilesDao;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.vo.ChatUpdateVO;
import com.kh.finalproject.vo.ReceiveVO;
import com.kh.finalproject.vo.channel.Channel;
import com.kh.finalproject.vo.channel.Chat;
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
		
		
		
		
		@Autowired
		private ChatDao chatDao;
		
		@Autowired
		private MemberDao memberDao;
		
		@Autowired
		private FilesDao filesDao;
		
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
			
			String memberId = user.getMemberId(); // 회원 아이디
			int filesNo = memberDao.findFileNo(memberId); // 파일 넘버 찾아옴		
			
		
			
			
			
			
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
			
			
				
			//DB로 가는 데이터 	
			ChatDto chatDto = ChatDto.builder()
													.memberId(user.getMemberId())	
													.roomNo(receiveVO.getRoom())
													.chatMessage(receiveVO.getText())
													.chatCreateAt(new Date())													
												.build();
			
			// roomjsp로 가는 데이터
			Chat chat = Chat.builder()
					.filesNo(filesNo) // 파일 No 담기
					.memberId(user.getMemberId())	
					.roomNo(receiveVO.getRoom())
					.chatMessage(receiveVO.getText())
					.chatCreateAt(new Date())
					.chatMessageStatus("N")
					.build();
					
					
			
				String json = mapper.writeValueAsString(chat);
				TextMessage msg = new TextMessage(json);
				channel.send(user, msg);
				
				//룸 번호, 그리고 내 아이디
				ChatUpdateVO vo = ChatUpdateVO.builder().memberId(user.getMemberId()).roomNo(receiveVO.getRoom()).build();		
				// 상대방 아이디 찾기
				String partnerId = chatDao.searchPartnerId(vo);
							
				//메세지를 전송과 동시에 이전 메세지를 다 읽음으로 update 				
				ChatUpdateVO chatUpdateVO = ChatUpdateVO
						.builder()
						.memberId(partnerId) // 상대 아이디를 가져와야함 
						.roomNo(receiveVO.getRoom())
						.build();
				chatDao.chatUpdate(chatUpdateVO);				
				
				//chatNo는 실시간 소켓에서는 없음 디비 들어갈때 생성 
				// roomNo는 가져올수있을거같은데 ...-> 가져왔음 Dto에 들어온다
				
				chatDao.insertMessage(chatDto);
				
				
			}
			
		}
		
//	// 기준 경로
//		private File dir = new File(System.getProperty("user.home"),"/carepet");//각자 집에서 C드라이브용
//	//	private File dir = new File("D:/upload/kh10i/carepet");//배포시 D드라이브용
//		
//	//이미지 저장소 폴더 생성
//		@PostConstruct
//		public void prepare() {//최소 실행시 딱 한번만 실행되는 코드
//			dir.mkdirs(); //폴더 생성
//		}
		
		
//		@Override
//		protected void handleBinaryMessage(WebSocketSession session, BinaryMessage message) {
//		
//			//메세지 해석					
//			ByteBuffer byteBuffer = message.getPayload();
//			String fileName = "temp.jpg";
//			//페이로드에 오는 정보에서 분리해야할거같은데 ...?
//			
//			
//			int filesNo = filesDao.sequence(); //파일 시퀀스 번호 생성
//			
//			File dir = new File(System.getProperty("user.home"),"/carepet");
//			if(!dir.exists()) {
//				dir.mkdirs();
//			}
//			File target = new File(dir, fileName);
			
//			FileOutputStream out = new FileOutputStream(target);
//			FileChannel channel = out.getChannel();
//			channel.write(byteBuffer);
//			out.close();
			
			
//			//DB저장	
//			filesDao.insert(FilesDto.builder()
//					.filesNo(filesNo)
//					.filesOriginalName(files.getOriginalFilename()) //인풋한 파일의 이름
//					.filesType(files.getContentType()) //인풋한 파일의 타입
//					.filesSize(files.getSize()) //인풋한 파일의 사이즈 
//				.build());
//	
//		//	파일저장
//		File target = new File(dir, String.valueOf(filesNo));
//			files.transferTo(target);
			

			
//			return "http://localhost:8888/download/"+filesNo;
//		ServletUriComponentsBuilder.fromCurrentContextPath()
//					.path("/download/").path(String.valueOf(filesNo))
//					.toUriString();
		
			
		
		//super.handleBinaryMessage(session, message);
		
			
			
		}
	

