<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
body {
	background-color: #f4f7f6;
	margin-top: 20px;
}

.d-flex {
	display: flex !important;
}

.card {
	background: #fff;
	transition: .5s;
	border: 0;d-inline-block
	border-radius: .55rem;
	position: relative;
	width: 100%;
	box-shadow: 0 1px 2px 0 rgb(0 0 0/ 10%);
}

.chat-app .people-list {
	width: 280px;
	position: absolute;
	left: 0;
	top: 0;
	padding: 20px;
	z-index: 7;
}

.chat-app .chat {
	margin-left: 280px;
	border-left: 1px solid #eaeaea;
}

.people-list {
	-moz-transition: .5s;
	-o-transition: .5s;
	-webkit-transition: .5s;
	transition: .5s;
}

.people-list .chat-list li {
	padding: 10px 15px;
	list-style: none;
	border-radius: 3px;
}

.people-list .chat-list li:hover {
	background: #efefef;
	cursor: pointer;
}

.people-list .chat-list li.active {
	background: #efefef;
}

.people-list .chat-list li .name {
	width: 50px;
	font-size: 15px;
}

.people-list .chat-list img {
	width: 50px;
	height: 50px;
	border-radius: 50%;
}

.people-list img {
	float: left;
	width: 50px;
	height: 50px;
	border-radius: 50%;
}

.people-list .about {
	float: left;
	padding-left: 8px;
}

.people-list .status {
	color: #999;
		font-size: 13px;
}

.chat .chat-header {
	padding: 15px 20px;
	border-bottom: 2px solid #f4f7f6;
}

.chat .chat-header img {
	float: left;
	width: 50px;
	height: 50px;
	border-radius: 50%;
}

.chat .chat-header .chat-about {
	float: left;
	padding-left: 10px;
}

.chat .chat-history {
	padding: 20px;
	border-bottom: 2px solid #fff;
}

.chat .chat-history ul {
	padding: 0;
}

.chat .chat-history ul li {
	list-style: none;
	margin-bottom: 30px;
}

.chat .chat-history ul li:last-child {
	margin-bottom: 0px;
}

.chat .chat-history .message-data {
	margin-bottom: 15px;
}

.chat .chat-history .message-data img {
	border-radius: 40px;
	width: 50px;
	height: 50px;
}

.chat .chat-history .message-data-time {
	color: #434651;
	padding-left: 6px;
}

.chat .chat-history .message {
	color: #444;
	padding: 18px 20px;
	line-height: 26px;
	font-size: 16px;
	border-radius: 7px;
	display: inline-block;
	position: relative;
}

.chat .chat-history .message:after {
	bottom: 100%;
	left: 7%;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
	border-bottom-color: #fff;
	border-width: 10px;
	margin-left: -10px;
}

.chat .chat-history .my-message {
	background: #e8f1f3;
}

.chat .chat-history .my-message:after {
	bottom: 100%;
	left: 30px;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
	border-bottom-color: #e8f1f3;
	border-width: 10px;
	margin-left: -10px;
}

.d-flex {
	display: flex !important;
}

.align-items-center {
	align-items: center !important;
}

.justify-content-center {
	justify-content: center !important;
}

.chat .chat-history .other-message {
	background: #efefef;
	text-align: right;
}

.d-none {
	display: none !important;
}

.d-block {
	display: block !important;
}

.chat .chat-history .other-message:after {
	border-bottom-color: #efefef;
	left: 93%;
}

.chat .chat-message {
	padding: 20px;
}

.online, .offline, .me {
	margin-right: 2px;
	font-size: 8px;
	vertical-align: middle;
}

.online {
	color: #86c541;
}

.offline {
	color: #e47297;
}

.me {
	color: #1d8ecd;
}

.float-right {
	/*     float: right; */
	text-align: right;
	margin-right: 5%;
}

.circle {
	border-radius: 50%;
	width: 25px;
	height: 25px;
	background-color: red;
	margin-right: 25px;
	float: right;
}

.staging-count {
	color: white;
}

.clearfix:after {
	visibility: hidden;
	display: block;
	font-size: 0;
	content: " ";
	clear: both;
	height: 0;
}

.input-group-prepend {
	width: 100%;
	height: 35px;
}

.input-group-prepend input {
	width: 85%;
	height: 100%;
}

.input-group-prepend button {
	height: 90%;
	margin-left: 10px;
}

#myNm {
	font-size: 15px;
}

@media only screen and (max-width: 767px) {
	.chat-app .people-list {
		height: 465px;
		width: 100%;
		overflow-x: auto;
		background: #fff;
		left: -400px;
		display: none;
	}
	.chat-app .people-list.open {
		left: 0;
	}
	.chat-app .chat {
		margin: 0;
	}
	.chat-app .chat .chat-header {
		border-radius: 0.55rem 0.55rem 0 0;
	}
	.chat-app .chat-history {
		height: 300px;
		overflow-x: auto;
	}
}

@media only screen and (min-width: 768px) and (max-width: 992px) {
	.chat-app .chat-list {
		height: 600px;
		overflow-x: auto;
	}
	.chat-app .chat-history {
		height: 70%;
		overflow-x: auto;
	}
}

@media only screen and (min-device-width: 768px) and (max-device-width:
	1024px) and (orientation: landscape) and
	(-webkit-min-device-pixel-ratio: 1) {
	.chat-app .chat-list {
		height: 480px;
		overflow-x: auto;
	}
	.chat-app .chat-history {
		height: calc(100vh - 350px);
		overflow-x: auto;
	}
}
</style>
<div class="container">
	<div class="row clearfix">
		<div class="col-lg-12">
			<div class="card chat-app">
				<!-- 사용자 목록 -->
				<div id="plist" class="people-list">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="검색">
					</div>
					<ul id="online-user" class="list-unstyled chat-list mt-2 mb-0 scroll-y h-700px">
						<!-- 직원 목록을 순회하며 사용자 목록 생성 -->
						<c:forEach var="employee" items="${employeeList}">
							<c:if test="${employee.emplId ne sender.emplId}">
								<li class="clearfix" onclick="activeToggle(this)" id="${employee.emplId}" style="display: flex; align-items: center;">
									<img src="${pageContext.request.contextPath}/resources/image/${employee.proflPhotoCours}" alt="image" class="rounded-3" />
									<div class="about">
										<div id="${employee.emplId}" class="name d-inline-block">${employee.emplNm}</div>
										<div class="badge badge-lg badge-light-primary d-inline-block">${employee.ofcpsCodeNm}</div>
										<div id="master-status" class="status" style="display: none">
											<i id="master-status-icon" class="fa fa-circle offline" style="display: none"></i>
											<span id="master-status-content" style="display: none">offline</span>
										</div>
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
				<!-- 채팅 섹션 -->
				<div class="chat">
					<div class="chat-header clearfix">
						<div class="row">
							<div class="col-lg-6" style="display: flex; align-items: center;">
								<!-- 사용자의 프로필 이미지 및 이름 표시 -->
								<a href="javascript:void(0);" data-toggle="modal" data-target="#view_info">
									<img id="myImg" src="${pageContext.request.contextPath}/resources/image/${sender.proflPhotoCours}" alt="image" class="rounded-3" />
								</a>
								<div class="chat-about">
									<!-- 세션 ID 표시 -->
									<span id="myNm" class="m-b-0">${sender.emplNm}</span>
								</div>
							</div>
						</div>
					</div>
					<div class="chat-history">
						<!-- 채팅 내용이 표시될 영역 -->
						<ul style="overflow: scroll; height: 600px;" id="chat-content" class="m-b-0"></ul>
					</div>
					<div class="chat-message clearfix">
						<div class="input-group-prepend d-flex mb-0">
							<!-- 메시지 입력란 -->
							<input id="msg" type="text" onkeydown="if(event.keyCode==13){send()}" class="form-control" placeholder="문자 입력">
							<!-- 메시지 전송 버튼 -->
							<button id="button-send" type="button" class="input-group-text" data-toggle="tooltip" data-placement="top" title="send a message">
								<i class="fas fa-paper-plane"></i>
							</button>
							<!-- 채팅 나가기 버튼 -->
							<button id="disconn" type="button" class="input-group-text" data-toggle="tooltip" data-placement="top" title="Out from chat">
								<i class="fas fa-sign-out-alt"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- JavaScript 코드 -->
<script type="text/javascript">
	// 내 ID 가져오기
	var myNm = document.querySelector("#myNm").textContent;
	var receiverNm;
	var receiverId;
	var preOnlineList;
	var masterStatusContent;
	var preMasterStatus;
	var masterStatus;
	
	// 내 ID가 ${sender.emplNm}가 아니면 수신자 ID를 ${employee.emplId}로 설정
	if(myNm != "${sender.emplNm}") {
    	receiverNm = "";
	} else {
	    // ${sender.emplNm}인 경우 프로필 이미지 설정
	    document.querySelector("#myImg").src = "${pageContext.request.contextPath}/resources/image/${sender.proflPhotoCours}";
	}
	
	// 로그아웃 버튼 클릭 시 창 닫기
	document.querySelector("#disconn").addEventListener("click", (e) => {
    	window.close();
	});
	
	// 메시지 전송 버튼 클릭 시 send 함수 호출
	document.querySelector("#button-send").addEventListener("click", (e) => {
    	send();
	});
	
	// WebSocket 설정
	const websocket = new WebSocket("ws://192.168.142.4/ws/chat");
	websocket.onmessage = onMessage;
	websocket.onopen = onOpen;
	websocket.onclose = onClose;
	
	// 메시지 전송 함수
	function send(){
		var message = document.querySelector("#msg").value;
		// 메시지가 비어 있지 않으면 전송
		if(message != "") {            
			let msg = {
				"receiverNm" : receiverNm,
				"message" : message
			};
			
			if(message != null) {
				websocket.send(JSON.stringify(msg));
			}
			document.querySelector("#msg").value = "";
		}
	}
	
	// 채팅 방 나가기 함수
	function onClose(evt) {
		console.log("close event : " + evt);
		console.log("close event : ", websocket);
	}
	
	// 채팅 방 입장 함수
	function onOpen(evt) {
		console.log("open event : " + evt);
		console.log("open event : ", websocket);
	}
	
	// 메시지 수신 함수
	function onMessage(msg) {
		// master 상태 내용 요소 선택
		masterStatusContent = document.querySelector("#master-status-content");     
		// 이전 master 상태 저장
		preMasterStatus = masterStatusContent.innerHTML;
		
		// 1번 콘솔: 수신된 메시지 데이터 로그
		console.log("1번 콘솔 msg.data >>> ", msg.data);
		// 수신된 메시지를 JSON 객체로 파싱
		var data = JSON.parse(msg.data);
		
		// 온라인 사용자 목록 추출
		var onlineList = data.onlineList;
		// 2번 콘솔: 온라인 사용자 목록 로그
		console.log("2번 콘솔 onlineList >>>> ", onlineList);
		
		// 발신자 ID 추출
		var senderNm = data.senderNm;
		// 3번 콘솔: 발신자 ID 로그
		console.log("3번 콘솔 senderNm >>> ", senderNm);
		
		// 메시지 내용 추출
		var message = data.message;
		// 4번 콘솔: 메시지 내용 로그
		console.log("4번 콘솔 message >>> ", message);
		
		// 메시지 시간 추출
		var time = data.time;
		// 메시지 시간 로그
		console.log("time >>> ", time);
		
		// master 상태 추출
		masterStatus = data.masterStatus;
		// 5번 콘솔: 이전 master 상태 로그
		console.log("5번 콘솔 preMasterStatus >>> ", preMasterStatus);
		// 6번 콘솔: 현재 master 상태 로그
		console.log("6번 콘솔 masterStatus >>> ", masterStatus);
		
		// 새로운 사용자 정보 추출
		var newOne = data.newOne;
		// 7번 콘솔: 새로운 사용자 로그
		console.log("7번 콘솔 newOne >>> ", newOne);
		
		// 로그아웃한 사용자 정보 추출
		var outOne = data.outOne;
		// 8번 콘솔: 로그아웃한 사용자 로그
		console.log("8번 콘솔 outOne >>> ", outOne);
		
		// 새로운 사용자가 로그인한 경우
		if(newOne != null) {
			console.log("new One is not null");
			// 현재 사용자가 master인 경우
			if(myNm == "${sender.emplNm}" && newOne == "${sender.emplNm}") {
				// 전체 온라인 사용자 목록 갱신
				getOnlineList(onlineList);
			} else if(myNm == "${sender.emplNm}" && newOne != "${sender.emplNm}") {
			    // 새로운 사용자 목록에 추가
				console.log("new one login >>>> " , newOne);
				insertOnlineList(newOne);
			}
		}
		// 사용자가 로그아웃한 경우
		if(outOne != null && myNm == "${sender.emplNm}") {
			// 로그아웃한 사용자 목록에서 제거
			console.log("user disconnect >>> ", outOne);
			deleteOnlieList(outOne);
		}
		
		// 메시지를 저장하거나 표시
		if(myNm=="${sender.emplNm}" && senderNm != "${sender.emplNm}" && receiverNm != senderNm) {
			// 대기 메시지로 저장
			addStagingMessage(senderNm, time, message);
		} else {
			// 메시지를 채팅 창에 표시
			insertMessage(senderNm, time, message);
		}
		
		// master 상태 업데이트
		updateMasterStatus();
		// 스크롤을 가장 아래로 이동
		scrollDown();
	}
	
	// 메시지 삽입 함수
	function insertMessage(senderNm, time, message) {
		// 채팅 내용이 표시될 요소 선택
		var chatContent = document.querySelector("#chat-content");
		
		// 보낸 사람이 나인 경우
		if(senderNm == myNm) {
			// 나에게 보내는 메시지 삽입
			var li = document.createElement("li");
			li.classList.add("message-li", "clearfix", "float-right"); // 오른쪽 정렬
			
			// 메시지 정보 (시간) 요소 생성
			var infoDiv = document.createElement("div");
			infoDiv.classList.add("message-data");
			li.appendChild(infoDiv);
			
			// 시간 정보 요소 생성 및 추가
			var timeSpan = document.createElement("span");
			timeSpan.classList.add("message-data-time");
			timeSpan.textContent = time;
			infoDiv.appendChild(timeSpan);
			
			// 메시지 내용 요소 생성 및 추가
			var msgDiv = document.createElement("div");
			msgDiv.classList.add("message", "my-message"); // 나의 메시지 스타일
			msgDiv.textContent = message;
			li.appendChild(msgDiv);
			
			// 메시지 리스트에 요소 추가
			chatContent.appendChild(li);
		} else {
			// 다른 사람에게 보내는 메시지 삽입
			var li = document.createElement("li");
			li.classList.add("message-li", "clearfix"); // 기본 정렬 (왼쪽)
			
			// 메시지 정보 (시간) 요소 생성
			var infoDiv = document.createElement("div");
			infoDiv.classList.add("message-data");
			li.appendChild(infoDiv);
			
			// 시간 정보 요소 생성 및 추가
			var timeSpan = document.createElement("span");
			timeSpan.classList.add("message-data-time");
			timeSpan.textContent = time;
			infoDiv.appendChild(timeSpan);
			
			// 메시지 내용 요소 생성 및 추가
			var msgDiv = document.createElement("div");
			msgDiv.classList.add("message", "other-message"); // 다른 사람의 메시지 스타일
			msgDiv.textContent = message;
			li.appendChild(msgDiv);
			
			// 메시지 리스트에 요소 추가
			chatContent.appendChild(li);
		}
	}
	
	// 스테이징 메시지 저장 함수
	function addStagingMessage(senderNm, time, message) {
		// 스테이징 메시지를 저장할 컨테이너 배열 선언
		var container = [];
		
		// 저장할 메시지 데이터를 객체로 생성
		var data = {
			"time": time,
			"message": message,
			"senderNm": senderNm
		};
		console.log("staging message data >>> ", data);
		
		// 해당 발신자의 메시지가 이미 세션 스토리지에 존재하는 경우
		if(sessionStorage.getItem(senderNm) != null) {
			// 세션 스토리지에서 기존 메시지들을 불러와서 컨테이너 배열에 추가
			container = JSON.parse(sessionStorage.getItem(senderNm));
			console.log("staging message container >>> ", container);
			container.push(data);
		} else {
			// 존재하지 않는 경우 새로운 데이터만 컨테이너 배열에 추가
			container.push(data);
		}
		
		// 세션 스토리지에 발신자 ID를 키로 하여 업데이트된 컨테이너 배열을 저장
		sessionStorage.setItem(senderNm, JSON.stringify(container));
		
	    // senderNm에 해당하는 요소가 존재하면
		if (document.getElementById(senderNm) != null) {
		
			// senderNm 요소 내에서 "circle" 클래스를 가진 요소를 선택
			var circle = document.getElementById(senderNm).querySelector(".circle");
			
			// "circle" 요소 내에서 "staging-count" 클래스를 가진 요소를 선택
			var count = document.getElementById(senderNm).querySelector(".circle > .staging-count");
			
			// "staging-count" 요소의 텍스트 콘텐츠를 가져옴
			var n = count.textContent;
			
			// 텍스트 콘텐츠가 비어있으면 n을 0으로 설정
			if (n == "") {
				n = 0;
			}
			
			// n을 숫자로 변환하고 1 증가
			n++;
			
			// "circle" 요소에서 "d-none" 클래스를 제거하여 표시
			circle.classList.remove("d-none");
			
			// "staging-count" 요소의 텍스트 콘텐츠를 증가된 n 값으로 업데이트
			count.textContent = n;
		}
	}
	
	// 액티브 상태 토글 함수
	function activeToggle(element) {
		// "active" 클래스가 없으면 추가, 있으면 제거
		if (!element.classList.contains("active")) {
			element.classList.add("active");
		} else {
			element.classList.remove("active");
		}
		
		// 이전 수신자 ID를 저장하고 새로운 수신자 ID를 업데이트
		var prereceiverNm = receiverNm;
		receiverNm = element.querySelector(".about > .name").textContent;
		
		var prereceiverId = receiverId;
		receiverId = element.querySelector(".about > .name").id;
		
		// 디버그용 로그 출력
		console.log("<<<< toggleAction >>>>>");
		console.log("receiverNm >>> ", receiverNm);
		console.log("prereceiverNm >>> ", prereceiverNm);
		
		// 새로운 수신자 ID가 이전 수신자 ID와 다르고, 이전 수신자 ID가 null이 아니면 "active" 클래스 제거
		if (receiverNm != prereceiverNm && prereceiverNm != null){
			document.getElementById(prereceiverId).classList.remove("active");
		}
		
		// 이전 수신자의 채팅 기록을 설정
		setChatHistory(prereceiverNm);
		
		// 채팅 내용을 초기화
		document.querySelector("#chat-content").innerHTML = "";
		
		// 새로운 수신자의 채팅 기록을 가져오기
		getChatHistory(receiverNm);
		
		// 채팅 섹션을 나누기
		divideChatSection(receiverNm);
		
		// 새로운 수신자의 "circle" 요소가 존재하면
		if (document.getElementById(receiverId).querySelector(".circle") != null) {
			// "staging-count" 요소의 텍스트 콘텐츠를 비우고 "d-none" 클래스를 추가하여 숨기기
			document.getElementById(receiverId).querySelector(".circle > .staging-count").textContent = "";
			document.getElementById(receiverId).querySelector(".circle").classList.add("d-none");
		}
	}
	
	// 온라인 사용자 목록 가져오기 함수
	function getOnlineList(onlineList) {
		// 온라인 사용자 목록을 표시할 요소 선택
		var onlineUser = document.querySelector("#online-user");
		
		// 온라인 사용자 목록을 초기화
		onlineUser.innerHTML = "";
		
		// 온라인 사용자 목록에 각 사용자를 추가
		onlineList.forEach(user => {
			insertOnlineList(user);
		});
	}
	
	// 온라인 사용자 목록에 사용자 추가 함수
	function insertOnlineList(user) {
		// 사용자가 목록에 없는 경우에만 추가
		if (document.getElementById(user) == null) {
			// 온라인 사용자 목록 요소 선택
			var onlineUser = document.querySelector("#online-user");
			
			// 새로운 사용자를 위한 리스트 아이템 생성
			var li = document.createElement("li");
			li.classList.add("clearfix");
			li.setAttribute("onclick", "activeToggle(this)");
			li.setAttribute("id", user);
			
			// 사용자 이미지 생성
			var img = document.createElement("img");
			var src = "resources/image/" + data.proflPhotoCours; // 이미지 소스
			img.setAttribute("src", src);
			img.setAttribute("alt", "guest");
			
			// 사용자 정보 생성
			var aboutDiv = document.createElement("div");
			aboutDiv.classList.add("about");
			var name = document.createElement("div");
			name.classList.add("name");
			name.textContent = user; // 사용자 이름 설정
			aboutDiv.appendChild(name);
			
			// 사용자 상태 생성
			var statusDiv = document.createElement("div");
			statusDiv.classList.add("status");
			var icon = document.createElement("i");
			icon.setAttribute("id", "master-status-icon");
			icon.classList.add("fa", "fa-circle", "online"); // 온라인 상태 아이콘 설정
			var span = document.createElement("span");
			span.setAttribute("id", "master-status-content");
			span.textContent = "online"; // 사용자 상태 설정
			statusDiv.appendChild(icon);
			statusDiv.appendChild(span);
			aboutDiv.appendChild(statusDiv);
			
			li.appendChild(img);
			li.appendChild(aboutDiv);
			
			// 알림 아이콘 생성
			var alertDiv = document.createElement("div");
			alertDiv.classList.add("circle", "d-flex", "align-items-center", "justify-content-center", "d-none");
			aspan = document.createElement("span");
			aspan.classList.add("staging-count"); // 스테이징 카운트 클래스
			alertDiv.appendChild(aspan);
			li.appendChild(alertDiv);
			
			// 목록에 리스트 아이템 추가
			onlineUser.appendChild(li);
		}
	}
	
	// 온라인 사용자 목록에서 사용자 삭제 함수
	function deleteOnlieList(data) {
		// 지정한 사용자 ID를 가진 리스트 아이템을 찾음
		var li = document.getElementById(data);
		
		// 온라인 사용자 목록에서 해당 리스트 아이템을 제거
		document.getElementById("online-user").removeChild(li);
	}
	
	// 특정 사용자와의 채팅 섹션을 분리하여 표시하는 함수
	function divideChatSection(receiverNm){
		// 대화 창을 만들고 대화 상대와의 대화 시작을 보여줌
		var div = document.createElement("div");
		div.classList.add("clearfix");
		var str = receiverNm + "님과의 대화"; // 대화 상대와의 대화 시작 문구 생성
		var hr = document.createElement("hr"); // 가로줄 생성
		
		// 대화 창에 대화 시작 문구와 가로줄 추가
		div.textContent = str;
		div.appendChild(hr);
		
		// 대화 내용이 표시될 영역에 대화 창 추가
		var chatContent = document.querySelector("#chat-content");
		chatContent.appendChild(div);
		
		// 대화 내용 영역을 스크롤 다운하여 가장 최근의 대화가 보임
		scrollDown();
	}
	
	// 마스터 상태를 업데이트하는 함수
	function updateMasterStatus(){
		// 이전 마스터 상태와 현재 마스터 상태를 비교하여 변경된 경우에만 실행
		if(preMasterStatus != masterStatus) {
			// 마스터 상태를 나타내는 아이콘 요소를 가져옴
			var icon = document.getElementById("master-status-icon");
			
			// 마스터 상태에 따라 아이콘 클래스를 변경
			if(masterStatus == "online") {
				icon.classList.remove("offline");
				icon.classList.add("online");
			} else {
				icon.classList.remove("online");
				icon.classList.add("offline");
			}
			
			// 마스터 상태를 화면에 업데이트
			masterStatusContent.innerHTML = masterStatus;
		}
	}
	
	// 채팅 기록을 저장하는 함수
	function setChatHistory(name){
		var value = [];
		// 각 채팅 메시지 요소를 순회하면서 데이터를 수집
		document.querySelectorAll(".message-li").forEach(item => {
			var time = item.querySelector(".message-data > .message-data-time").textContent;
			var message = item.querySelector(".message").textContent;
			var senderNm;
			// 메시지가 자신이 보낸 것인지 확인하고 senderNm를 설정
			var type = item.querySelector(".message").classList[1];
			if(type == "my-message"){
				senderNm = myNm;
			} else {
				senderNm = name;
			}
			
			// 채팅 데이터를 객체로 생성하여 배열에 추가
			var data = {
				"time": time,
				"message": message,
				"senderNm": senderNm
			};
			value.push(data);
		});
		
		// 세션 스토리지에 채팅 기록을 저장
		sessionStorage.setItem(name, JSON.stringify(value));
	}
	
	// 이전 채팅 기록을 가져와서 화면에 출력하는 함수
	function getChatHistory(name){
		var data = JSON.parse(sessionStorage.getItem(name));
		
		// 세션 스토리지에서 데이터를 가져와서 채팅 내용에 삽입
		if(data != null) {
			data.forEach(item => {
				var time = item.time;
				var message = item.message;
				var senderNm = item.senderNm;
				
				insertMessage(senderNm, time, message);
			});
		}
	}
	
	// 채팅 내용을 스크롤하여 최신 메시지를 보여주는 함수
	function scrollDown() {
		// 채팅 내용이 표시되는 영역의 스크롤을 가장 아래로 이동
		var chatContent =  document.querySelector("#chat-content");
		chatContent.scrollTop = chatContent.scrollHeight;
	}
</script>