<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!--begin::Main-->
<!-- <div class="app-main flex-column flex-row-fluid" id="kt_app_main"> -->
	<!--begin::Content wrapper-->
<div class="d-flex flex-column flex-column-fluid">
	<!--begin::Toolbar-->
	<div id="kt_app_toolbar" class="app-toolbar py-3 py-lg-6">
		<!--begin::Toolbar container-->
		<div id="kt_app_toolbar_container" class="app-container container-xxl d-flex flex-stack">
			<!--begin::Page title-->
			<div class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
				<!--begin::Title-->
				<h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">주소록</h1>
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
					<li class="breadcrumb-item text-muted">주소록</li>
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
			<!--begin::Card-->
			<div class="card card-flush">
				<!--begin::Card header-->
				<div class="card-header mt-6">
					<!--begin::Card title-->
					<div class="card-title">
						<!--begin::Search-->
						<div class="d-flex align-items-center position-relative my-1 me-5">
							<i class="ki-duotone ki-magnifier fs-3 position-absolute ms-5">
								<span class="path1"></span>
								<span class="path2"></span>
							</i>
							<input type="text" data-kt-permissions-table-filter="search" class="form-control form-control-solid w-250px ps-13" placeholder="Search Permissions" />
						</div>
						<!--end::Search-->
					</div>
					<!--end::Card title-->
					<!--begin::Card toolbar-->
					<div class="card-toolbar">
						<!--begin::Button-->
						<button type="button" class="btn btn-light-primary addAdrs">
							<i class="ki-duotone ki-plus-square fs-3 addAdrs">
								<span class="path1"></span>
								<span class="path2"></span>
								<span class="path3"></span>
							</i>주소록 추가
						</button>
						<!--end::Button-->
					</div>
					<!--end::Card toolbar-->
				</div>
				<!--end::Card header-->
				<!--begin::내용 추가-->
				<div id="mydiv" style="display : none;">
					이름 <input type="text" class="adrsAdd" name="nm">
					메일주소<input type="text" class="adrsAdd" name="mail">
					핸드폰 번호<input type="text" class="adrsAdd" name="hp">
					회사명<input type="text" class="adrsAdd" name="comp">
					<button type="button" class="btn btn-light-primary addAdrs"> 저장 </button>
				</div>
				<!--end::내용추가-->
				<!--begin::Card body-->
				<div class="card-body pt-0">
					<!--begin::Table-->
					<table class="table align-middle table-row-dashed fs-6 gy-5 mb-0" id="kt_inbox_listing">
						<thead>
							<tr class="text-start text-gray-500 fw-bold fs-7 text-uppercase gs-0">
								<th class="min-w-125px">이름</th>
								<th class="min-w-250px">메일주소</th>
								<th class="min-w-125px">핸드폰번호</th>
								<th class="min-w-125px">회사명</th>
								<th class="min-w-125px">비고</th>
							</tr>
						</thead>
						<tbody class="fw-semibold text-gray-600">
							<tr>
								<td>개똥이</td>
								<td>asdasd123@naver.com</td>
								<td>010-8888-4444</td>
								<td>대덕인재개발원</td>
<!-- 								<td class="text-end">대덕인재개발원</td> -->
								<td class="min-w-125px">
									<button class="btn btn-icon btn-active-light-primary w-30px h-30px me-3" data-bs-toggle="modal" data-bs-target="#kt_modal_update_permission">
										<i class="ki-duotone ki-star fs-3">
											<span class="path1"></span>
											<span class="path2"></span>
											<span class="path3"></span>
											<span class="path4"></span>
											<span class="path5"></span>
										</i>
									</button>
									<button class="btn btn-icon btn-color-gray-500 btn-active-color-primary w-35px h-35px" data-kt-permissions-table-filter="delete_row">
										<i class="ki-duotone ki-trash fs-3">
											<span class="path1"></span>
											<span class="path2"></span>
											<span class="path3"></span>
											<span class="path4"></span>
											<span class="path5"></span>
										</i>
									</button>
								</td>
							</tr>
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

<script>
document.addEventListener("DOMContentLoaded", () => {
	$(".addAdrs").on("click", function() {
		if($("#mydiv").css("display") != "none"){
			$("#mydiv").hide();
		} else {
			$("#mydiv").show();
		}
	})

	$(".addAdrs").on("click", function(e) {
		let url = "/address/new";
		
// 		$.ajax({
// 			url : 
// 			, method : 
// 			, success : function(res) {
				
// 			}
// 		})
		
	})
})
</script>