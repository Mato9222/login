// 출근 버튼
$("#attendBtn").on("click", function() {
	$.ajax({
		url : "/attendance/" + dclzNo + "/ATTEND"
		, method : "POST"
		, dataType : "text"
		, success : function(data){
			swal.fire({
				text : "출근 !!"
				, icon : "success"
				, buttonsStyling : false
				, confirmButtonText : "확인"
				, customClass : {
					confirmButton : "btn fw-bold btn-light-primary"
				}
		    }).then((result) => {
				if (result.isConfirmed) {
					location.reload();
				}
		    });
		} 
	})
});

// 퇴근 버튼
$("#lvffcBtn").on("click", function() {
	$.ajax({
		url : "/attendance/" + dclzNo + "/LVFFC"
		, method : "POST"
		, dataType : "text"
		, success : function(data){
			swal.fire({
				text : "퇴근 !!!!"
				, icon : "success"
				, buttonsStyling : false
				, confirmButtonText : "확인"
				, customClass : {
					confirmButton : "btn fw-bold btn-light-primary"
				}
		    }).then((result) => {
				if (result.isConfirmed) {
					location.reload();
				}
		    });
		} 
	})
});

// 시차 계산 함수
function timeDifferenceFormat(startTime, endTime) {
	const timeDifference = endTime - startTime;
	
	const hours = Math.floor(timeDifference / 3600000);
	const minutes = Math.floor((timeDifference % 3600000) / 60000);
	const seconds = Math.floor((timeDifference % 60000) / 1000);
	
	return [
		String(hours).padStart(2, "0")
		, String(minutes).padStart(2, "0")
		, String(seconds).padStart(2, "0")
	]. join(" : ");
}

// 근무 시간 계산 함수
function updateWorkTime() {
	let attendTimeText = $("#attendTime").text();
	let lvffcTimeText = $("#lvffcTime").text();
	
	if (attendTimeText) {
		let attendTime = new Date(attendTimeText);
		let lvffcTime = lvffcTimeText ? new Date(lvffcTimeText) : new Date();
		
		let workTimeText = timeDifferenceFormat(attendTime, lvffcTime);
		$("#workTime").text(workTimeText);
	}
	else {
		$("#workTime").text("-- : -- : --");
	}
}

// 1초마다 갱신
let workTimeInterval = setInterval(updateWorkTime, 1000);