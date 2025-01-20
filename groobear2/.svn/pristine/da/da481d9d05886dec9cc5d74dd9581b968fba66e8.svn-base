"use strict";

// Class definition
var KTAppCalendar = function () {
    // Shared variables
    // Calendar variables
    var calendar;
    var data = {
        schdulNo: '',
      emplNo:'',
        schdulSj: '',
        schdulCn: '',
        schdulPlace: '',
        schdulIemCode:'',
        schdulBeginDate: '',
        schdulEndDate: '',
        allDay: '',
    };
    

    // Add event variables
   var emplNo;
    var allDay;
    var schdulNo;
    var schdulSj;
    var schdulCn;
    var schdulPlace;
    var schdulIemCode;
    var schdulBeginDatepicker;
    var startFlatpickr;
    var schdulEndDatepicker;
    var endFlatpickr;
    var startTimepicker;
    var startTimeFlatpickr;
    var endTimepicker
    var endTimeFlatpickr;
    var modal;
    var modalTitle;
    var form;
    var validator;
    var addButton;
    var submitButton;
    var cancelButton;
    var closeButton;
    var datepickerWrappers;
    var allDayToggle;

    // View event variables
    var viewschdulSj;
    var viewAllDay;
    var viewschdulIemCode;
    var viewschdulCn;
    var viewschdulPlace;
    var viewschdulBeginDate;
    var viewschdulEndDate;
    var viewModal;
    var viewEditButton;
    var viewDeleteButton;


    // Private functions
    var initCalendarApp = function () {
        // Define variables
        var calendarEl = document.getElementById('kt_calendar_app');
        var todayDate = moment().startOf('day');
        var YM = todayDate.format('YYYY-MM');
        var YESTERDAY = todayDate.clone().subtract(1, 'day').format('YYYY-MM-DD');
        var TODAY = todayDate.format('YYYY-MM-DD');
        var TOMORROW = todayDate.clone().add(1, 'day').format('YYYY-MM-DD');

        // Init calendar --- more info: https://fullcalendar.io/docs/initialize-globals
        calendar = new FullCalendar.Calendar(calendarEl, {
            //locale: 'es', // Set local --- more info: https://fullcalendar.io/docs/locale
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay'
            },
            initialDate: TODAY,
            navLinks: true, // can click day/week names to navigate views
            selectable: true,
            selectMirror: true,

            // Select dates action --- more info: https://fullcalendar.io/docs/select-callback
            select: function (arg) {
                console.log("arg====>",arg);
                formatArgs(arg);
                handleNewEvent();
            },

            // Click event --- more info: https://fullcalendar.io/docs/eventClick
            eventClick: function (arg) {
                console.log("arg====>",arg);
                formatArgs({
                    id: arg.event.id,
               empl:arg.event.extendedProps.empl,
                    title: arg.event.title,
                    // 정규 변수가 아니기 때문에 extendedProps로 세개의 데이터를 변환
                    description: arg.event.extendedProps.description,
                    location: arg.event.extendedProps.location,
                    type:arg.event.extendedProps.type,
                    
               startStr: arg.event.startStr,
                    endStr: arg.event.endStr,
                    allDay: arg.event.allDay
                });
                
                handleViewEvent();
            },

            editable: true,
            dayMaxEvents: true, // allow "more" link when too many events
           events: function(info, successCallback, failureCallback) {
             fetch("/schedule/selectList")
               .then(resp=>resp.json())
               .then(json=>{
                  json = json.map(o=>{
                     let bcolor = null;
                            console.log("o.schdulIemCode==>",o.schdulIemCode);
                     switch(o.schdulIemCode){
                        case "L01":
                           bcolor = "rgba(var(--bs-success-rgb)";
                           break;
                                case "L02":
                                    bcolor = "rgba(var(--bs-primary-rgb)";
                                    break;
                                case "L03":
                                    bcolor = "#e7c73a";
                                    break;
                        default :
                           bcolor = "green";
                           break;                           
                     }
                     let obj = {
                        ...o,
                        display:'block',
                        backgroundColor:bcolor,
                        end: moment(o.end).add(1, 'day')
                     };   
                     return data2Event(obj);                  
                  });
                  console.log(json)
                  successCallback(json)
               })
               .catch(failureCallback);  
              },

            

            // Handle changing calendar views --- more info: https://fullcalendar.io/docs/datesSet
            datesSet: function(){
                // do some stuff
            }
        });

        calendar.render();
    }
    
    // Init validator(검증)
    const initValidator = () => {
        // Init form validation rules. For more info check the FormValidation plugin's official documentation:https://formvalidation.io/
        validator = FormValidation.formValidation(
            form,
            {
                fields: {
                    'calendar_event_name': {
                        validators: {
                            notEmpty: {
                                message: '일정 제목이 입력되지 않았습니다.'
                            }
                        }
                    },
                    'calendar_event_start_date': {
                        validators: {
                            notEmpty: {
                                message: '시작일을 입력하지 않았습니다.'
                            }
                        }
                    },
                    'calendar_event_end_date': {
                        validators: {
                            notEmpty: {
                                message: '종료일을 입력하지 않았습니다.'
                            }
                        }
                    }
                },

                plugins: {
                    trigger: new FormValidation.plugins.Trigger(),
                    bootstrap: new FormValidation.plugins.Bootstrap5({
                        rowSelector: '.fv-row',
                        eleInvalidClass: '',
                        eleValidClass: ''
                    })
                }
            }
        );
    }

    // Initialize datepickers --- more info: https://flatpickr.js.org/
    const initDatepickers = () => {
        startFlatpickr = flatpickr(schdulBeginDatepicker, {
            enableTime: false,
            dateFormat: "Y-m-d",
        });

        endFlatpickr = flatpickr(schdulEndDatepicker, {
            enableTime: false,
            dateFormat: "Y-m-d",
        });

        startTimeFlatpickr = flatpickr(startTimepicker, {
            enableTime: true,
            noCalendar: true,
            dateFormat: "H:i",
        });

        endTimeFlatpickr = flatpickr(endTimepicker, {
            enableTime: true,
            noCalendar: true,
            dateFormat: "H:i",
        });
    }

    // Handle add button
    const handleAddButton = () => {
        addButton.addEventListener('click', e => {
            // Reset form data
            data = {
            schdulNo:'',
            emplNo:'',
                schdulSj: '',
                schdulCn: '',
                schdulIemCode: '일정 선택',
                schdulBeginDate: new Date(),
                schdulEndDate: new Date(),
                allDay: '',
            };
            handleNewEvent();
        });
    }

    // Handle add new event
    const handleNewEvent = () => {
        // Update modal title
        modalTitle.innerText = "일정 등록";

        modal.show();

        populateForm(data);

        // Handle submit form
        submitButton.addEventListener('click', function (e) {
            // Prevent default button action
            e.preventDefault();

            // Validate form before submit
            if (validator) {
                validator.validate().then(function (status) {
                    console.log('validated!');

                    if (status == 'Valid') {
                        // Show loading indication
                        submitButton.setAttribute('data-kt-indicator', 'on');

                        // Disable submit button whilst loading
                        submitButton.disabled = true;

                        // Simulate form submission
                        setTimeout(function () {
                            // Simulate form submission
                            submitButton.removeAttribute('data-kt-indicator');

                            // Show popup confirmation 
                            Swal.fire({
                                text: "새로운 일정이 등록되었습니다.",
                                icon: "success",
                                buttonsStyling: false,
                                confirmButtonText: "예",
                                customClass: {
                                    confirmButton: "btn btn-primary"
                                }
                            }).then(function (result) {
                                if (result.isConfirmed) {
                                    modal.hide();

                                    // Enable submit button after loading
                                    submitButton.disabled = false;

                                    
                           let data = form2Data();
                           
                                    // Add new event to calendar
                                    console.log("data",data);
                                    
                            $.ajax({
                              url:"/schedule",
                              method:"POST",
                              dataType:"json",
                              data: JSON.stringify(data),
                              contentType: 'application/json',
                              success:function(resp){
                                 if(resp.success){ 
                                            const newEvent = data2Event(resp.schedule);
                                 /*calendar.addEvent(newEvent);*/
                                          calendar.refetchEvents();
                                  }
                              }
                           }) 
                           calendar.unselect();

                                    // Reset form for demo purposes only
                                    form.reset();
                                }
                            });

                            //form.submit(); // Submit form
                        }, 2000);
                    } else {
                        // Show popup warning 
                        Swal.fire({
                            text: "오류가 발생하였습니다. 다시 시도하여 주세요.",
                            icon: "error",
                            buttonsStyling: false,
                            confirmButtonText: "예",
                            customClass: {
                                confirmButton: "btn btn-primary"
                            }
                        });
                    }
                });
            }
        });
    }

    // Handle edit event
    const handleEditEvent = () => {
        // Update modal title
        modalTitle.innerText = "일정 수정";

        modal.show();
        
        // 풀캘린
        populateForm(data);

        // Handle submit form
        submitButton.addEventListener('click', function (e) {
            // Prevent default button action
            e.preventDefault();

            // Validate form before submit
            if (validator) {
                validator.validate().then(function (status) {
                    console.log('validated!');

                    if (status == 'Valid') {
                        // Show loading indication
                        submitButton.setAttribute('data-kt-indicator', 'on');

                        // Disable submit button whilst loading
                        submitButton.disabled = true;

                        // Simulate form submission
                        setTimeout(function () {
                            // Simulate form submission
                            submitButton.removeAttribute('data-kt-indicator');

                            // Show popup confirmation 
                            Swal.fire({
                                text: "새로운 일정이 등록되었습니다.",
                                icon: "success",
                                buttonsStyling: false,
                                confirmButtonText: "예",
                                customClass: {
                                    confirmButton: "btn btn-primary"
                                }
                            }).then(function (result) {
                                if (result.isConfirmed) {
                                    modal.hide();

                                    // Enable submit button after loading
                                    submitButton.disabled = false;

                                    // Remove old event
                                    
                                    let modifyData = form2Data();
                                    
                                    // Add new event to calendar
                                    // 데이터 담는 작업은 이 부분에서 진행
                                    $.ajax({
                                        url:"/schedule",
                              method:"PUT",
                              dataType:"json",
                              data: JSON.stringify(modifyData),
                              contentType: 'application/json',
                              success:function(resp){
                                            if(resp.success){ 
                                                // 오래된 건
                                                /*calendar.getEventById(modifyData.schdulNo).remove();*/
                                                /* calendar.addEvent(data2Event(resp.schedule)); */
                                                // 캘린더를 새로 작성
                                                // 캘린더 전체 데이터를 새로 조회
                                                //calendar.refetchEvents();
                                                // 수정된 데이터만 추가
                                                let modifyEvent = data2Event(resp.schedule);
                                                /*calendar.addEvent(modifyEvent);*/
                                    calendar.refetchEvents();
                                  }
                              }
                           })
                           calendar.unselect();

                                    // Reset form for demo purposes only
                                    form.reset();
                                }
                            });

                            //form.submit(); // Submit form
                            // 아직 서버를 돌리는 코드가 아니기 때문에 저장되는 이벤트를 보여주기 위한 settime을 적용
                        }, 2000);
                    } else {
                        // Show popup warning 
                        Swal.fire({
                            text: "오류가 발생하였습니다. 다시 시도하여 주세요.",
                            icon: "error",
                            buttonsStyling: false,
                            confirmButtonText: "예",
                            customClass: {
                                confirmButton: "btn btn-primary"
                            }
                        });
                    }
                });
            }
        });
    }

    // Handle view event
    // 일정 상세 뷰
    const handleViewEvent = () => {
        viewModal.show();

        // Detect all day event
        var allDaySjMod;
        var schdulBeginDateMod;
        var schdulEndDateMod;

        // Generate labels
       
        console.log("handleView ", data);
        console.log("handleView - schdulNo ==>", data.schdulNo);

        $.ajax({
            url:`/schedule/${data.schdulNo}`,
            method:"GET",
            dataType:"json",
            success:function(resp){
                console.log("resp ==>", resp);
                console.log("resp 제목 ==>", resp.schdulSj);
                console.log("viewschdulSj ==>", viewschdulSj);

                if (resp.allDay == 'Y') {
                    allDaySjMod = '하루종일';
                    schdulBeginDateMod = moment(resp.schdulBeginDate).format('Do MMM, YYYY');
                    schdulEndDateMod = moment(resp.schdulEndDate).format('Do MMM, YYYY');
                } else {
                    allDaySjMod = '';
                    schdulBeginDateMod = moment(resp.schdulBeginDate).format('Do MMM, YYYY - h:mm a');
                    schdulEndDateMod = moment(resp.schdulEndDate).format('Do MMM, YYYY - h:mm a');
                }

                viewschdulSj.textContent = resp.schdulSj;
                viewschdulCn.textContent = resp.schdulCn;
                viewschdulBeginDate.textContent = schdulBeginDateMod;
                viewschdulEndDate.textContent = schdulEndDateMod;
                viewschdulPlace.textContent = resp.schdulPlace;
                viewAllDay.textContent = allDaySjMod;
                if(resp.schdulIemCode == "L01"){
                    resp.schdulIemCode = "개인일정";
                }
                if(resp.schdulIemCode == "L02"){
                    resp.schdulIemCode = "부서일정";
                }
                if(resp.schdulIemCode == "L03"){
                    resp.schdulIemCode = "회사일정";
                }
                viewschdulIemCode.textContent = resp.schdulIemCode;
                viewAllDay.innerText = allDaySjMod;

            }
        }) 
    }

    // Handle delete event(삭제버튼이벤트)
    const handleDeleteEvent = () => {
    viewDeleteButton.addEventListener('click', e => {
        e.preventDefault();

        if (data.emplNo == emplNo.value) {
            Swal.fire({
                text: "정말로 현재 일정을 삭제하시겠습니까?",
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
                    console.log("data===>", data);
                    $.ajax({
                        url: `/schedule/${data.schdulNo}`,
                        method: "DELETE",
                        dataType: "json",
                        success: function(resp) {
                            if (resp.success) {
                                console.log("resp==>", resp);
                                calendar.getEventById(resp.schedule).remove();
                                calendar.render();
                            }
                        }
                    });
                    viewModal.hide(); // Hide modal            
                } else if (result.dismiss === 'cancel') {
                    Swal.fire({
                        text: "일정이 삭제되지 않았습니다.",
                        icon: "error",
                        buttonsStyling: false,
                        confirmButtonText: "예",
                        customClass: {
                            confirmButton: "btn btn-primary",
                        }
                    });
                }
            });
        } else {
                        Swal.fire({
                        text: "해당 일정에 삭제 권한이 없습니다.",
                        icon: "error",
                        buttonsStyling: false,
                        confirmButtonText: "예",
                        customClass: {
                            confirmButton: "btn btn-primary",
                        }
                    });
        }
    });
}

    // Handle edit button(수정버튼이벤트)
    const handleEditButton = () => {
    viewEditButton.addEventListener('click', e => {
        e.preventDefault();
        console.log("data는 뭘까영", data);
        console.log("data 사원번호는 뭘까영", data.emplNo);
        console.log("emplNo 뭘까영", emplNo.value);

        if (data.emplNo == emplNo.value) {
            viewModal.hide();
            setTimeout(() => {
                handleEditEvent();
            }, 500);
        } else {
            Swal.fire({
                        text: "해당 일정에 수정 권한이 없습니다.",
                        icon: "error",
                        buttonsStyling: false,
                        confirmButtonText: "예",
                        customClass: {
                            confirmButton: "btn btn-primary",
                        }
                    });
        }
    });
}
    // Handle cancel button(취소버튼 이벤트)
    const handleCancelButton = () => {
        // Edit event modal cancel button
        cancelButton.addEventListener('click', function (e) {
            e.preventDefault();

            Swal.fire({
                text: "정말로 취소하시겠습니까?",
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
                    form.reset(); // Reset form   
                    modal.hide(); // Hide modal            
                } else if (result.dismiss === 'cancel') {
                    Swal.fire({
                        text: "현재 작업이 취소되지 않았습니다.",
                        icon: "error",
                        buttonsStyling: false,
                        confirmButtonText: "예",
                        customClass: {
                            confirmButton: "btn btn-primary",
                        }
                    });
                }
            });
        });
    }

    // Handle close button(닫기버튼이벤트)
    const handleCloseButton = () => {
        // Edit event modal close button
        closeButton.addEventListener('click', function (e) {
            e.preventDefault();

            Swal.fire({
                text: "정말로 취소하시겠습니까?",
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
                    form.reset(); // Reset form   
                    modal.hide(); // Hide modal            
                } else if (result.dismiss === 'cancel') {
                    Swal.fire({
                        text: "현재 작업이 취소되지 않았습니다.",
                        icon: "error",
                        buttonsStyling: false,
                        confirmButtonText: "예",
                        customClass: {
                            confirmButton: "btn btn-primary",
                        }
                    });
                }
            });
        });
    }

    // Handle view button
    const handleViewButton = () => {
        const viewButton = document.querySelector('#kt_calendar_event_view_button');
        viewButton.addEventListener('click', e => {
            e.preventDefault();

            hidePopovers();
            handleViewEvent();
        });
    }

    // Helper functions

    // Reset form validator on modal close
    const resetFormValidator = (element) => {
        // Target modal hidden event --- For more info: https://getbootstrap.com/docs/5.0/components/modal/#events
        element.addEventListener('hidden.bs.modal', e => {
            if (validator) {
                // Reset form validator. For more info: https://formvalidation.io/guide/api/reset-form
                validator.resetForm(true);
            }
        });
    }
    const form2Data = () => {
        // Detect if is all day event
        let allDayEvent = '';
        if (allDayToggle.checked || startTimeFlatpickr.selectedDates.length === 0) {
          allDayEvent = "Y"; 
        /*if () { allDayEvent = "Y"; }*/
              console.log("allDayEvent =>",allDayEvent);
        // Merge date & time
           var schdulBeginDateTime = moment(startFlatpickr.selectedDates[0]).format('YYYY-MM-DDTHH:mm:ss');
         console.log("테스트1",schdulBeginDateTime);
           var schdulEndDateTime = moment(endFlatpickr.selectedDates[endFlatpickr.selectedDates.length - 1]).format('YYYY-MM-DDTHH:mm:ss');
         console.log("테스트2",schdulEndDateTime);
      
        }else{
            const schdulBeginDate = moment(startFlatpickr.selectedDates[0]).format('YYYY-MM-DD');
            const schdulEndDate = moment(endFlatpickr.selectedDates[0]).format('YYYY-MM-DD');
            const startTime = moment(startTimeFlatpickr.selectedDates[0]).format('HH:mm:ss');
            const endTime = moment(endTimeFlatpickr.selectedDates[0]).format('HH:mm:ss');
            var schdulBeginDateTime = schdulBeginDate + 'T' + startTime;
         console.log("테스트3",schdulBeginDateTime);
            var schdulEndDateTime = schdulEndDate + 'T' + endTime;
         console.log("테스트4",schdulEndDateTime);
        }
        return {
            schdulNo: schdulNo.value,
         emplNo: emplNo.value,
            schdulSj: schdulSj.value,
            schdulCn: schdulCn.value,
            schdulPlace: schdulPlace.value,
            schdulIemCode: schdulIemCode.value,
            schdulBeginDate: schdulBeginDateTime,
            schdulEndDate: schdulEndDateTime,
            allDay: allDayEvent,
        }
    }
    // Populate form 
    // 원소스 객체를 등록이나 수정폼에 값을 초기화하기 위한 형태로 변환하고 설정해줌.
    const populateForm = () => {
        console.log("populateForm >>",data);
        console.log("populateForm =>",allDay.value);
        console.log("populateForm ==>",data.allDay);
        schdulNo.value = data.schdulNo ? data.schdulNo : '';
      emplNo.value = emplNo.value;
        schdulSj.value = data.schdulSj ? data.schdulSj : '';
        schdulCn.value = data.schdulCn ? data.schdulCn : '';
        schdulPlace.value = data.schdulPlace ? data.schdulPlace : '';
        schdulIemCode.value = data.schdulIemCode ? data.schdulIemCode : '';
        allDay.value = data.allDay ? true : false;
        startFlatpickr.setDate(data.schdulBeginDate, true, 'Y-m-d');
        
        // Handle null end dates
        const schdulEndDate = data.schdulEndDate ? data.schdulEndDate : moment(data.schdulBeginDate).format();
        endFlatpickr.setDate(schdulEndDate, true, 'Y-m-d');

        if (data.allDay) {
            allDayToggle.checked = true;
            datepickerWrappers.forEach(dw => {
                dw.classList.add('d-none');
            });
        } else {
            startTimeFlatpickr.setDate(data.schdulBeginDate, true, 'Y-m-d H:i');
            endTimeFlatpickr.setDate(data.schdulEndDate, true, 'Y-m-d H:i');
            endFlatpickr.setDate(data.schdulBeginDate, true, 'Y-m-d');
            allDayToggle.checked = false;
            datepickerWrappers.forEach(dw => {
                dw.classList.remove('d-none');
            });
        } 
    }
    const data2Event = (data) => {
        return {
            id: data.schdulNo,
            title: data.schdulSj,
         empl: data.emplNo,
            // 밑에 세개 프로퍼티는 정규 변수가 아님
            description: data.schdulCn,
            location: data.schdulPlace,
            type: data.schdulIemCode,

            start: data.schdulBeginDate,
            end: data.schdulEndDate,
            allDay: data.allDay,
         backgroundColor: data.backgroundColor
        }
    }
    // Format FullCalendar reponses
    // 풀캘린더 내부 객체를 원소스 객체형태로 변환
    const formatArgs = (event) => {
        console.log("formatArgs ",event);
        data.schdulNo = event.id;
      data.emplNo = event.empl;
        data.schdulSj = event.title;
        data.schdulCn = event.description;
        data.schdulPlace = event.location;
        data.schdulIemCode = event.type;
        data.schdulBeginDate = event.startStr;
        data.schdulEndDate = event.endStr;
        data.allDay = event.allDay;
    }

   function handleRadioChange(event) {
    const selectedValue = event.target.value;
    console.log('Selected radio button value:', selectedValue);
    
    // Add your custom logic here
    if (selectedValue === 'all') {
        console.log('전체일정 선택됨');
      showAllEvents();
        // Add logic for 전체일정
    } else if (selectedValue === 'L01') {
        console.log('개인일정 선택됨');
        // Add logic for 개인일정
       filterEventsByType('L01');
    } else if (selectedValue === 'L02') {
        console.log('부서일정 선택됨');
        // Add logic for 부서일정
       filterEventsByType('L02');
    } else if (selectedValue === 'L03') {
        console.log('회사일정 선택됨');
        // Add logic for 회사일정
       filterEventsByType('L03');
    }
}

function showAllEvents() {
    var allEvents = calendar.getEvents();
    allEvents.forEach(function(event) {
        event.setProp('display', ''); // 모든 이벤트를 표시합니다.
    });
}

function filterEventsByType(type) {
    var allEvents = calendar.getEvents();
    allEvents.forEach(function(event) {
        if (event.extendedProps.type === type) {
            event.setProp('display', ''); // 해당 타입의 이벤트를 표시합니다.
        } else {
            event.setProp('display', 'none'); // 다른 타입의 이벤트를 숨깁니다.
        }
    });
}

    // Generate unique IDs for events
    const uid = () => {
        return Date.now().toString() + Math.floor(Math.random() * 1000).toString();
    }

    return {
        // Public Functions
        init: function () {
            // Define variables
            // Add event modal
            const element = document.getElementById('kt_modal_add_event');
            form = element.querySelector('#kt_modal_add_event_form');
         emplNo = document.querySelector('input[name="emplNo"]');
            schdulNo = form.querySelector('[name="schdulNo"]');
            allDay = form.querySelector('[name="calendar_allDay"]');
            schdulSj = form.querySelector('[name="calendar_event_name"]');
            schdulCn = form.querySelector('[name="calendar_event_description"]');
            schdulPlace = form.querySelector('[name="calendar_event_location"]');
            schdulIemCode = form.querySelector('[name="calendar_event_Type"]');
            schdulBeginDatepicker = form.querySelector('#kt_calendar_datepicker_start_date');
            schdulEndDatepicker = form.querySelector('#kt_calendar_datepicker_end_date');
            startTimepicker = form.querySelector('#kt_calendar_datepicker_start_time');
            endTimepicker = form.querySelector('#kt_calendar_datepicker_end_time');
            addButton = document.querySelector('[data-kt-calendar="add"]');
            submitButton = form.querySelector('#kt_modal_add_event_submit');
            cancelButton = form.querySelector('#kt_modal_add_event_cancel');
            closeButton = element.querySelector('#kt_modal_add_event_close');
            modalTitle = form.querySelector('[data-kt-calendar="title"]');
            modal = new bootstrap.Modal(element);

         const radioButtons = document.querySelectorAll('input[name="radio2"]');
        
          radioButtons.forEach(radio => {
                  radio.addEventListener('change', function(e) {
                      handleRadioChange(e)
                  })
              })
            // Select datepicker wrapper elements
            datepickerWrappers = form.querySelectorAll('[data-kt-calendar="datepicker"]');
        // Handle all day toggle
           allDayToggle = form.querySelector('#kt_calendar_datepicker_allday');

            allDayToggle.addEventListener('click', e => {
                if (e.target.checked) {
                    datepickerWrappers.forEach(dw => {
                        dw.classList.add('d-none');
                    });
                } else {
                    endFlatpickr.setDate(data.schdulBeginDate, true, 'Y-m-d');
                    datepickerWrappers.forEach(dw => {
                        dw.classList.remove('d-none');
                    });
                }
            });

            // View event modal
            const viewElement = document.getElementById('kt_modal_view_event');
            viewModal = new bootstrap.Modal(viewElement);
            viewschdulSj = viewElement.querySelector('[data-kt-calendar="event_name"]');
            viewAllDay = viewElement.querySelector('[data-kt-calendar="all_day"]');
            viewschdulCn = viewElement.querySelector('[data-kt-calendar="event_description"]');
            viewschdulPlace = viewElement.querySelector('[data-kt-calendar="event_location"]');
            viewschdulIemCode = viewElement.querySelector('[data-kt-calendar="event_Type"]');
            viewschdulBeginDate = viewElement.querySelector('[data-kt-calendar="event_start_date"]');
            viewschdulEndDate = viewElement.querySelector('[data-kt-calendar="event_end_date"]');
            viewEditButton = viewElement.querySelector('#kt_modal_view_event_edit');
            viewDeleteButton = viewElement.querySelector('#kt_modal_view_event_delete');

            initCalendarApp();
            initValidator();
            initDatepickers();
            handleEditButton();
            handleAddButton();
            handleDeleteEvent();
            handleCancelButton();
            handleCloseButton();
            resetFormValidator(element);
        }
    };
}();

// On document ready
/*KTUtil.onDOMContentLoaded(function () {
    KTAppCalendar.init();
});*/
document.addEventListener('DOMContentLoaded',function () {
    KTAppCalendar.init();
});
