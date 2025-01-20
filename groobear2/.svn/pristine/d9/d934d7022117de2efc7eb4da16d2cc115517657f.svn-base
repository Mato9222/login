package com.teamtodev.chatroom.handler;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.teamtodev.employees.vo.EmployeeVO;

import lombok.extern.log4j.Log4j2;

@Component // Spring의 컴포넌트 스캔에 의해 관리되는 빈(bean)으로 등록됩니다.
@Log4j2 // Log4j2를 사용한 로깅을 지원합니다.
public class ChatHandler extends TextWebSocketHandler {

	// 온라인 사용자 목록을 저장하는 리스트
	private static List<String> onlineList = new ArrayList<>();

	// 웹소켓 세션을 저장하는 리스트
	private static List<WebSocketSession> sessionList = new ArrayList<>();

	// 사용자 세션을 저장하는 맵, 키는 사용자 ID, 값은 WebSocketSession
	Map<String, WebSocketSession> userSession = new HashMap<>();

	// JSON 처리를 위한 ObjectMapper 객체
	ObjectMapper json = new ObjectMapper();

	// 메시지를 처리하는 메서드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 메시지 데이터를 저장할 맵
		Map<String, Object> dataMap = new HashMap<>();

		// 마스터 상태 확인
		String masterStatus = null;
		if (userSession.containsKey("sender")) {
			masterStatus = "online";
		} else {
			masterStatus = "offline";
		}

		// 현재 시간
		LocalDateTime currentTime = LocalDateTime.now();
		String time = currentTime.format(DateTimeFormatter.ofPattern("hh:mm a, E"));

		// 메시지 데이터
		EmployeeVO sessionEmployeeVO = (EmployeeVO) session.getAttributes().get("sender");
        String senderNm = sessionEmployeeVO.getEmplNm();
		String payload = message.getPayload();

		// JSON 문자열을 맵으로 변환
		dataMap = jsonToMap(payload);
		dataMap.put("senderNm", senderNm);
		dataMap.put("time", time);
		dataMap.put("masterStatus", masterStatus);
		dataMap.put("onlineList", onlineList);
		
//		log.info("리시버가 어디서 나오는 애임? {}", (String) dataMap.get("receiverNm"));
		
		String receiverNm = (String) dataMap.get("receiverNm");

//		log.info("final dataMap >>> " + dataMap);

		// 메시지 전송
		System.out.println("receiver session >>> " + userSession.get(receiverNm));
		String msg = json.writeValueAsString(dataMap);

		// 수신자에게 메시지 전송
		if (userSession.get(receiverNm) != null) {
			userSession.get(receiverNm).sendMessage(new TextMessage(msg));
		}

		// 본인에게 메시지 전송
		if (!senderNm.equals(receiverNm)) {
			dataMap.put("receiverNm", senderNm);
			msg = json.writeValueAsString(dataMap);
			session.sendMessage(new TextMessage(msg));
		}
	}

	// 연결이 성립된 경우 호출되는 메서드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 세션을 세션 리스트에 저장
		EmployeeVO sessionEmployeeVO = (EmployeeVO) session.getAttributes().get("sender");
		String senderNm = sessionEmployeeVO.getEmplNm();
		sessionList.add(session);
//		log.info("sender >>> " + senderNm);
		onlineList.add(senderNm);
		userSession.put(senderNm, session);

//		// 마스터일 경우 모든 사용자에게 메시지 전송
//		if (senderNm.equals("master")) {
//			TextMessage msg = new TextMessage(senderNm + " 님이 접속했습니다.");
//			sendToAll(msg, senderNm);
//		} else {
//			// 일반 사용자의 경우 마스터에게 메시지 전송
//			Map<String, Object> data = new HashMap<>();
//			data.put("message", senderNm + "님이 접속하셨습니다.");
//			data.put("receiverNm", "master");
//			data.put("newOne", senderNm);
//
//			TextMessage msgToMaster = new TextMessage(json.writeValueAsString(data));
//			handleMessage(session, msgToMaster);
//		}

		log.info(session + " client connected");
	}

	// 연결이 종료된 경우 호출되는 메서드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 세션을 세션 리스트에서 제거
		EmployeeVO sessionEmployeeVO = (EmployeeVO) session.getAttributes().get("sender");
		String senderNm = sessionEmployeeVO.getEmplNm();
		sessionList.remove(session);
		onlineList.remove(senderNm);
		userSession.remove(senderNm);

		// 마스터일 경우 모든 사용자에게 메시지 전송
		if (senderNm.equals("master")) {
			TextMessage msg = new TextMessage(senderNm + " 님이 퇴장했습니다.");
			sendToAll(msg, senderNm);
		} else {
			// 일반 사용자의 경우 마스터에게 메시지 전송
			Map<String, Object> data = new HashMap<>();
			data.put("message", senderNm + "님이 퇴장하셨습니다.");
			data.put("receiverNm", "master");
			data.put("outOne", senderNm);

			TextMessage msg = new TextMessage(json.writeValueAsString(data));
			handleMessage(session, msg);
		}

//		log.info(session + " client disconnected");
	}

	// 온라인 사용자 목록을 가져오는 메서드 (현재 사용되지 않음)
	public void getOnlineList() throws IOException {
	}

	// JSON 문자열을 맵으로 변환하는 메서드
	public Map<String, Object> jsonToMap(String jsonString) throws JsonMappingException, JsonProcessingException {
		Map<String, Object> map = new HashMap<>();
		ObjectMapper jmapper = new ObjectMapper();
		map = jmapper.readValue(jsonString, new TypeReference<Map<String, Object>>() {
		});

		return map;
	}

	// 모든 사용자에게 메시지를 전송하는 메서드
	public void sendToAll(TextMessage message, String senderNm) throws Exception {
		// 메시지 데이터를 저장할 맵
		Map<String, Object> dataMap = new HashMap<>();

		// 마스터 상태 확인
		String masterStatus = null;
		if (userSession.containsKey("sender")) {
			masterStatus = "online";
		} else {
			masterStatus = "offline";
		}

		// 현재 시간
		LocalDateTime currentTime = LocalDateTime.now();
		String time = currentTime.format(DateTimeFormatter.ofPattern("hh:mm a E"));

		// 메시지 데이터
		String payload = message.getPayload();

//		log.info("payload >>> " + payload);

		dataMap.put("message", message.getPayload());
		dataMap.put("senderNm", senderNm);
		dataMap.put("time", time);
		dataMap.put("masterStatus", masterStatus);
		dataMap.put("onlineList", onlineList); // 온라인 사용자 목록
		dataMap.put("newOne", "master");

		String receiverNm = (String) dataMap.get("receiverNm");

//		log.info("final dataMap >>> " + dataMap);

		// 모든 사용자에게 메시지 전송
//		log.info("receiver session >>> " + userSession.get(receiverNm));

		for (String r : userSession.keySet()) {
			dataMap.put("receiverNm", r);
			String msg = json.writeValueAsString(dataMap);
			userSession.get(r).sendMessage(new TextMessage(msg));
		}
	}

	// 특정 사용자에게 온라인 사용자 목록을 전송하는 메서드
	public void sendOnlineList(WebSocketSession session) throws IOException {
		Map<String, Object> map = new HashMap<>();

		map.put("onlineList", onlineList);
		String list = json.writeValueAsString(map);

//		log.info("map >>> " + map);
		session.sendMessage(new TextMessage(list));
	}
}
