
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<security:authentication property="principal.realUser" var="realUser"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/approval-form.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/dropzone.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.min.css">
<link href="${pageContext.request.contextPath }/resources/demo1/assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css"/>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/project/css/documents/docStyle.css"> --%>
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
		<div id="kt_app_toolbar_container" class="app-container container-xxl d-flex flex-stack">
			<!--begin::Page title-->
			<div class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
				<!--begin::Title-->
				<h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">결재 문서 조회</h1>
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
			<form id="kt_ecommerce_add_product_form" class="form d-flex flex-column flex-lg-row" action="/sanctionDoc/update" method="POST">
				<!--begin::Aside column-->
				
				<!--end::Aside column-->
				<!--begin::Main column-->
				<div class="d-flex flex-column flex-row-fluid gap-7 gap-lg-10" style="width:1400px;">
					<!--begin:::Tabs-->
					<!--end:::Tabs-->
					<!--begin::Tab content-->
					<div class="tab-content">
						<!--begin::Tab pane-->
						<div class="tab-pane fade show active" id="kt_ecommerce_add_product_general" role="tab-panel">
							<div class="d-flex flex-column gap-7 gap-lg-10">
								<!--begin::General options-->
								<div class="card card-flush py-4">
									<!--begin::Card header-->
									<div class="card-header">
										<!--begin::Card title-->
										<div class="card-title">
											<h2>기안 문서</h2>
										</div>
										<!--end::Card title-->
									</div>
									<!--end::Card header-->
									<!--begin::Card body-->
									<div class="card-body pt-0">
										<!--begin::Input group-->
										<div>
											<!--begin::Editor-->
											<div id="kt_ecommerce_add_product_description" name="kt_ecommerce_add_product_description" class="min-h-200px mb-2">
												<div id="editor">
												
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
            <!-- 파일첨부 시작이당~ -->
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

			<!--begin::Items-->
			<div class="dropzone-items wm-200px">
			<c:if test="${not empty scDocVO.attchFileList }">
				<c:forEach items="${scDocVO.attchFileList }" var="attachFile">
				<c:url value="/attach/${scDocVO.atchFileNo }/${attachFile.atchFileSeq }" var="downloadUrl"/>
                <div class="dropzone-item dz-processing dz-image-preview dz-complete" onclick="window.location.href='${downloadUrl}'">
			    	<i class="ki-duotone ki-folder-down">
						 <span class="path1"></span>
						 <span class="path2"></span>
					</i>&nbsp;	
					<!--begin::File-->
					<div class="dropzone-file">
					    <div class="dropzone-filename" title="${attachFile.fileNm }">
					        <span data-dz-name>${attachFile.fileNm }</span>
					        <strong>(<span data-dz-size>${attachFile.fileSizeContraction }</span>)</strong>
					    </div>
                	</div>
                </div>
				</c:forEach>
			</c:if>
			<c:if test="${empty scDocVO.attchFileList }">
                <div class="dropzone-item" style="background-color: white;">
				<!--begin::File-->
				<div class="">
				    <div class="dropzone-filename">
				        <span class="fw-semibold text-muted text-end me-3">첨부된 파일이 없습니다.</span>
				    </div>
				</div>
                </div>
            </c:if>
			</div>
                <!--end::Items-->
            </div>
            
            <!--end::Dropzone-->
        </div>
        <!--end::Col-->
    </div>
    <!--end::Input group-->
<!--end::Form-->
</div>								
<!-- 파일첨부 끝이당~ -->
							</div>
						</div>
					</div>
					<!--end::Tab content-->
					<div class="d-flex justify-content-end">
						<!--begin::Button-->
							<a href="javascript:void(0);" id="kt_ecommerce_add_product_cancel" class="btn btn-light me-5" onclick="history.back();">
							나가기
							<i class="ki-duotone ki-exit-right">
							 <span class="path1"></span>
							 <span class="path2"></span>
							</i>													
							</a>
						<security:authorize access="${realUser.emplNo eq scDocVO.drafterEmplNo }">
							<!--end::Button-->
							<!--begin::Button-->
							<security:authorize access="${scDocVO.lastSanctnSttusCode eq 'J01' || scDocVO.lastSanctnSttusCode eq 'J04'}">
							<button type="button" id="kt_ecommerce_delete" class="btn btn-danger">
								<span class="indicator-label">
								삭제
							<i class="ki-duotone ki-cross-circle">
							 <span class="path1"></span>
							 <span class="path2"></span>
							</i>													
								</span>
								<span class="indicator-progress">잠시만 기다려주세요.
								<span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
							</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
							 <input type="hidden" name="sanctnDocNo" value="${scDocVO.sanctnDocNo}">
							<button type=submit id="kt_ecommerce_update" class="btn btn-primary">
								<span class="indicator-label">
								수정
							<i class="ki-duotone ki-pencil">
							 <span class="path1"></span>
							 <span class="path2"></span>
							</i>													
								</span>
								<span class="indicator-progress">잠시만 기다려주세요.
								<span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
							</button>
							</security:authorize>
						</security:authorize>
						<c:forEach var="sanction" items="${scList}">
						    <c:set var="employee" value="${sanction.emplList}" />
						        <security:authorize access="${realUser.emplNo ne scDocVO.drafterEmplNo and realUser.emplNo eq employee.emplNo}">
									<div class="modal fade" tabindex="-1" id="commentModal">
									    <div class="modal-dialog">
									        <div class="modal-content">
									            <div class="modal-header">
									                <h3 class="modal-title">결재 의견</h3>
									
									                <!--begin::Close-->
									                <div class="btn btn-icon btn-sm btn-active-light-primary ms-2" data-bs-dismiss="modal" aria-label="Close">
									                    <i class="ki-duotone ki-cross fs-1"><span class="path1"></span><span class="path2"></span></i>
									                </div>
									                <!--end::Close-->
									            </div>
									
													<div class="rounded border d-flex flex-column p-10">
													    <textarea class="form-control" id="returnComment" data-kt-autosize="true"></textarea>
													</div>
									
									            <div class="modal-footer">
									                <button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
									                <button type="button" class="btn btn-primary">등록</button>
									            </div>
									        </div>
									    </div>
									</div>							            
						            <!--end::Button-->
						            <!--begin::Button-->
						  			  <c:set var="comm" value="${sanction.commList}" />						            
						                <security:authorize access="${comm.cmmnCode eq 'J01' and employee.emplNo eq realUser.emplNo}">
						                    <button type="button" id="kt_ecommerce_return" class="btn btn-danger">
						                        <span class="indicator-label">
						                            반려
						                            <i class="ki-duotone ki-cross-circle">
						                                <span class="path1"></span>
						                                <span class="path2"></span>
						                            </i>                                                    
						                        </span>
						                        <span class="indicator-progress">잠시만 기다려주세요.
						                            <span class="spinner-border spinner-border-sm align-middle ms-2"></span>
						                        </span>
						                    </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
						                    <button type="button" class="btn btn-success kt_ecommerce_sanction">
						                        <span class="indicator-label">
						                            결재
						                            <i class="ki-duotone ki-check-circle">
						                                <span class="path1"></span>
						                                <span class="path2"></span>
						                            </i>                                                    
						                        </span>
						                        <span class="indicator-progress">잠시만 기다려주세요.
						                            <span class="spinner-border spinner-border-sm align-middle ms-2"></span>
						                        </span>
						                    </button>                        
						                </security:authorize>
						        </security:authorize>
						</c:forEach>
						<!--end::Button-->
					</div>
				</div>
				<div class="d-flex flex-column gap-7 gap-lg-10 w-500 w-lg-700px mb-1 me-lg-10" style="margin-left:20px; max-width:700px;">
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
        <table class="table align-middle table-row-dashed fs-6 gy-5" id="kt_table_users">
            <tbody class="text-gray-600 fw-semibold">
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
                                            <a href="#" class="btn btn-secondary btn-sm d-flex align-items-center" data-bs-toggle="modal" data-bs-target="#commentDT${sanctionStatus.index}">
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
                
                <c:if test="${empty scList}">
                    <tr>
                        <td class="d-flex align-items-center">
                            <div>등록된 결재라인이 없습니다.</div>
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
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
<input type="hidden" name="sanctnDocNo" value="${scDocVO.sanctnDocNo }">
<script>
const deleteBtn = document.querySelector('#kt_ecommerce_delete');
// const updateBtn = document.querySelector('#kt_ecommerce_update');
const returnBtn = document.querySelector('#kt_ecommerce_return');

document.addEventListener("DOMContentLoaded", () => {
	
	ClassicEditor
    .create( document.querySelector( '#editor' ), {
    	toolbar: ['exportPdf'],
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
    } )
    .then(newEditor => {
    	editor = newEditor;
    	newEditor.setData('${scDocVO.sanctnCn }');
        const toolbarElement = editor.ui.view.toolbar.element;

        newEditor.on( 'change:isReadOnly', ( evt, propertyName, isReadOnly ) => {
            if ( isReadOnly ) {
                toolbarElement.style.display = 'none';
            } else {
                toolbarElement.style.display = 'flex';
            }
        });
        newEditor.enableReadOnlyMode( 'my-feature-id' );
        newEditor.isReadOnly;
    } )
    .catch( error => {
        console.log( error );
    } );	
	
if(deleteBtn){
    deleteBtn.addEventListener('click', () => {
    	const sanctnDocNo = $('input[name=sanctnDocNo]').val();
        $.ajax({
            url: '/waitSanction/delete',
            method: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify({ sanctnDocNo: sanctnDocNo }),
            success: function(data) {
                Swal.fire({
                    text: "정상적으로 삭제되었습니다.",
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
    })
}
/*
if (updateBtn) {
	updateBtn.addEventListener('click', () => {
	    const sanctnDocNo = $('input[name=sanctnDocNo]').val();
	    
	    $.ajax({
	        url: '/sanctionDoc/update',
	        method: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify({ sanctnDocNo: sanctnDocNo }),
	        success: function(data) {
	                location.href = "data";
	        }
	    });
	    
	});
}
*/
if (document.querySelectorAll('.kt_ecommerce_sanction')) {
    document.addEventListener('click', (e) => {
    	if(!e.target.classList.contains('kt_ecommerce_sanction')){
    		return false;
    	}
        const sanctnDocNo = $('input[name=sanctnDocNo]').val();
        let sanctnCn = editor.getData();
//         console.log("결재내용1 : ", sanctnCn)
        const userNo = `${realUser.emplNo}`
        const parser = new DOMParser();
        const doc = parser.parseFromString(sanctnCn, 'text/html');
        const sanctionTable = doc.querySelectorAll('td[data-sanctn]');
		sanctionTable.forEach(td => {
			if (td.getAttribute('data-sanctn') === userNo) {
				const img = td.querySelector('img');
				if (img) {
					img.style.display = 'block'; // 이미지를 표시
				}
			}
		});
        const updatedSanctnCn = doc.body.innerHTML;
        sanctnCn = updatedSanctnCn;		
//         console.log("결재내용2 : ", sancㅊtnCn)
        Swal.fire({
            text: "결재의견을 등록하시겠습니까?",
            icon: "info",
            showCancelButton: true,
            buttonsStyling: false,
            confirmButtonText: "예",
            cancelButtonText: "아니요",
            customClass: {
                confirmButton: "btn btn-primary",
                cancelButton: "btn btn-active-light"
            }
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: '결재 의견',
                    input: 'textarea',
                    inputPlaceholder: '의견 입력',
                    showCancelButton: true,
                    confirmButtonText: '제출',
                    cancelButtonText: '취소',
                    customClass: {
                        confirmButton: 'btn btn-primary',
                        cancelButton: 'btn btn-active-light'
                    }
                }).then((commentResult) => {
                    if (commentResult.isConfirmed) {
                        const comment = commentResult.value;
                        
                        const sanctionVO = {
                            sanctnDocNo: sanctnDocNo,
                            sanctnOpinion: comment,
                            sanctnCn: sanctnCn
                        };

                        $.ajax({
                            url: '/waitSanction/success',
                            method: 'PUT',
                            contentType: 'application/json',
                            data: JSON.stringify(sanctionVO),
                            success: function(data) {
                                Swal.fire({
                                    text: "결재 처리되었습니다.",
                                    icon: "success",
                                    buttonsStyling: false,
                                    confirmButtonText: "확인",
                                    customClass: {
                                        confirmButton: "btn btn-primary"
                                    }
                                }).then(() => {
                                    location.href = "/sanctionDoc/wait";
                                });
                            }
                        });
                    }
                });
            } else {
                // '아니요'를 눌렀을 때 바로 AJAX 실행
                 const sanctionVO = {
                     sanctnDocNo: sanctnDocNo,
                     sanctnCn: sanctnCn
                 };                
                
                $.ajax({
                    url: '/waitSanction/success',
                    method: 'PUT',
                    contentType: 'application/json',
                    data: JSON.stringify(sanctionVO),
                    success: function(data) {
                        Swal.fire({
                            text: "결재 처리되었습니다.",
                            icon: "success",
                            buttonsStyling: false,
                            confirmButtonText: "확인",
                            customClass: {
                                confirmButton: "btn btn-primary"
                            }
                        }).then(() => {
                            location.href = "/sanctionDoc/wait";
                        });
                    }
                });
            }
        });
    });
}

if(returnBtn){
	returnBtn.addEventListener('click', ()=>{
		const sanctnDocNo = $('input[name=sanctnDocNo]').val();
	    Swal.fire({
	        title: '반려 사유',
	        input: 'textarea',
	        inputPlaceholder: '사유 입력',
	        showCancelButton: true,
	        confirmButtonText: '제출',
	        cancelButtonText: '취소',
	        customClass: {
	            confirmButton: 'btn btn-primary',
	            cancelButton: 'btn btn-active-light'
	        }
	    }).then((commentResult) => {
	        if (commentResult.isConfirmed) {
	            const comment = commentResult.value;
	            
	            const sanctionVO = {
	                sanctnDocNo: sanctnDocNo,
	                sanctnOpinion: comment
	            };	
		 
	    $.ajax({
	        url: '/waitSanction/return',
	        method: 'PUT',
	        contentType: 'application/json',
	        data: JSON.stringify(sanctionVO),
	        success: function(data) {
	            Swal.fire({
	                text: "반려 처리되었습니다.",
	                icon: "success",
	                buttonsStyling: false,
	                confirmButtonText: "확인",
	                customClass: {
	                    confirmButton: "btn btn-primary"
	                }
	            }).then(() => {
	                location.href = "/sanctionDoc/wait";
	            });
	        }
	    });
		 
	}
	    })
	})
}
});
</script>