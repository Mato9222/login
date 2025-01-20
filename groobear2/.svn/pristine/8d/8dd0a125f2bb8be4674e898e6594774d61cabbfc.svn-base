<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@	taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<security:authentication property="principal" var="emplNo" />
<!--begin::Modals-->
<!--begin::Modal - Upload File-->
<style>
    .jstree-clicked {
        background-color: #007bff !important;
        color: white !important;
    }
</style>
<div class="modal fade" id="kt_modal_upload" tabindex="-1" aria-hidden="true">
	<!--begin::Modal dialog-->
	<div class="modal-dialog modal-dialog-centered mw-650px">
		<!--begin::Modal content-->
		<div class="modal-content">
			<!--begin::Form-->
			<form class="form" action="none" id="kt_modal_upload_form">
				<!--begin::Modal header-->
				<div class="modal-header">
					<!--begin::Modal title-->
					<h2 class="fw-bold">파일 첨부</h2>
					<!--end::Modal title-->
					<!--begin::Close-->
					<div class="btn btn-icon btn-sm btn-active-icon-primary" data-bs-dismiss="modal">
						<i class="ki-duotone ki-cross fs-1">
							<span class="path1"></span>
							<span class="path2"></span>
						</i>
					</div>
					<!--end::Close-->
				</div>
				<!--end::Modal header-->
				<!--begin::Modal body-->
				<div class="modal-body pt-10 pb-15 px-lg-17">
					<!--begin::Input group-->
					<div class="form-group">
						<!--begin::Dropzone-->
						<div class="dropzone dropzone-queue mb-2" id="kt_modal_upload_dropzone">
							<!--begin::Controls-->
							<div class="dropzone-panel mb-4">
								<a class="dropzone-select btn btn-sm btn-primary me-2">파일 선택</a>
								<a class="dropzone-upload btn btn-sm btn-light-primary me-2">전부 업로드</a>
								<a class="dropzone-remove-all btn btn-sm btn-light-primary">전부 제거</a>
							</div>
							<!--end::Controls-->
							<!--begin::Items-->
							<div class="dropzone-items wm-200px">
								<div class="dropzone-item p-5" style="display:none">
									<!--begin::File-->
									<div class="dropzone-file">
										<div class="dropzone-filename text-gray-900" title="some_image_file_name.jpg">
											<span data-dz-name="">some_image_file_name.jpg</span>
											<strong>(
											<span data-dz-size="">340kb</span>)</strong>
										</div>
										<div class="dropzone-error mt-0" data-dz-errormessage=""></div>
									</div>
									<!--end::File-->
									<!--begin::Progress-->
									<div class="dropzone-progress">
										<div class="progress bg-gray-300">
											<div class="progress-bar bg-primary" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0" data-dz-uploadprogress=""></div>
										</div>
									</div>
									<!--end::Progress-->
									<!--begin::Toolbar-->
									<div class="dropzone-toolbar">
										<span class="dropzone-start">
											<i class="ki-duotone ki-to-right fs-1"></i>
										</span>
										<span class="dropzone-cancel" data-dz-remove="" style="display: none;">
											<i class="ki-duotone ki-cross fs-2">
												<span class="path1"></span>
												<span class="path2"></span>
											</i>
										</span>
										<span class="dropzone-delete" data-dz-remove="">
											<i class="ki-duotone ki-cross fs-2">
												<span class="path1"></span>
												<span class="path2"></span>
											</i>
										</span>
									</div>
									<!--end::Toolbar-->
								</div>
							</div>
							<!--end::Items-->
						</div>
						<!--end::Dropzone-->
						<!--begin::Hint-->
						<!--end::Hint-->
					</div>
					<!--end::Input group-->
				</div>
				<!--end::Modal body-->
			</form>
			<!--end::Form-->
		</div>
	</div>
</div>
<!--end::Modal - Upload File-->
<!--begin::Modal - Invite Friends-->
<div class="modal fade" id="kt_modal_invite_friends" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog mw-1200px" style="max-width: 1200px;">
        <div class="modal-content">
            <div class="modal-header pb-0 border-0 justify-content-end">
                <div class="btn btn-sm btn-icon btn-active-color-primary" data-bs-dismiss="modal">
                    <i class="ki-duotone ki-cross fs-1"> <span class="path1"></span> <span class="path2"></span> </i>
                </div>
            </div>
            <div class="container-fluid px-0">
                <div class="modal-body scroll-y pt-0 pb-3">
                    <div class="text-center mb-5">
                        <h1 class="mb-3">결재라인 등록</h1>
                    </div>
                    <div class="separator d-flex flex-center mb-8">
                        <span class="text-uppercase bg-body fs-7 fw-semibold text-muted px-3"></span>
                    </div>
                    <div class="mb-10">
                        <div class="row mb-3">
                            <div class="col-auto">
                                <input type="text" class="form-control form-control-solid" style="width:250px;" id="schName" placeholder="이름 또는 부서 입력" value="">
                            </div>
                            <div class="col-auto" style="margin-left: 3px;">
                                <button class="btn btn-primary" id="fSch">검색</button>
                            </div>
                        </div>
                        <div class="row gx-1">
                            <!-- 조직도 -->
                            <div class="col-md-3">
                                <div class="card">
                                    <div class="card-header border-0 pt-5">
                                        <h4 class="card-title align-items-start flex-column">조직도</h4>
                                    </div>
                                    <div class="card-body pt-0 scroll h-400px">
                                        <div id="kt_docs_jstree_contextual"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- 선택된 직원 -->
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="card-header border-0 pt-5">
                                        <h4 class="card-title align-items-start flex-column">선택된 직원</h4>
                                    </div>
                                    <div class="card-body pt-0 scroll h-400px" id="selectedEmployees">
                                        <!-- 직원 목록 -->
                                    </div>
                                </div>
                            </div>
                            <!-- 결재라인 리스트 -->
                            <div class="col-md-3">
                                <div class="card">
                                    <div class="card-header border-0 pt-5">
                                        <h4 class="card-title align-items-start flex-column">결재라인 리스트</h4>
                                    </div>
                                    <div class="card-body pt-0 scroll h-400px">
                                        <ul id="sclineList" class="list-group d-flex flex-wrap">
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex flex-center m-5">
                        <form id="sanctionForm" method="post" action="/scline">
                            <button type="button" class="btn btn-lg btn-primary me-5" id="submitSanctionLine">등록</button>
                            <button type="reset" id="closeBtn" class="btn btn-light me-5" data-bs-dismiss="modal">닫기</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--end::Modal - Invite Friend-->
<!--begin::Modal - New Sanction Process-->
<div class="modal fade" id="kt_modal_new_sanction" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog mw-1200px" style="max-width: 1200px;">
        <div class="modal-content">
            <div class="modal-header pb-0 border-0 justify-content-end">
                <div class="btn btn-sm btn-icon btn-active-color-primary" data-bs-dismiss="modal">
                    <i class="ki-duotone ki-cross fs-1"> <span class="path1"></span> <span class="path2"></span></i>
                </div>
            </div>
            <div class="container-fluid px-0">
                <div class="modal-body scroll-y pt-0 pb-3">
                    <div class="text-center mb-5">
                        <h1 class="mb-3">새 결재 진행</h1>
                    </div>
                    <div class="separator d-flex flex-center mb-8">
                        <span class="text-uppercase bg-body fs-7 fw-semibold text-muted px-3"></span>
                    </div>
                    <div class="mb-10">
                        <div class="row mb-3">
                            <div class="col-auto">
                            <input type="text" class="form-control form-control-solid" 
                                style="width:250px;" id="docName" placeholder="양식명 입력" value="">
                            </div>
                            <div class="col-auto" style="margin-left: 3px;">
                            	<button class="btn btn-primary" id="newSanctionFnSch">검색</button>
                            </div>
                        </div>
                        <div class="row gx-1">
                            <div class="col-md-3">
                                <div class="card">
                                    <div class="card-header border-0 pt-5">
                                    	<h4 class="card-title align-items-start flex-column">결재양식</h4>
                                    </div>
                                   	<div class="card-body pt-0 scroll h-400px" id="kt_docs_jstree_basic"></div>
                                </div>
								<div>
                                    <input type="hidden" class="form-control" id="selectDoc" name="selectDoc"/>
                                    <input type="hidden" id="selectDocCn">
                                    <input type="hidden" id="selectDocNo">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="card-header border-0 pt-5">
                                    	<h4 class="card-title align-items-start flex-column">결재라인 직원목록</h4>
                                    </div>
                                    <div class="card-body pt-0 scroll h-400px" id="selectedEmployees2" name="sclineList">
                                        <!-- 선택된 직원 목록 -->
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card">
                                    <div class="card-header border-0 pt-5">
                                        <h4 class="card-title align-items-start flex-column">내 결재라인</h4>
                                    </div>
                                    <div class="card-body pt-0 scroll h-400px">
                                        <ul id="sclineList2" class="list-group d-flex flex-wrap">
                                        </ul>
                                    </div>
                                </div>
                            </div>                         
                       </div>
                    </div>
                    <div class="d-flex flex-center m-5">
                        <button type="button" class="btn btn-lg btn-primary me-5" id="newSanctionBtn">확인</button>
                        <button type="reset" id="closeBtn2" class="btn btn-light me-5" data-bs-dismiss="modal">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--end::Modal - Invite Friend-->
<div class="modal fade" tabindex="-1" id="passwordAccess">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">비밀번호 인증</h3>

                <!--begin::Close-->
                <div class="btn btn-icon btn-sm btn-active-light-primary ms-2" data-bs-dismiss="modal" aria-label="Close">
                    <i class="ki-duotone ki-cross fs-1"><span class="path1"></span><span class="path2"></span></i>
                </div>
                <!--end::Close-->
            </div>

            <div class="modal-body">
               <input class="form-control form-control-lg form-control-solid"
                type="password" placeholder="비밀번호 입력" name="passwordAccess" autocomplete="off" />
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">닫기</button>
                <button type="button" id="passwordAccessBtn" class="btn btn-primary">인증</button>
            </div>
        </div>
    </div>
</div>
<!--end::Modals-->
<script src="${pageContext.request.contextPath }/resources/js/app/passwordAccess/passwordAccess.js" ></script>
<script src="${pageContext.request.contextPath }/resources/js/app/sanction/sanctionList.js" ></script>
<script src="${pageContext.request.contextPath }/resources/js/app/sanction/newSanction.js" ></script>
