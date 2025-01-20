var KTGeneralFullCalendarSelectDemos = function () {
 // Private functions

 var exampleSelect = function () {
     // Define variables
     var calendarEl = document.getElementById('kt_docs_fullcalendar_selectable2');

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
});