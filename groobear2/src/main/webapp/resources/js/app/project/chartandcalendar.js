"use strict";

//Class definition
var KTGeneralFullCalendarSelectDemos = function () {
 // Private functions

 var exampleSelect = function () {
     // Define variables
     var calendarEl = document.getElementById('kt_docs_fullcalendar_selectable');

     var calendar = new FullCalendar.Calendar(calendarEl, {
         headerToolbar: {
             left: 'prev,next today',
             center: 'title',
             right: 'dayGridMonth,timeGridWeek,timeGridDay'
         },
         initialDate: '2024-06-12',
         navLinks: true, // can click day/week names to navigate views
         selectable: true,
         selectMirror: true,

         // Create new event
         select: function (arg) {
             Swal.fire({
                 html: '<div class="mb-7">일정을 등록하시겠습니까?</div><div class="fw-bolder mb-5">일정 제목:</div><input type="text" class="form-control" name="event_name" />',
                 icon: "info",
                 showCancelButton: true,
                 buttonsStyling: false,
                 confirmButtonText: "예",
                 cancelButtonText: "아니요",
                 customClass: {
                     confirmButton: "btn btn-primary",
                     cancelButton: "btn btn-active-light"
                 }
             }).then(function (result) {
                 if (result.value) {
                     var title = document.querySelector('input[name="event_name"]').value;
                     if (title) {
                         calendar.addEvent({
                             title: title,
                             start: arg.start,
                             end: arg.end,
                             allDay: arg.allDay
                         })
                     }
                     calendar.unselect()
                 } else if (result.dismiss === 'cancel') {
                     Swal.fire({
                         text: "일정이 등록되지 않았습니다",
                         icon: "error",
                         buttonsStyling: false,
                         confirmButtonText: "확인",
                         customClass: {
                             confirmButton: "btn btn-primary",
                         }
                     });
                 }
             });
         },

         // Delete event
         eventClick: function (arg) {
             Swal.fire({
                 text: '정말로 일정을 삭제하시겠습니까?',
                 icon: "warning",
                 showCancelButton: true,
                 buttonsStyling: false,
                 confirmButtonText: "예",
                 cancelButtonText: "아니요",
                 customClass: {
                     confirmButton: "btn btn-primary",
                     cancelButton: "btn btn-active-light"
                 }
             }).then(function (result) {
                 if (result.value) {
                     arg.event.remove()
                 } else if (result.dismiss === 'cancel') {
                     Swal.fire({
                         text: "일정이 삭제되지 않았습니다",
                         icon: "error",
                         buttonsStyling: false,
                         confirmButtonText: "확인",
                         customClass: {
                             confirmButton: "btn btn-primary",
                         }
                     });
                 }
             });
         },
         editable: true,
         dayMaxEvents: true, // allow "more" link when too many events
         events: [
             {
                 title: 'All Day Event',
                 start: '2024-06-01'
             },
             {
                 title: 'Long Event',
                 start: '2024-06-07',
                 end: '2024-06-10'
             },
             {
                 groupId: 999,
                 title: 'Repeating Event',
                 start: '2024-06-09T16:00:00'
             },
             {
                 groupId: 999,
                 title: 'Repeating Event',
                 start: '2024-06-16T16:00:00'
             },
             {
                 title: 'Conference',
                 start: '2024-06-11',
                 end: '2024-06-13'
             },
             {
                 title: 'Meeting',
                 start: '2024-06-12T10:30:00',
                 end: '2024-06-12T12:30:00'
             },
             {
                 title: 'Lunch',
                 start: '2024-06-12T12:00:00'
             },
             {
                 title: 'Meeting',
                 start: '2024-06-12T14:30:00'
             },
             {
                 title: 'Happy Hour',
                 start: '2024-06-12T17:30:00'
             },
             {
                 title: 'Dinner',
                 start: '2024-06-12T20:00:00'
             },
             {
                 title: 'Birthday Party',
                 start: '2024-06-13T07:00:00'
             },
             {
                 title: 'Click for Google',
                 url: 'http://google.com/',
                 start: '2024-06-28'
             }
         ]
     });

     calendar.render();
 }

 return {
     // Public Functions
     init: function () {
         exampleSelect();
     }
 };
}();

document.addEventListener('DOMContentLoaded',function () {
	// 캘린더
	KTGeneralFullCalendarSelectDemos.init();
	
	// 일감 진행표
	var ctx = document.getElementById('kt_chartjs_1');

	// Define colors
	var primaryColor = KTUtil.getCssVariableValue('--kt-primary');
	var dangerColor = KTUtil.getCssVariableValue('--kt-danger');
	var successColor = KTUtil.getCssVariableValue('--kt-success');

	// Define fonts
	var fontFamily = KTUtil.getCssVariableValue('--bs-font-sans-serif');

	// Chart labels
	const labels = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];

	// Chart data
	const data = {
	    labels: labels,
	    datasets: [{
	        label: "완료됨",
	        data: [0, 
	        	0, 0, 0, 0, 5,0, 0, 0, 0, 0, 0],
	        backgroundColor: successColor
	    }, {
	        label: "진행중",
	        data: [0, 0, 0, 0, 0, 14, 0,0, 0, 0, 0,0],
	        backgroundColor: primaryColor
	    }, {
	        label: "대기중",
	        data: [0, 0, 0, 0, 0, 12, 0 ,0, 0, 0, 0, 0],
	        backgroundColor: dangerColor
	    }]
	};

	// Chart config
	const config = {
	    type: 'bar',
	    data: data,
	    options: {
	        plugins: {
	            title: {
	                display: false,
	            }
	        },
	        responsive: true,
	        interaction: {
	            intersect: false,
	        },
	        scales: {
	            x: {
	                stacked: false, 
	            },
	            y: {
	                stacked: false 
	            }
	        }
	    },
	    defaults:{
	        global: {
	            defaultFont: fontFamily
	        }
	    }
	};
			
	var myChart = new Chart(ctx, config);
// 일감 진행 표 끝 라인

	// 팀월별 표 시작 라인
/*	$.ajax({
			url:'/projectWork/countAllMemberDetailWorkCount',
			method:"GET",
			contentType:"application/json",
			data:JSON.stringify(projectWorkVO),
			success:function(resp){
				console.log("성공",resp);
			}
		})*/
	var element = document.getElementById('kt_apexcharts_1');
    var prjctCodeEl = $('input[name=post_prjctCode]');
    if (!element) {
        console.error('Element with ID "kt_apexcharts_1" not found.');
        return;
    }
    var names = Array.from(document.querySelectorAll('.emplNm')).map(function(el) {
        return el.textContent.trim();
    });
    
	var specificValues = [0, 4, 6, 6, 7];
	var specificValues2 = [0, 0, 0, 0, 1];
    var netProfitData = names.map((n,index) =>{
		console.log("이름",n);
		console.log("index",index);
		return specificValues[index]; 
});
 
  var revenueData = names.map((n,index) =>{
		console.log("이름",n);
		console.log("index",index);
		return specificValues2[index]; 
});
    
    var height = parseInt(KTUtil.css(element, 'height')) || 350; // Fallback height
    var labelColor = KTUtil.getCssVariableValue('--kt-gray-500') || '#6c757d';
    var borderColor = KTUtil.getCssVariableValue('--kt-gray-200') || '#ebedf2';
    var baseColor = KTUtil.getCssVariableValue('--kt-warning') || '#87CEEB';
    var secondaryColor = KTUtil.getCssVariableValue('--kt-gray-300') || '#FFC0CB';

    var options = {
        series: [{
            name: '완료된 일감 개수',
            data: revenueData
        }, {
            name: '총 일감 개수',
            data: netProfitData
        }],
        chart: {
            fontFamily: 'inherit',
            type: 'bar',
            height: height,
            toolbar: {
                show: false
            }
        },
        plotOptions: {
            bar: {
                horizontal: true,
                columnWidth: '30%',
                endingShape: 'rounded'
            }
        },
        legend: {
            show: false
        },
        dataLabels: {
            enabled: false
        },
        stroke: {
            show: true,
            width: 2,
            colors: ['transparent']
        },
        xaxis: {
            categories: names,
            tickAmount: 4, // Ensure there are 5 ticks
            axisBorder: {
                show: false
            },
            axisTicks: {
                show: false
            },
            labels: {
                style: {
                    colors: labelColor,
                    fontSize: '14px', // Increase font size
                    fontWeight: 'bold' // Make font bold
                }
            }
        },
        yaxis: {
            labels: {
                style: {
                    colors: labelColor,
                    fontSize: '14px', // Increase font size
                    fontWeight: 'bold' // Make font bold
                }
            }
        },
        fill: {
            opacity: 1
        },
        states: {
            normal: {
                filter: {
                    type: 'none',
                    value: 0
                }
            },
            hover: {
                filter: {
                    type: 'none',
                    value: 0
                }
            },
            active: {
                allowMultipleDataPointsSelection: false,
                filter: {
                    type: 'none',
                    value: 0
                }
            }
        },
        tooltip: {
            style: {
                fontSize: '14px' // Increase tooltip font size
            },
            y: {
                formatter: function (val) {
                    return val + ' 개'
                }
            }
        },
        colors: [baseColor, secondaryColor],
        grid: {
            borderColor: borderColor,
            strokeDashArray: 4,
            yaxis: {
                lines: {
                    show: true
                }
            }
        }
    };

    var chart = new ApexCharts(element, options);
    chart.render();
		//팀원별 일감 라인 끝
});