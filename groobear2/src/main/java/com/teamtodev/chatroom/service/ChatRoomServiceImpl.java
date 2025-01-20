package com.teamtodev.chatroom.service;

import org.springframework.stereotype.Service;

import com.teamtodev.chatroom.mapper.ChatRoomMapper;
import com.teamtodev.chatroom.vo.ChatRoomVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChatRoomServiceImpl implements ChatRoomService {
	private final ChatRoomMapper chatRoomMapper;

	@Override
	public int insertChatRoom(String chatRoomNm) {
		int cnt = 0;
		
		ChatRoomVO chatRoomVO = new ChatRoomVO();
		chatRoomVO.setChatRoomNm(chatRoomNm);
		
		return cnt;
	}

}
