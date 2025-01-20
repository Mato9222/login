<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<security:authentication property="principal.realUser" var="realUser" />
<script src="${pageContext.request.contextPath}/resources/demo1/assets/js/custom/apps/file-manager/list.js"></script>
<link href="${pageContext.request.contextPath }/resources/demo1/assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
<link rel="canonical" href="http://apps/file-manager/files.html" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/approval-form.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/dropzone.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.min.css">
<link rel="canonical" href="http://apps/file-manager/files.html" />

<style>
.ck.ck-editor {
	max-width: 100%;
}

.ck-editor__editable {
	min-height: 100%;
}
</style>
<div class="d-flex flex-column flex-column-fluid">
	<!--begin::Toolbar-->
	<div id="kt_app_toolbar" class="app-toolbar py-3 py-lg-6">
		<!--begin::Toolbar container-->
		<div id="kt_app_toolbar_container"
			class="app-container container-xxl d-flex flex-stack">
			<!--begin::Page title-->
			<div
				class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
				<!--begin::Title-->
				<h1	class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">
					결재 문서 작성</h1>
				<!--end::Title-->
			</div>
			<!--end::Page title-->
			<!--begin::Actions-->
			<!--end::Actions-->
		</div>
		<!--end::Toolbar container-->
	</div>
	<!--end::Toolbar-->
	<div id="kt_app_content" class="app-content flex-column-fluid">
		<!--begin::Content container-->
		<div id="kt_app_content_container" class="app-container container-xxl">
			<!--begin::Form-->
			<form id="kt_ecommerce_add_product_form"
				class="form d-flex flex-column flex-lg-row"
				data-kt-redirect="apps/ecommerce/catalog/products.html">
				<!--begin::Aside column-->

				<!--end::Aside column-->
				<!--begin::Main column-->
				<div class="d-flex flex-column flex-row-fluid gap-7 gap-lg-10" style="width:1400px;">
					<!--begin:::Tabs-->
					<!--end:::Tabs-->
					<!--begin::Tab content-->
					<div class="tab-content">
						<!--begin::Tab pane-->
						<div class="tab-pane fade show active"
							id="kt_ecommerce_add_product_general" role="tab-panel">
							<div class="d-flex flex-column gap-7 gap-lg-10">
								<!--begin::General options-->
								<div class="card card-flush py-4">
									<!--begin::Card header-->
									<div class="card-header">
										<!--begin::Card title-->
										<div class="card-title">
											<h2>결재 문서</h2>
										</div>
										<!--end::Card title-->
										<security:authorize access="${not empty sanctionData and empty scDocVO }">
											<div class="card-title">
												<input type="button" class="btn btn-active-info" id="QuickWrite" value="빠른 작성"/>
											</div>
										</security:authorize>
									</div>
									<!--end::Card header-->
									<!--begin::Card body-->
									<div class="card-body pt-0">
										<!--begin::Input group-->
										<div class="mb-10 fv-row">
											<!--begin::Label-->
											<label class="form-label">문서명 입력</label>
											<!--end::Label-->
											<!--begin::Input-->
											<security:authorize access="${not empty sanctionData and empty scDocVO}">
												<input type="text" name="docName" class="form-control mb-2"
													placeholder="문서명 입력" value="" />
											</security:authorize>
											<security:authorize access="${not empty scDocVO }">
												<input type="text" name="docName" class="form-control mb-2"
													placeholder="문서명 입력" value="${scDocVO.sanctnSj }" />
											</security:authorize>
											<!--end::Input-->
											<!--begin::Description-->
											<!--end::Description-->
										</div>
										<!--end::Input group-->
										<!--begin::Input group-->
										<div>
											<!--begin::Label-->
											<label class="form-label">문서내용</label>
											<!--end::Label-->
											<!--begin::Editor-->
											<div id="kt_ecommerce_add_product_description"
												name="kt_ecommerce_add_product_description"
												class="min-h-200px mb-2">
												<div id="editor">
													<security:authorize access="${not empty sanctionData and empty scDocVO}">
																			${sanctionData[0].docCn }
																		</security:authorize>
<%-- 													<security:authorize access="${not empty scDocVO }"> --%>
<%-- 																			${scDocVO.sanctnCn } --%>
<%-- 																		</security:authorize> --%>
																		
												</div>
												
											</div>
											<!--end::Editor-->
											<!--begin::Description-->
											<!--end::Description-->
										</div>
										<!--end::Input group-->
									</div>
									<!--end::Card header-->
								</div>
								<!--end::General options-->
								<!--begin::Media-->
<div class="card card-flush py-4">
    <!--begin::Form-->
    <!--begin::Input group-->
    <div class="form-group row m-5">
        <!--begin::Label-->
        <label class="col-lg-2 col-form-label text-lg-right">첨부 파일</label>
        <!--end::Label-->

        <!--begin::Col-->
        <div class="col-lg-10">
            <!--begin::Dropzone-->
            <div class="dropzone dropzone-queue mb-2" id="kt_dropzonejs_example_3">
                <!--begin::Controls-->
                <div class="dropzone-panel mb-lg-0 mb-2">
                    <a class="dropzone-select btn btn-sm btn-primary me-2">파일 선택</a>
                    <a class="dropzone-remove-all btn btn-sm btn-light-primary">전부 삭제</a>
                </div>
                <!--end::Controls-->

                <!--begin::Items-->
				<div class="dropzone-items wm-200px">
                    <div class="dropzone-item" style="display:none">
                        <!--begin::File-->
                        <div class="dropzone-file">
                            <div class="dropzone-filename" title="some_image_file_name.jpg">
                                <span data-dz-name>some_image_file_name.jpg</span>
                                <strong>(<span data-dz-size>340kb</span>)</strong>
                            </div>

                            <div class="dropzone-error" data-dz-errormessage></div>
                        </div>
                        <!--end::File-->

                        <!--begin::Progress-->
                        <div class="dropzone-progress">
                            <div class="progress">
                                <div
                                    class="progress-bar bg-primary"
                                    role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0" data-dz-uploadprogress>
                                </div>
                            </div>
                        </div>
                        <!--end::Progress-->

                        <!--begin::Toolbar-->
                        <div class="dropzone-toolbar">
                            <span class="dropzone-delete" data-dz-remove><i class="bi bi-x fs-1"></i></span>
                        </div>
                        <!--end::Toolbar-->
                    </div>
                </div>
                <!--end::Items-->
            </div>
            <!--end::Dropzone-->

            <!--begin::Hint-->
            <span class="form-text text-muted">파일 개당 최대용량 100MB 첨부 가능</span>
            <!--end::Hint-->
        </div>
        <!--end::Col-->
    </div>
    <!--end::Input group-->
    <!--end::Form-->
</div>
								<!--end::Media-->
							</div>
						</div>
					</div>
					<!--end::Tab content-->
					<div class="d-flex justify-content-end">
						<!--begin::Button-->
						<a href="/"
							id="kt_ecommerce_add_product_cancel" class="btn btn-light me-5">
							취소 <i class="ki-duotone ki-exit-right"> <span class="path1"></span>
								<span class="path2"></span>
						</i>
						</a>
						<!--end::Button-->
						<!--begin::Button-->
						<security:authorize access="${not empty sanctionData and empty scDocVO}">
							<button type="button" id="kt_ecommerce_save"
								class="btn btn-light">
								<span class="indicator-label"> 임시저장 <i
									class="ki-duotone ki-save-2"> <span class="path1"></span> <span
										class="path2"></span>
								</i>
								</span> <span class="indicator-progress">잠시만 기다려주세요. <span
									class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
							</button>&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" id="kt_ecommerce_add_product_submit"
								class="btn btn-primary">
								<span class="indicator-label"> 기안 <i
									class="ki-duotone ki-send"> <span class="path1"></span> <span
										class="path2"></span>
								</i>
								</span> <span class="indicator-progress">잠시만 기다려주세요. <span
									class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
							</button>
						</security:authorize>
						<security:authorize access="${not empty scDocVO }">
							<button type="button" id="kt_update_save"
								class="btn btn-light">
								<span class="indicator-label"> 임시저장 <i
									class="ki-duotone ki-save-2"> <span class="path1"></span> <span
										class="path2"></span>
								</i>
								</span> <span class="indicator-progress">잠시만 기다려주세요. <span
									class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
							</button>&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" id="kt_ecommerce_update"
								class="btn btn-primary">
								<span class="indicator-label"> 기안 <i
									class="ki-duotone ki-send"> <span class="path1"></span> <span
										class="path2"></span>
								</i>
								</span> <span class="indicator-progress">잠시만 기다려주세요. <span
									class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
							</button>
						</security:authorize>
						<!--end::Button-->
					</div>
				</div>
				
				<div
					class="d-flex flex-column gap-7 gap-lg-10 w-100 w-lg-700px mb-7 me-lg-10"
					style="margin-left: 20px; max-width:700px;">
					<!--begin::Thumbnail settings-->
					<div class="card card-flush py-4">
						<!--begin::Card header-->
						<div class="card-header">
							<!--begin::Card title-->
							<div class="card-title">
								<h2>결재라인</h2>
							</div>
							<!--end::Card title-->
						</div>
						<!--end::Card header-->
						<!--begin::Card body-->
						<div class="card-body text-center pt-0">
							<div class="table-responsive">
								<table class="table align-middle table-row-dashed fs-6 gy-5"
									id="kt_table_users">
									<tbody class="text-gray-600 fw-semibold">
										<c:if test="${not empty sanctionData and empty scDocVO}">
											<c:forEach var="scline" items="${sanctionData }">
												<tr>
													<td class="d-flex align-items-center">
														<div
															class="symbol symbol-circle symbol-50px overflow-hidden me-3">
															<div class="symbol-label">
																<img alt=""
																	src="${pageContext.request.contextPath }/resources/image/${scline.sanctnproflPhotoCours }"
																	class="w-100">
															</div>
														</div>
														<div class="d-flex flex-column">
															<a href="apps/user-management/users/view.html"
																class="text-gray-800 text-hover-primary mb-1">${scline.sanctnEmplNm }</a>
															<span>(${scline.sanctnofcpsCodeNm})</span>
														</div>
														<c:if test="${scline.sanctnSortate eq '결재' }">
															<th><span class="badge badge-primary">결재</span></th>
														</c:if>
														<c:if test="${scline.sanctnSortate eq '수신' }">
															<th><span class="badge" style="background-color: #ffcce8;">수신</span></th>
														</c:if>
														<c:if test="${scline.sanctnSortate eq '참조' }">
															<th><span class="badge" style="background-color: #20dbd0;">참조</span></th>
														</c:if>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${not empty scList}">
                    <c:forEach var="sanction" items="${scList}" varStatus="sanctionStatus">
                        <c:set var="employee" value="${sanction.emplList}" />   
                            <tr>
                                <td class="d-flex align-items-center">
                                    <div class="symbol symbol-circle symbol-50px overflow-hidden me-3">
                                        <div class="symbol-label">
                                            <img alt="" src="${pageContext.request.contextPath}/resources/image/${employee.proflPhotoCours}" class="w-100">
                                        </div>
                                    </div>
                                    <div class="d-flex flex-column">
                                        <a href="apps/user-management/users/view.html" class="text-gray-800 text-hover-primary mb-1">${employee.emplNm}</a>
                                        <span>(${employee.ofcpsCodeNm}, ${employee.rspofcCodeNm})</span>
                                    </div>
                                </td>
                                <td>
                                    <c:set var="common" value="${sanction.commList}" />      
                                        <c:if test="${common.cmmnCodeNm eq '결재대기'}">
                                            <span class="badge badge-primary">${common.cmmnCodeNm}</span>
                                        </c:if>
                                        <c:if test="${common.cmmnCodeNm eq '반려'}">
                                            <span class="badge badge-danger">${common.cmmnCodeNm}</span>
                                        </c:if>
                                        <c:if test="${common.cmmnCodeNm eq '결재진행중'}">
                                            <span class="badge badge-warning">${common.cmmnCodeNm}</span>
                                        </c:if>
                                        <c:if test="${common.cmmnCodeNm eq '결재완료'}">
                                            <span class="badge badge-success">${common.cmmnCodeNm}</span>
                                        </c:if>
                                </td>
                                <td>
                                    <c:set var="comment" value="${sanction.sanctnOpinion}" />
                                        <c:if test="${not empty comment}">
                                            <a href="#" class="btn btn-secondary btn-sm d-flex align-items-center" data-bs-toggle="modal" data-bs-target="#commentDT${sanctionStatus.index}${employeeStatus.index}${commentStatus.index}">
                                                <i class="bi bi-chat-square-text-fill"></i> 의견
                                            </a>
                                            <div class="modal fade" tabindex="-1" id="commentDT${sanctionStatus.index}">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h3 class="modal-title">등록된 의견</h3>
                                                            <div class="btn btn-icon btn-sm btn-active-light-primary ms-2" data-bs-dismiss="modal" aria-label="Close">
                                                                <i class="ki-duotone ki-cross fs-1"><span class="path1"></span><span class="path2"></span></i>
                                                            </div>
                                                        </div>
                                                        <div class="modal-body">
                                                            <table>
                                                                <thead>
                                                                    <tr>
                                                                        <th>
                                                                            <h4>의견등록자</h4>
                                                                        </th>
                                                                        <th colspan="10" style="text-align: center; padding-left:150px;">
                                                                            <h4>의견내용</h4>
                                                                        </th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="symbol symbol-circle symbol-50px overflow-hidden me-3">
                                                                                <div class="symbol-label">
                                                                                    <img alt="" src="${pageContext.request.contextPath}/resources/image/${employee.proflPhotoCours}" class="w-100">
                                                                                </div>
                                                                            </div>
                                                                            <div class="d-flex flex-column">
                                                                                <a href="apps/user-management/users/view.html" class="text-gray-800 text-hover-primary mb-1">${employee.emplNm}</a>
                                                                                <span>(${employee.ofcpsCodeNm}, ${employee.rspofcCodeNm})</span>
                                                                            </div>
                                                                        </td>
                                                                        <td colspan="10" style="text-align: center; padding-left:150px;">
                                                                            <p>${comment}</p>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-light" data-bs-dismiss="modal">닫기</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                </td>
                            </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${not empty scline }">
                	<c:forEach items="${scline[0].sclineDetailList }" var="notScEmpl">
						<tr>
                               <td class="d-flex align-items-center">
                                   <div class="symbol symbol-circle symbol-50px overflow-hidden me-3">
                                       <div class="symbol-label">
                                           <img alt="" src="${pageContext.request.contextPath}/resources/image/${notScEmpl.proflPhotoCours}" class="w-100">
                                       </div>
                                   </div>
                                   <div class="d-flex flex-column">
                                       <a href="apps/user-management/users/view.html" class="text-gray-800 text-hover-primary mb-1">${notScEmpl.emplNm}</a>
                                       <span>(${notScEmpl.ofcpsCode}, ${notScEmpl.rspofcCode})</span>
                                   </div>
                               </td>
                               <td>
                                   <c:set var="common2" value="${notScEmpl.sanctnSortate}" />
                                       <c:if test="${common2 eq '수신'}">
                                           <span class="badge" style="background-color: #ffcce8;">${common2}</span>
                                       </c:if>
                                       <c:if test="${common2 eq '참조'}">
                                           <span class="badge" style="background-color: #20dbd0;">${common2}</span>
                                       </c:if>
                               </td>
                           </tr>                	
                	</c:forEach>
                </c:if>
									</tbody>
								</table>
							</div>
							<!--end::Image input-->
							<!--begin::Description-->
							<!--end::Description-->
						</div>
						<!--end::Card body-->
					</div>
				</div>
				<!--end::Main column-->
			</form>
			<!--end::Form-->
		</div>
		<!--end::Content container-->
	</div>
	<!--end::Content-->
</div>

<input type="hidden" name="emplNo" value="${realUser.emplNo }" />
<input type="hidden" name="docRaisngNo"
	value="${sanctionData[0].docRaisngNo }" />
<input type="hidden" name="doorSign"
	value="${sanctionData[0].doorSign }" />
<input type="hidden" name="sanctnLineNo"
	value="${sanctionData[0].sanctnLineNo }" />
<input type="hidden" name="sanctnDocNo" value="${scDocVO.sanctnDocNo }">
<c:forEach var="scline" items="${sanctionData}">
	<input type="hidden" name="sanctnEmplNo" value="${scline.sanctnEmplNo}" />
	<input type="hidden" name="sanctnEmplNm" value="${scline.sanctnEmplNm}" />
	<input type="hidden" name="sanctnOrdr" value="${scline.sanctnOrdr}" />
	<input type="hidden" name="sanctnSortate" value="${scline.sanctnSortate}" />
	<input type="hidden" name="sanctnofcpsCodeNm"
		value="${scline.sanctnofcpsCodeNm}" />
	<input type="hidden" name="sanctnrspofcCodeNm"
		value="${scline.sanctnrspofcCodeNm}" />
	<input type="hidden" name="sanctnCtpntUrl"
		value="${scline.sanctnCtpntUrl}" />
</c:forEach>
<c:forEach items="${scDocVO.attchFileList }" var="attach">
	<input type="hidden" name="attachFileNm" value="${attach.fileNm }">
	<input type="hidden" name="attachSaveFileNm" value="${attach.saveFileNm }">
	<input type="hidden" name="attachFilePath" value="${attach.filePath }">
	<input type="hidden" name="attachFileSize" value="${attach.fileSize }">
</c:forEach>
<script src="${pageContext.request.contextPath }/resources/js/app/upload/fileUpload.js"></script>
<script>
    var scDocSanctnCn = `${scDocVO.sanctnCn}`;
</script>
<script>

const newBtn = document.querySelector('#kt_ecommerce_add_product_submit');
const updateBtn = document.querySelector('#kt_ecommerce_update');
const saveBtn = document.querySelector('#kt_ecommerce_save');
const updateSaveBtn = document.querySelector('#kt_update_save');
const QuickWriteBtn = document.querySelector('#QuickWrite');

document.addEventListener("DOMContentLoaded", () => {
	if(QuickWriteBtn)
		QuickWriteBtn.addEventListener('click', ()=>{
		    const sanctnSj = $('input[name="docName"]');
	    	sanctnSj.val('개발2팀과 홍보/마케팅팀간 협업 관련 회의록');
			const sanctnCn = `<figure class="table" style="width:100%;"><table class="ck-table-resized" style="border:1px solid #000000;"><colgroup><col style="width:62.56%;"><col style="width:9.36%;"><col style="width:9.36%;"><col style="width:9.36%;"><col style="width:9.36%;"></colgroup><tbody><tr><td style="border-bottom-style:hidden;border-left-style:hidden;border-right-color:#000000;border-right-style:solid;border-top-style:hidden;border-width:1px;height:22.8px;padding-left:0.8px;padding-right:0.8px;width:397.07px;" rowspan="2"><p style="text-align:center;"><a href="http://www.yesform.com/z_n/forms/search.php?mode=&amp;searchType=&amp;mrown=IT&amp;free_search=&amp;focus_count=0&amp;focus_cus=0&amp;focus_prev=0&amp;is_show_lvch=1&amp;skwid=&amp;q=%C8%B8%C0%C7%B7%CF"><span class="text-huge" style="color:#000000;"><strong>회의록</strong></span></a></p></td><td style="background-color:hsl(0, 0%, 90%);border-bottom-color:#a0a0a0;border-left-color:#000000;border-right-color:#a0a0a0;border-style:solid;border-top-color:#000000;border-width:1px;height:22.8px;padding-left:0.8px;padding-right:0.8px;width:59.67px;"><p style="text-align:center;"><span style="color:#000000;"><strong>담 &nbsp;당</strong></span></p></td><td style="background-color:hsl(0, 0%, 90%);border-bottom-color:#a0a0a0;border-left-color:#a0a0a0;border-right-color:#a0a0a0;border-style:solid;border-top-color:#000000;border-width:1px;height:22.8px;padding-left:0.8px;padding-right:0.8px;width:59.6px;"><p style="text-align:center;"><strong>검 토</strong></p></td><td style="background-color:hsl(0, 0%, 90%);border-bottom-color:#a0a0a0;border-left-color:#a0a0a0;border-right-color:#a0a0a0;border-style:solid;border-top-color:#000000;border-width:1px;height:22.8px;padding-left:0.8px;padding-right:0.8px;width:59.67px;"><p style="text-align:center;"><strong>검 토</strong></p></td><td style="background-color:hsl(0, 0%, 90%);border-bottom-color:#a0a0a0;border-left-color:#a0a0a0;border-right-color:#000000;border-style:solid;border-top-color:#000000;border-width:1px;height:22.8px;padding-left:0.8px;padding-right:0.8px;width:59.73px;"><p style="text-align:center;"><strong>승 인</strong></p></td></tr><tr><td style="border-bottom-color:#000000;border-left-color:#000000;border-right-color:#a0a0a0;border-style:solid;border-top-color:#a0a0a0;border-width:1px;height:53.07px;padding-left:0.8px;padding-right:0.8px;text-align:center;width:59.67px;" data-writer="2406123"><img class="image_resized" style="display: none; width: 45px;" src="/resources/image/sign/sign1718187572045.png"></td><td data-sanctn="style=&quot;border-bottom-color:#000000;border-left-color:#a0a0a0;border-right-color:#a0a0a0;border-style:solid;border-top-color:#a0a0a0;border-width:1px;height:53.07px;padding-left:0.8px;padding-right:0.8px;text-align:center;width:59.6px;&quot;"><img class="image_resized" style="display:none;width:45px;" src=""></td><td style="border-bottom-color:#000000;border-left-color:#a0a0a0;border-right-color:#a0a0a0;border-style:solid;border-top-color:#a0a0a0;border-width:1px;height:53.07px;padding-left:0.8px;padding-right:0.8px;text-align:center;width:59.67px;" data-sanctn="2406122"><img class="image_resized" style="display:none;width:45px;" src="/resources/image/sign/sign1718187239590.png"></td><td style="border-bottom-color:#000000;border-left-color:#a0a0a0;border-right-color:#000000;border-style:solid;border-top-color:#a0a0a0;border-width:1px;height:53.07px;padding-left:0.8px;padding-right:0.8px;text-align:center;width:59.73px;" data-sanctn="2406121"><img class="image_resized" style="display:none;width:45px;" src="/resources/image/sign/sign1718186968710.png"></td></tr></tbody></table></figure><p style="text-align:justify;">&nbsp;</p><figure class="table"><table style="border:1px solid #000000;"><tbody><tr><td style="background-color:hsl(0, 0%, 90%);border-bottom-color:#a0a0a0;border-left-color:#a0a0a0;border-right-color:#a0a0a0;border-style:solid;border-top-color:#000000;border-width:1px;height:30px;padding-left:0.8px;padding-right:0.8px;width:113.13px;"><p style="text-align:center;"><span style="color:#000000;"><strong>회의일자</strong></span></p></td><td style="border-bottom-color:#a0a0a0;border-left-color:#a0a0a0;border-right-color:#a0a0a0;border-style:solid;border-top-color:#000000;border-width:1px;height:30px;padding-left:0.8px;padding-right:0.8px;width:205.87px;"><span style="color:#000000;">&nbsp;2024년 06월 13일 (목요일)</span></td><td style="background-color:hsl(0, 0%, 90%);border-bottom-color:#a0a0a0;border-left-color:#a0a0a0;border-right-color:#a0a0a0;border-style:solid;border-top-color:#000000;border-width:1px;height:30px;padding-left:0.8px;padding-right:0.8px;width:114.53px;"><p style="text-align:center;"><span style="color:#000000;"><strong>회의시간</strong></span></p></td><td style="border-bottom-color:#a0a0a0;border-left-color:#a0a0a0;border-right-color:#a0a0a0;border-style:solid;border-top-color:#000000;border-width:1px;height:30px;padding-left:0.8px;padding-right:0.8px;width:207px;">&nbsp;14:00 ~ 15:30 (90분)&nbsp;</td></tr><tr><td style="background-color:hsl(0, 0%, 90%);border:1px solid #a0a0a0;height:30.07px;padding-left:0.8px;padding-right:0.8px;width:113.13px;"><p style="text-align:center;"><span style="color:#000000;"><strong>회의장소</strong></span></p></td><td style="border:1px solid #a0a0a0;height:30.07px;padding-left:0.8px;padding-right:0.8px;width:205.87px;">&nbsp;1층 소회의실</td><td style="background-color:hsl(0, 0%, 90%);border:1px solid #a0a0a0;height:30.07px;padding-left:0.8px;padding-right:0.8px;width:114.53px;"><p style="text-align:center;"><span style="color:#000000;"><strong>주 관 자</strong></span></p></td><td style="border:1px solid #a0a0a0;height:30.07px;padding-left:0.8px;padding-right:0.8px;width:207px;">&nbsp;김병수 수석</td></tr><tr><td style="background-color:hsl(0, 0%, 90%);border:1px solid #a0a0a0;height:30px;padding-left:0.8px;padding-right:0.8px;width:113.13px;"><p style="text-align:center;"><span style="color:#000000;"><strong>회의종류</strong></span></p></td><td style="border:1px solid #a0a0a0;height:30px;padding-left:0.8px;padding-right:0.8px;width:527.4px;" colspan="3"><span style="color:#000000;">&nbsp;□ 품평회 &nbsp;■ 사내일반 &nbsp;□ 경영검토 &nbsp;□ 기타 ( &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; )</span></td></tr><tr><td style="background-color:hsl(0, 0%, 90%);border:1px solid #a0a0a0;height:60.2px;padding-left:0.8px;padding-right:0.8px;width:113.13px;"><p style="text-align:center;"><span style="color:#000000;"><strong>참 석 자</strong></span></p></td><td style="border:1px solid #a0a0a0;height:60.2px;padding-left:0.8px;padding-right:0.8px;width:320.4px;" colspan="2">&nbsp;경영전략본부 : 최재림 상무<br>&nbsp;홍보/마케팅팀 : 정지훈 책임, 장용준 선임<br>&nbsp;개발2팀 : 김병수 수석, 권나라 사원, 차윤호 사원</td><td style="border:1px solid #a0a0a0;height:60.2px;padding-left:0.8px;padding-right:0.8px;width:207px;"><span style="color:#000000;">(참석인원 : &nbsp;6명)</span></td></tr><tr><td style="background-color:hsl(0, 0%, 90%);border:1px solid #a0a0a0;height:30px;padding-left:0.8px;padding-right:0.8px;width:113.13px;"><p style="text-align:center;"><span style="color:#000000;"><strong>회의제목</strong></span></p></td><td style="border:1px solid #a0a0a0;height:30px;padding-left:0.8px;padding-right:0.8px;width:527.4px;" colspan="3">&nbsp;팀간 협업 강화 및 PetCareCentral 프로젝트 업무 계획 논의</td></tr><tr><td style="background-color:hsl(0, 0%, 90%);border:1px solid #a0a0a0;height:30.07px;padding-left:0.8px;padding-right:0.8px;width:640.53px;" colspan="4"><p style="text-align:center;"><span style="color:#000000;"><strong>회의내용</strong></span></p></td></tr><tr><td style="border:1px solid #a0a0a0;height:339.73px;padding-left:0.8px;padding-right:0.8px;width:640.53px;" colspan="4"><p>&nbsp;▣ 회의 목적<br>&nbsp; &nbsp;1. 홍보/마케팅과 개발팀 간의 협업을 강화하고, PetCareCentral 프로젝트 업무 계획에 대한 논의 및 조정</p><p>&nbsp;▣ 회의 내용<br>&nbsp; &nbsp;1. 현재 협업 상황 분석<br>&nbsp; &nbsp; &nbsp;-. 홍보/마케팅과 개발2팀 간의 현재 협업 상황을 분석하고, 성과 및 개선점에 대해 토론 진행<br>&nbsp; &nbsp; &nbsp;-. 홍보/마케팅은 개발2팀의 업무 지원이 필요한 부분을 강조<br>&nbsp; &nbsp; &nbsp;-. 개발2팀은 홍보/마케팅과의 협업을 더욱 원활하게 하기 위한 방안을 제시</p><p>&nbsp; 2. PetCareCentral 프로젝트 및 업무 계획<br>&nbsp; &nbsp; &nbsp;-. 다가오는 프로모션 이벤트와 관련하여 홍보/마케팅팀은 마케팅 및 홍보 지원이 필요한 부분을 공유<br>&nbsp; &nbsp; &nbsp;-. 개발2팀은 해당 지원에 필요한 인력 및 자원을 조율하는 데에 협력<br>&nbsp; &nbsp; &nbsp;-. 개발2팀은 홍보/마케팅팀의 업무 효율성을 높이기 위한 프로세스 개선 제안<br>&nbsp; &nbsp; &nbsp;-. 홍보/마케팅팀은 해당 제안에 대해 협의하여 향후 업무 계획을 조정</p><p>&nbsp; 3. 기타 사항 및 향후 일정<br>&nbsp; &nbsp; &nbsp;-. 다음 협업 회의 일정을 조정하고, 각자의 역할과 책임에 대해 명확하게 진행<br>&nbsp; &nbsp; &nbsp;-. 개발2팀은 홍보/마케팅팀에 필요한 자료 및 지원 사항에 대한 요청을 접수 및 조치</p></td></tr><tr><td style="background-color:hsl(0, 0%, 90%);border:1px solid #a0a0a0;height:30.07px;padding-left:0.8px;padding-right:0.8px;width:640.53px;" colspan="4"><p style="text-align:center;"><span style="color:#000000;"><strong>회의결과</strong></span></p></td></tr><tr><td style="border-bottom-color:#000000;border-left-color:#a0a0a0;border-right-color:#a0a0a0;border-style:solid;border-top-color:#a0a0a0;border-width:1px;height:278.93px;padding-left:0.8px;padding-right:0.8px;width:640.53px;" colspan="4"><p>&nbsp; 1. 홍보/마케팅팀과 개발2팀은 강화된 협업을 통해 프로젝트의 성공적인 진행을 위해 노력할 것으로 합의</p><p><br>&nbsp; 2. 다음 회의까지 각 부서는 할 일을 수행하고 협업을 위한 조치를 취할 것으로 합의</p><p><br>&nbsp; 3. 다음 회의 일정 : 2024년 06월 17일 오후 2시</p></td></tr></tbody></table></figure>`
			editor.setData(sanctnCn);
		})
/* 	
	const attachFileList = [];
	$('input[name=attachFileNm]').each(function (index, element) {
	    const fileNm = $(element).val();
	    const saveFileNm = $('input[name=attachSaveFileNm]').eq(index).val();
	    const filePath = $('input[name=attachFilePath]').eq(index).val();
	    const fileSize = $('input[name=attachFileSize]').eq(index).val();

	    attachFileList.push({
	        fileNm: fileNm,
	        saveFileNm: saveFileNm,
	        filePath: filePath,
	        fileSize: fileSize
	    });

	    let mockFile = { name: fileNm, size: fileSize };
	    myDropzone.displayExistingFile(mockFile, filePath + '/' + saveFileNm);
	});
	 */
const dropzoneElement = document.querySelector("#kt_dropzonejs_example_3");
const myDropzone = Dropzone.forElement(dropzoneElement);
	const contextPath = `${contextPath}`;
    ClassicEditor
        .create(document.querySelector('#editor'), {
        	htmlSupport: {
        	    allow: [
        	        {
        	            name: /.*/,
        	            attributes: true,
        	            classes: true,
        	            styles: true
        	        }
        	    ]
        	},
            
            licenseKey: 'eU5USHA5OURMMVdUZE9LeFhNanYyVGZDTlNEZFZndzRVbGZwTThvRkVwdlFPRGZXRHZ3dUhnT056eXRMQmc9PS1NakF5TkRBMk1qST0='
        })
        .then(newEditor => {
            editor = newEditor;
            editor.config.allowedContent=true;
            
            if (scDocSanctnCn) {
                var sanctnCn = document.createElement("div");
                sanctnCn.innerHTML = `${scDocVO.sanctnCn}`;

                var dataWriterImg = sanctnCn.querySelector('[data-writer] img');
                if (dataWriterImg) {
                    dataWriterImg.style.display = "none";
                }

                var dataSanctnImgs = sanctnCn.querySelectorAll('[data-sanctn] img');
                dataSanctnImgs.forEach(function(img) {
                    img.style.display = "none";
                });

                var updatedSanctnCn = sanctnCn.innerHTML;
                editor.setData(updatedSanctnCn);
            }
        })
        .catch(error => {
            console.error(error);
        });

	if(newBtn){
	    newBtn.addEventListener('click', () => {
	    	const currentFileNames = myDropzone.files.map(file => file.name);
	    	
	    	const sanctionURL = $('input[name=sanctnCtpntUrl]').map(function() {
	    	    return $(this).val();
	    	}).get();
	    	const sanctnURLEmplNo = $('input[name=sanctnEmplNo]').map(function() {
	    	    return $(this).val();
	    	}).get();
	
	        let sanctnCn = editor.getData();
	        console.log("문서양식 : ", sanctnCn)
	        const userNo = `${realUser.emplNo}`
	        const parser = new DOMParser();
	        const doc = parser.parseFromString(sanctnCn, 'text/html');
	        const writer = doc.querySelector('td[data-writer]');
	        if (writer && writer.getAttribute('data-writer') === userNo) {
	            const img = writer.querySelector('img');
	            if (img) {
	                img.style.display = 'block'; 
	            }
	        }
	        const sanctnList = doc.querySelectorAll('td[data-sanctn]');
	        sanctnList.forEach(td => {
	            const dataSanctn = td.getAttribute('data-sanctn');
	            const index = sanctnURLEmplNo.indexOf(dataSanctn);
	            
	            if (index !== -1 && index < sanctionURL.length) {
	                const img = td.querySelector('img');
	                if (img) {
	//                     img.style.display = 'block'; // 이미지를 표시
	                    img.src = contextPath+"/resources/image/sign/"+sanctionURL[index]; // 이미지 src를 업데이트
	                }
	            }
	        });
	        const updatedSanctnCn = doc.body.innerHTML;
	        sanctnCn = updatedSanctnCn;
	        editor.setData(sanctnCn);
	        const drafterEmplNo = $('input[name=emplNo]').val();
	        const docRaisngNo = $('input[name=docRaisngNo]').val();
	        const docRaisngNm = $('input[name=doorSign]').val();
	        const sanctnSj = $('input[name=docName]').val();
	        const sanctnLineNo = $('input[name=sanctnLineNo]').val();
	        const sanctionDoc = {
	            drafterEmplNo: drafterEmplNo,
	            docRaisngNo: docRaisngNo,
	            sanctnSj: sanctnSj,
	            docRaisngNm: docRaisngNm,
	            sanctnCn: sanctnCn,
	            sanctnLineNo: sanctnLineNo
	        };
	        const sanction = [];
	        $('input[name=sanctnEmplNo]').each(function (index, element) {
	            sanction.push({
	                sanctnEmplNo: $(element).val(),
	                sanctnOrdr: $('input[name=sanctnOrdr]').eq(index).val(),
	                sanctnEmplNm: $('input[name=sanctnEmplNm]').eq(index).val(),
	                sanctnSortate: $('input[name=sanctnSortate]').eq(index).val(),
	                sanctnofcpsCodeNm: $('input[name=sanctnofcpsCodeNm]').eq(index).val(),
	                sanctnrspofcCodeNm: $('input[name=sanctnrspofcCodeNm]').eq(index).val()
	            });
	        });
	        const requestData = {
	            sanctionDoc: sanctionDoc,
	            sanction: sanction,
	            attach: currentFileNames,
	            attachTemp: uploadedFileList
	        };
			  
	        $.ajax({
	            url: '/sanctionDoc/new',
	            method: 'POST',
	            contentType: 'application/json',
	            data: JSON.stringify(requestData),
	            success: function (data) {
	                Swal.fire({
	                    text: "정상적으로 처리되었습니다.",
	                    icon: "success",
	                    buttonsStyling: false,
	                    confirmButtonText: "확인",
	                    customClass: {
	                        confirmButton: "btn btn-primary"
	                    }
	                }).then(() => {
	                     location.href = "/sanctionDoc/list";
	                });
	            }
	        });
	         
		});
	}
	if(updateBtn){
	    updateBtn.addEventListener('click', () => {
	    	const currentFileNames = myDropzone.files.map(file => file.name);
	    	
	        let sanctnCn = editor.getData();
	        const userNo = `${realUser.emplNo}`
	        const parser = new DOMParser();
	        const doc = parser.parseFromString(sanctnCn, 'text/html');
	        const writer = doc.querySelector('td[data-writer]');
	        if (writer && writer.getAttribute('data-writer') === userNo) {
	            const img = writer.querySelector('img');
	            if (img) {
	                img.style.display = 'block'; 
	            }
	        }
	        const updatedSanctnCn = doc.body.innerHTML;
	        sanctnCn = updatedSanctnCn;
	        editor.setData(sanctnCn);
// 	        console.log("sanctnCn : ", sanctnCn)
	        const sanctnDocNo = $('input[name=sanctnDocNo]').val();
	        const sanctnSj = $('input[name=docName]').val();
	        const sanctionDocVO = {
	            sanctnSj: sanctnSj,
	            sanctnCn: sanctnCn,
	            sanctnDocNo: sanctnDocNo
	        };
	        
	        const requestData = {
	     		sanctionDocVO : sanctionDocVO,
	     		attach: currentFileNames,
	            attachTemp: uploadedFileList
	        }
	        
	        $.ajax({
	            url: '/waitSanction/update',
	            method: 'PUT',
	            contentType: 'application/json',
	            data: JSON.stringify(requestData),
	            success: function (data) {
	                Swal.fire({
	                    text: "정상적으로 처리되었습니다.",
	                    icon: "success",
	                    buttonsStyling: false,
	                    confirmButtonText: "확인",
	                    customClass: {
	                        confirmButton: "btn btn-primary"
	                    }
	                }).then(() => {
	                    location.href = "/sanctionDoc/list";
	                });
	            }
	        });
	    });
	}
if(updateSaveBtn){
	updateSaveBtn.addEventListener('click', () => {
    	const currentFileNames = myDropzone.files.map(file => file.name);
		const sanctionURL = $('input[name=sanctnCtpntUrl]').map(function() {
    	    return $(this).val();
    	}).get();
    	const sanctnURLEmplNo = $('input[name=sanctnEmplNo]').map(function() {
    	    return $(this).val();
    	}).get();

        let sanctnCn = editor.getData();
        const userNo = `${realUser.emplNo}`
        const parser = new DOMParser();
        const doc = parser.parseFromString(sanctnCn, 'text/html');
        const writer = doc.querySelector('td[data-writer]');
        if (writer && writer.getAttribute('data-writer') === userNo) {
            const img = writer.querySelector('img');
            if (img) {
                img.style.display = 'block'; 
            }
        }
        const sanctnList = doc.querySelectorAll('td[data-sanctn]');
        sanctnList.forEach(td => {
            const dataSanctn = td.getAttribute('data-sanctn');
            const index = sanctnURLEmplNo.indexOf(dataSanctn);
            
            if (index !== -1 && index < sanctionURL.length) {
                const img = td.querySelector('img');
                if (img) {
//                     img.style.display = 'block'; // 이미지를 표시
                    img.src = contextPath+"/resources/image/sign/"+sanctionURL[index]; // 이미지 src를 업데이트
                }
            }
        });
        const updatedSanctnCn = doc.body.innerHTML;
        sanctnCn = updatedSanctnCn;
        editor.setData(sanctnCn);
        const sanctnDocNo = $('input[name=sanctnDocNo]').val();
        const sanctnSj = $('input[name=docName]').val();
        const sanctionDocVO = {
            sanctnSj: sanctnSj,
            sanctnCn: sanctnCn,
            sanctnDocNo: sanctnDocNo
        };
        $.ajax({
            url: '/waitSanction/updateSave',
            method: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(sanctionDocVO),
            success: function (data) {
                Swal.fire({
                    text: "정상적으로 처리되었습니다.",
                    icon: "success",
                    buttonsStyling: false,
                    confirmButtonText: "확인",
                    customClass: {
                        confirmButton: "btn btn-primary"
                    }
                }).then(() => {
                    location.href = "/sanctionList/saveDocument";
                });
            }
        });
    });
}
if(saveBtn){	
    saveBtn.addEventListener('click', () => {
    	const currentFileNames = myDropzone.files.map(file => file.name);
    	
    	const sanctionURL = $('input[name=sanctnCtpntUrl]').map(function() {
    	    return $(this).val();
    	}).get();
    	const sanctnURLEmplNo = $('input[name=sanctnEmplNo]').map(function() {
    	    return $(this).val();
    	}).get();

        let sanctnCn = editor.getData();
        const userNo = `${realUser.emplNo}`
        const parser = new DOMParser();
        const doc = parser.parseFromString(sanctnCn, 'text/html');
        const writer = doc.querySelector('td[data-writer]');
        if (writer && writer.getAttribute('data-writer') === userNo) {
            const img = writer.querySelector('img');
            if (img) {
                img.style.display = 'block'; 
            }
        }
        const sanctnList = doc.querySelectorAll('td[data-sanctn]');
        sanctnList.forEach(td => {
            const dataSanctn = td.getAttribute('data-sanctn');
            const index = sanctnURLEmplNo.indexOf(dataSanctn);
            
            if (index !== -1 && index < sanctionURL.length) {
                const img = td.querySelector('img');
                if (img) {
//                     img.style.display = 'block'; // 이미지를 표시
                    img.src = contextPath+"/resources/image/sign/"+sanctionURL[index]; // 이미지 src를 업데이트
                }
            }
        });
        const updatedSanctnCn = doc.body.innerHTML;
        sanctnCn = updatedSanctnCn;
        editor.setData(sanctnCn);
	    const drafterEmplNo = $('input[name=emplNo]').val();
	    const docRaisngNo = $('input[name=docRaisngNo]').val();
	    const docRaisngNm = $('input[name=doorSign]').val();
	    const sanctnSj = $('input[name=docName]').val();
	    const sanctnLineNo = $('input[name=sanctnLineNo]').val();
	    const sanctionDoc = {
	        drafterEmplNo: drafterEmplNo,
	        docRaisngNo: docRaisngNo,
	        sanctnSj: sanctnSj,
	        docRaisngNm: docRaisngNm,
	        sanctnCn: sanctnCn,
	        sanctnLineNo: sanctnLineNo
	    };
	    const sanction = [];
	    $('input[name=sanctnEmplNo]').each(function (index, element) {
	        sanction.push({
	            sanctnEmplNo: $(element).val(),
	            sanctnOrdr: $('input[name=sanctnOrdr]').eq(index).val(),
	            sanctnEmplNm: $('input[name=sanctnEmplNm]').eq(index).val(),
                sanctnSortate: $('input[name=sanctnSortate]').eq(index).val(),
	            sanctnofcpsCodeNm: $('input[name=sanctnofcpsCodeNm]').eq(index).val(),
	            sanctnrspofcCodeNm: $('input[name=sanctnrspofcCodeNm]').eq(index).val()
	        });
	    });
	    const requestData = {
	        sanctionDoc: sanctionDoc,
	        sanction: sanction,
            attach: currentFileNames,
            attachTemp: uploadedFileList
	    };
	
	    $.ajax({
	        url: '/sanctionDoc/save',
	        method: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify(requestData),
	        success: function (data) {
	            Swal.fire({
	                text: "정상적으로 처리되었습니다.",
	                icon: "success",
	                buttonsStyling: false,
	                confirmButtonText: "확인",
	                customClass: {
	                    confirmButton: "btn btn-primary"
	                }
	            }).then(() => {
	                location.href = "/sanctionList/saveDocument";
	            });
	        }
	    });
	});
}    

});
</script>
