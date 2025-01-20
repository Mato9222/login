const employeeCalendar = document.querySelector("#employeeCalendar");

//캘린더 헤더 옵션
const headerToolbar = {
	left : "prev next"
	, center : "title"
	, right : "today dayGridMonth"
}

// 캘린더 생성 옵션(참공)
const calendarOption = {
	height : "800px"					// calendar 높이 설정
	, expandRows : true					// 화면에 맞게 높이 재설정
	, headerToolbar : headerToolbar		// 맨 위 헤더 지정
	, initialView : "dayGridMonth"		// default : dayGridMonth "dayGridWeek", "timeGridDay", "listWeek"
	, locale : "kr"						// 언어 설정
	, selectable : true					// 영역 선택
	, selectMirror : true				// 오직 TimeGrid view에만 적용됨, default false
	, navLinks : true					// 날짜, WeekNumber 클릭 여부, default false
//	, weekNumbers : true				// WeekNumber 출력여부, default false
	, dayMaxEventRows : true			// Row 높이보다 많으면 + 숫자 more 링크 보임!
	, nowIndicator : true				// 현재 시간 표시
	, select: function(info) {
		dateSelect(info.start); // 선택된 날짜를 handleDateSelect 함수로 전달
	}
}

function dateSelect(selectedDate) {
//	console.log("너의 값은?",selectedDate)	
	const startOfWeek = moment(selectedDate).startOf("week").format("YYYY-MM-DDTHH:mm");
	const endOfWeek = moment(selectedDate).endOf("week").format("YYYY-MM-DDTHH:mm");
	const startOfMonth = moment(selectedDate).startOf("month").format("YYYY-MM-DDTHH:mm");
	const endOfMonth = moment(selectedDate).endOf("month").format("YYYY-MM-DDTHH:mm");
	
//	console.log("1", startOfWeek)
//	console.log("2", endOfWeek)
//	console.log("3", startOfMonth)
//	console.log("4", endOfMonth)
	
	const weeklyEvents = calendar.getEvents().filter(event => {
		return moment(event.start).isBetween(startOfWeek, endOfWeek, null, "[]");
	});
	
//	console.log("5", weeklyEvents)
	
	const monthlyEvents = calendar.getEvents().filter(event => {
		return moment(event.start).isBetween(startOfMonth, endOfMonth, null, "[]");
	});
	
//	console.log("6", monthlyEvents)
	
	const averageWeekWorkTime = calculateAverageWorkTime(weeklyEvents);
	const averageMonthWorkTime = calculateAverageWorkTime(monthlyEvents);
	
	$("#weekWorkTime").text(averageWeekWorkTime);
	$("#monthWorkTime").text(averageMonthWorkTime);
}

function calculateAverageWorkTime(events) {
	let totalWorkTime = 0;
	let workDayCount = 0;
	let startTime = null;
	let endTime = null;
	
	for(let i = 0; i < events.length; i++) {
		const title = events[i].title;
		
		if(title.includes("퇴근")) {
			const timeOfAttend = events[i - 1].title.substr(5, 5);
			const timeOfLvffc = events[i].title.substr(5, 5);
			
			const attendTimeMoment = moment(timeOfAttend, "HH:mm");
			const lvffcTimeMoment = moment(timeOfLvffc, "HH:mm");
			
			const diffSeconds = lvffcTimeMoment.diff(attendTimeMoment, "seconds");
			totalWorkTime += diffSeconds;
			workDayCount++;
		}
	}

	const averageWorkTimeSeconds = workDayCount ? totalWorkTime / workDayCount : 0;
	return formatTime(averageWorkTimeSeconds);
}

function formatTime(seconds) {
	const workHours = Math.floor(seconds / 3600);
	const workMinutes = Math.floor((seconds % 3600) / 60);
	const workSeconds = seconds % 60;
	
	// 각 시간, 분, 초를 문자열로 변환하고 " : " 구분자로 결합하여 반환
	return [
		String(workHours).padStart(2, "0"),
		String(workMinutes).padStart(2, "0"),
		String(workSeconds).padStart(2, "0").substr(0, 2)
	].join(" : ");
}

function fCalAdd(pList) {
// 여기서 FullCalendar가 원하는 모습으로 데이터 변형이 필요
//	console.log("체크 : ", pList);

	for(let i=0; i<pList.length; i++){
		let startOfList = pList[i].start;
		
		if(!startOfList){
			continue;
		}
		
		let start = startOfList.split(" ")[0]; 
		let time = start + "T" + startOfList.split(" ")[1].substr(0, 5);
		let end = start;

		let title = "출근 = " + startOfList.split(" ")[1].substr(0, 5);
		let event = {
			start
			, end
			, title
			, backgroundColor : "skyblue"
			, borderColor : "skyblue"
		}
		calendar.addEvent(event);   // 출근 넣기
		
		if(pList[i].end){
			title = "퇴근 = " + pList[i].end.split(" ")[1].substr(0, 5);
			let event = {
				start
				, end
				, title
				, backgroundColor : "pink"
				, borderColor : "pink"
			}
			calendar.addEvent(event);   // 퇴근 넣기
		}
//		console.log("체크:",event);
	}
}

// 캘린더 생성
const calendar = new FullCalendar.Calendar(employeeCalendar, calendarOption);
// 캘린더 그리기
calendar.render();
