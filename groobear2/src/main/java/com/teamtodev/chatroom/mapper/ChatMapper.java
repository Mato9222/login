package com.teamtodev.chatroom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.teamtodev.chatroom.vo.ChatVO;

@Mapper
public interface ChatMapper {
	/**
	 * 채팅방 조회
	 * @param chatRoomNm
	 * @return
	 */
	public ChatVO selectChat(int chatRoomNo);
	
	/**
	 * 채팅방 목록 조회
	 * @param chatRoomNm
	 * @return
	 */
	public List<ChatVO> selectChatList();
}
