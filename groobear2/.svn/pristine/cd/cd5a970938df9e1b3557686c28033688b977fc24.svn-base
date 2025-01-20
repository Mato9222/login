<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<security:authentication property="principal.realUser" var="realUser"/>
<input type="hidden" name="emplNo" value="${realUser.emplNo}">
<input type="hidden" name="emplNo" value="${realUser.deptNo}">
						<!--begin::Content wrapper-->
						<div class="d-flex flex-column flex-column-fluid">
							<!--begin::Toolbar-->
							<div id="kt_app_toolbar" class="app-toolbar py-3 py-lg-6">
								<!--begin::Toolbar container-->
								<div id="kt_app_toolbar_container" class="app-container container-xxl d-flex flex-stack">
									<!--begin::Page title-->
									<div class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
										<!--begin::Title-->
										<h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">일정</h1>
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
											<li class="breadcrumb-item text-muted">일정</li>
										</ul>
										<!--제목 아래 경로 설명 끝-->
									</div>
									<!--end::Page title-->
									
									<!--begin::Actions-->
									<div class="d-flex align-items-center gap-2 gap-lg-3">
										<!--begin::Filter menu-->
										<div class="m-0">
											<!--begin::Menu toggle-->
											<a href="#" class="btn btn-sm btn-flex btn-secondary fw-bold" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">
											<i class="ki-duotone ki-filter fs-6 text-muted me-1">
												<span class="path1"></span>
												<span class="path2"></span>
											</i>필터</a>
											<!--end::Menu toggle-->
											<!--begin::Menu 1-->
											<div class="menu menu-sub menu-sub-dropdown w-250px w-md-300px" data-kt-menu="true" id="kt_menu_6606384989f52">
												<!--begin::Header-->
												<div class="px-7 py-5">
													<div class="fs-5 text-gray-900 fw-bold">일정 선택</div>
												</div>
												<!--end::Header-->
												<!--begin::Menu separator-->
												<div class="separator border-gray-200"></div>
												<!--end::Menu separator-->
												<!--begin::Form-->
												<div class="px-7 py-5">
													<!--begin::Input group-->
													<div class="mb-10">
														<div class="py-5 mb-5">
														    <div class="mb-5">
														        <div class="form-check form-check-custom form-check-danger">
														            <input class="form-check-input" type="radio" value="all" id="flexCheckDefault1" name="radio2"  checked/>
														            <label class="form-check-label" for="flexCheckDefault1">
														                전체일정
														            </label>
														        </div>
														    </div>
														
														    <div class="mb-5">
														        <div class="form-check form-check-custom form-check-success">
														            <input class="form-check-input" type="radio" value="L01" id="flexCheckChecked1" name="radio2"/>
														            <label class="form-check-label" for="flexCheckChecked1">
														                개인일정
														            </label>
														        </div>
														    </div>
														    <div class="mb-5">
														        <div class="form-check">
														            <input class="form-check-input" type="radio" value="L02" id="flexCheckChecked2" name="radio2" />
														            <label class="form-check-label" for="flexCheckChecked2">
														                부서일정
														            </label>
														        </div>
														    </div>
														    <div class="mb-0">
														        <div class="form-check form-check-custom form-check-warning">
														            <input class="form-check-input" type="radio" value="L03" id="flexCheckChecked3" name="radio2" />
														            <label class="form-check-label" for="flexCheckChecked3">
														                회사일정
														            </label>
														        </div>
														    </div>
														</div>
														<!--end::Input-->
													</div>
													<!--end::Input group-->
													<!--begin::Input group-->
													<div class="mb-10">
														<!--begin::Label-->
														<label class="form-label fw-semibold">알림</label>
														<!--end::Label-->
														<!--begin::Switch-->
														<div class="form-check form-switch form-switch-sm form-check-custom form-check-solid">
															<input class="form-check-input" type="checkbox" value="" name="notifications" checked="checked" />
															<label class="form-check-label">활성화</label>
															
														</div>
														<!--end::Switch-->
													</div>
													<!--end::Input group-->
													<!--begin::Actions-->
													</div>
													<div class="d-flex justify-content-end m-5">
														<button type="submit" class="btn btn-sm btn-primary" data-kt-menu-dismiss="true">설정완료</button>
													</div>
													<!--end::Actions-->
												</div>
												<!--end::Form-->
											</div>
											<!--end::Menu 1-->
										</div>
										<!--end::Filter menu-->
										<!--begin::Secondary button-->
										<!--end::Secondary button-->
									</div>
									<!--end::Actions-->
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
										<div class="card-header">
											<h2 class="card-title fw-bold">일정</h2>
											<div class="card-toolbar">
												<button class="btn btn-flex btn-primary" data-kt-calendar="add">
												<i class="ki-duotone ki-plus fs-2"></i>일정 등록</button>
											</div>
										</div>
										<!--end::Card header-->
										<!--begin::Card body-->
										<div class="card-body">
											<!--begin::Calendar-->
											<div id="kt_calendar_app"></div>
											<!--end::Calendar-->
										</div>
										<!--end::Card body-->
									</div>
									<!--end::Card-->
									<!--begin::Modals-->
									<!--begin::Modal - New Product-->
									<div class="modal fade" id="kt_modal_add_event" tabindex-="1" aria-hidden="true" data-bs-focus="false">
										<!--begin::Modal dialog-->
										<div class="modal-dialog modal-dialog-centered mw-650px">
											<!--begin::Modal content-->
											<div class="modal-content">
												<!--begin::Form-->
											 	<form class="form" action="/schedule" id="kt_modal_add_event_form">
													<!--begin::Modal header-->
													<div class="modal-header">
														<!--begin::Modal title-->
														<h2 class="fw-bold" data-kt-calendar="title">일정 등록</h2>
														<!--end::Modal title-->
														<!--begin::Close-->
														<div class="btn btn-icon btn-sm btn-active-icon-primary" id="kt_modal_add_event_close">
															<i class="ki-duotone ki-cross fs-1">
																<span class="path1"></span>
																<span class="path2"></span>
															</i>
														</div>
														<!--end::Close-->
													</div>
													<!--end::Modal header-->
													<!--begin::Modal body-->
													<div class="modal-body py-10 px-lg-17">
														<input type="hidden" name="schdulNo">
														<!--begin::Input group-->
														<div class="fv-row mb-9">
															<!--begin::Label-->
															<label class="fs-6 fw-semibold required mb-2">일정 제목</label> 
															<!--end::Label-->
															<!--begin::Input-->
														<input type="text" class="form-control form-control-solid" placeholder="" name="calendar_event_name"/>
															<!--end::Input-->
														</div>
														<!--end::Input group-->
														<!--begin::Input group-->
														<div class="fv-row mb-9">
															<!--begin::Label-->
															<label class="fs-6 fw-semibold mb-2">일정 내용</label>
															<!--end::Label-->
															<!--begin::Input-->
															<input type="text" class="form-control form-control-solid" placeholder="" name="calendar_event_description" />
															<!--end::Input-->
														</div>
														<!--end::Input group-->
														<!--begin::Input group-->
														<div class="fv-row mb-9">
															<!--begin::Label-->
															<label class="fs-6 fw-semibold mb-2">일정 장소</label>
															<!--end::Label-->
															<!--begin::Input-->
															<input type="text" class="form-control form-control-solid" placeholder="" name="calendar_event_location" />
															<!--end::Input-->
														</div>
														<!--end::Input group-->
														<!--begin::Input group-->
														<div class="fv-row mb-9">
															<!--begin::Checkbox-->
															<label class="form-check form-check-custom form-check-solid">
																<input class="form-check-input" type="checkbox" value="" id="kt_calendar_datepicker_allday" name="calendar_allDay"/>
																<span class="form-check-label fw-semibold" for="kt_calendar_datepicker_allday">하루 종일</span>
															</label>
															<!--end::Checkbox-->
														</div>
												<div class="col" data-kt-calendar="eventType">
													<div class="mb-10">
														<!--begin::Label-->
														<label class="form-label fw-semibold">일정 선택</label>
														<!--end::Label-->
														<!--begin::Input-->
														<div>
															<select class="form-select form-select-solid" name="calendar_event_Type" data-kt-select2="true" data-close-on-select="true" data-placeholder="일정 선택" data-allow-clear="false">
																<option ></option>
																<option value="L01">개인일정</option>
																<option value="L02">부서일정</option>
																<security:authorize access="${realUser.ofcpsCode eq 'A08'}">
																<option value="L03">회사일정</option>
																</security:authorize>
															</select>
														</div>
														<!--end::Input-->
													</div>
												</div>
														<!--end::Input group-->
														<!--begin::Input group-->
														<div class="row row-cols-lg-2 g-10">
															<div class="col">
																<div class="fv-row mb-9">
																	<!--begin::Label-->
																	<label class="fs-6 fw-semibold mb-2 required">일정 시작 날짜</label>
																	<!--end::Label-->
																	<!--begin::Input-->
																	<input class="form-control form-control-solid" name="calendar_event_start_date" placeholder="Pick a start date" id="kt_calendar_datepicker_start_date" />
																	<!--end::Input-->
																</div>
															</div>
															<div class="col" data-kt-calendar="datepicker">
																<div class="fv-row mb-9">
																	<!--begin::Label-->
																	<label class="fs-6 fw-semibold mb-2">일정 시작 시간</label>
																	<!--end::Label-->
																	<!--begin::Input-->
																	<input class="form-control form-control-solid" name="calendar_event_start_time" placeholder="Pick a start time" id="kt_calendar_datepicker_start_time" />
																	<!--end::Input-->
																</div>
															</div>
														</div>
														<!--end::Input group-->
														<!--begin::Input group-->
														<div class="row row-cols-lg-2 g-10">
															<div class="col">
																<div class="fv-row mb-9">
																	<!--begin::Label-->
																	<label class="fs-6 fw-semibold mb-2 required">일정 종료 날짜</label>
																	<!--end::Label-->
																	<!--begin::Input-->
																	<input class="form-control form-control-solid" name="calendar_event_end_date" placeholder="Pick a end date" id="kt_calendar_datepicker_end_date" />
																	<!--end::Input-->
																</div>
															</div>
															<div class="col" data-kt-calendar="datepicker">
																<div class="fv-row mb-9">
																	<!--begin::Label-->
																	<label class="fs-6 fw-semibold mb-2">일정 종료 시간</label>
																	<!--end::Label-->
																	<!--begin::Input-->
																	<input class="form-control form-control-solid" name="calendar_event_end_time" placeholder="Pick a end time" id="kt_calendar_datepicker_end_time" />
																	<!--end::Input-->
																</div>
															</div>
														</div>
														<!--end::Input group-->
													</div>
													<!--end::Modal body-->
													<!--begin::Modal footer-->
													<div class="modal-footer flex-center">
														<!--begin::Button-->
														<button type="button" id="kt_modal_add_event_submit" class="btn btn-primary">
															<span class="indicator-label">저장</span>
															<span class="indicator-progress">저장중.. 
															<span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
														</button>
																<!--end::Button-->
														<!--begin::Button-->
														<button type="reset" id="kt_modal_add_event_cancel" class="btn btn-light me-3">취소</button>
														<!--end::Button-->
													</div>
													<!--end::Modal footer-->
												</form>
												<!--end::Form-->
											</div>
										</div>
									</div>
									<!--end::Modal - New Product-->
									<!--begin::Modal - New Product-->
									<div class="modal fade" id="kt_modal_view_event" tabindex="-1" data-bs-focus="false" aria-hidden="true">
										<!--begin::Modal dialog-->
										<div class="modal-dialog modal-dialog-centered mw-650px">
											<!--begin::Modal content-->
											<div class="modal-content">
												<!--begin::Modal header-->
												<div class="modal-header border-0 justify-content-end">
													<h2 class="fw-bold" data-kt-calendar="title" style="position:relative; left: -418px;top: 5px;">일정 조회</h2>
													<!--begin::Edit-->
													<div class="btn btn-icon btn-sm btn-color-gray-500 btn-active-icon-primary me-2" data-bs-toggle="tooltip" data-bs-dismiss="click" title="Edit Event" id="kt_modal_view_event_edit">
														<i class="ki-duotone ki-pencil fs-2">
															<span class="path1"></span>
															<span class="path2"></span>
														</i>
													</div>
													<!--end::Edit-->
													<!--begin::Edit-->
													<div class="btn btn-icon btn-sm btn-color-gray-500 btn-active-icon-danger me-2" data-bs-toggle="tooltip" data-bs-dismiss="click" title="Delete Event" id="kt_modal_view_event_delete">
														<i class="ki-duotone ki-trash fs-2">
															<span class="path1"></span>
															<span class="path2"></span>
															<span class="path3"></span>
															<span class="path4"></span>
															<span class="path5"></span>
														</i>
													</div>
													<!--end::Edit-->
													<!--begin::Close-->
													<div class="btn btn-icon btn-sm btn-color-gray-500 btn-active-icon-primary" data-bs-toggle="tooltip" title="Hide Event" data-bs-dismiss="modal">
														<i class="ki-duotone ki-cross fs-2x">
															<span class="path1"></span>
															<span class="path2"></span>
														</i>
													</div>
													<!--end::Close-->
												</div>
												<!--end::Modal header-->
												<!--begin::Modal body-->
												<div class="modal-body pt-0 pb-20 px-lg-17">
													<!--begin::Row-->
													<div class="d-flex">
														<!--begin::Icon-->
														<i class="ki-duotone ki-calendar-8 fs-1 text-muted me-5">
															<span class="path1"></span>
															<span class="path2"></span>
															<span class="path3"></span>
															<span class="path4"></span>
															<span class="path5"></span>
															<span class="path6"></span>
														</i>
														<!--end::Icon-->
														<div class="mb-9">
															<!--begin::Event name-->
															<div class="d-flex align-items-center mb-2">
																<span class="fs-3 fw-bold me-3" data-kt-calendar="event_name"></span>
																<span class="badge badge-light-success" data-kt-calendar="all_day"></span>
																<span class="badge badge-event-type" data-kt-calendar="event_Type" style="margin-left:5px;"></span>
															</div>
															<!--end::Event name-->
															<!--begin::Event description-->
															<div class="fs-6" data-kt-calendar="event_description"></div>
															<!--end::Event description-->
														</div>
													</div>
													<!--end::Row-->
													<!--begin::Row-->
													<div class="d-flex align-items-center mb-2">
														<!--begin::Bullet-->
														<span class="bullet bullet-dot h-10px w-10px bg-success ms-2 me-7"></span>
														<!--end::Bullet-->
														<!--begin::Event start date/time-->
														<div class="fs-6">
															<span class="fw-bold">시작일자(시)</span>
															<span data-kt-calendar="event_start_date"></span>
														</div>
														<!--end::Event start date/time-->
													</div>
													<!--end::Row-->
													<!--begin::Row-->
													<div class="d-flex align-items-center mb-9">
														<!--begin::Bullet-->
														<span class="bullet bullet-dot h-10px w-10px bg-danger ms-2 me-7"></span>
														<!--end::Bullet-->
														<!--begin::Event end date/time-->
														<div class="fs-6">
															<span class="fw-bold">종료일자(시)</span>
															<span data-kt-calendar="event_end_date"></span>
														</div>
														<!--end::Event end date/time-->
													</div>
													<!--end::Row-->
													<!--begin::Row-->
													<div class="d-flex align-items-center">
														<!--begin::Icon-->
														<i class="ki-duotone ki-geolocation fs-1 text-muted me-5">
															<span class="path1"></span>
															<span class="path2"></span>
														</i>
														<!--end::Icon-->
														<!--begin::Event location-->
														<div class="fs-6" data-kt-calendar="event_location"></div>
														<!--end::Event location-->
													</div>
													<!--end::Row-->
												</div>
												<!--end::Modal body-->
											</div>
										</div>
									</div>
									<!--end::Modal - New Product-->
									<!--end::Modals-->
								</div>
								<!--end::Content container-->
							</div>
							<!--end::Content-->
						</div>
						<!--end::Content wrapper-->
						<script src="${pageContext.request.contextPath}/resources/demo1/assets/js/custom/apps/calendar/calendar.js"></script>