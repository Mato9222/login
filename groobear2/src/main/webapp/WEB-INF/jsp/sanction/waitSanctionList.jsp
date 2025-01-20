<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<security:authentication property="principal.realUser" var="realUser"/>
<div class="d-flex flex-column flex-column-fluid">
	<!--begin::Toolbar-->
	<div id="kt_app_toolbar" class="app-toolbar py-3 py-lg-6">
		<!--begin::Toolbar container-->
		<div id="kt_app_toolbar_container" class="app-container container-xxl d-flex flex-stack">
			<!--begin::Page title-->
			<div class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
				<!--begin::Title-->
				<h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">결재 대기 문서</h1>
				<!--end::Title-->
				<!--begin::Breadcrumb-->
				<ul class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 my-0 pt-1">
					<!--begin::Item-->
					<li class="breadcrumb-item text-muted">
						<a href="index.html" class="text-muted text-hover-primary">Home</a>
					</li>
					<!--end::Item-->
					<!--begin::Item-->
					<li class="breadcrumb-item">
						<span class="bullet bg-gray-500 w-5px h-2px"></span>
					</li>
					<!--end::Item-->
					<!--begin::Item-->
					<li class="breadcrumb-item text-muted">전자결재</li>
					<!--end::Item-->
					<!--begin::Item-->
					<li class="breadcrumb-item">
						<span class="bullet bg-gray-500 w-5px h-2px"></span>
					</li>
					<!--end::Item-->
					<!--begin::Item-->
					<li class="breadcrumb-item text-muted">결재 대기 문서</li>
					<!--end::Item-->
				</ul>
				<!--end::Breadcrumb-->
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
			<!--begin::Products-->
			<div class="card card-flush">
				<!--begin::Card header-->
				<div class="card-header align-items-center py-5 gap-2 gap-md-5">
					<!--begin::Card title-->
					<div class="card-title">
						<!--begin::Search-->
						<div class="d-flex align-items-center position-relative my-1">
							<i class="ki-duotone ki-magnifier fs-3 position-absolute ms-4">
								<span class="path1"></span>
								<span class="path2"></span>
							</i>
							<input type="text" data-kt-ecommerce-order-filter="search" class="form-control form-control-solid w-250px ps-12" placeholder="문서명 검색" />
						</div>
						<!--end::Search-->
						<!--begin::Export buttons-->
						<div id="kt_ecommerce_report_shipping_export" class="d-none"></div>
						<!--end::Export buttons-->
					</div>
					<!--end::Card title-->
					<!--begin::Card toolbar-->
					<div class="card-toolbar flex-row-fluid justify-content-end gap-5">
						<!--begin::Daterangepicker-->
<!-- 						<input class="form-control form-control-solid w-100 mw-250px" placeholder="Pick date range" id="kt_ecommerce_report_shipping_daterangepicker" /> -->
						<!--end::Daterangepicker-->
						<!--begin::Filter-->
						<div class="w-150px">
							<!--begin::Select2-->
							<select class="form-select form-select-solid" data-control="select2" data-hide-search="true" data-placeholder="결재상태" data-kt-ecommerce-order-filter="status">
								<option></option>
								<option value="all">All</option>
								<option value="결재완료">결재완료</option>
								<option value="결재대기">결재대기</option>
								<option value="결재진행중">결재진행중</option>
								<option value="반려">반려</option>
							</select>
							<!--end::Select2-->
						</div>
						<!--end::Filter-->
					</div>
					<!--end::Card toolbar-->
				</div>
				<!--end::Card header-->
				<!--begin::Card body-->
				<div class="card-body pt-0">
					<!--begin::Table-->
					<table class="table align-middle table-row-dashed fs-6 gy-5" id="kt_ecommerce_report_shipping_table">
						<thead>
							<tr class="text-start text-gray-500 fw-bold fs-7 text-uppercase gs-0">
								<th class="min-w-100px">결재문서번호</th>
								<th class="min-w-100px">문서양식</th>
								<th class="min-w-100px">문서명</th>
								<th class="min-w-100px">결재상태</th>
								<th class="text-end min-w-100px">기안일</th>
							</tr>
						</thead>
						<tbody class="fw-semibold text-gray-600">
						<c:if test="${not empty waitSclist }">
						<c:forEach items="${waitSclist }" var="scDocList">
							<tr>
								<td>${scDocList.sanctnDocNo}</td>
								<td>${scDocList.doorSign}</td>
								<td>
									<a href="/sanctionDoc/detail/${scDocList.sanctnDocNo }" class="text-gray-900 text-hover-primary">${scDocList.sanctnSj }</a>
								</td>
								<td>
									<!--begin::Badges-->
									<c:if test="${scDocList.lastSanctnSttusNm eq '결재대기'}">
										<div class="badge badge-light-primary">${scDocList.lastSanctnSttusNm }</div>
									</c:if>
									<c:if test="${scDocList.lastSanctnSttusNm eq '반려'}">
										<div class="badge badge-light-danger">${scDocList.lastSanctnSttusNm }</div>
									</c:if>
									<c:if test="${scDocList.lastSanctnSttusNm eq '결재완료'}">
										<div class="badge badge-light-success">${scDocList.lastSanctnSttusNm }</div>
									</c:if>
									<c:if test="${scDocList.lastSanctnSttusNm eq '결재진행중'}">
										<div class="badge badge-light-warning">${scDocList.lastSanctnSttusNm }</div>
									</c:if>
									<!--end::Badges-->
								</td>
								<td class="text-end pe-0" data-order="${scDocList.recomDe }">
								${scDocList.recomDe}
								</td>
							</tr>
						</c:forEach>
						</c:if>
						<c:if test="${empty waitSclist }">
							<tr>
								<td colspan="5" style="text-align: center">결재할 문서가 없습니다.</td>
							</tr>
						</c:if>
						</tbody>
					</table>
					<!--end::Table-->
				</div>
				<!--end::Card body-->
			</div>
			<!--end::Products-->
		</div>
		<!--end::Content container-->
	</div>
	<!--end::Content-->
</div>
<!--end::Content wrapper-->