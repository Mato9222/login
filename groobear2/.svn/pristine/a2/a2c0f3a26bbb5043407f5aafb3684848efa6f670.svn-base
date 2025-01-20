<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="co" %>
    <!DOCTYPE html>
	<!--begin::Main-->
	<div class="app-main flex-column flex-row-fluid" id="kt_app_main">
		<!--begin::Content wrapper-->
		<div class="d-flex flex-column flex-column-fluid">
			<!--begin::메일 시작-->
			<div id="kt_app_content" class="app-content flex-column-fluid">
				<!--begin::Content container-->
				<div id="kt_app_content_container" class="app-container container-xxl">
					<!--begin::Inbox App - Messages -->
					<div class="d-flex flex-column flex-lg-row">
						<!--begin::Content-->
						<div class="flex-lg-row-fluid ms-lg-7 ms-xl-10">
							<!--begin::Card-->
							<div class="card">
								<div class="card-header align-items-center py-5 gap-5">
									<!--begin::Actions-->
									<div class="d-flex">
										<!--begin::Back-->
										<a href="/mail" class="btn btn-sm btn-icon btn-clear btn-active-light-primary me-3" data-bs-toggle="tooltip" data-bs-placement="top" title="Back">
											<i class="ki-duotone ki-arrow-left fs-1 m-0">
												<span class="path1"></span>
												<span class="path2"></span>
											</i>
										</a>
										<!--end::Back-->
										<!--begin::Archive-->
<%-- 										 data-mail-no="${mailList.emailNo }" --%>
										<a href="#" data-mail-no="${mail.rec[0].receNo }" class="btn btn-sm btn-icon btn-light btn-active-light-primary me-2 reSend" data-bs-toggle="tooltip" data-bs-placement="top" title="답장">
											<i class="ki-duotone ki-sms fs-2 m-0">
												<span class="path1"></span>
												<span class="path2"></span>
											</i>
										</a>
										<!--end::Archive-->
										<!--begin::Spam-->
										<a href="#" class="btn btn-sm btn-icon btn-light btn-active-light-primary me-2" data-bs-toggle="tooltip" data-bs-placement="top" title="스팸">
											<i class="ki-duotone ki-information fs-2 m-0">
												<span class="path1"></span>
												<span class="path2"></span>
												<span class="path3"></span>
											</i>
										</a>
										<!--end::Spam-->
<%-- 										<p> ${mail } </p> --%>
										<!--begin::Delete-->
										<a href="/mail/trash/" data-no="${mailList.rec[0].receNo }" class="btn btn-sm btn-icon btn-light btn-active-light-primary me-2 mailDel" data-bs-toggle="tooltip" data-bs-placement="top" title="Delete">
											<i class="ki-duotone ki-trash fs-2 m-0">
												<span class="path1"></span>
												<span class="path2"></span>
												<span class="path3"></span>
												<span class="path4"></span>
												<span class="path5"></span>
											</i>
										</a>
										<!--end::Delete-->
										<!--begin::Mark as read-->
<!-- 										<a href="#" class="btn btn-sm btn-icon btn-light btn-active-light-primary me-2" data-bs-toggle="tooltip" data-bs-placement="top" title="Mark as read"> -->
<!-- 											<i class="ki-duotone ki-copy fs-2 m-0"></i> -->
<!-- 										</a> -->
										<!--end::Mark as read-->
										<!--begin::Move-->
										<a href="#" class="btn btn-sm btn-icon btn-light btn-active-light-primary" data-bs-toggle="tooltip" data-bs-placement="top" title="이동">
											<i class="ki-duotone ki-entrance-left fs-2 m-0">
												<span class="path1"></span>
												<span class="path2"></span>
											</i>
										</a>
										<!--begin::Star 즐겨찾기-->
										<a href="#" class="btn btn-sm btn-icon btn-clear btn-active-light-primary me-3" data-bs-toggle="tooltip" data-bs-placement="top" title="중요메일">
											<i class="ki-duotone ki-star fs-2 m-0"></i>
										</a>
										<!--end::Star 즐겨찾기 -->
									</div>
									<!--end::Actions-->
									<!--begin::Pagination-->
									<div class="d-flex align-items-center">
										<!--begin::Pages info-->
<!-- 										<span class="fw-semibold text-muted me-2">1 - 50 of 235</span> -->
										<!--end::Pages info-->
										<!--begin::Prev page-->
										<a href="#" class="btn btn-sm btn-icon btn-light btn-active-light-primary me-3" data-bs-toggle="tooltip" data-bs-placement="top" title="이전 메일">
											<i class="ki-duotone ki-left fs-2 m-0"></i>
										</a>
										<!--end::Prev page-->
										<!--begin::Next page-->
										<a href="#" class="btn btn-sm btn-icon btn-light btn-active-light-primary me-2" data-bs-toggle="tooltip" data-bs-placement="top" title="다음 메일">
											<i class="ki-duotone ki-right fs-2 m-0"></i>
										</a>
										<!--end::Next page-->
										<!--begin::Toggle-->
										<a href="#" class="btn btn-sm btn-icon btn-color-primary btn-light btn-active-light-primary d-lg-none" data-bs-toggle="tooltip" data-bs-dismiss="click" data-bs-placement="top" title="Toggle inbox menu" id="kt_inbox_aside_toggle">
											<i class="ki-duotone ki-burger-menu-2 fs-3 m-0">
												<span class="path1"></span>
												<span class="path2"></span>
												<span class="path3"></span>
												<span class="path4"></span>
												<span class="path5"></span>
												<span class="path6"></span>
												<span class="path7"></span>
												<span class="path8"></span>
												<span class="path9"></span>
												<span class="path10"></span>
											</i>
										</a>
										<!--end::Toggle-->
									</div>
									<!--end::Pagination-->
								</div>
								
								<div class="card-body">
								<c:choose>
									<c:when test="${not empty mailList }">
										<c:forEach items="${mailList }" var="mail">
										<!--begin::Title-->
										<div class="d-flex flex-wrap gap-2 justify-content-between mb-8">
											<div class="d-flex align-items-center flex-wrap gap-2">
												<!--begin::제목-->
												<h1 class="fw-bold me-3 my-1"><co:out value="${mail.emailSj }"/></h1>
												<!--end::제목-->
											</div>
										</div>
										<!--end::Title-->
										<!--begin::Message accordion-->
										<div data-kt-inbox-message="message_wrapper">
											<!--begin::Message header-->
											<div class="d-flex flex-wrap gap-2 flex-stack cursor-pointer" data-kt-inbox-message="header">
												<!--begin::Author-->
												<div class="d-flex align-items-center">
													<!--begin::Avatar-->
													<div class="symbol symbol-50 me-4">
														<span class="symbol-label" style="background-image:url('${pageContext.request.contextPath}/resources/image/${mail.proflPhotoCours }');"></span>
													</div>
										
													<!--end::Avatar-->
													<div class="pe-5">
														<!--begin::Author details-->
														<div class="d-flex align-items-center flex-wrap gap-1">
															<h3><a href="#" class="fw-bold text-gray-900 text-hover-primary">보낸사람 : ${mail.emp[0].emplNm }(${mail.ofcpsCodeNm })</a></h3>
															<div class="ms-auto w-75px text-end">
															<i class="ki-duotone ki-abstract-8 fs-7 text-success mx-3"> </i>
															</div>
														</div>
														<!--end::Author details-->
													</div>
												</div>
												<!--end::Author-->
												<div class="d-flex align-items-center flex-wrap gap-2">
													<!--begin::Date-->
													 <span class="fw-semibold text-muted text-end me-3">${mail.trnsmisDt }</span>
													<!--end::Date-->
												</div>
												<!--end::Actions-->
											</div>
											<p></p>
											<div class="row mb-8" style="padding-left: 2rem;">
												<div class="col-xl-2">
													<div class="fs-6 fw-semibold mt-2 mb-3">첨부파일</div>
												</div>
												<div class="col-xl-9 fv-row">
													<co:if test="${not empty mail.attchFileList}">
														<co:forEach items="${mail.attchFileList}" var="item" varStatus="vs">
															<co:url value="/mail/${mail.emailNo}/attach/${item.atchFileNo}/${item.atchFileSeq}" var="downloadUrl"/>
															<a href="${downloadUrl}" title="${item.fileSizeContraction}, ${item.fileDownCnt}번 다운"><!-- 파일크기(축약형), 다운로드수 -->
																${item.fileNm}
															</a>${not vs.last ? "<br>" : "" }
														</co:forEach>
													</co:if>
												</div>
											</div>
<!-- 											<div class="d-flex flex-wrap gap-2 flex-stack cursor-pointer" data-kt-inbox-message="header"> -->
<!-- 												begin::Author -->
<!-- 												<div class="d-flex align-items-center"> -->
<!-- 													begin::Avatar -->
<!-- 													<div class="symbol symbol-50 me-4"> -->
<%-- 														<span class="symbol-label" style="background-image:url('${pageContext.request.contextPath}/resources/image/${mail.emp[0].proflPhotoCours }');"></span> --%>
<!-- 													</div> -->
<!-- 													end::Avatar -->
<!-- 													<div class="pe-5"> -->
<!-- 														begin::Author details -->
<!-- 														<div class="d-flex align-items-center flex-wrap gap-1"> -->
<%-- 															<h5><a href="#" class="fw-bold text-gray-900 text-hover-primary">받는사람 : ${mail.emp[0].emplNm }(${mail.emp[0].cmmnCodeNm })</a></h5> --%>
<!-- 															<div class="ms-auto w-75px text-end"> -->
<!-- 															<i class="ki-duotone ki-abstract-8 fs-7 text-success mx-3"> </i> -->
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<p></p> -->
											</div>
											<!--end::Message header-->
											<p></p>
											<!--begin::Message content 내용 350 -> 500정도로 --> 
											<div id="kt_inbox_form_editor" class="bg-transparent border-0 h-350px px-3" style="overflow : auto">
												<pre><co:out value='${mail.emailCn }' escapeXml="false"></co:out></pre>
											</div>
<!-- 											<div class="collapse fade show" data-kt-inbox-message="message"> -->
<!-- 												<div class="py-5"> -->
<!-- 													<p class="mb-0">하드코딩 명함3</p> -->
<!-- 												</div> -->
<!-- 											</div> -->
											<!--end::Message content-->
											<!--end::Message accordion-->
											</c:forEach>
										</c:when>
									</c:choose>
									</div>
								</div>
							</div>
							<!--end::Card-->
						</div>
						<!--end::Content-->
					</div>
					<!--end::Inbox App - View & Reply -->
				</div>
				<!--end::Content container-->
			</div>
			<!--end::Content-->
		</div>
		<!--end::Content wrapper-->
		
<script>
document.addEventListener("DOMContentLoaded", () => {
	$(".mailDel").on("click", function(e) {
		e.preventDefault();
		let no = this.dataset.no;

		console.log(no)
		
		let url =  `/mail/trash/\${no}`;
		$.ajax({
			url : url
			, method : "post"
			, dataType : "text"
			, success : function(res) {
				console.log(res)
				if(res == "success") {
					location.href = "/mail";
				}
			}
		})
	})

	$(".reSend").on("click", function(e) {
		e.preventDefault();
		let mailNo = this.dataset.mailNo;
		console.log()
		console.log(mailNo);
		
		$.ajax({
			url : `/mail/reSend/\${mailNo}`
			, method : "post"
			, dataType : "text"
			, success : function(res) {
				console.log(res)
				if(res == "success") {
					console.log("여기가 성공",res);
					location.href = "/mail/reSendMail";
				}
				
			}
		})
	})
})
</script>