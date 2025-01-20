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
				<h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">사원 목록</h1>
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
							<input type="text" data-kt-user-table-filter="search" class="form-control form-control-solid w-250px ps-13" placeholder="사원 검색" />
						</div>
						<!--end::Search-->
					</div>
					<!--begin::Card title-->
					<!--begin::Card toolbar-->
					<div class="card-toolbar">
						<!--begin::Toolbar-->
						<div class="d-flex justify-content-end" data-kt-user-table-toolbar="base">
							<!--begin::Filter-->
							<button type="button" class="btn btn-light-primary me-3" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">
								<i class="ki-duotone ki-filter fs-2">
									<span class="path1"></span>
									<span class="path2"></span>
								</i>필터
							</button>
							<!--begin::Menu 1-->
							<div class="menu menu-sub menu-sub-dropdown w-300px w-md-325px" data-kt-menu="true">
								<!--begin::Header-->
								<div class="px-7 py-5">
									<div class="fs-5 text-gray-900 fw-bold">필터</div>
								</div>
								<!--end::Header-->
								<!--begin::Separator-->
								<div class="separator border-gray-200"></div>
								<!--end::Separator-->
								<!--begin::Content-->
								<div class="px-7 py-5" data-kt-user-table-filter="form">
									<!--begin::Input group-->
									<div class="mb-10">
										<label class="form-label fs-6 fw-semibold">직위 :</label>
										<select class="form-select form-select-solid fw-bold" data-kt-select2="true" data-placeholder="직위 선택" data-allow-clear="true" data-kt-user-table-filter="role" data-hide-search="true">
											<option></option>
											<option>전체</option>
											<c:forEach var="commonOfcpsList" items="${commonOfcpsList}">
												<option value="${commonOfcpsList.cmmnCode}">${commonOfcpsList.cmmnCodeNm}</option>
											</c:forEach>
										</select>
									</div>
									<!--end::Input group-->
									<!--begin::Actions-->
									<div class="d-flex justify-content-end">
										<button type="reset" class="btn btn-light btn-active-light-primary fw-semibold me-2 px-6" data-kt-menu-dismiss="true" data-kt-user-table-filter="reset">취소</button>
										<button type="button" class="btn btn-primary fw-semibold px-6" data-kt-menu-dismiss="true" data-kt-user-table-filter="filter">선택</button>
									</div>
									<!--end::Actions-->
								</div>
								<!--end::Content-->
							</div>
							<!--end::Menu 1-->
							<%-- <!--end::Filter-->
							<!--begin::Export-->
							<button type="button" class="btn btn-light-primary me-3" data-bs-toggle="modal" data-bs-target="#kt_modal_export_users">
								<i class="ki-duotone ki-exit-up fs-2">
									<span class="path1"></span>
									<span class="path2"></span>
								</i>내보내기
							</button>
							<!--end::Export--> --%>
							<!--begin::Add user-->
							<button type="button" id="insertBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#kt_modal_add_user">
								<i class="ki-duotone ki-plus fs-2"></i>사원 등록
							</button>
							<!--end::Add user-->
						</div>
						<!--end::Toolbar-->
						<%-- <!--begin::Modal - Adjust Balance-->
						<div class="modal fade" id="kt_modal_export_users" tabindex="-1" aria-hidden="true">
							<!--begin::Modal dialog-->
							<div class="modal-dialog modal-dialog-centered mw-650px">
								<!--begin::Modal content-->
								<div class="modal-content">
									<!--begin::Modal header-->
									<div class="modal-header">
										<!--begin::Modal title-->
										<h2 class="fw-bold">사원 내보내기</h2>
										<!--end::Modal title-->
										<!--begin::Close-->
										<div class="btn btn-icon btn-sm btn-active-icon-primary" data-kt-users-modal-action="close">
											<i class="ki-duotone ki-cross fs-1">
												<span class="path1"></span>
												<span class="path2"></span>
											</i>
										</div>
										<!--end::Close-->
									</div>
									<!--end::Modal header-->
									<!--begin::Modal body-->
									<div class="modal-body scroll-y mx-5 mx-xl-15 my-7">
										<!--begin::Form-->
										<form id="kt_modal_export_users_form" class="form" action="#">
											<!--begin::Input group-->
											<div class="fv-row mb-10">
												<!--begin::Label-->
												<label class="fs-6 fw-semibold form-label mb-2">직위 :</label>
												<!--end::Label-->
												<!--begin::Input-->
												<select name="role" data-control="select2" data-placeholder="직위 선택" data-hide-search="true" class="form-select form-select-solid fw-bold">
													<option></option>
													<option>전체</option>
													<c:forEach var="commonOfcpsList" items="${commonOfcpsList}">
														<option value="${commonOfcpsList.cmmnCode}">${commonOfcpsList.cmmnCodeNm}</option>
													</c:forEach>
												</select>
												<!--end::Input-->
											</div>
											<!--end::Input group-->
											<!--begin::Input group-->
											<div class="fv-row mb-10">
												<!--begin::Label-->
												<label class="fs-6 fw-semibold form-label mb-2">양식 :</label>
												<!--end::Label-->
												<!--begin::Input-->
												<select name="format" data-control="select2" data-placeholder="양식 선택" data-hide-search="true" class="form-select form-select-solid fw-bold">
													<option></option>
													<option>Excel</option>
													<option>PDF</option>
												</select>
												<!--end::Input-->
											</div>
											<!--end::Input group-->
											<!--begin::Actions-->
											<div class="text-center">
												<button type="reset" class="btn btn-light me-3" data-kt-users-modal-action="cancel">취소</button>
												<button type="submit" class="btn btn-primary" data-kt-users-modal-action="submit">
													<span class="indicator-label">내보내기</span>
													<span class="indicator-progress">내보내는 중...
														<span class="spinner-border spinner-border-sm align-middle ms-2"></span>
													</span>
												</button>
											</div>
											<!--end::Actions-->
										</form>
										<!--end::Form-->
									</div>
									<!--end::Modal body-->
								</div>
								<!--end::Modal content-->
							</div>
							<!--end::Modal dialog-->
						</div>
						<!--end::Modal - New Card--> --%>
					</div>
					<!--end::Card toolbar-->
				</div>
				<!--end::Card header-->
				<!--begin::Card body-->
				<div class="card-body py-4">
					<!--begin::Table-->
					<table class="table align-middle table-row-dashed fs-6 gy-5" id="kt_table_users">
						<thead>
							<tr class="text-start text-muted fw-bold fs-7 text-uppercase gs-0">
								<th class="min-w-125px">이름</th>
								<th class="min-w-125px">부서</th>
								<th class="min-w-125px">직위</th>
								<th class="min-w-125px">직책</th>
								<th class="min-w-125px">이메일</th>
								<th class="min-w-125px">휴대폰 번호</th>
								<th class="min-w-125px">입사일</th>
							</tr>
						</thead>
						<tbody class="text-gray-600 fw-semibold">
							<c:forEach var="emplList" items="${emplList}">
								<tr>
									<td class="d-flex align-items-center">
										<!--begin:: Avatar -->
										<div class="symbol symbol-circle symbol-50px overflow-hidden me-3" id="imageDiv">
											<a href="${emplList.emplNo}">
												<div class="symbol-label">
													<img src="${pageContext.request.contextPath}/resources/image/${emplList.proflPhotoCours}" alt="image" class="w-100" />
<%-- 													<img src="${pageContext.request.contextPath}/resources/image/${emplList.proflPhotoCours}?${System.currentTimeMillis()}" alt="image" class="w-100" /> --%>
												</div>
											</a>
										</div>
										<!--end::Avatar-->
										<!--begin::User details-->
										<div class="d-flex flex-column">
											<a href="${emplList.emplNo}" class="text-gray-800 text-hover-primary mb-1">${emplList.emplNm}</a>
										</div>
									</td>
									<td>${emplList.deptNm}</td>
									<td>${emplList.ofcpsCodeNm}</td>
									<td>${emplList.rspofcCodeNm}</td>
									<td>${emplList.emailAdres}</td>
									<td>${emplList.moblphonNo}</td>
									<td>${emplList.encpnDe}</td>
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