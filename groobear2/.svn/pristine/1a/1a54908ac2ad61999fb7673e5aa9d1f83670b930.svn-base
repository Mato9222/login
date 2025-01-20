document.addEventListener("DOMContentLoaded", () => {
	console.log("realGantt==>",gantt);
	 var prjctCodeEle = $('input[name=post_prjctCode]');
	 console.log("heyMan ==>",prjctCodeEle);
	var gantt2 = document.querySelector('#gantt_here');
	console.log("gantt===>>>",gantt);
	gantt.config.xml_date = "%Y-%m-%d";
	gantt.config.columns = [
		{ name: "text2", label:"팀원 이름",align: "center",width:100},
        { name: "text", label: "제목", width: 200, tree: true },
        { name: "start_date", label: "시작일", align: "center", width: 150 },
        { name: "duration", label: "총 일수", align: "center" },
    ];
	gantt.init(gantt2);
	
	 let prjctCode = prjctCodeEle.val();
	 console.log("heyMan ==>",prjctCode);
		$.ajax({
			url:`/projectWork/${prjctCode}/workList`,
			method:'GET',
			success:function(resp){
					console.log("리스트=>",resp);
				   let tasks = resp.map(function(e) {
		                return {
		                	text2: e.emplNm2, // Assuming worksNo is the unique identifier for the task
		                    text: e.worksTitle,
		                    start_date: e.bgnde,
		                    duration: (new Date(e.closOn) - new Date(e.bgnde)) / (1000 * 60 * 60 * 24), // duration in days
		                    progress: e.progrsRt / 100 // Assuming progrsRt is a percentage
		                };
		            });
		            gantt.parse({ data: tasks });
			}
		})
	     
    })