package com.teamtodev.chatroom.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.teamtodev.chatroom.mapper.ChatMapper;
import com.teamtodev.chatroom.vo.ChatVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ChatServiceImpl implements ChatService {
	private final ChatMapper chatMapper;

	@Override
	public ChatVO selectChat(int chatRoomNo) {
		ChatVO chatVO = chatMapper.selectChat(chatRoomNo);
		return chatVO;
	}

	@Override
	public List<ChatVO> selectChatList() {
		return null;
	}

}
