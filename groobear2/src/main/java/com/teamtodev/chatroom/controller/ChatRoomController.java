package com.teamtodev.chatroom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.teamtodev.chatroom.mapper.ChatRoomMapper;
import com.teamtodev.chatroom.service.ChatRoomService;
import com.teamtodev.chatroom.vo.ChatRoomVO;


@RestController
public class ChatRoomController {
    
    @Autowired
    ChatRoomMapper chatRoomMapper;
    
    @Autowired
    ChatRoomService chatRoomService;
    
    /**
     * 특정 이메일로 최신의 ChatRoomVO를 가져오거나, 없으면 새로운 레코드를 삽입하는 메서드입니다.
     * 
     * @param param 클라이언트에서 JSON 형태로 전송된 ChatRoomVO 객체입니다.
     * @return 데이터베이스에서 최신의 ChatRoomVO 객체를 반환합니다. 데이터가 없으면 null을 반환합니다.
     */
//    @PostMapping("/contact")
//    public ChatRoomVO selectChatRoom(@RequestBody ChatRoomVO paramChatRoomVO) { // JSON으로 받은 param을 파싱하여 ChatRoomVO 객체로 변환합니다.
//        
//        // 주어진 이메일로 데이터베이스에서 최신의 레코드를 검색합니다.
//        ChatRoomVO chatRoomVO = chatRoomMapper.selectChatRoom(paramChatRoomVO.getChatRoomNm());
//        
//        if (chatRoomVO == null) {
//            // 데이터가 없는 경우, 새로운 레코드를 삽입합니다.
//            chatRoomService.insertChatRoom(paramChatRoomVO.getChatRoomNm());
//            return null; // 새로운 레코드를 삽입한 후 null을 반환합니다.
//        } else {
//            // 데이터가 있는 경우, 해당 데이터를 반환합니다.
//            return chatRoomVO;
//        }
//    }
    
    /**
     * 새로운 ChatRoomVO 레코드를 데이터베이스에 삽입하는 메서드입니다.
     * 
     * @param param 클라이언트에서 JSON 형태로 전송된 ChatRoomVO 객체입니다.
     */
    @PostMapping("/contact/insert")
    public void insertChatRoom(@RequestBody ChatRoomVO paramChatRoomVO) {
        // 주어진 ChatRoomVO 객체를 데이터베이스에 삽입합니다.
        chatRoomService.insertChatRoom(paramChatRoomVO.getChatRoomNm());
    }
}
