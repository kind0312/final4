package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.ChatDto;
import com.kh.finalproject.entity.ChatUserDto;
import com.kh.finalproject.entity.RoomDto;
import com.kh.finalproject.vo.ChatPartnerSearchVO;
import com.kh.finalproject.vo.ChatPartnerVO;
import com.kh.finalproject.vo.ChatRoomVO;
import com.kh.finalproject.vo.SearchRoomVO;






@Repository
public class ChatDaoImpl implements ChatDao{

	@Autowired
	private SqlSession sqlSession;


	@Override
	public void createRoom(RoomDto roomDto) {
		//채팅방(room) 생성
		sqlSession.insert("chat.roomCreate", roomDto);		
	}
	
	@Override
	public void insertChatUser(ChatUserDto chatUserDto) {
		//채팅 유저 chat_user테이블에 저장
		sqlSession.insert("chat.chatUserInsert", chatUserDto);		
	}
	
	@Override
	public void insertMessage(ChatDto chatDto) {
		//채팅내용 chat테이블에 insert
		sqlSession.insert("chat.chatMessageInsert", chatDto);		
	}

	@Override
	public List<ChatDto> chatSearch(String roomNo) {
		// 특정 방에 대한 chat 내역 list로 뽑아와야함
		return sqlSession.selectList("chat.chatList", roomNo);
	}

	@Override
	public String createRoomSeq() {
		// 룸 table 시퀀스 번호 생성
		return sqlSession.selectOne("chat.roomSeqNo");
	}

	@Override
	public String searchRoomVO(SearchRoomVO searchRoomVO) {		
		return sqlSession.selectOne("chat.searchRoom", searchRoomVO);
	}

	@Override
	public List<ChatUserDto> chatRoomList(String memberId) {		
		return sqlSession.selectList("chat.chatRoomList", memberId);
	}

	@Override
	public List<ChatRoomVO> chatRoom(String roomNo) {		
		return sqlSession.selectList("chat.chatRoom", roomNo);
	}

	@Override
	public ChatPartnerVO chatPartner(ChatPartnerSearchVO chatPartnerSearchVO) {		
		return sqlSession.selectOne("chat.searchPartner", chatPartnerSearchVO);
	}








	

	
}
