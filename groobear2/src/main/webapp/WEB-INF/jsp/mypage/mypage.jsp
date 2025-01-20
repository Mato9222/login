<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--begin::Content wrapper-->
<div class="d-flex flex-column flex-column-fluid">
	<!--begin::Toolbar-->
	<div id="kt_app_toolbar" class="app-toolbar py-3 py-lg-6">
		<!--begin::Toolbar container-->
		<div id="kt_app_toolbar_container" class="app-container container-xxl d-flex flex-stack">
			<!--begin::Page title-->
			<div class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
				<!--begin::Title-->
				<h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">마이 페이지</h1>
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
			<!--begin::Navbar-->
			<div class="card mb-5 mb-xl-10">
				<div class="card-body pt-9 pb-0">
					<!--begin::Details-->
					<div class="d-flex flex-wrap flex-sm-nowrap">
						<!--begin: Pic-->
						<div class="me-7 mb-4">
							<div class="symbol symbol-100px symbol-lg-160px symbol-fixed position-relative">
								<img src="${pageContext.request.contextPath}/resources/image/${empl.proflPhotoCours}" alt="image" />
							</div>
						</div>
						<!--end::Pic-->
						<!--begin::Info-->
						<div class="flex-grow-1 mt-5">
							<!--begin::Title-->
							<div class="d-flex justify-content-between align-items-start flex-wrap mb-2">
								<!--begin::User-->
								<div class="d-flex flex-column">
									<!--begin::Name-->
									<div class="d-flex align-items-center mb-4">
										<a class="text-gray-900 text-hover-primary fs-2 fw-bold me-1 mb-3">${empl.emplNm}</a>
									</div>
									<!--end::Name-->
									<!--begin::Info-->
									<div class="d-flex flex-wrap fw-semibold fs-6 mb-3 pe-2">
										<a class="d-flex align-items-center text-gray-500 text-hover-primary me-5 mb-2">
											<i class="ki-duotone ki-data">
												<span class="path1"></span>
												<span class="path2"></span>
												<span class="path3"></span>
												<span class="path4"></span>
												<span class="path5"></span>
											</i>${empl.deptNm}
										</a>
										<a class="d-flex align-items-center text-gray-500 text-hover-primary me-5 mb-2">
											<i class="ki-duotone ki-profile-circle fs-4 me-1">
												<span class="path1"></span>
												<span class="path2"></span>
												<span class="path3"></span>
											</i>${empl.ofcpsCodeNm}
										</a>
									</div>
									<div class="d-flex flex-wrap fw-semibold fs-6 mb-3 pe-2">
										<a href="/mail/send" class="d-flex align-items-center text-gray-500 text-hover-primary mb-2">
											<i class="ki-duotone ki-sms fs-4">
												<span class="path1"></span>
												<span class="path2"></span>
											</i>${empl.emailAdres}
										</a>
									</div>
									<!--end::Info-->
								</div>
								<!--end::User-->
							</div>
							<!--end::Title-->
						</div>
						<div class="flex-grow-1 mt-5">
							<div class="row mb-7">
								<label class="col-lg-4 fw-semibold text-muted">입사일</label>
								<div class="col-lg-8">
									<span class="fw-bold fs-6 text-gray-800">${empl.encpnDe}</span>
								</div>
							</div>
							<div class="row mb-7">
								<label class="col-lg-4 fw-semibold text-muted">근속년수</label>
								<div class="col-lg-8">
									<span class="fw-bold fs-6 text-gray-800">${empl.cnwkYycnt}</span>
								</div>
							</div>
							<div class="row mb-7">
								<label class="col-lg-4 fw-semibold text-muted">내선번호</label>
								<div class="col-lg-8">
									<span class="fw-bold fs-6 text-gray-800">${empl.lxtnNo}</span>
								</div>
							</div>
						</div>
						<!--end::Info-->
					</div>
					<!--end::Details-->
					<!--begin::Navs-->
					<ul class="nav nav-stretch nav-line-tabs nav-line-tabs-2x border-transparent fs-5 fw-bold">
						<!--begin::Nav item-->
						<li class="nav-item mt-2">
							<a class="nav-link text-active-primary ms-0 me-10 py-5 active" href="${pageContext.request.contextPath}/mypage">프로필 보기</a>
						</li>
						<!--end::Nav item-->
					</ul>
					<!--begin::Navs-->
				</div>
			</div>
			<!--end::Navbar-->
			<!--begin::details View-->
			<div class="card mb-5 mb-xl-10" id="kt_profile_details_view">
				<!--begin::Card header-->
				<div class="card-header">
					<!--begin::Card title-->
					<div class="card-title m-0">
						<h3 class="fw-bold m-0">프로필</h3>
					</div>
					<!--end::Card title-->
					<!--begin::Action-->
					<a href="${pageContext.request.contextPath}/mypage/settings" class="btn btn-sm btn-primary align-self-center">프로필 수정</a>
					<!--end::Action-->
				</div>
				<!--begin::Card header-->
				<!--begin::Card body-->
				<div class="card-body p-9">
					<!--begin::Input group-->
					<div class="row mb-7">
						<!--begin::Label-->
						<label class="col-lg-4 fw-semibold text-muted">휴대폰 번호</label>
						<!--end::Label-->
						<!--begin::Col-->
						<div class="col-lg-8 fv-row">
							<span class="fw-semibold text-gray-800 fs-6">${empl.moblphonNo}</span>
						</div>
						<!--end::Col-->
					</div>
					<!--end::Input group-->
					<!--begin::Input group-->
					<div class="row mb-7">
						<!--begin::Label-->
						<label class="col-lg-4 fw-semibold text-muted">우편번호</label>
						<!--end::Label-->
						<!--begin::Col-->
						<div class="col-lg-8 fv-row">
							<span class="fw-semibold text-gray-800 fs-6">${empl.zip}</span>
						</div>
						<!--end::Col-->
					</div>
					<!--end::Input group-->
					<!--begin::Input group-->
					<div class="row mb-7">
						<!--begin::Label-->
						<label class="col-lg-4 fw-semibold text-muted">집 주소</label>
						<!--end::Label-->
						<!--begin::Col-->
						<div class="col-lg-8 fv-row">
							<span class="fw-semibold text-gray-800 fs-6">${empl.bassAdres} ${empl.detailAdres}</span>
						</div>
						<!--end::Col-->
					</div>
					<!--end::Input group-->
					<!--begin::Input group-->
					<div class="row mb-7">
						<!--begin::Label-->
						<label class="col-lg-4 fw-semibold text-muted">비상 연락처</label>
						<!--end::Label-->
						<!--begin::Col-->
						<div class="col-lg-8 fv-row">
							<span class="fw-semibold text-gray-800 fs-6">${empl.emgncContactNtwkNo}</span>
						</div>
						<!--end::Col-->
					</div>
					<!--end::Input group-->
				</div>
				<!--end::Card body-->
			</div>
			<!--end::details View-->
		</div>
		<!--end::Content container-->
	</div>
	<!--end::Content-->
</div>
<!--end::Content wrapper-->