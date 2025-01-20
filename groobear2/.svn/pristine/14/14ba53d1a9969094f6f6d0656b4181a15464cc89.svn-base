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
							<input type="text" data-kt-customer-table-filter="search" class="form-control form-control-solid w-250px ps-13" placeholder="검색" />
						</div>
						<!--end::Search-->
					</div>
					<!--begin::Card title-->
					<!--begin::Card toolbar-->
					<div class="card-toolbar">
						<!--begin::Toolbar-->
						<div class="d-flex justify-content-end" data-kt-customer-table-toolbar="base">
							<!--begin::Filter-->
							<div class="w-150px me-3">
								<!--begin::Select2-->
								<select class="form-select form-select-solid" data-control="select2" data-hide-search="true" data-placeholder="근태" data-kt-ecommerce-order-filter="status">
									<option></option>
									<option value="all">전체</option>
									<option>출근</option>
									<option>결근</option>
									<option>휴가</option>
								</select>
								<!--end::Select2-->
							</div>
							<!--end::Filter-->
							<!--begin::Export-->
							<button type="button" class="btn btn-light-primary me-3" data-bs-toggle="modal" data-bs-target="#kt_customers_export_modal">
								<i class="ki-duotone ki-exit-up fs-2">
									<span class="path1"></span>
									<span class="path2"></span>
								</i>내보내기
							</button>
							<!--end::Export-->
						</div>
						<!--end::Toolbar-->
						<!--begin::Group actions-->
						<div class="d-flex justify-content-end align-items-center d-none" data-kt-customer-table-toolbar="selected">
							<div class="fw-bold me-5">
								<span class="me-2" data-kt-customer-table-select="selected_count"></span>Selected
							</div>
							<button type="button" class="btn btn-danger" data-kt-customer-table-select="delete_selected">Delete Selected</button>
						</div>
						<!--end::Group actions-->
					</div>
					<!--end::Card toolbar-->
				</div>
				<!--end::Card header-->
				<!--begin::Card body-->
				<div class="card-body pt-0">
					<!--begin::Table-->
					<table class="table align-middle table-row-dashed fs-6 gy-5" id="kt_customers_table">
						<thead>
							<tr class="text-start text-gray-500 fw-bold fs-7 text-uppercase gs-0">
								<th class="w-10px pe-2"></th>
								<th class="min-w-125px">부서</th>
								<th class="min-w-125px">사원 이름</th>
								<th class="min-w-125px">이메일</th>
								<th class="min-w-125px">출결</th>
								<th class="min-w-125px">출근 시간</th>
								<th class="min-w-125px">퇴근 시간</th>
							</tr>
						</thead>
						<tbody class="fw-semibold text-gray-600">
							<tr>
								<td>
									<div class="form-check form-check-sm form-check-custom form-check-solid"></div>
								</td>
								<td>부서 이름</td>
								<td>
									<a href="apps/ecommerce/customers/details.html" class="text-gray-800 text-hover-primary mb-1">사원 이름</a>
								</td>
								<td>
									<a href="#" class="text-gray-600 text-hover-primary mb-1">사원 이메일</a>
								</td>
								<td>
									<!--begin::Badges-->
									<div class="badge badge-light-danger">결근</div>
									<!--end::Badges-->
								</td>
								<td>25 Jul 2024, 2:40 pm</td>
								<td>25 Jul 2024, 2:40 pm</td>
							</tr>
							<tr>
								<td>
									<div class="form-check form-check-sm form-check-custom form-check-solid"></div>
								</td>
								<td>대충 부서</td>
								<td>
									<a href="apps/ecommerce/customers/details.html" class="text-gray-800 text-hover-primary mb-1">대충 이름</a>
								</td>
								<td>
									<a href="#" class="text-gray-600 text-hover-primary mb-1">대충 이메일</a>
								</td>
								<td>
									<!--begin::Badges-->
									<div class="badge badge-light-success">출근</div>
									<!--end::Badges-->
								</td>
								<td>25 Oct 2024, 6:43 am</td>
								<td>25 Oct 2024, 6:43 am</td>
							</tr>
							<tr>
								<td>
									<div class="form-check form-check-sm form-check-custom form-check-solid"></div>
								</td>
								<td>부서</td>
								<td>
									<a href="apps/ecommerce/customers/details.html" class="text-gray-800 text-hover-primary mb-1">이름</a>
								</td>
								<td>
									<a href="#" class="text-gray-600 text-hover-primary mb-1">이메일</a>
								</td>
								<td>
									<!--begin::Badges-->
									<div class="badge badge-light-warning">휴가</div>
									<!--end::Badges-->
								</td>
								<td>25 Oct 2024, 6:43 am</td>
								<td>25 Oct 2024, 6:43 am</td>
							</tr>
						</tbody>
						<!--end::Table body-->
					</table>
					<!--end::Table-->
				</div>
				<!--end::Card body-->
			</div>
			<!--end::Card-->
			<!--begin::Modals-->
			<!--begin::Modal - Adjust Balance-->
			<div class="modal fade" id="kt_customers_export_modal" tabindex="-1" aria-hidden="true">
				<!--begin::Modal dialog-->
				<div class="modal-dialog modal-dialog-centered mw-650px">
					<!--begin::Modal content-->
					<div class="modal-content">
						<!--begin::Modal header-->
						<div class="modal-header">
							<!--begin::Modal title-->
							<h2 class="fw-bold">내보내기</h2>
							<!--end::Modal title-->
							<!--begin::Close-->
							<div id="kt_customers_export_close" class="btn btn-icon btn-sm btn-active-icon-primary">
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
							<form id="kt_customers_export_form" class="form" action="#">
								<!--begin::Input group-->
								<div class="fv-row mb-10">
									<!--begin::Label-->
									<label class="fs-5 fw-semibold form-label mb-5">양식 선택 :</label>
									<!--end::Label-->
									<!--begin::Input-->
									<select data-control="select2" data-placeholder="Select a format" data-hide-search="true" name="format" class="form-select form-select-solid">
										<option value="excell">Excel</option>
										<option value="pdf">PDF</option>
									</select>
									<!--end::Input-->
								</div>
								<!--end::Input group-->
								<!--begin::Input group-->
								<div class="fv-row mb-10">
									<!--begin::Label-->
									<label class="fs-5 fw-semibold form-label mb-5">날짜 선택:</label>
									<!--end::Label-->
									<!--begin::Input-->
									<input class="form-control form-control-solid" placeholder="Pick a date" name="date" />
									<!--end::Input-->
								</div>
								<!--end::Input group-->
								<!--begin::Actions-->
								<div class="text-center">
									<button type="reset" id="kt_customers_export_cancel" class="btn btn-light me-3">닫기</button>
									<button type="submit" id="kt_customers_export_submit" class="btn btn-primary">
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
			<!--end::Modal - New Card-->
			<!--end::Modals-->
		</div>
		<!--end::Content container-->
	</div>
	<!--end::Content-->
</div>
<!--end::Content wrapper-->