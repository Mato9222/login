<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<security:authentication property="principal.realUser" var="realUser"/>			
						<!--begin::Content wrapper-->
						<div class="d-flex flex-column flex-column-fluid">
							<!--begin::Toolbar-->
							<div id="kt_app_toolbar" class="app-toolbar py-3 py-lg-6">
								<!--begin::Toolbar container-->
								<div id="kt_app_toolbar_container" class="app-container container-xxl d-flex flex-stack">
									<!--begin::Page title-->
									<div class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
										<!--begin::Title-->
										<h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">예약</h1>
										<!--end::Title-->
										<!--begin::Breadcrumb-->
										<ul class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 my-0 pt-1">
											<li class="breadcrumb-item text-muted">
												<a href="index.html" class="text-muted text-hover-primary">메인</a>
											</li>
											<li class="breadcrumb-item">
												<span class="bullet bg-gray-500 w-5px h-2px"></span>
											</li>
											<li class="breadcrumb-item text-muted">예약/신청</li>
												<li class="breadcrumb-item">
												<span class="bullet bg-gray-500 w-5px h-2px"></span>
											</li>
											<li class="breadcrumb-item text-muted">예약</li>
										</ul>
										<!--end::Breadcrumb-->
									</div>
									<!--end::Page title-->
								</div>
								<!--end::Toolbar container-->
							</div>
							<p>${rsList }</p>
							<!--end::Toolbar-->
							<!--begin::Content-->
							<div id="kt_app_content" class="app-content flex-column-fluid">
								<!--begin::Content container-->
								<div id="kt_app_content_container" class="app-container container-xxl">
									<!--begin::Layout-->
									<div class="d-flex flex-column flex-lg-row">
										<!--begin::Content-->
										<div class="flex-lg-row-fluid me-lg-15 order-2 order-lg-1 mb-10 mb-lg-0 margin-right-12">
											<!--begin::Card-->
											<div class="card card-flush pt-3 mb-5 mb-xl-10">
												<!--begin::Card header-->
												<div class="card-header">
													<!--begin::Card title-->
													<div class="card-title">
														<h2 class="fw-bold">자원 정보</h2>
													</div>
													<div style ="display: flex; align-items: center;">
													<form id="select_form">
														<select  id="resource-select1"data-placeholder="항목선택">
															<option class="text-gray-600" value>항목선택</option>
															<c:forEach items="${ccList}" var="cc">
															<option class="text-gray-600" value="${cc.cmmnCode}">${ cc.cmmnCodeNm}</option>
															</c:forEach>
														</select>
														<select id="resource-select2" data-placeholder="자원선택">
															<option class="text-gray-600" value>자원선택</option>
														</select>
													</form>
													</div>
												</div>
												<!--end::Card header-->
												<!--상세조회 컨텐츠 바디-->
												<div class="card-body pt-3" id="resourceArea">
												</div>
												<!--상세조회 컨텐츠 바디 끝-->
											</div>
											<!--end::Card-->
											
										</div>
										<!--end::Content-->
										
										<!--begin::Sidebar-->
										<div class="flex-column flex-lg-row-auto w-lg-350px w-xl-450px mb-10 order-1 order-lg-2">
											<!--begin::Card-->
											<div class="card card-flush mb-0" data-kt-sticky="true" data-kt-sticky-name="subscription-summary" data-kt-sticky-offset="{default: false, lg: '200px'}" data-kt-sticky-width="{lg: '250px', xl: '300px'}" data-kt-sticky-left="auto" data-kt-sticky-top="150px" data-kt-sticky-animation="false" data-kt-sticky-zindex="95">
												<!--begin::Card header-->
												<div class="card-header">
													<!--begin::Card title-->
													<div class="card-title">
														<h2>예약</h2>
														<input type="hidden" name="emplNo" value="${realUser.emplNo }">
													</div>
													<!--end::Card title-->
												</div>
												<!--end::Card header-->
												<!--begin::Card body-->
												<div class="card-body pt-0 fs-6">
													<!--begin::Section-->
													<div class="mb-7">
														<div class="d-flex align-items-center">
															<div class="d-flex flex-column">
    															<p class="fs-6 fw-semibold required mb-2 text-gray-500">예약 시작 일정을 선택해주세요</p>
																<input data-target-slot="#timeslot-start" id="reservation_Datepicker_start" class="datepicker form-control form-control-solid flatpickr-input active w-325px" name="resveBeginDe">
															</div>
														</div>
													</div>
													<div class="reservation_time mb-10">
														<h5 class="mb-4">예약시간</h5>
														<div  id="timeslot-start" class="reservation_time_body mb-0" style="display:none" >
																	<ul class="time_body fw-semibold text-gray-600 d-flex align-items-center">
																<c:forEach items="${timeList}" var="time">
																		<li style = "list-style-type : none; margin : 3px">
																		<button type="button" class="timeNoBtn btn btn-primary w-95px h-45px" data-value="${time.resveTimeNo }" data-target="#startTimeNo">${time.beginTime}</button>
																		</li>
																	<%-- <div class="fw-semibold text-gray-600 d-flex align-items-center">${time.endTime}</div> --%>															
																</c:forEach>
																	</ul>
																	<input type="hidden"  id="startTimeNo" >
														</div>
													</div>
													<div class="separator separator-dashed mb-7"></div>
													<div class="mb-7">
														<div class="d-flex align-items-center">
															<div class="d-flex flex-column">
    															<p class="fs-6 fw-semibold required mb-2 text-gray-500">예약 종료 일정을 선택해주세요</p>
																<input data-target-slot="#timeslot-end" id="reservation_Datepicker_end" class="datepicker form-control form-control-solid flatpickr-input active w-325px" name="resveEndDe">
															</div>
														</div>
													</div>
													<div class="reservation_time mb-10">
														<h5 class="mb-4">예약시간</h5>
														<div  id="timeslot-end" class="reservation_time_body mb-0" style="display:none" >
																	<ul class="time_body fw-semibold text-gray-600 d-flex align-items-center">
															<c:forEach items="${timeList}" var="time">
																		<li style = "list-style-type : none; margin : 3px">
																		<button type="button" data-target="#endTimeNo" data-value="${time.resveTimeNo }" class="timeNoBtn btn btn-primary w-95px h-45px">${time.beginTime}</button>
																		</li>
																	<%-- <div class="fw-semibold text-gray-600 d-flex align-items-center">${time.endTime}</div> --%>															
																</c:forEach>
																	</ul>
																	<input type="hidden"  id="endTimeNo" >
														</div>
													</div>
													<!--end::Section-->
													<!--begin::Seperator-->
													<div class="separator separator-dashed mb-7"></div>
													<!--end::Seperator-->
													<!--begin::Section-->
													<div class="mb-10">
														<!--begin::Title-->
														<h5 class="mb-4">예약정보</h5>
														<!--end::Title-->
														<!--begin::Details-->
														<div class="fv-row mb-9">
																<label class="fs-6 fw-semibold required mb-2 text-gray-500">예약목적</label> 
																<input type="text" name="resvePurps" class="form-control form-control-solid w-325px" placeholder="예약목적"/>
														</div>
														<div class="fv-row mb-9">
																<label class="fs-6 fw-semibold required mb-2 text-gray-500">예약내용</label> 
																<input type="text" name="resveCn" class="form-control form-control-solid w-325px" placeholder="예약사유"/>
														</div>
														<table class="table fs-6 fw-semibold gs-0 gy-2 gx-2">
															<tr class="">
															<!--begin::Row-->
																<!-- <td class="text-gray-500">예약목적:</td> -->
																<!-- <td class="text-gray-800">sub_4567_8765</td> -->
															</tr>
															<!--end::Row-->
															<!--begin::Row-->
															<tr class="">
																<td class="text-gray-500">예약상태:</td>
																<td>
																	<span class="badge badge-light-success">예약가능</span>
																</td>
															</tr>
															<!--end::Row-->
														</table>
														<!--end::Details-->
													</div>
													<!--end::Section-->
													<!--begin::Actions-->
													<div class="mb-0">
														<button class="btn btn-primary" name="add_reservation">예약하기</button>
													</div>
													<!--end::Actions-->
												</div>
												<!--end::Card body-->
											</div>
											<!--end::Card-->
										</div>
										<!--end::Sidebar-->
									</div>
									<!--end::Layout-->
								</div>
								<!--end::Content container-->
							</div>
							<!--end::Content-->
						</div>
						<!--end::Content wrapper-->

		   <script>
		   
				
				
			
document.addEventListener("DOMContentLoaded", () => {
					
	    var formEl = document.getElementById('select_form');
		var emplNoEl = document.querySelector('input[name=emplNo]');
		var resveCnEl = document.querySelector('input[name=resveCn]');
		var resvePurpsEl = document.querySelector('input[name=resvePurps]');
		var startTimeNoEl = document.querySelector('#startTimeNo');
		var endTimeNoEl = document.querySelector('#endTimeNo');
		var resveBeginDeEl = document.querySelector('input[name=resveBeginDe]');
		var resveEndDeEl = document.querySelector('input[name=resveEndDe]');
		
	
		
		var $form = $(formEl);
		var $emplNo = $(emplNoEl);
		var $resveCn = $(resveCnEl);
		var $resvePurps = $(resvePurpsEl);
		var $resveBeginTimeNo = $(startTimeNoEl);
		var $resveEndTimeNo = $(endTimeNoEl);
		var $resveBeginDe = $(resveBeginDeEl);
		var $resveEndDe = $(resveEndDeEl);
		
		const startDatepicker = document.getElementById('reservation_Datepicker_start');
		const endDatepicker = document.getElementById('reservation_Datepicker_end');

		startDatepicker.addEventListener('change', function() {
			const selectedStartDate = this.value;
			 let resrceNo = $form.find('#resource-select2').val();
			fetchReservedStartTimes(resrceNo,selectedStartDate, '#timeslot-start');
		});

		endDatepicker.addEventListener('change', function() {
			const selectedEndDate = this.value;
			 let resrceNo = $form.find('#resource-select2').val();
			fetchReservedEndTimes(resrceNo,selectedEndDate, '#timeslot-end');
		});
		
		function fetchReservedStartTimes(resrceNo,selectedStartDate, targetSlotId) {
	        $.ajax({
	        	url:`/reservation/getStartTimeNo/\${selectedStartDate}/\${resrceNo}`,
	        	method:'GET',
	        	success:function(resp){
	                disableReservedTimes(resp, targetSlotId);
	        	}
	        })
	    }
		function fetchReservedEndTimes(resrceNo,selectedEndDate, targetSlotId) {
	        $.ajax({
	        	url:`/reservation/getEndTimeNo/\${selectedEndDate}/\${resrceNo}`,
	        	method:'GET',
	        	success:function(resp){
	                disableReservedTimes(resp,targetSlotId);
	        	}
	        })
	    }
		function customFilter(reservedTimes, propName, time){
			return reservedTimes.filter(o=>o[propName]===time).length>0;
		}
		
		function disableReservedTimes(reservedTimes, targetSlotId) {
			console.log("targetSlotId",targetSlotId);
			let propName = null;
			if(targetSlotId.indexOf("start")>=0){
				propName = "resveBeginTimeNo";
			}else{
				propName = "resveEndTimeNo";
			}
	        const slotBody = document.querySelector(`\${targetSlotId}`);
	        const buttons = slotBody.querySelectorAll('.timeNoBtn');
	        buttons.forEach(button => {
	            button.disabled = false;
	            button.classList.remove('disabled');
	        });

	        buttons.forEach(button => {
	            let time = button.getAttribute('data-value');
	            time = parseInt(time);
	            if (customFilter(reservedTimes,propName,time)) {
	                button.disabled = true;
	                button.classList.add('disabled');
	            }
	        });
	    }
			 
		// 시간 버튼 눌렀을때 input hidden에 해당값 담는 함수
			$(".timeNoBtn").on('click',function(){
				let value = $(this).data("value");
				let target = $(this).data("target");
				
				$(target).val(value);
			})
			
		// 예약버튼 눌렀을때 이벤트
			   var $addButton = $('button[name=add_reservation]').on('click',function(){
				 
				let emplNo = $emplNo.val();
			    let resrceNo = $form.find('#resource-select2').val();
				let resveCn = $resveCn.val();
				let resvePurps = $resvePurps.val();
				let resveBeginDe = $resveBeginDe.val();
				let resveEndDe = $resveEndDe.val();
			    let resveBeginTimeNo = $resveBeginTimeNo.val();
				let resveEndTimeNo = $resveEndTimeNo.val();
				   
				   const reservationVO = {
							emplNo: emplNo,
							resrceNo:resrceNo,
							resveBeginDe: resveBeginDe,
							resveEndDe: resveEndDe,
							resveCn: resveCn,
							resvePurps: resvePurps,
							resveBeginTimeNo: resveBeginTimeNo,
							resveEndTimeNo: resveEndTimeNo,
					}
					console.log("reservation==>",reservationVO);
					
					$.ajax({
						url:"/reservation",
						method:"POST",
						dataType:"TEXT",
						data: JSON.stringify(reservationVO),
						contentType: "application/json",
						success:function(resp){
							if(resp=='ok'){
								console.log("resp==>",resp);
								console.log("reservationVO==>",reservationVO);
								location.href = "/reservation/reservationList";
							}
						}
					})
			   })
				
		   const rsDatepicker = document.querySelector('#reservation_Datepicker_start');
          const rsEndDatepicker = document.querySelector('#reservation_Datepicker_end');
    	  
          /* flatpickr("#reservation_Datepicker_start", {
              minDate: "today"
            });
          flatpickr("#reservation_Datepicker_end", {
              minDate: "today"
            }); */
           const initDatepickers = () => {
		        startFlatpickr = flatpickr(rsDatepicker, {
		        	minDate: "today",
		            enableTime: false,
		            dateFormat: "Y-m-d",
		        });

		        endFlatpickr = flatpickr(rsEndDatepicker, {
		        	minDate: "today",
		            enableTime: false,
		            dateFormat: "Y-m-d",
		        });
		      
		    }
           
           initDatepickers(); 
           
			   var $selectList2 = $('#resource-select2');
			   var $datepicker = $('.datepicker');
				   
				    $datepicker.on("change", function() { // change 이벤트로 변경
				        let data = $(this).val();
				        console.log("data==>", data);
				        let targetSelector = $(this).data("targetSlot");
				        
				        if (data) {
				            $(targetSelector).show();
				        } else {
				        	$(targetSelector).hide();
				        }
				    });
			   
				    
				   $.ajax({
					   url : '/resources/resourceList',
					   method: 'GET',
					   success: function(data){
						   console.log("data:",data);
						   let options = "";
						   $.each(data,function(i,v){
							options +=`<option value="\${v.resrceNo}" class="\${v.resrceIemCode} text-gray-600">\${ v.resrceNm}</option>`;						   
						   })
						   $selectList2.append(options);
					   }
				   })
				// select 항목 선택   
				   $('#resource-select1').on("change", function(){
						let resource = $(this).val();
						$selectList2.find(`option`).each(function(index, opt){
							if(index==0 || !resource || ( resource && $(opt).hasClass(resource) )){
								$(opt).show();
							}else{
								$(opt).hide();
							}
						});
					})
					// 항목선택후 그에 해당하는 프로퍼티 출력 이벤트
					$selectList2.find(`option:first`).prop(`selected`, true);
					
					  $selectList2.on("change", function(){
					        let selectedResrceNo = $(this).val();
					        let $resourceArea = $('#resourceArea');
					        console.log("selectedResrceNo ==>",selectedResrceNo);
					        if(selectedResrceNo){
					            $.ajax({
					                url: `/resources/searchResourceDiv/\${selectedResrceNo}`,
					                method: 'GET',
					                success: function(detailData){
					                    // detailData를 사용하여 화면에 상세 정보 출력
					                    console.log("detailData==>",detailData);
					                    let div = displayResourceDetail(detailData);
					                    $resourceArea.html(div);
					                }
					            });
					        }
					    });
				   // 출력하고싶은 div 화면에 뿌려주는 함수
				   function displayResourceDetail(rsVO) {
					    // detailData를 기반으로 HTML을 생성하거나 업데이트합니다.
					return   `<div class="mb-10">
						<!--begin::Title-->
						<img class="w-400px h-400px;" src="/resources/image/resourceimage/\${rsVO.resrceImage}">
						<!--end::Title-->
						<!--begin::Details-->
						<div class="d-flex flex-wrap py-5">
							<!--begin::Row-->
							<div class="flex-equal me-5">
								<!--begin::Details-->
								<table class="table fs-6 fw-semibold gs-0 gy-2 gx-2 m-0">
									<tr>
										<td class="text-gray-500 min-w-175px w-175px">자원 이름:</td>
										<td class="text-gray-800 min-w-200px">
											<a href="pages/apps/customers/view.html" class="text-gray-800 text-hover-primary">\${rsVO.resrceNm}</a>
										</td>
									</tr>
									<tr>
										<td class="text-gray-500">자원 분류:</td>
											<td class="text-gray-800">\${rsVO.commonCode.cmmnCodeNm}</td>
									</tr>
									<tr>
										<td class="text-gray-500">담당자 전화:</td>
										<td class="text-gray-800">010-1111-2222(김병수)</td>
									</tr>
								</table>
								<!--end::Details-->
							</div>
							<!--end::Row-->
							<!--begin::Row-->
							<div class="flex-equal">
								<!--begin::Details-->
								<table class="table fs-6 fw-semibold gs-0 gy-2 gx-2 m-0">
									<tr>
										<td class="text-gray-500 min-w-175px w-175px">자원 등록일자:</td>
										<td class="text-gray-800 min-w-200px">
											<a href="#" class="text-gray-800 text-hover-primary">\${rsVO.resrceRegistDe }</a>
										</td>
									</tr>
									<tr>
										<td class="text-gray-500">자원 수정일자:</td>
										<td class="text-gray-800">\${rsVO.resrceUpdDe }</td>
									</tr>
									<tr>
										<td class="text-gray-500">자원 정보:</td>
										<td class="text-gray-800">\${rsVO.resrceInfo }</td>
									</tr>
									<tr>
										<td class="text-gray-500">담당부서:</td>
										<td class="text-gray-800">재무팀</td>
									</tr>
								</table>
								<!--end::Details-->
							</div>
							<!--end::Row-->
						</div>
						<!--end::Row-->
					</div>`
					}
				   
		   });
		   

		   
		   </script>
