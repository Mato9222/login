<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">
	.fc-highlight{
		background-color: #FFFED2 !important;
	}
</style>

<c:set var="atdcV" value="${attendanceVO}"/>

<script>
	const myList = [];
	let dclzNo = ${atdcV.dclzNo};
</script>
<c:forEach var="atdcL" items="${attendanceList}">
	<script>
		var event = {
			start: '${atdcL.attendDt}',
			end: '${atdcL.lvffcDt}',
			title: "출근\n퇴근"
		}  
		myList.push(event);
	</script>
</c:forEach>
<script>
	document.addEventListener("DOMContentLoaded", ()=> {
		fCalAdd(myList);
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
				<h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">근태 정보</h1>
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
								<!--begin::Info-->
								<div class="d-flex flex-wrap flex-center">
									<!--begin::Stats-->
									<form method="post">
										<c:if test="${atdcV.attendDt eq null}">
											<button type="button" class="btn btn-light-primary hover-scale mx-2 w-125px" id="attendBtn">출근</button>
										</c:if>
										<c:if test="${atdcV.attendDt ne null}">
											<span class="btn btn-primary mx-2 w-125px" style="cursor: default;">출근 완료</span>
										</c:if>
									</form>
									<!--end::Stats-->
									<!--begin::Stats-->
									<form method="post">
										<button type="button" class="btn btn-light-primary hover-scale mx-2 w-125px" id="lvffcBtn">퇴근</button>
									</form>
									<!--end::Stats-->
								</div>
								<!--end::Info-->
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
							<!--end::Details content-->
						</div>
						<!--end::Card body-->
					</div>
					<div class="card mb-5 mb-xl-8">
						<div class="card-body">
							<div class="fw-bold mt-5">주간 평균 근무 시간</div>
							<div class="text-gray-600" id="weekWorkTime">-- : -- : --</div>
							<div class="fw-bold mt-5">월간 평균 근무 시간</div>
							<div class="text-gray-600" id="monthWorkTime">-- : -- : --</div>
						</div>
					</div>
					<!--end::Card-->
				</div>
				<!--end::Sidebar-->
				<!--begin::Content-->
				<div class="flex-lg-row-fluid ms-lg-15">
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