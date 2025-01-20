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
										<h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">자원(비품) 예약</h1>
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
											<li class="breadcrumb-item text-muted">자원(비품) 예약</li>
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
													<input type="text" data-kt-subscription-table-filter="search" class="form-control form-control-solid w-250px ps-12" placeholder="자원(비품) 검색" />
												</div>
												<!--end::Search-->
											</div>
											<!--begin::Card title-->
										</div>
										<!--end::Card header-->
										<!--begin::Card body-->
										<div class="card-body pt-0">
											<!--begin::Table-->
											<table class="table align-middle table-row-dashed fs-6 gy-5" id="kt_subscriptions_table">
												<thead>
													<tr class="text-start text-muted fw-bold fs-7 text-uppercase gs-0">
														<th class="min-w-125px">자원(비품)명</th>
														<th class="min-w-125px">장소위치</th>
														<th class="min-w-80px">이용가능여부</th>
														<th class="min-w-80px m-10">예약</th>
													</tr>
												</thead>
												<tbody class="text-gray-600 fw-semibold">
											<c:forEach items="${usingList}" var="using">
													<tr class="text-start text-muted fw-bold fs-7 text-uppercase gs-0">
														<td>
														<a href="
" class="text-gray-800 text-hover-primary mb-1">${using.resrceNm }</a>
														</td>
														<td>${using.resrceInfo}</td>
														<c:if test="${using.resrceUseAt eq 'Y'}" >
														<td>
														<div class="badge badge-light-success">사용가능</div>
														</td>
														</c:if>
														<c:if test="${using.resrceUseAt eq 'N'}">
														<td>
														<div class="badge badge-light-danger">사용불가</div>
														</td>
														</c:if>
													    <td>
															<button class="btn btn-primary RR-button">예약</button>
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