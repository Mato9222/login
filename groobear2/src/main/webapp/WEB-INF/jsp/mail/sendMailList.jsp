<%@page import="com.teamtodev.mail.vo.MailVO"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="com.teamtodev.employees.vo.EmployeeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.blue {
	color : blue;
}
.blue:hover{
	border-bottom: solid 1px;
}
</style>
<div class="app-main flex-column flex-row-fluid" id="kt_app_main">
	<!--begin::Content wrapper-->
	<div class="d-flex flex-column flex-column-fluid">
		<!--begin::Toolbar-->
		<div id="kt_app_toolbar" class="app-toolbar py-3 py-lg-6">
			<!--begin::Toolbar container-->
			<div id="kt_app_toolbar_container"
				class="app-container container-xl d-flex flex-stack">
				<!--begin::Page title-->
				<div class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
					<!--begin::Title-->
					<h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">보낸편지함</h1>
					<!--end::Title-->
					<!--begin::Breadcrumb-->
					<ul class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 my-0 pt-1">
						<!--begin::Item-->
						<li class="breadcrumb-item text-muted">
							<a href='<c:url value="/"></c:url>' class="text-muted text-hover-primary">Home</a>
						</li>
						<!--end::Item-->
						<!--begin::Item-->
						<li class="breadcrumb-item">
							<span class="bullet bg-gray-500 w-5px h-2px"></span>
						</li>
						<!--end::Item-->
						<!--begin::Item-->
						<li class="breadcrumb-item text-muted">보낸메일함</li>
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
			<div id="kt_app_content_container" class="app-container container-xl">
				<!--begin::Inbox App - Messages -->
				<div class="d-flex flex-column flex-lg-row">
					<!--begin::Content-->
					<div class="flex-lg-row-fluid ms-l-10">
						<!--begin::Card-->
						<div class="card">
							<div class="card-header align-items-center py-5 gap-2 gap-md-5">
								<!--begin::Actions-->
								<div class="d-flex flex-wrap gap-2">
									<!--begin::Checkbox-->
									<div class="form-check form-check-sm form-check-custom form-check-solid me-4 me-lg-7">
										<input class="form-check-input" type="checkbox" data-kt-check="true"
											data-kt-check-target="#kt_inbox_listing .form-check-input" value="1">
									</div>
									<!--end::Checkbox-->
<!-- 									begin::Archive 답장으로 쓰거나 버리거나 -->
									<a href="#"
										class="btn btn-sm btn-icon btn-light btn-active-light-primary"
										data-bs-toggle="tooltip" data-bs-dismiss="click"
										data-bs-placement="top" aria-label="Archive"
										data-bs-original-title="Archive" data-kt-initialized="1">
										<i class="ki-duotone ki-sms fs-2"> <span class="path1"></span>
											<span class="path2"></span>
									</i>
									</a>
									<!--end::Archive-->
									<!--begin::Delete 휴지통(삭제)버튼 -->
									<a href="/trash" id="selectTrash" class="btn btn-sm btn-icon btn-light btn-active-light-primary"
										data-bs-toggle="tooltip" data-bs-dismiss="click" data-bs-placement="top" 
										aria-label="Delete" data-bs-original-title="Delete" data-kt-initialized="1">
										<i class="ki-duotone ki-trash fs-2">
										<span class="path1"></span>
										<span class="path2"></span>
										<span class="path3"></span>
										<span class="path4"></span>
										<span class="path5"></span>
									</i>
									</a>
									<!--end::Delete-->
									<!--begin::Filter-->
									<div>
										<a href="#" class="btn btn-sm btn-icon btn-light btn-active-light-primary"
											data-kt-menu-trigger="click" data-kt-menu-placement="bottom-start">
											<i class="ki-duotone ki-down fs-2"></i>
										</a>
										<!--begin::Menu-->
										<div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-600 menu-state-bg-light-primary fw-semibold fs-7 w-125px py-4"
											data-kt-menu="true">
											<!--begin::Menu item-->
											<div class="menu-item px-3">
												<a href="/mail" class="menu-link px-3" data-kt-inbox-listing-filter="show_all">All</a>
											</div>
											<!--end::Menu item-->
											<!--begin::Menu item 읽은것만 버튼-->
											<div class="menu-item px-3">
												<a href="#" class="menu-link px-3" data-kt-inbox-listing-filter="show_read">읽은 메일</a>
											</div>
											<!--end::Menu item-->
											<!--begin::Menu item 안읽은것만 버튼-->
											<div class="menu-item px-3">
												<a href="/mail/unread" class="menu-link px-3" data-kt-inbox-listing-filter="show_unread">안읽은 메일</a>
											</div>
											<!--end::Menu item-->
											<!--begin::Menu item 즐겨찾기만 버튼-->
											<div class="menu-item px-3">
												<a href="#" class="menu-link px-3" data-kt-inbox-listing-filter="show_starred">즐겨찾기 메일</a>
											</div>
											<!--end::Menu item-->
										</div>
										<!--end::Menu-->
									</div>
									<!--end::Filter-->
								</div>
								<!--end::Actions-->
								<!--begin::Actions-->
								<div class="d-flex align-items-center flex-wrap gap-2"><!--  검색 정렬 ? -->
									<!--begin::Search-->
									<div class="d-flex align-items-center position-relative">
										<i class="ki-duotone ki-magnifier fs-3 position-absolute ms-4">
											<span class="path1"></span>
											<span class="path2"></span>
										</i>
										<input type="text" data-kt-inbox-listing-filter="search" 
											class="form-control form-control-sm form-control-solid mw-100 min-w-125px min-w-lg-150px min-w-xxl-200px ps-11"
											placeholder="검색어를 입력해주세요">
									</div>
									<!--end::Search-->
								</div>
								<!--end::Actions-->
							</div>
							<div class="card-body p-0">
								<!--begin::Table-->
								<div id="kt_inbox_listing_wrapper" class="dt-container dt-bootstrap5 dt-empty-footer">
									<div id="" class="table-responsive">
										<table class="table table-hover table-row-dashed fs-6 gy-5 my-0 dataTable"
											 id="kt_inbox_listing" style="width: 950.5px;"><!--  id="kt_inbox_listing" -->
											<thead>
												<tr role="row">
													<th data-dt-column="0" rowspan="1" colspan="1"
														aria-label="Checkbox: Activate to sort" tabindex="0" style="width : 60px">
														<span class="dt-column-title" role="button"></span>
														<span class="dt-column-order"> </span>
													</th>
													<th data-dt-column="1" rowspan="1" colspan="1"
														class="dt-orderable-asc dt-orderable-desc"
														aria-label="Actions: Activate to sort" tabindex="0">
														<span class="dt-column-title" role="button"></span>
														<span class="dt-column-order"></span>
													</th>
													<th data-dt-column="2" rowspan="1" colspan="1"
														class="dt-orderable-asc dt-orderable-desc"
														aria-label="Author: Activate to sort" tabindex="0">
														<span class="dt-column-title" role="button">받는사람</span>
														<span class="dt-column-order"></span>
													</th>
													<th data-dt-column="3" rowspan="1" colspan="1"
														class="dt-orderable-asc dt-orderable-desc"
														aria-label="Title: Activate to sort" tabindex="0" style="width : 1000px">
														<span class="dt-column-title" role="button">제목</span>
														<span class="dt-column-order"></span>
													</th>
													<th data-dt-column="4" rowspan="1" colspan="1"
														class="dt-orderable-asc dt-orderable-desc text-end pe-9"
														aria-label="Date: Activate to sort" tabindex="0">
														<span class="dt-column-title" role="button">수신일시</span>
														<span class="dt-column-order"></span>
													</th>
												</tr>
											</thead>
											<tbody>
												<c:choose>
													<c:when test="${not empty mailList }">
														<c:forEach items="${mailList }" var="mail">
															<tr>
																<td class="ps-9">
																	<div class="form-check form-check-sm form-check-custom form-check-solid mt-3">
																		<input class="form-check-input selected" id="selected" type="checkbox" value="${mail.rec[0].receNo }" >
																	</div>
																</td>
																<td class="min-w-80px">
																	<!--begin::Star 중요표시-->
																	<a href="#" class="btn btn-icon btn-color-gray-500 btn-active-color-primary w-35px h-35px"
																	data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Star"
																	data-bs-original-title="Star" data-kt-initialized="1"> 
																	<i class="ki-duotone ki-star fs-3"> </i>
																	</a> 
																	<!--end::Star-->
																	<!--begin::휴지통-->
																	<a href="#" class="btn btn-icon btn-color-gray-500 btn-active-color-primary w-35px h-35px mailDel"
																	data-bs-toggle="tooltip" data-bs-placement="right" aria-label="trash" 
																	data-no="${mail.emailNo }" data-bs-original-title="Star" data-kt-initialized="1">
																		<i class="ki-duotone ki-trash fs-3">
																		<span class="path1"></span>
																		<span class="path2"></span>
																		<span class="path3"></span>
																		<span class="path4"></span>
																		<span class="path5"></span>
																	</i>
																	</a>
																	<!--end::휴지통-->
																</td>
																<td class="w-100px w-md-100px"> 
																	<a href="${pageContext.request.contextPath}/WEB-INF/jsp/mail/mailContent"
																		class="d-flex align-items-center text-gray-900"> 
																		<!--begin::Avatar-->
																			<div class="symbol symbol-35px me-3">
																				<div class="symbol-label bg-light-danger" style="background-image:url('${pageContext.request.contextPath}/resources/image/${mail.emp[0].proflPhotoCours }')"> </div>
																			</div> 
			<!-- 																end::Avatar begin::보낸 사람 이름  -->
																			<c:if test="${mail.rec[0].count != 1}">
																				<span class="fw-bold fw-semibold">${mail.emp[0].emplNm }(${mail.com[0].cmmnCodeNm }) 외 ${mail.rec[0].count-1 }</span>
																			</c:if> 
																			<c:if test="${mail.rec[0].count == 1}">
																				<span class="fw-bold fw-semibold">${mail.emp[0].emplNm }(${mail.com[0].cmmnCodeNm })</span>
																			</c:if> 
																		<!--end::보낸 사람 이름-->
																	</a>
																</td>
																<td>
																	<div class="text-gray-900 gap-1 pt-2">
																		<!--begin::Heading-->
																		<a href="/mail/sendContent/${mail.rec[0].receNo }" class="text-gray-900">
																			<c:if test="${empty mail.emailSj}">
																		   	    <span class="fw-bold mail-link">(제목없음)</span>
																	        </c:if>
																			 <c:if test="${not empty mail.emailSj}">
																		        <span class="fw-bold mail-link">${mail.emailSj}</span>
																	        </c:if>
																		</a>
																		<!--end::Heading-->
																	</div>
																	<!--begin::Badges-->
																</td>
																<td class="w-100px text-end fs-7 pe-9">
<%-- 																	<c:forEach items="${mail.rec }" var="mailrec"> --%>
																		<c:if test="${mail.rec[0].readTime == NULL}">
<%-- 																		<c:if test="${mailrec == 0}"> --%>
																			읽지 않음 <span class="fw-semibold cancel blue" data-no="${mail.emailNo }">(발송 취소)</span>
																		</c:if>
<%-- 																		<c:if test="${mail.rec[0].asd != 0}"> --%>
<%-- 																			<span class="fw-semibold">${mail.rec[0].count} 명 중 ${mail.rec[0].readAsd} 명 읽음 </span> --%>
<%-- 																		</c:if> --%>
<%-- 																	</c:forEach> --%>
																	<c:if test="${mail.rec[0].readTime != NULL}">
																		<c:if test="${mail.rec[0].count == 1}">
																			<span class="fw-semibold">${mail.rec[0].readTime}</span>
																		</c:if>
																		<c:if test="${mail.rec[0].count != 1}">
																			<span class="fw-semibold">${mail.rec[0].count} 명 중 ${mail.rec[0].readCount} 명 읽음 </span>
																		</c:if>
																	</c:if>
																</td>
															</tr>
														</c:forEach>
													</c:when>
												</c:choose>
											</tbody>
											<tfoot></tfoot>
										</table>
									</div>
								</div>
								<!--end::Table-->
							</div>
						</div>
						<!--end::Card-->
					</div>
					<!--end::Content-->
				</div>
				<!--end::Inbox App - Messages -->
			</div>
			<!--end::Content container-->
		</div>
		<!--end::Content-->
	</div>
	<!--end::Content wrapper-->
</div>
 
<script>
document.addEventListener("DOMContentLoaded", () => {
	$(".mailDel").on("click", function(e) {
		e.preventDefault();
		let no = this.dataset.no;

		let url = `/mail/sendTrash/\${no}`;
		$.ajax({
			url : url
			, method : "post"
			, dataType : "text"
			, success : function(res) {
				console.log(res)
				if(res == "success") {
					location.href = "/mail/sendMailList";
				}
			}
		})
	})
	
	$("#selectTrash").on("click", function(e) {
		e.preventDefault();
		let values = '';
		let sel = $("input[id=selected]:checked");
		$(sel).each(function() {
			values += $(this).val()+",";
		})
		
		let url = `/mail/sendTrash/\${values}`;
		$.ajax({
			url : url
			, method : "post"
			, dataType : "text"
			, success : function(res) {
				console.log(res)
				if(res == "success") {
					location.href = "/mail/sendMailList";
				}
			}
		})
	})
$(".cancel").on("click", function(e){
    e.preventDefault(); // Prevent the default action
    let readNo = this.dataset.no;

    Swal.fire({
        title: '발송 취소 확인',
        text: "해당 메일의 발송을 취소하시겠습니까?",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '예',
        cancelButtonText: '아니오'
    }).then((result) => {
        if (result.isConfirmed) {
            let url = `/mail/deleteMail/\${readNo}`;

            $.ajax({
                url: url,
                method: "post",
                dataType: "text",
                success: function(res) {
                    console.log(res);
                    if (res == "success") {
                        Swal.fire(
                            '발송 취소 완료',
                            '메일 발송이 취소되었습니다.',
                            'success'
                        ).then(() => {
                            location.href = "/mail/sendMailList";
                        });
                    } else {
                        Swal.fire(
                            '발송 취소 실패',
                            '메일 발송 취소에 실패하였습니다.',
                            'error'
                        );
                    }
                },
                error: function() {
                    Swal.fire(
                        '에러',
                        '서버와의 통신 중 에러가 발생했습니다.',
                        'error'
                    );
                }
            });
        }
    });
});	
})
</script>

