package com.teamtodev.chatroom;


import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.teamtodev.chatroom.handler.ChatHandler;

import lombok.RequiredArgsConstructor;


@Configuration
@EnableWebSocket
@RequiredArgsConstructor
public class WebSocketConfig implements WebSocketConfigurer {
	private final ChatHandler chatHandler;
	
	@Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        // "/ws/chat" 엔드포인트에 대해 WebSocket 핸들러 등록
        registry.addHandler(chatHandler, "/ws/chat")
        		.setAllowedOrigins("*") // 모든 출처의 요청 허용 (Cross-Origin)
        		.addInterceptors(new HttpSessionHandshakeInterceptor()); // HttpSession을 WebSocket 세션에 추가하는 인터셉터
    }
}
