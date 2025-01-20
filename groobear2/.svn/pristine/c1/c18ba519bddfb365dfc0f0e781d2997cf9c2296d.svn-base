<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
						<!--begin::Content wrapper-->
						<div class="d-flex flex-column flex-column-fluid">
							<!--begin::Toolbar-->
							<div id="kt_app_toolbar" class="app-toolbar py-3 py-lg-6">
								<!--begin::Toolbar container-->
								<div id="kt_app_toolbar_container" class="app-container container-xxl d-flex flex-stack">
									<!--begin::Page title-->
									<div class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
										<!--begin::Title-->
										<h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">예약 내역</h1>
										<!--end::Title-->
										<!--제목 아래 경로 설명 시작-->
										<ul class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 my-0 pt-1">
											<li class="breadcrumb-item text-muted">
												<a href="index.html" class="text-muted text-hover-primary">메인</a>
											</li>
											<!-- 문단 중간중간 '-' 부호 삽입 시작-->
											<li class="breadcrumb-item">
												<span class="bullet bg-gray-500 w-5px h-2px"></span>
											</li>
											<!-- 문단 중간중간 '-' 부호 삽입 끝-->
											<li class="breadcrumb-item text-muted">예약/신청</li>
											<!-- 문단 중간중간 '-' 부호 삽입 시작-->
											<li class="breadcrumb-item">
												<span class="bullet bg-gray-500 w-5px h-2px"></span>
											</li>
											<!-- 문단 중간중간 '-' 부호 삽입 끝-->
											<li class="breadcrumb-item text-muted">예약 내역</li>
										</ul>
										<!--제목 아래 경로 설명 끝-->
									</div>
									<!--end::Page title-->
								</div>
								<!--end::Toolbar container-->
							</div>
							<!--end::Toolbar-->
							<!--begin::Content-->
							<div id="kt_app_content" class="app-content flex-column-fluid">
								<!--begin::Content container-->
								<div id="kt_app_content_container" class="app-container container-xxl">
									<!--begin::Card-->
									<div class="card">
										<!--begin::Card header-->
										<div class="card-header border-0 pt-6">
											<!--begin::Card title-->
											<div class="card-title">
												<!--begin::Search-->
												<div class="d-flex align-items-center position-relative my-1">
													<i class="ki-duotone ki-magnifier fs-3 position-absolute ms-5">
														<span class="path1"></span>
														<span class="path2"></span>
													</i>
													<input type="text" data-kt-subscription-table-filter="search" class="form-control form-control-solid w-250px ps-12" placeholder="예약 검색" />
												</div>
												<!--end::Search-->
											</div>
											<!--begin::Card title-->
											<a href="/reservation/reservationForm"><button class="btn btn-primary RR-button">예약</button></a>
												
										</div>
										<!--end::Card header-->
										<!--begin::Card body-->
										<div class="card-body pt-0">
											<!--begin::Table-->
											<table class="table align-middle table-row-dashed fs-6 gy-5" id="kt_subscriptions_table">
												<thead>
													<tr class="text-start text-muted fw-bold fs-7 text-uppercase gs-0">
														<!-- <th class="min-w-125px">예약코드</th> -->
														<th class="min-w-100px">예약항목</th>
														<th class="min-w-125px">이름</th>
														<th class="min-w-100px">예약일시</th>
														<th class="min-w-100px">종료일시</th>
														<th class="min-w-75px">예약상태</th>
														<th class="min-w-80px m-10">비고</th>
													</tr>
												</thead>
												<tbody>
											<c:forEach items="${ rvList}" var="reservation">
													<tr class="text-start text-muted fw-bold fs-7 text-uppercase gs-0">
														<%-- <td>
														 <a href="/resources/searchResource/${reservation.resrceNo}" class="text-gray-800 text-hover-primary mb-1">${reservation.resveCode }</a>
														 </td> --%>
														
														<c:if test="${reservation.resrceIemCode eq 'H01'}" >
														<td>
														<div class="text-gray-800" >회의실</div>
														</td>
														</c:if>
														<c:if test="${reservation.resrceIemCode eq 'H02'}" >
														<td>
														<div class="text-gray-800">차량</div>
														</td>
														</c:if>
														<c:if test="${reservation.resrceIemCode eq 'H03'}" >
														<td>
														<div class="text-gray-800">법인카드</div>
														</td>
														</c:if>
														<c:if test="${reservation.resrceIemCode eq 'H04'}" >
														<td>
														<div class="text-gray-800">비품</div>
														</td>
														</c:if>
														<td>
														 <span id="resource_detail" data-bs-toggle="modal" data-bs-target="#bsModal" data-detail-no="${reservation.resrceNo}" class="text-gray-800 text-hover-primary mb-1" style="cursor:pointer">${ reservation.resrceNm}</span>
														 </td>
														<td class="text-gray-800">
														${reservation.resveBeginDe}
														${reservation.beginTime}
														</td>
														<td class="text-gray-800">
														${reservation.resveEndDe}&nbsp;&nbsp;${reservation.endTime}
														</td>
														<c:if test="${reservation.resveSttusCode eq 'E01' }">
														<td>
															<div class="badge badge-light-success">반납완료</div>
														</td>
														</c:if>
														<c:if test="${reservation.resveSttusCode eq 'E02' }">
														<td>
															<div class="badge badge-light-info">대여중</div>
														</td>
														</c:if>
														<c:if test="${reservation.resveSttusCode eq 'E03' }">
														<td>
															<div class="badge badge-light-success">대여가능</div>
														</td>
														</c:if>
														<c:if test="${reservation.resveSttusCode eq 'E04' }">
														<td>
															<div class="badge badge-light-danger">예약취소</div>
														</td>
														</c:if>
													    <td colspan="2">
														<c:if test="${reservation.resveSttusCode ne 'E04' and reservation.resveSttusCode ne 'E01'}">
													    	<!-- 수정버튼 -->
															<button title="예약 수정" class="modify_reservation btn btn-light-secondary" data-modify="${reservation.resveCode}" data-bs-toggle="modal" data-bs-target="#modify_bsmodal">
															<i class="ki-duotone ki-notepad-edit">
																 <span class="path1"></span>
																 <span class="path2"></span></i>
															</button>
															<!-- 삭제버튼 -->
															<button title="예약 취소" class="delete_reservation btn btn-light-secondary" data-delete="${reservation.resveCode}">
															<i class="ki-duotone ki-trash-square">
																	 <span class="path1"></span>
																	 <span class="path2"></span>
																	 <span class="path3"></span>
																	 <span class="path4"></span></i>
														  </button>
														  <!-- 반납버튼 -->
														  <button title="반납" class="return_reservation btn btn-light-secondary" data-return="${reservation.resveCode}" data-bs-toggle="modal">
															<i class="ki-duotone ki-exit-right">
															 	<span class="path1"></span>
															 	<span class="path2"></span>
															</i>
															</button>
														  
														  
														</c:if>
														</td> 
													</tr>
												</c:forEach>
												</tbody>
											</table>
											<!--end::Table-->
										</div>
										<!--end::Card body-->
									</div>
									<!--end::Card-->
								</div>
								<!--end::Content container-->
							</div>
							<!--end::Content-->
						</div>
						<!--end::Content wrapper-->
						
						<!-- 모달상세조회맨 -->
							<div class="modal fade" tabindex="-1" id="bsModal">
								    <div class="modal-dialog">
								        <div class="modal-content">
								            <div class="modal-header">
								                <h3 class="modal-title">자원 상세 조회</h3>
								
								                <!--begin::Close-->
								                <div class="btn btn-icon btn-sm btn-active-light-primary ms-2" data-bs-dismiss="modal" aria-label="Close">
								                    <i class="ki-duotone ki-cross fs-1"><span class="path1"></span><span class="path2"></span></i>
								                </div>
								                <!--end::Close-->
								            </div>
								
								            <div class="modal-body">
								          		<div class="card-body pt-3" id="resourceArea">
													<div class="mb-10">
														<!--begin::Title-->
														<img id="detail_resrceImage" class="w-400px h-400px;" src="">
														<!--end::Title-->
														<!--begin::Details-->
														<div class="d-flex flex-wrap py-5">
															<!--begin::Row-->
															<div class="flex-equal me-5">
																<!--begin::Details-->
																<table class="table fs-6 fw-semibold gs-0 gy-2 gx-2 m-0">
																	<tr>
																		<td class="text-gray-500 min-w-175px w-175px">자원 이름:</td>
																		<td id="detail_resrceNm" class="text-gray-800 min-w-200px"></td>
																	</tr>
																	<tr>
																		<td class="text-gray-500">자원 분류:</td>
																		<td id="detail_commonCode" class="text-gray-800"></td>
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
																		<td id="detail_resrceRegistDe" class="text-gray-800 min-w-200px"></td>
																	</tr>
																	<tr>
																		<td class="text-gray-500">자원 수정일자:</td>
																		<td id="detail_resrceUpdDe" class="text-gray-800"></td>
																	</tr>
																	<tr>
																		<td class="text-gray-500">자원 정보:</td>
																		<td id="detail_resrceInfo" class="text-gray-800"></td>
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
													</div>
												</div>
								            </div>
								
								            <div class="modal-footer">
								                <button type="button" class="btn btn-light" data-bs-dismiss="modal">닫기</button>
								            </div>
								        </div>
								    </div>
								</div>
								<!-- 상세조회 모달끝 -->
								<!--  수정폼 모달시작 -->
								<div class="modal fade" tabindex="-1" id="modify_bsmodal">
								    <div class="modal-dialog">
								        <div class="modal-content">
								            <div class="modal-header">
								                <h3 class="modal-title">예약 수정</h3>
								
								                <!--begin::Close-->
								                <div class="btn btn-icon btn-sm btn-active-light-primary ms-2" data-bs-dismiss="modal" aria-label="Close">
								                    <i class="ki-duotone ki-cross fs-1"><span class="path1"></span><span class="path2"></span></i>
								                </div>
								                <!--end::Close-->
								            </div>
								
								            <div class="modal-body">
								                <!--begin::Card body-->
												<div class="card-body pt-0 fs-6">
													<!--begin::Section-->
													<div class="mb-7">
														<div class="d-flex align-items-center">
															<div class="d-flex flex-column">
    															<p class="fs-6 fw-semibold required mb-2 text-gray-500">예약 시작 일정을 선택해주세요</p>
																<input data-target-slot="#timeslot-start" id="reservation_Datepicker_start" class="datepicker form-control form-control-solid flatpickr-input active w-325px" name="resveBeginDe">
																<input type="hidden" name="modal_resveCode">
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
																		<button type="button" data-target="#endTimeNo" data-value="${time.resveTimeNo }" class="timeNoBtn btn btn-primary w-95px h-45px">${time.endTime}</button>
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
												</div>
								            </div>
								
								            <div class="modal-footer">
								                <button id="modal_save" type="button" class="btn btn-primary">저장</button>
								                <button id="modal_close" type="button" class="btn btn-light" data-bs-dismiss="modal">닫기</button>
								            </div>
								        </div>
								    </div>
								</div>
								<!-- 수정폼 모달끝 -->
<script>
	
	
	 document.addEventListener("DOMContentLoaded", () => {
// 		 const beforeResveBeginTimeNo = document.getElementById("saveButton");
		 const beforeResveBeginDe = document.querySelector('[name=resveBeginDe]'); 
		 const beforeResveEndDe = document.querySelector('[name=resveEndDe]'); 
		 const beforeResveCn = document.querySelector('[name=resveCn]'); 
		 const beforeResvePurps = document.querySelector('[name=resvePurps]'); 
		 const modalResveCode = document.querySelector('[name=modal_resveCode]');
		 const modalStartTimeNoEl = document.querySelector('#startTimeNo');
		 const modalEndTimeNoEl = document.querySelector('#endTimeNo');
		 
		 
		 // 수정버튼 이벤트
		 $('.modify_reservation').on('click',function(e){
			 e.preventDefault();
			 let resveCode = $(this).data('modify');
			 console.log("resveCode==>",resveCode);
			 $.ajax({
				 url:`/reservation/\${resveCode}`,
				 method:"GET",
				 dataType:"json",
				 success:function(resp){
					 console.log("resp===>>",resp.resveCode);
					 beforeResveBeginDe.value = resp.resveBeginDe;
					 beforeResveEndDe.value = resp.resveEndDe;
					 beforeResvePurps.value = resp.resvePurps;
					 beforeResveCn.value = resp.resveCn;
					 modalResveCode.value = resp.resveCode;
					 
					 let resrceNo = resp.resrceNo;
					 console.log("resrceNo",resrceNo);
					 
					 const startDatepicker = document.getElementById('reservation_Datepicker_start');
					 const endDatepicker = document.getElementById('reservation_Datepicker_end');

						startDatepicker.addEventListener('change', function() {
							const selectedStartDate = this.value;
							fetchReservedStartTimes(resrceNo,selectedStartDate, '#timeslot-start');
						});

						endDatepicker.addEventListener('change', function() {
							const selectedEndDate = this.value;
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
				 }
			 })
		 })
		 // 저장 버튼 이벤트
		 $('#modal_save').on('click',function(e){
			 
			 e.preventDefault();
			 
			 let resveCode = modalResveCode.value;
			 let resveBeginDe = beforeResveBeginDe.value;
			 let resveEndDe = beforeResveEndDe.value;
			 let resveBeginTimeNo = modalStartTimeNoEl.value;
			 let resveEndTimeNo = modalEndTimeNoEl.value;
			 let resvePurps = beforeResvePurps.value;
			 let resveCn = beforeResveCn.value;
			 
			 const reservationVO = {
					 resveCode: resveCode,
					 resveBeginDe: resveBeginDe,
					 resveEndDe:resveEndDe,
					 resveBeginTimeNo:resveBeginTimeNo,
					 resveEndTimeNo:resveEndTimeNo,
					 resvePurps:resvePurps,
					 resveCn:resveCn,
			 }
			 
			 console.log("MODIFYreservationVO===>",reservationVO);
			 console.log("modifyResveCode==>",resveCode);
			 $.ajax({
				 url:'/reservation/updateReservation/',
				 method:"PUT",
				 dataType:"json",
				 contentType: "application/json",
				 data:JSON.stringify(reservationVO),
				 success:function(resp){
						if(resp=='ok'){
							location.href = "/reservation/reservationList";
						}
					}
			 })
		 })
		 
		 // 닫기 버튼 이벤트
		 $('#modal_close').on('click', function () {
        // 입력 필드 초기화
	        beforeResveBeginDe.value = '';
	        beforeResveEndDe.value = '';
	        beforeResvePurps.value = '';
	        beforeResveCn.value = '';
	
	        // 비활성화 된 버튼 다시 활성화
	        $(".timeNoBtn").prop("disabled", false);
	    });
		 
		 	// 시간 버튼 눌렀을때 input hidden에 해당값 담는 함수
			$(".timeNoBtn").on('click',function(){
				let value = $(this).data("value");
				let target = $(this).data("target");
						
				$(target).val(value);
			})
		 // 반납버튼 이벤트
		 $('.return_reservation').on('click',function(e){
			e.preventDefault();
			let resveCode = $(this).data('return');
			console.log("code===>",resveCode);
			  Swal.fire({
	                text: "예약된 자원을 반납하시겠습니까?",
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
	                    $.ajax({
	        				url:`/reservation/returnReservation/\${resveCode}`,
	        				method:"PUT",
	        				dataType:"json",
	        				contentType: "application/json",
	        				data:JSON.stringify(resveCode),
	        				success:function(resp){
	        					if(resp=='ok'){
	        						 Swal.fire({
	        						        text: "반납이 완료 되었습니다.",
	        						        icon: "success",
	        						        buttonsStyling: false,
	        						        confirmButtonText: "예",
	        						        customClass: {
	        						            confirmButton: "btn btn-primary"
	        						        }
	        						    }).then(function(result){
	        						    	if(result.isConfirmed){
	        									location.href = "/reservation/reservationList";
	        						    	}
	        						    })
	        					}
	        				}
	        			})

	                } else if (result.dismiss === 'cancel') {
	                    Swal.fire({
	                        text: "반납 처리가 완료되지 않았습니다.",
	                        icon: "error",
	                        buttonsStyling: false,
	                        confirmButtonText: "예",
	                        customClass: {
	                            confirmButton: "btn btn-primary",
	                        }
	                    });
	                }
	            });
		})
		   
           
		 // 삭제버튼 이벤트
		$('.delete_reservation').on('click',function(e){
			e.preventDefault();
			let resveCode = $(this).data('delete');
			console.log("code===>",resveCode);
			  Swal.fire({
	                text: "정말로 예약을 취소하시겠습니까?",
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
	                    $.ajax({
	        				url:`/reservation/deleteReservation/\${resveCode}`,
	        				method:"PUT",
	        				dataType:"json",
	        				contentType: "application/json",
	        				data:JSON.stringify(resveCode),
	        				success:function(resp){
	        					if(resp=='ok'){
	        						location.href = "/reservation/reservationList";
	        					}
	        				}
	        			})

	                } else if (result.dismiss === 'cancel') {
	                    Swal.fire({
	                        text: "예약이 취소되지 않았습니다.",
	                        icon: "error",
	                        buttonsStyling: false,
	                        confirmButtonText: "예",
	                        customClass: {
	                            confirmButton: "btn btn-primary",
	                        }
	                    });
	                }
	            });
		})
		
		  const rsDatepicker = document.querySelector('#reservation_Datepicker_start');
          const rsEndDatepicker = document.querySelector('#reservation_Datepicker_end');
    	  
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
		
		const resrceNm = document.querySelector("#detail_resrceNm");
		const resrceImage = document.getElementById("detail_resrceImage");
		const resrceRegistDe = document.querySelector("#detail_resrceRegistDe");
		const resrceUpdDe = document.querySelector("#detail_resrceUpdDe");
		const resrceInfo = document.querySelector("#detail_resrceInfo");
		const commonCode = document.querySelector("#detail_commonCode");
		
		$(document).on('click', '#resource_detail', function(e) {
		    e.preventDefault();
		    let resrceNo = $(this).data('detail-no');
		    
		    console.log("resrceNo ==>", resrceNo);

		    $.ajax({
		        url: `/resources/searchResource/\${resrceNo}`,
		        method: "GET",
		        dataType: "json",
		        success: function(resp) {
		            console.log("resp===>", resp);
		            $.each(resp,function(i,v){
		            	console.log(i,":",v.resrceNm);
		            	resrceNm.innerHTML = v.resrceNm;
		            	resrceImage.src = "${pageContext.request.contextPath}/resources/image/resourceimage/"+v.resrceImage;
		            	resrceRegistDe.innerHTML = v.resrceRegistDe;
		            	resrceUpdDe.innerHTML = v.resrceUpdDe;
		            	commonCode.innerHTML = v.commonCode.cmmnCodeNm;
		            	resrceInfo.innerHTML = v.resrceInfo;
		            })
		            
		        },
		        error: function(xhr, status, error) {
		            console.error("AJAX 요청 실패:", status, error);
		        }
		    });
		});
		
	})


</script>