<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="atdcV" value="${attendanceVO}"/>
<security:authentication property="principal.realUser" var="realUser" />
<style>
 .overdue {
            color: red;
}
 .remain {
            color: blue;
}
a {
	color: black;
}

a:hover {
	color: black;
	border-bottom: solid 1px;
}

.word {
	display: block;
	color: black;
	width: 400px;
	font-weight: bolder !important;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.adrsStyle {
	height: auto;
	width: 100%;
	border: 1px solid lightgray;
}

.boardSubject {
	/* margin:100px; */
	/* outline: 1px solid black; */
	/* display: block; */
	/* color: black; */
	/* width: 630px; */
	/* font-size: 12px; */
	/* font-weight: bolder !important; */
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>
<!--begin::Content-->
<div id="kt_app_content" class="app-content flex-column-fluid">
	<!--begin::Content container-->
	<div id="kt_app_content_container"
		class="app-container container-fluid">
		<!--begin::Row-->
		<div class="row g-5 gx-xl-10 mb-5 mb-xl-10">
			<!--begin::Col 라인 크기 조절 col-xxl-4 4대신 3-->
			<div class="row g-5 g-xl-10 mb-5 mb-xl-10">
				<!--begin::Col-->
				<div class="col-xl-4">
					<!--begin::Chart Widget 35-->
					<div class="card mb-5 mb-xl-8">
						<!--begin::Body-->
						<div class="card-header pt-7">
							<!--begin::Title-->
							<h3 class="card-title align-items-start flex-column">
								<span class="card-label fw-bold text-gray-800">사원 정보</span>
								<!-- <span class="text-gray-500 mt-1 fw-semibold fs-6">Avg. 69.34% Conv. Rate</span> -->
							</h3>
							<!--end::Title-->
							<!--begin::Toolbar-->
							<!--end::Toolbar-->
						</div>
						<div class="card-body pt-15 px-0">
							<!--begin::Member-->
							<div class="d-flex flex-column text-center mb-9 px-9">
								<!--begin::Photo-->
								<div class="symbol symbol-80px symbol-lg-150px mb-4">
									<img
										src="${pageContext.request.contextPath}/resources/image/${realUser.proflPhotoCours}"
										class="" alt="" />
								</div>
								<!--end::Photo-->
								<!--begin::Info-->
								<div class="text-center">
									<!--begin::Name-->
									<span class="text-gray-800 fw-bold text-hover-primary fs-4">
										${realUser.emplNm } ${realUser.ofcpsCodeNm }
									</span>
									<!--end::Name-->
									<!--begin::Position-->
									<span class="text-muted d-block fw-semibold">${realUser.deptNm }</span>
									<!--end::Position-->
								</div>
								<!--end::Info-->
							</div>
							<!--end::Member-->
							<!--begin::Row-->
							<div class="row px-9 mb-4">
								<!--begin::Col-->
								<!--end::Col-->
								<div class="d-flex flex-wrap flex-center">
									<!--begin::Stats-->
									<form method="post">
										<c:if test="${atdcV.attendDt eq null}">
											<button type="button" class="btn btn-light-primary hover-scale mx-2 w-125px"
												id="indexAttendBtn">출근</button>
										</c:if>
										<c:if test="${atdcV.attendDt ne null}">
											<span class="btn btn-primary mx-2 w-125px" style="cursor: default;">출근 완료</span>
										</c:if>
									</form>
									<!--end::Stats-->
									<!--begin::Stats-->
									<form method="post">
										<button type="button" class="btn btn-light-primary hover-scale mx-2 w-125px" id="indexLvffcBtn">퇴근</button>
									</form>
									<!--end::Stats-->
								</div>
								<div class="d-flex flex-stack fs-4 py-3">
									<div class="fw-bold rotate collapsible"
										data-bs-toggle="collapse" href="#kt_user_view_details"
										role="button" aria-expanded="false"
										aria-controls="kt_user_view_details">
										상세 정보 <span class="ms-2 rotate-180"> <i
											class="ki-duotone ki-down fs-3"></i>
										</span>
									</div>
								</div>
								<!--end::Details toggle-->
								<div class="separator"></div>
								<!--begin::Details content-->
								<div id="kt_user_view_details" class="collapse show">
									<div class="pb-5 fs-6">
										<div class="fw-bold mt-5">출근 시간</div>
										<div class="text-gray-600" id="attendTime">${atdcV.attendDt}</div>
										<!--end::Details item-->
										<!--begin::Details item-->
										<div class="fw-bold mt-5">퇴근 시간</div>
										<div class="text-gray-600" id="lvffcTime">${atdcV.lvffcDt}</div>
										<!--end::Details item-->
										<!--begin::Details item-->
										<div class="fw-bold mt-5">근무 시간</div>
										<div class="text-gray-600" id="workTime">-- : -- : --</div>
										<!--end::Details item-->
									</div>
								</div>
							</div>
							<!--end::Row-->
							<!--begin::Navbar-->

							<!--end::Navbar-->
						</div>
						<!--end::Body-->
					</div>
					<!--end::Chart Widget 35-->
				</div>
				<!--end::Col-->
				<!--begin::Col-->
				<div class="col-xl-8">
					<!--begin::Table widget 14-->
					<div class="card card-flush h-md-100">
						<!--begin::Header-->
						<div class="card-header pt-7" style="border-bottom: 1px solid var(--bs-card-border-color) !important">
							<!--begin::Title-->
							<h3 class="card-title align-items-start flex-column">
								<span class="card-label fw-bold text-gray-800">새 알림</span>
								<!-- <span class="text-gray-500 mt-1 fw-semibold fs-6">Avg. 69.34% Conv. Rate</span> -->
							</h3>
							<!--end::Title-->
							<!--begin::Toolbar-->
							<!--end::Toolbar-->
						</div>
						<!--end::Header-->
						<!--begin::Body-->
						<div class="card-body pt-6">
							<!--begin::Nav-->
							<ul class="nav nav-pills nav-pills-custom mb-3 d-flex" style="justify-content: center;">
								<!--begin::Item-->
								<li class="nav-item ms-5 mb-3 me-3 me-lg-16">
									<!--begin::Link--> <a
									class="nav-link btn btn-outline btn-flex btn-color-muted btn-active-color-primary flex-column overflow-hidden w-100px h-85px pt-5 pb-2 active"
									id="kt_stats_widget_16_tab_link_1" data-bs-toggle="pill"
									href="#kt_stats_widget_16_tab_1"> <!--begin::Icon-->
										<div class="nav-icon mb-3">
											<i class="ki-duotone ki-sms fs-1"> <span class="path1"></span>
												<span class="path2"></span> <span class="path3"></span> 
												<span class="path4"></span> <span class="path5"></span>
											</i>
										</div> <!--end::Icon--> <!--begin::Title--> 
										<span class="nav-text text-gray-800 fw-bold fs-9 lh-1">받은 메일함</span> <!--end::Title-->
										<!--begin::Bullet--> 
										<span class="bullet-custom position-absolute bottom-0 w-100 h-4px bg-primary"></span>
										<!--end::Bullet-->
								</a> <!--end::Link-->
								</li>
								<!--end::Item-->
								<!--begin::Item-->
								<li class="nav-item mb-3 me-3 me-lg-16">
									<!--begin::Link--> 
									<a class="nav-link btn btn-outline btn-flex btn-color-muted btn-active-color-primary flex-column overflow-hidden w-100px h-85px pt-5 pb-2"
									id="kt_stats_widget_16_tab_link_2" data-bs-toggle="pill" href="#kt_stats_widget_16_tab_2"> <!--begin::Icon-->
										<div class="nav-icon mb-3">
											<i class="ki-duotone ki-notepad-edit fs-1"> 
												<span class="path1"></span>
												<span class="path2"></span>
											</i>
										</div> 
										<!--end::Icon--> 
										<!--begin::Title--> 
										<span class="nav-text text-gray-800 fw-bold fs-9 lh-1">전자결재</span> <!--end::Title-->
										<!--begin::Bullet--> 
										<span class="bullet-custom position-absolute bottom-0 w-100 h-4px bg-primary"></span>
										<!--end::Bullet-->
								</a> <!--end::Link-->
								</li>
								<!--end::Item-->
								<!-- 공지사항 게시판 버튼 -->
								<li class="nav-item mb-3 me-3 me-lg-16">
									<a class="nav-link btn btn-outline btn-flex btn-color-muted btn-active-color-primary flex-column overflow-hidden w-100px h-85px pt-5 pb-2"
										id="kt_stats_widget_16_tab_link_3" data-bs-toggle="pill" href="#kt_stats_widget_16_tab_3"> 
										<div class="nav-icon mb-3">
											<i class="ki-duotone ki-directbox-default fs-1">
												<span class="path1"></span>
												<span class="path2"></span>
											</i>
										</div>
										<span class="nav-text text-gray-800 fw-bold fs-9 lh-1">공지사항</span>
										<span class="bullet-custom position-absolute bottom-0 w-100 h-4px bg-primary"></span>
									</a>
								</li>
								<!-- 부서 게시판 버튼 -->
								<li class="nav-item mb-3 me-3 me-lg-16">
									<a class="nav-link btn btn-outline btn-flex btn-color-muted btn-active-color-primary flex-column overflow-hidden w-100px h-85px pt-5 pb-2"
										id="kt_stats_widget_16_tab_link_4" data-bs-toggle="pill" href="#kt_stats_widget_16_tab_4">
										<div class="nav-icon mb-3">
											<i class="ki-duotone ki-message-text-2 fs-1">
												<span class="path1"></span>
												<span class="path2"></span>
												<span class="path3"></span>
											</i>
										</div> 
										<span class="nav-text text-gray-800 fw-bold fs-9 lh-1">부서게시판</span>
										<span class="bullet-custom position-absolute bottom-0 w-100 h-4px bg-primary"></span>
									</a>
								</li>
								<!--end::Item-->
								<!--begin::Item-->
								<li class="nav-item mb-3 me-3">
									<!--begin::Link--> 
									<a class="nav-link btn btn-outline btn-flex btn-color-muted btn-active-color-primary flex-column overflow-hidden w-100px h-85px pt-5 pb-2"
									id="kt_stats_widget_16_tab_link_5" data-bs-toggle="pill" href="#kt_stats_widget_16_tab_5">
									<!--begin::Icon-->
										<div class="nav-icon mb-3">
											<i class="ki-duotone ki-timer fs-1"> <span class="path1"></span>
												<span class="path2"></span>
											</i>
										</div> <!--end::Icon--> <!--begin::Title--> 
										<span class="nav-text text-gray-800 fw-bold fs-9 lh-1">예약</span> <!--end::Title-->
										<!--begin::Bullet--> <span
										class="bullet-custom position-absolute bottom-0 w-100 h-4px bg-primary"></span>
										<!--end::Bullet-->
								</a> <!--end::Link-->
								</li>
								<!--end::Item-->
							</ul>
							<!--end::Nav-->
							<!--begin::Tab Content-->
							<div class="tab-content">
								<!--begin::Tap pane-->
								<div class="tab-pane fade show active" id="kt_stats_widget_16_tab_1">
									<!--begin::Table container-->
									<div class="table-responsive">
										<!--begin::Table-->
										<table
											class="table table-row-dashed align-middle gs-0 gy-3 my-0">
											<!--begin::Table head-->
											<thead>
												<tr class="fs-7 fw-bold text-gray-500 border-bottom-0">
													<th class="text-center" width="25%" colspan="2">보낸사람</th>
													<th class="text-center" width="50%">제목</th>
													<th class="text-center" width="25%">보낸날짜</th>
												</tr>
											</thead>
											<!--end::Table head-->
											<!--begin::Table body-->
											<tbody class="mailList">
											</tbody>
											<!--end::Table body-->
										</table>
										<!--end::Table-->
									</div>
									<!--end::Table container-->
								</div>
								<!--end::Tap pane-->
								<!--begin::Tap pane-->
								<div class="tab-pane fade" id="kt_stats_widget_16_tab_2">
									<!--begin::Table container-->
									<div class="table-responsive">
										<!--begin::Table-->
										<table
											class="table table-row-dashed align-middle gs-0 gy-3 my-0">
											<!--begin::Table head-->
											<!-- 											
											<thead>
												<tr class="fs-7 fw-bold text-gray-500 border-bottom-0">
													<th class="p-0 pb-3 min-w-150px text-start">AUTHOR</th>
													<th class="p-0 pb-3 min-w-100px text-end pe-13">CONV.</th>
													<th class="p-0 pb-3 w-125px text-end pe-7">CHART</th>
													<th class="p-0 pb-3 w-50px text-end">VIEW</th>
												</tr>
											</thead>
											 -->
											<!--end::Table head-->
											<!--begin::Table body-->
											<tbody>
												<tr>
													<td>
														<div class="text-center min-w-200px">
															<div class="min-w-200px bg-success card-rounded py-2">
																<div class="text-white fs-3 fw-bold my-3">결재 대기 문서</div>
																<div
																	class="fs-5x text-white d-flex justify-content-center align-items-start">
																	<span class="lh-sm fw-semibold my-3" id="wait"
																		data-kt-plan-price-month="99"
																		data-kt-plan-price-annual="399"></span>
																</div>
																<a href="/sanctionDoc/wait"
																	class="btn bg-white bg-opacity-20 bg-hover-white text-hover-primary text-white fw-bold mx-auto my-2">이동</a>
															</div>
														</div>
													</td>
													<td>
														<div class="text-center min-w-200px">
															<div class="min-w-200px bg-primary card-rounded py-2">
																<div class="text-white fs-3 fw-bold my-3">기안 진행 문서</div>
																<div
																	class="fs-5x text-white d-flex justify-content-center align-items-start">
																	<span class="lh-sm fw-semibold my-3" id="process"
																		data-kt-plan-price-month="99"
																		data-kt-plan-price-annual="399"></span>
																</div>
																<a href="/sanctionDoc/list"
																	class="btn bg-white bg-opacity-20 bg-hover-white text-hover-primary text-white fw-bold mx-auto my-2">이동</a>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="text-center min-w-200px">
															<div class="min-w-200px bg-info card-rounded py-2">
																<div class="text-white fs-3 fw-bold my-3">수신 문서</div>
																<div
																	class="fs-5x text-white d-flex justify-content-center align-items-start">
																	<span class="lh-sm fw-semibold my-3" id="rcver"
																		data-kt-plan-price-month="99"
																		data-kt-plan-price-annual="399"></span>
																</div>
																<a href="/sanctionList/receive"
																	class="btn bg-white bg-opacity-20 bg-hover-white text-hover-primary text-white fw-bold mx-auto my-2">이동</a>
															</div>
														</div>
													</td>
													<td>
														<div class="text-center min-w-200px">
															<div class="min-w-200px bg-warning card-rounded py-2">
																<div class="text-white fs-3 fw-bold my-3">참조 문서</div>
																<div
																	class="fs-5x text-white d-flex justify-content-center align-items-start">
																	<span class="lh-sm fw-semibold my-3" id="reference"
																		data-kt-plan-price-month="99"
																		data-kt-plan-price-annual="399"></span>
																</div>
																<a href="/sanctionList/reference"
																	class="btn bg-white bg-opacity-20 bg-hover-white text-hover-primary text-white fw-bold mx-auto my-2">이동</a>
															</div>
														</div>
													</td>
												</tr>
											</tbody>
											<!--end::Table body-->
										</table>
										<!--end::Table-->
									</div>
									<!--end::Table container-->
								</div>
								<!--end::Tap pane-->
								<!-- 공지사항 목록 -->
								<div class="tab-pane fade" id="kt_stats_widget_16_tab_3">
									<div class="table-responsive">
										<table class="table table-row-dashed align-middle gs-0 gy-3 my-0">
											<thead>
												<tr class="fs-7 fw-bold text-gray-700 border-bottom-0">
													<th class="text-center" width="10%">No</th>
													<th class="text-center" width="20%">카테고리</th>
													<th class="text-center" width="30%">제목</th>
													<th class="text-center" width="20%">작성자</th>
													<th class="text-center" width="20%">작성일시</th>
												</tr>
											</thead>
											<tbody class="noticsBoard">
												<!-- 공지사항 목록 내용 -->
											</tbody>
										</table>
									</div>
								</div>
								<!-- 부서게시판 목록 -->
								<div class="tab-pane fade" id="kt_stats_widget_16_tab_4">
									<div class="table-responsive">
										<table class="table table-row-dashed align-middle gs-0 gy-3 my-0">
											<thead>
												<tr class="fs-7 fw-bold text-gray-700 border-bottom-0">
													<th class="text-center" width="10%">No</th>
													<th class="text-center" width="20%">카테고리</th>
													<th class="text-center" width="30%">제목</th>
													<th class="text-center" width="20%">작성자</th>
													<th class="text-center" width="20%">작성일시</th>
												</tr>
											</thead>
											<tbody class="departBoard">
												<!-- 부서게시판 목록 내용 -->
											</tbody>
										</table>
									</div>
								</div>
								<!--begin::Tap pane-->
								<div class="tab-pane fade" id="kt_stats_widget_16_tab_5">
									<!--begin::Table container-->
									<div class="table-responsive">
										<!--begin::Table-->
										<table
											class="table table-row-dashed align-middle gs-0 gy-3 my-0">
											<!--begin::Table head-->
											<thead>
												<tr class="fs-7 fw-bold text-gray-500 border-bottom-0">
													<th class="text-center" width="50%">예약 자원명</th>
													<th class="text-center" width="20%">예약일시</th>
													<th class="text-center" width="20%">종료일시</th>
													<th class="text-center" width="10%">예약상태</th>
												</tr>
											</thead>
											<!--end::Table head-->
											<!--begin::Table body-->
											<tbody>
												<c:forEach begin="0" end="4" items="${reservationList }" var="res">
												<tr>
													<td class="text-center">
														<div class="d-flex align-items-center">
															<div class="d-flex justify-content-start flex-column">
																<span class="text-gray-800 fw-bold text-primary mb-1 fs-6">${res.resrceNm}</span>
															</div>
														</div>
													</td>
													<td class="text-center">
														<span class="text-gray-600 fw-bold fs-6">${res.resveBeginDe }</span>
													</td>
													<td class="text-center">
														<span class="text-gray-600 fw-bold fs-6">${res.resveEndDe }</span>
													</td>
													<c:if test="${res.resveSttusCode eq 'E01' }">
													<td class="text-center">
														<span class="badge badge-light-success">반납완료</span>
													</td>
													</c:if>
													<c:if test="${res.resveSttusCode eq 'E02' }">
													<td class="text-center">
														<span class="badge badge-light-info">대여중</span>
													</td>
													</c:if>
													<c:if test="${res.resveSttusCode eq 'E03' }">
													<td class="text-center">
														<span class="badge badge-light-success">대여가능</span>
													</td>
													</c:if>
													<c:if test="${res.resveSttusCode eq 'E04' }">
													<td class="text-center">
														<span class="badge badge-light-danger">예약취소</span>
													</td>
													</c:if>
												</tr>
												</c:forEach>
											</tbody>
											<!--end::Table body-->
										</table>
										<!--end::Table-->
									</div>
									<!--end::Table container-->
								</div>
								<!--end::Tap pane-->
								<!--end::Table container-->
							</div>
							<!--end::Tab Content-->
						</div>
						<!--end: Card Body-->
					</div>
					<!--end::Table widget 14-->
				</div>
				<!--end::Col-->
			</div>
			<div class="row gx-5 gx-xl-10">
				<!--begin::Col-->
				<div class="col-xl-4 mb-5 mb-xl-0">
					<!--begin::Chart widget 31-->
					<div class="card card-flush h-xl-100">
						<!--begin::Header-->
						<div class="card-header pt-7 mb-7" style="border-bottom: 1px solid var(--bs-card-border-color) !important">
							<!--begin::Title-->
							<h3 class="card-title align-items-start flex-column">
								<span class="card-label fw-bold text-gray-800">내 일정</span>
							</h3>
							<!--end::Title-->
							<!--begin::Toolbar-->
							<!--end::Toolbar-->
						</div>
						<!--end::Header-->
						<!--begin::Body-->
						<div class="p-3">
							<!--begin::Chart-->
							<div id="kt_docs_fullcalendar_selectable2"></div>
							<!--end::Chart-->
						</div>
						<!--end::Body-->
					</div>
					<!--end::Chart widget 31-->
				</div>
				<!--end::Col-->
				<!--begin::Col-->
				<div class="col-xl-8">
					<!--begin::Chart widget 24-->
					<div class="card card-flush h-md-100">
						<!--begin::Header-->
						<div class="card-header pt-7" style="border-bottom: 1px solid var(--bs-card-border-color) !important">
							<!--begin::Title-->
							<h3 class="card-title align-items-start flex-column">
								<span class="card-label fw-bold text-gray-800">프로젝트</span>
								<!-- <span class="text-gray-500 mt-1 fw-semibold fs-6">Avg. 69.34% Conv. Rate</span> -->
							</h3>
							<!--end::Title-->
							<!--begin::Toolbar-->
							<!--end::Toolbar-->
						</div>
						<!--end::Header-->
						<!--begin::Body-->
						<div class="card-body pt-6">
							<!--begin::Nav-->
							<ul class="nav nav-pills nav-pills-custom mb-3 d-flex" style="justify-content: center;">
								<!--begin::Item-->
								<li class="nav-item ms-5 mb-3 me-3 me-lg-20">
									<!--begin::Link--> <a
									class="nav-link btn btn-outline btn-flex btn-color-muted btn-active-color-primary flex-column overflow-hidden w-100px h-85px pt-5 pb-2 active"
									id="kt_stats_widget_16_tab_link_1" data-bs-toggle="pill"
									href="#kt_stats_widget_16_tab_6"> <!--begin::Icon-->
										<div class="nav-icon mb-3">
											<i class="ki-duotone ki-sms fs-1"> <span class="path1"></span>
												<span class="path2"></span> <span class="path3"></span> <span
												class="path4"></span> <span class="path5"></span>
											</i>
										</div> <!--end::Icon--> <!--begin::Title--> 
										<span class="nav-text text-gray-800 fw-bold fs-9 lh-1">현황</span> <!--end::Title-->
										<!--begin::Bullet--> 
										<span class="bullet-custom position-absolute bottom-0 w-100 h-4px bg-primary"></span>
										<!--end::Bullet-->
								</a> <!--end::Link-->
								</li>
								<!--end::Item-->
								<!--begin::Item-->
								<li class="nav-item mb-3 me-3 me-lg-20">
									<!--begin::Link--> <a
									class="nav-link btn btn-outline btn-flex btn-color-muted btn-active-color-primary flex-column overflow-hidden w-100px h-85px pt-5 pb-2"
									id="kt_stats_widget_16_tab_link_2" data-bs-toggle="pill"
									href="#kt_stats_widget_16_tab_7"> <!--begin::Icon-->
										<div class="nav-icon mb-3">
											<i class="ki-duotone ki-notepad-edit fs-1"> <span
												class="path1"></span> <span class="path2"></span>
											</i>
										</div> <!--end::Icon--> <!--begin::Title--> <span
										class="nav-text text-gray-800 fw-bold fs-9 lh-1">내 프로젝트</span>
										<!--end::Title--> <!--begin::Bullet--> <span
										class="bullet-custom position-absolute bottom-0 w-100 h-4px bg-primary"></span>
										<!--end::Bullet-->
								</a> <!--end::Link-->
								</li>
								<!--end::Item-->
								<!--begin::Item-->
								<li class="nav-item mb-3 me-3 me-lg-20">
									<!--begin::Link--> <a
									class="nav-link btn btn-outline btn-flex btn-color-muted btn-active-color-primary flex-column overflow-hidden w-100px h-85px pt-5 pb-2"
									id="kt_stats_widget_16_tab_link_3" data-bs-toggle="pill"
									href="#kt_stats_widget_16_tab_8"> <!--begin::Icon-->
										<div class="nav-icon mb-3">
											<i class="ki-duotone ki-directbox-default fs-1"> <span
												class="path1"></span> <span class="path2"></span>
											</i>
										</div> <!--end::Icon--> <!--begin::Title--> <span
										class="nav-text text-gray-800 fw-bold fs-9 lh-1">나의 일감</span>
										<!--end::Title--> <!--begin::Bullet--> <span
										class="bullet-custom position-absolute bottom-0 w-100 h-4px bg-primary"></span>
										<!--end::Bullet-->
								</a> <!--end::Link-->
								</li>
								<!--end::Item-->
								<!--begin::Item-->
								<li class="nav-item mb-3 me-3 me-lg-20">
									<!--begin::Link--> <a
									class="nav-link btn btn-outline btn-flex btn-color-muted btn-active-color-primary flex-column overflow-hidden w-100px h-85px pt-5 pb-2"
									id="kt_stats_widget_16_tab_link_4" data-bs-toggle="pill"
									href="#kt_stats_widget_16_tab_9"> <!--begin::Icon-->
										<div class="nav-icon mb-3">
											<i class="ki-duotone ki-message-text-2 fs-1"> <span
												class="path1"></span> <span class="path2"></span> <span
												class="path3"></span>
											</i>
										</div> <!--end::Icon--> <!--begin::Title--> <span
										class="nav-text text-gray-800 fw-bold fs-9 lh-1">나의 게시판</span> <!--end::Title-->
										<!--begin::Bullet--> <span
										class="bullet-custom position-absolute bottom-0 w-100 h-4px bg-primary"></span>
										<!--end::Bullet-->
								</a> <!--end::Link-->
								</li>
								<!--end::Item-->
							</ul>
							<!--end::Nav-->
							<!--begin::Tab Content-->
							<div class="tab-content">
								<!--begin::Tap pane-->
								<div class="tab-pane fade show active pt-15" id="kt_stats_widget_16_tab_6" style="width: 50%;padding-left: 255px;">
									<div class="card h-100 w-400px">
												<!--begin::Card body-->
												<div class="card-body p-9">
													<!--begin::Heading-->
													<div class="fs-3hx fw-bold">${sum}</div>
													<div class="fs-4 fw-semibold text-gray-500 mb-7">현 프로젝트 현황</div>
													<!--end::Heading-->
													<!--begin::Wrapper-->
													<div class="d-flex flex-wrap">
														<!--begin::Chart-->
														<div class="d-flex flex-center h-100px w-100px me-9 mb-5">
															<canvas id="index_project_list_chart"></canvas>
														</div>
														<!--end::Chart-->
														<!--begin::Labels-->
														<div class="d-flex flex-column justify-content-center flex-row-fluid pe-11 mb-5">
															<!--begin::Label-->
															<div class="d-flex fs-6 fw-semibold align-items-center mb-3">
																<div class="bullet bg-warning me-3"></div>
																<div class="text-gray-500">진행중</div>
																<div id="projectZ02Count2"class="ms-auto fw-bold text-gray-700">${two2 }</div>
															</div>
															<!--end::Label-->
															<!--begin::Label-->
															<div class="d-flex fs-6 fw-semibold align-items-center mb-3">
																<div class="bullet bg-success me-3"></div>
																<div class="text-gray-500">완료</div>
																<div id="projectZ03Count3" class="ms-auto fw-bold text-gray-700">${three3 }</div>
															</div>
															<!--end::Label-->
															<!--begin::Label-->
															<div class="d-flex fs-6 fw-semibold align-items-center mb-3">
																<div class="bullet bg-primary 300 me-3"></div>
																<div class="text-gray-500">시작전</div>
																<div id="projectZ01Count1" class="ms-auto fw-bold text-gray-700">${one1 }</div>
															</div>
															<div class="d-flex fs-6 fw-semibold align-items-center">
																<div class="bullet bg-danger 300 me-3"></div>
																<div class="text-gray-500">중단됨</div>
																<div id="projectZ04Count4" class="ms-auto fw-bold text-gray-700">${four4 }</div>
															</div>
															<!--end::Label-->
														</div>
														<!--end::Labels-->
													</div>
													<!--end::Wrapper-->
												</div>
												<!--end::Card body-->
											</div>
								</div>
								<!--end::Tap pane-->
								<!--begin::Tap pane-->
								<div class="tab-pane fade" id="kt_stats_widget_16_tab_7">
									<!--begin::Table container-->
									<div class="table-responsive">
										<!--begin::Table-->
										<table
											class="table table-row-dashed align-middle gs-0 gy-3 my-0">
											<!--begin::Table head-->
											<thead>
												<tr class="fs-7 fw-bold text-gray-500 border-bottom-0">
													<th class="text-center" width="5%"></th>
													<th class="text-center" width="55%">프로젝트명</th>
													<th class="text-center" width="20%">시작일</th>
													<th class="text-center" width="20%">종료일</th>
												</tr>
											</thead>
											<!--end::Table head-->
											<!--begin::Table body-->
											<tbody>
												<c:forEach items="${projectList}" var="project">
												<tr>
													<td class="text-center p-3">
															<div class="symbol symbol-50px me-3">
																<img src="${pageContext.request.contextPath}/resources/demo1/assets/media/logos/logo.png" class="" alt="" />
															</div>
													</td>
													<td class="text-center">
														<div>
															<div class="d-flex justify-content-start flex-column">
																<span class="text-gray-800 fw-bold text-primary mb-1 fs-6">${project.prjctNm}</span>
															</div>
														</div>
													</td>
													<td class="text-center">
														<span class="text-gray-600 fw-bold fs-6 myProjectStartDate">${project.prjctBgnde}</span>
													</td>
													<td class="text-center">
														<span class="text-gray-600 fw-bold fs-6 myProjectEndDate">${project.prjctClosOn}</span>
													</td>
												</tr>
												</c:forEach>
											</tbody>
											<!--end::Table body-->
										</table>
										<!--end::Table-->
									</div>
									<!--end::Table container-->
								</div>
								<!--end::Tap pane-->
								<!--begin::Tap pane-->
								<div class="tab-pane fade" id="kt_stats_widget_16_tab_8">
									<!--begin::Table container-->
									<div class="table-responsive">
										<!--begin::Table-->
										<table
											class="table table-row-dashed align-middle gs-0 gy-3 my-0">
											<!--begin::Table head-->
											<thead>
												<tr class="fs-7 fw-bold text-gray-500 border-bottom-0">
													<th class="text-center py-3" width="40%">일감 제목</th>
													<th class="text-center py-3" width="15%">시작일</th>
													<th class="text-center py-3" width="15%">소요 일수</th>
													<th class="text-center py-3" width="15%">남은 일수</th>
													<th class="text-center py-3" width="15%">상태</th>
												</tr>
											</thead>
											<!--end::Table head-->
											<!--begin::Table body-->
											<tbody>
												<c:forEach items="${projectWorkList}" var="work">
												<tr>
													<td class="text-center">
														<div class="d-flex align-items-center">
															<div class="symbol symbol-50px me-3">
																<img src="${pageContext.request.contextPath}/resources/demo1/assets/media/logos/logo.png" class="" alt="" />
															</div>
															<div class="d-flex justify-content-start flex-column">
																<span class="text-gray-800 fw-bold text-primary mb-1 fs-6">[${work.prjctNm}]${work.worksTitle }</span>
															</div>
														</div>
													</td>
													<td class="text-center">
														<span class="text-gray-600 fw-bold fs-6 myWorkBgnde">${work.bgnde}</span>
														<input type="hidden" name="closOn" class="closOn" value="${work.closOn }">
													</td>
													<td class="text-center">
														<div id="daysRemaining"
															class="daysRemaining" data-kt-chart-color="success"></div>
													</td>
													<td class="text-center">
														<div id="daysRemaining2"
															class="daysRemaining2" data-kt-chart-color="success"></div>
													</td>
													 <c:if test="${work.workSttusCode eq 'G01'}">
											       		<td class="text-center">
											       			<span class="badge badge-primary">진행중</span>
											       		</td>
											       </c:if>
											       <c:if test="${work.workSttusCode eq 'G03'}">
											       		<td class="text-center">
											       			<span  class="badge badge-secondary">대기</span>
											       		</td>
											       </c:if>
											       <c:if test="${work.workSttusCode eq 'G04'}">
											       		<td class="text-center">
											       			<span  class="badge badge-warning">보류</span>
											       		</td>
											       </c:if>
												</tr>
												</c:forEach>
											</tbody>
											<!--end::Table body-->
										</table>
										<!--end::Table-->
									</div>
									<!--end::Table container-->
								</div>
								<!--end::Tap pane-->
								<!--begin::Tap pane-->
								<div class="tab-pane fade" id="kt_stats_widget_16_tab_9">
									<!--begin::Table container-->
									<div class="table-responsive">
										<!--begin::Table-->
										<table
											class="table table-row-dashed align-middle gs-0 gy-3 my-0">
											<!--begin::Table head-->
											<thead>
												<tr class="fs-7 fw-bold text-gray-500 border-bottom-0">
													<th class="text-center py-3" width="5%"></th>
													<th class="text-center py-3" width="80%">게시글 제목</th>
													<th class="text-center py-3" width="15%">작성일자</th>
												</tr>
											</thead>
											<!--end::Table head-->
											<!--begin::Table body-->
											<tbody>
												<c:forEach items="${projectPostList}" var="post">
												<tr>
													<td class="text-center">
														<div class="text-center d-flex align-items-center">
															<div class="symbol symbol-50px me-3">
																<img src="${pageContext.request.contextPath}/resources/demo1/assets/media/logos/logo.png" class="" alt="" />
															</div>
														</div>
													</td>
													<td>
														<div class="text-center d-flex align-items-center">
															<div class="text-center d-flex justify-content-start flex-column">
																<span class="text-gray-800 fw-bold text-primary mb-1 fs-6">[${post.prjctNm}] ${post.sntncSj}</span>
															</div>
														</div>
													</td>
													<td class="text-center">
														<span class="text-gray-600 fw-bold fs-6 myWorkBgnde">${post.writngDate}</span>
													</td>
												</tr>
												</c:forEach>
											</tbody>
											<!--end::Table body-->
										</table>
										<!--end::Table-->
									</div>
									<!--end::Table container-->
								</div>
								<!--end::Tap pane-->
								<!--end::Table container-->
							</div>
							<!--end::Tab Content-->
						</div>
						<!--end: Card Body-->
					</div>
					<!--end::Chart widget 24-->
				</div>
				<!--end::Col-->
			</div>
			<!-- 				
			<div class="col-md-6 col-lg-6 col-xl-6 col-xxl-4 mb-md-5 mb-xl-10"> 
					begin::Card widget 20
					
					end::Card widget 20
					
					begin::메일하자
					<div class="card card-flush h-md-80 mb-5 mb-xl-10">
					<div class="card card-flush h-md-80 mb-5 mb-xl-10">
						begin::Header
						<div class="card-header pt-5">
							begin::Title
							<div class="card-title d-flex flex-column">
								begin::Amount
								<span class="fs-2hx fw-bold text-gray-900 me-2 lh-1 ls-n2">메일함</span>
								<span class="fs-2hx fw-bold text-gray-900 me-2 lh-1 ls-n2" >메일함</span>
								end::Amount
							</div>
							end::Title
						</div>
						end::Header
						begin::Card body
						<div class="card-body d-flex flex-column justify-content-end pe-0 mailList">
						
						</div>
						end::Card body
					</div>
					end::Card widget 7
				</div>
				end::Col
				begin::Col 길이 조절 col-xxl-4 를 3으로
				<div class="col-md-6 col-lg-6 col-xl-6 col-xxl-4 mb-md-5 mb-xl-10">
					begin::Card widget 17
					<div class="card card-flush h-md-20 mb-5 mb-xl-10">
						begin::Header
						<div class="card-header pt-5">
							begin::Title
							<div class="card-title d-flex flex-column">
								begin::Info
								<div class="d-flex align-items-center">
									begin::Currency
									<span class="fs-4 fw-semibold text-gray-500 me-1 align-self-start">결재</span>
									end::Currency
									
									
									begin::Amount
									<span class="fs-2hx fw-bold text-gray-900 me-2 lh-1 ls-n2">결재 </span>
									end::Amount
								</div>
								end::Info
							</div>
							end::Title
						</div>
						end::Header
						begin::Card body
						<div class="card-body pt-2 pb-4 d-flex flex-wrap align-items-center ">
						<div class="card-body pt-2 pb-4 d-flex align-items-center ">
							<div class="row card-body pt-2 pb-4 d-flex flex-wrap align-items-center "> 
								<h3 class="card-body pt-2 pb-4 d-flex flex-wrap align-items-center" id="wait"> </h3>
								<h3 class="card-body pt-2 pb-4 d-flex flex-wrap align-items-center" id="temp"> </h3>
							</div>
							<div class="row card-body pt-2 pb-4 d-flex flex-wrap align-items-center "> 
								<h3 class="card-body pt-2 pb-4 d-flex flex-wrap align-items-center" id="reje"> </h3>
								<h3 class="card-body pt-2 pb-4 d-flex flex-wrap align-items-center" id="comp"> </h3>
							 </div>
						</div>
						end::Card body
					</div>
					end::Card widget 17
					begin::List widget 26
					<div class="card card-flush h-lg-50">
						begin::Header
						<div class="card-header pt-5">
							begin::Title
							<h1 class="card-title text-gray-800 fw-bold">공지사항</h1>
							<span class="fs-2hx fw-bold text-gray-900 me-2 lh-1 ls-n2">공지사항</span>
							end::Title
							begin::Toolbar
							<div class="card-toolbar">
								<div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg-light-primary fw-semibold w-200px" data-kt-menu="true">
									begin::Menu item
									<div class="menu-item px-3">
										<div class="menu-content fs-6 text-gray-900 fw-bold px-3 py-4">Quick Actions</div>
									</div>
									end::Menu item
									begin::Menu separator
									<div class="separator mb-3 opacity-75"></div>
									end::Menu separator
									begin::Menu item
									<div class="menu-item px-3">
										<a href="#" class="menu-link px-3">New Ticket</a>
									</div>
									end::Menu item
									begin::Menu item
									<div class="menu-item px-3">
										<a href="#" class="menu-link px-3">New Customer</a>
									</div>
									end::Menu item
									begin::Menu item
									<div class="menu-item px-3" data-kt-menu-trigger="hover" data-kt-menu-placement="right-start">
										begin::Menu item
										<a href="#" class="menu-link px-3">
											<span class="menu-title">New Group</span>
											<span class="menu-arrow"></span>
										</a>
										end::Menu item
										begin::Menu sub
										<div class="menu-sub menu-sub-dropdown w-175px py-4">
											begin::Menu item
											<div class="menu-item px-3">
												<a href="#" class="menu-link px-3">Admin Group</a>
											</div>
											end::Menu item
											begin::Menu item
											<div class="menu-item px-3">
												<a href="#" class="menu-link px-3">Staff Group</a>
											</div>
											end::Menu item
											begin::Menu item
											<div class="menu-item px-3">
												<a href="#" class="menu-link px-3">Member Group</a>
											</div>
											end::Menu item
										</div>
										end::Menu sub
									</div>
									end::Menu item
									begin::Menu item
									<div class="menu-item px-3">
										<a href="#" class="menu-link px-3">New Contact</a>
									</div>
									end::Menu item
									begin::Menu separator
									<div class="separator mt-3 opacity-75"></div>
									end::Menu separator
									begin::Menu item
									<div class="menu-item px-3">
										<div class="menu-content px-3 py-3">
											<a class="btn btn-primary btn-sm px-4" href="#">Generate Reports</a>
										</div>
									</div>
									end::Menu item
								</div>
								end::Menu 2
								end::Menu
							</div>
							end::Toolbar
						</div>
						end::Header
						begin::Body
						end::Body
					</div>
					end::LIst widget 26
				</div>
 -->
			<!--end::Col-->
			<!--begin::Col 길이조절 xxl-4를 6으로-->
			<!--end::Col-->
			<!-- 			</div> -->
			<!--end::Row-->
			<!--begin::Row-->
			<!--end::Row-->
			<!--begin::Row-->
		</div>
		<!--end::Content container-->
	</div>
	<!--end::Content-->
</div>
<!--end::Content wrapper-->
<script src="${pageContext.request.contextPath}/resources/demo1/assets/js/custom/apps/calendar/calendar2.js"></script>
<script>
/* 날짜간의 일수 계산하는 함수 */
        function calculateDaysRemaining(startDate, endDate) {
            const start = new Date(startDate);
            const end = new Date(endDate);
            const timeDiff = end - start;
            const daysDiff = timeDiff / (1000 * 60 * 60 * 24);
            return Math.ceil(daysDiff); // 올림처리하여 반올림
        }
        function calculateDaysRemaining2(endDate) {
            const start = new Date();
            const end = new Date(endDate);
            const timeDiff = end - start;
            const daysDiff = timeDiff / (1000 * 60 * 60 * 24);
            return Math.ceil(daysDiff); // 올림처리하여 반올림
        }

document.addEventListener("DOMContentLoaded", () => {
	let dclzNo = ${atdcV.dclzNo}
	$("#indexAttendBtn").on("click", function() {
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
	$("#indexLvffcBtn").on("click", function() {
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


	/* 프로젝트 리스트 날짜만 출력 */
	var dateElements = document.querySelectorAll('.myProjectStartDate, .myProjectEndDate');
	var dateElements2 = document.querySelectorAll('.myWorkBgnde');
        
        // 각 요소에 대해 날짜만 추출하여 설정
        dateElements.forEach(function(element) {
            var fullDateTime = element.textContent.trim();
            var dateOnly = fullDateTime.split(' ')[0].split('T')[0];
            element.textContent = dateOnly;
        });
        // 각 요소에 대해 날짜만 추출하여 설정
        dateElements2.forEach(function(element) {
            var fullDateTime = element.textContent.trim();
            var dateOnly = fullDateTime.split(' ')[0].split('T')[0];
            element.textContent = dateOnly;
        });
        
        const rows = document.querySelectorAll('tr');
        rows.forEach(row => {
            const startDateElement = row.querySelector('.myWorkBgnde');
            const endDateElement = row.querySelector('.closOn');
            const daysRemainingElement = row.querySelector('.daysRemaining');
            const daysRemainingElement2 = row.querySelector('.daysRemaining2');

            if (startDateElement && endDateElement && daysRemainingElement) {
                const startDate = startDateElement.innerText;
                console.log("^^s",startDate);    
                const endDate = endDateElement.value;
                console.log("^^e",endDate);    
                // 남은 일수 계산
                const daysRemaining = calculateDaysRemaining(startDate, endDate);
                const daysRemaining2 = calculateDaysRemaining2(endDate);
                console.log("^^d",daysRemaining);
                console.log("^^d2",daysRemaining2);
                // 남은 일수를 HTML 요소에 삽입
                daysRemainingElement.innerText = `\${daysRemaining}일`;
                
                if (daysRemaining2 >= 0) {
                    daysRemainingElement2.innerText = `\${daysRemaining2}일 남음`;
                    daysRemainingElement2.classList.add('remain');
                } else {
                    daysRemainingElement2.innerText = `\${Math.abs(daysRemaining2)}일 지남`;
                    daysRemainingElement2.classList.add('overdue');
                }
            }
        });
        
	/* 메일리스트 카운트 */
    $.ajax({
        type: "get",
        url: "/main/mail",
        success: function(res) {
            res.forEach(mail => {	
            	let emailNo = mail.rec[0].receNo;
            	let emailSubject = mail.emailSj;
            	let name = mail.emp[0].emplNm;
            	let cmmn = mail.com[0].cmmnCodeNm;
            	let readTime = mail.rec[0].readTime;
	        	let trnsmisDt = mail.trnsmisDt;
            	let atchFileNo = mail.atchFileNo;
            	let atch;
            	
            	if (atchFileNo != null) {
            		atch = `<i class="ki-duotone ki-folder-up">
								<span class="path1"></span>
								<span class="path2"></span>
							</i>`;
            	} else {
            		atch="";
            	}
            	
            	let emailSj = "";
				if(readTime == null) {
	            	if (emailSubject == null) {
	            		emailSj = `<a href=/mail/content/\${emailNo} class="fw-bold mail-link"> (제목 없음) \${atch}</a>`;
					} else {
	            		emailSj = `<a href=/mail/content/\${emailNo} class="fw-bold mail-link"> \${emailSubject} \${atch}</a>`;
					}
            	} else {
					if(emailSubject == null) {
	            		emailSj = `<a href=/mail/content/\${emailNo} class="mail-link"> (제목 없음) \${atch}</a>`;
					} else {
	            		emailSj = `<a href=/mail/content/\${emailNo} class="mail-link"> \${emailSubject} \${atch}</a>`;
					}
            	}
            	
                mailHtml = `<tr>
								<td class="text-center ps-3 pe-0">
									<div class="d-flex align-items-center">
										<div class="symbol symbol-50px">
											<img src="${pageContext.request.contextPath}/resources/image/\${mail.proflPhotoCours }" />
										</div>
										<div class="d-flex justify-content-start flex-column">
											<a href="${pageContext.request.contextPath}/resources/demo1/pages/user-profile/overview.html"
												class="text-gray-800 fw-bold text-hover-primary mb-1 fs-6">
											</a>
										</div>
									</div>
								</td>
								<td class="text-start px-0">
									<span class="text-gray-600 fw-bold fs-6">\${name}(\${cmmn})</span>
								</td>
								<td class="text-start">
									\${emailSj}
								</td>
								<td class="text-center">
									<div> \${trnsmisDt} </div>
								</td>
							</tr>`;
//                 	`<p class="mail-item">
//                 		<div>보낸사람 : \${name}(\${cmmn})</div>
// 	                	<div  class="word">\${emailSj}</div>
//                     </p>`;
                
	            $('.mailList').append(mailHtml);
            });
       	}
    });
    
	/* 공지 및 부서게시판 출력  */
    $.ajax({
        type: "get",
        url: "/main/post",
        success: function(res) {
        	let noticsBoardHTML = ``;
        	let departBoardHTML = ``;

			let boardNo = 0;

        	let noticsBoardList = res.noticsBoardList; // 부서게시판 리스트
        	let departBoardList = res.departBoardList; // 공지사항 리스트
        	
			// 공지사항 게시판 HTML 만들기
        	res.noticsBoardList.forEach(item => {
				boardNo = boardNo + 1;
        		let bbsNo = item.bbsNo; // 게시판 번호
        		let sntncNo = item.sntncNo; // 게시글 번호
        		let sntncSj = item.sntncSj; // 게시글 제목
        		let ctgryCode = item.ctgryCode; // 카테고리
				let emplNm = item.employeeVO.emplNm; // 작성자
				let registDt = item.registDt; // 작성일시
				let badgeTxt = "";
				let postLinkTxt = "";
				
				// 카테고리 뱃지 텍스트 설정
				if(ctgryCode == "N01"){
					badgeTxt = `<span class="badge badge-light-danger">공지</span>`;
				} else if(ctgryCode == "N02"){
					badgeTxt = `<span class="badge badge-light-success">업무</span>`;
				} else if(ctgryCode == "N03"){
					badgeTxt = `<span class="badge badge-light-primary">일반</span>`;
				} else if(ctgryCode == "N04"){
					badgeTxt = `<span class="badge badge-light-secondary">기타</span>`;
				}
				
				// 게시글 링크 텍스트 설정
				postLinkTxt = `<a href="${pageContext.request.contextPath}/board/\${bbsNo}/\${sntncNo}">
							       <span class="text-gray-600 fw-bold fs-8">
								       <c:out value="\${sntncSj}"/>
								   </span>
							   </a>`;

				// 게시글 HTML 만들기
				noticsBoardHTML += `
						<tr>
							<td class="text-center"><!-- 번호 -->
								\${boardNo}
							</td>
							<td class="text-center"><!-- 카테고리 -->
								\${badgeTxt}
							</td>
							<td class=""><!-- 제목 -->
								<span style="display: block; width:100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">\${postLinkTxt}</span>
							</td>
							<td class="text-center"><!-- 작성자 -->
								<span class="text-gray-600 fw-bold fs-8">\${emplNm}</span>
							</td>
							<td class="text-center"><!-- 작성일시 -->
								<span class="text-gray-600 fw-bold fs-8">\${registDt}</span>
							</td>
						</tr>
					`;
        	});
        	
			// 적용
            $('.noticsBoard').append(noticsBoardHTML);
			

			// 부서 게시판 HTML 만들기
			boardNo = 0;
			res.departBoardList.forEach(item => {
				boardNo = boardNo + 1;
        		let bbsNo = item.bbsNo; // 게시판 번호
        		let sntncNo = item.sntncNo; // 게시글 번호
        		let sntncSj = item.sntncSj; // 게시글 제목
        		let ctgryCode = item.ctgryCode; // 카테고리
				let emplNm = item.employeeVO.emplNm; // 작성자
				let registDt = item.registDt; // 작성일시
				let badgeTxt = "";
				let postLinkTxt = "";
				
				// 카테고리 뱃지 텍스트 설정
				if(ctgryCode == "N01"){
					badgeTxt = `<span class="badge badge-light-danger">공지</span>`;
				} else if(ctgryCode == "N02"){
					badgeTxt = `<span class="badge badge-light-success">업무</span>`;
				} else if(ctgryCode == "N03"){
					badgeTxt = `<span class="badge badge-light-primary">일반</span>`;
				} else if(ctgryCode == "N04"){
					badgeTxt = `<span class="badge badge-light-secondary">기타</span>`;
				}
				
				// 게시글 링크 텍스트 설정
				postLinkTxt = `<a href="${pageContext.request.contextPath}/board/\${bbsNo}/\${sntncNo}"><span class="text-gray-600 fw-bold fs-8"><c:out value="\${sntncSj}"/></span></a>`;

				// 게시글 HTML 만들기
				departBoardHTML += `
						<tr>
							<td class="text-center"><!-- 번호 -->
								\${boardNo}
							</td>
							<td class="text-center"><!-- 카테고리 -->
								\${badgeTxt}
							</td>
							<td class=""><!-- 제목 -->
								\${postLinkTxt}
							</td>
							<td class="text-center"><!-- 작성자 -->
								<span class="text-gray-600 fw-bold fs-8">\${emplNm}</span>
							</td>
							<td class="text-center"><!-- 작성일시 -->
								<span class="text-gray-600 fw-bold fs-8">\${registDt}</span>
							</td>
						</tr>
					`;
        	});
        	
			// 적용
            $('.departBoard').append(departBoardHTML);
		}
    });

    /* 대기문서  */
    $.ajax({
    	type: "get",
        url: "/san/count",
        success: function(res) {
			let wait = res.wait;
			let process = res.process;
			let reference = res.reference;
			let rcver = res.rcver;
			 /* 
			let waitPtn = wait + " 건";
        	let processPtn = process + " 건";
			let refPtn = reference + " 건";
			let rcverPtn = rcver + " 건";
        	  */
			$('#wait').html(wait);
			$('#process').html(process);
			$('#reference').html(reference);
			$('#rcver').html(rcver);
			
        },
        error : function(xhr) {
			console.log("에러 ", xhr.status);
        }
    })
    
    
});


</script>
