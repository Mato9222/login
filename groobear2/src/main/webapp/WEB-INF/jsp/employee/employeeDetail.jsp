<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="empl" value="${employeeVO}"/>
<c:set var="atdcV" value="${attendanceVO}"/>

<style type="text/css">
	.fc-highlight{
		background-color: #FFFED2 !important;
	}
</style>

<script>
	const ghList = [];
</script>
<c:forEach var="atdcL" items="${attendanceList}">
	<script>
		var event = {
			start: '${atdcL.attendDt}'
			, end: '${atdcL.lvffcDt}'
			, title: "출근\n퇴근"
		}  
		ghList.push(event);
	</script>
</c:forEach>
<script>
	document.addEventListener("DOMContentLoaded", ()=> {
		fCalAdd(ghList);
	})
</script>

<!--begin::Content wrapper-->
<div class="d-flex flex-column flex-column-fluid">
	<!--begin::Toolbar-->
	<div id="kt_app_toolbar" class="app-toolbar py-3 py-lg-6">
		<!--begin::Toolbar container-->
		<div id="kt_app_toolbar_container" class="app-container container-xxl d-flex flex-stack">
			<!--begin::Page title-->
			<div class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
				<!--begin::Title-->
				<h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">사원 정보</h1>
				<!--end::Title-->
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
			<!--begin::Layout-->
			<div class="d-flex flex-column flex-lg-row">
				<!--begin::Sidebar-->
				<div class="flex-column flex-lg-row-auto w-lg-250px w-xl-350px mb-10">
					<!--begin::Card-->
					<div class="card mb-5 mb-xl-8">
						<!--begin::Card body-->
						<div class="card-body">
							<!--begin::Summary-->
							<!--begin::User Info-->
							<div class="d-flex flex-center flex-column py-5">
								<!--begin::Avatar-->
								<div class="symbol symbol-200px symbol-circle mb-7">
									<img src="${pageContext.request.contextPath}/resources/image/${empl.proflPhotoCours}" alt="image" />
								</div>
								<!--end::Avatar-->
								<!--begin::Name-->
								<div class="d-flex" style="align-items : center;">
									<a class="fs-3 text-gray-800 text-hover-primary fw-bold mt-3 mb-3 me-2">${empl.emplNm}
									</a>
									<div class="badge badge-lg badge-light-primary d-inline">${empl.ofcpsCodeNm}</div>
								</div>
								<!--end::Name-->
								<!--begin::Position-->
								<div class="mb-9">
									<!--begin::Badge-->
									<div class="fw-bold text-gray-600">${empl.deptNm} - ${empl.rspofcCodeNm}</div>
									<!--begin::Badge-->
								</div>
								<!--end::Position-->
							</div>
							<!--end::User Info-->
							<!--end::Summary-->
							<!--begin::Details toggle-->
							<div class="d-flex flex-stack fs-4 py-3">
								<div class="fw-bold rotate collapsible" data-bs-toggle="collapse" href="#kt_user_view_details" role="button" aria-expanded="false" aria-controls="kt_user_view_details"> 상세 정보
									<span class="ms-2 rotate-180">
										<i class="ki-duotone ki-down fs-3"></i>
									</span>
								</div>
							</div>
							<!--end::Details toggle-->
							<div class="separator"></div>
							<!--begin::Details content-->
							<div id="kt_user_view_details" class="collapse show">
								<div class="pb-5 fs-6">
									<!--begin::Details item-->
									<div class="fw-bold mt-5">사번</div>
									<div class="text-gray-600">${empl.emplNo}</div>
									<!--end::Details item-->
									<!--begin::Details item-->
									<div class="fw-bold mt-5">근속년수</div>
									<c:if test="${empl.cnwkYycnt eq 0}">
										<div class="badge badge-lg badge-light-success d-inline">신입</div>
									</c:if>
									<c:if test="${empl.cnwkYycnt ne 0}">
										<div class="text-gray-600">${empl.cnwkYycnt}</div>
									</c:if>
									<!--end::Details item-->
									<!--begin::Details item-->
									<div class="fw-bold mt-5">이메일</div>
									<div class="text-gray-600">
										<a href="#" class="text-gray-600 text-hover-primary">${empl.emailAdres}</a>
									</div>
									<!--end::Details item-->
									<!--begin::Details item-->
									<div class="fw-bold mt-5">주소</div>
									<div class="text-gray-600">
										${empl.bassAdres}
										</br>
										${empl.detailAdres}
									</div>
									<!--end::Details item-->
									<!--begin::Details item-->
									<div class="fw-bold mt-5">휴대폰 번호</div>
									<div class="text-gray-600">${empl.moblphonNo}</div>
									<!--end::Details item-->
									<!--begin::Details item-->
									<div class="fw-bold mt-5">출근 시간</div>
									<div class="text-gray-600">${atdcV.attendDt}</div>
									<!--end::Details item-->
									<!--begin::Details item-->
									<div class="fw-bold mt-5">퇴근 시간</div>
									<div class="text-gray-600">${atdcV.lvffcDt}</div>
									<!--end::Details item-->
								</div>
							</div>
							<!--end::Details content-->
						</div>
						<!--end::Card body-->
					</div>
					<!--end::Card-->
					<div class="card mb-5 mb-xl-8">
						<div class="card-body">
							<div class="fw-bold mt-5">주간 평균 근무 시간</div>
							<div class="text-gray-600" id="weekWorkTime">-- : -- : --</div>
							<div class="fw-bold mt-5">월간 평균 근무 시간</div>
							<div class="text-gray-600" id="monthWorkTime">-- : -- : --</div>
						</div>
					</div>
				</div>
				<!--end::Sidebar-->
				<!--begin::Content-->
				<div class="flex-lg-row-fluid ms-lg-15">
					<!--begin:::Tabs-->
					<ul class="nav nav-custom nav-tabs nav-line-tabs nav-line-tabs-2x border-0 fs-4 fw-semibold mb-8">
						<!--begin:::Tab item-->
						<li class="nav-item">
							<a class="nav-link text-active-primary pb-4 active" data-bs-toggle="tab" href="#kt_user_view_overview_tab">근태 정보</a>
						</li>
						<!--end:::Tab item-->
						<!--begin:::Tab item-->
						<li class="nav-item">
							<a class="nav-link text-active-primary pb-4" data-kt-countup-tabs="true" data-bs-toggle="tab" href="#kt_user_view_overview_security">프로젝트</a>
						</li>
						<!--end:::Tab item-->
					</ul>
					<!--end:::Tabs-->
					<!--begin:::Tab content-->
					<div class="tab-content" id="myTabContent">
						<!--begin:::Tab pane-->
						<div class="tab-pane fade show active" id="kt_user_view_overview_tab" role="tabpanel">
							<!--begin::Card-->
							<div class="card card-flush mb-6 mb-xl-9 x-900">
								<!--begin::Card header-->
								<div class="card-header mt-6">
									<!--begin::Card title-->
									<div class="card-title">
										<h2 class="mb-1">근태</h2>
									</div>
									<!--end::Card title-->
								</div>
								<!--end::Card header-->
								<!--begin::Card body-->
								<div class="px-5 py-5" id="employeeCalendar"></div>
								<!--end::Card body-->
							</div>
							<!--end::Card-->
						</div>
						<!--end:::Tab pane-->
						<!--begin:::Tab pane-->
						<div class="tab-pane fade" id="kt_user_view_overview_security" role="tabpanel">
							<!--begin::Card-->
							<div class="card pt-4 mb-6 mb-xl-9">
								<!--begin::Card header-->
								<div class="card-header border-0">
									<!--begin::Card title-->
									<div class="card-title">
										<h2>프로젝트</h2>
									</div>
									<!--end::Card title-->
								</div>
								<!--end::Card header-->
								<!--begin::Card body-->
								<!--end::Card body-->
							</div>
							<!--end::Card-->
							<!--begin::Card-->
							<div class="card pt-4 mb-6 mb-xl-9">
								<!--begin::Card header-->
								<div class="card-header border-0">
									<!--begin::Card title-->
									<div class="card-title flex-column">
										<h2 class="mb-1">일단 틀만 살려</h2>
									</div>
									<!--end::Card title-->
								</div>
								<!--end::Card header-->
								<!--begin::Card body-->
								<!--end::Card body-->
							</div>
							<!--end::Card-->
							<!--begin::Card-->
							<div class="card pt-4 mb-6 mb-xl-9">
								<!--begin::Card header-->
								<div class="card-header border-0">
									<!--begin::Card title-->
									<div class="card-title flex-column">
										<h2>일단 살려</h2>
									</div>
									<!--end::Card title-->
								</div>
								<!--end::Card header-->
								<!--begin::Card body-->
								<!--end::Card body-->
							</div>
							<!--end::Card-->
						</div>
						<!--end:::Tab pane-->
					</div>
					<!--end:::Tab content-->
				</div>
				<!--end::Content-->
			</div>
			<!--end::Layout-->
		</div>
		<!--end::Content container-->
	</div>
	<!--end::Content-->
</div>
<!--end::Content wrapper-->