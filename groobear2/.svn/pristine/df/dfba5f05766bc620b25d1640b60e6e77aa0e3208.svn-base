<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!--begin::Main-->
<div class="app-main flex-column flex-row-fluid" id="kt_app_main">
	<!--begin::Content wrapper-->
	<div class="d-flex flex-column flex-column-fluid">
		<!--begin::Toolbar-->
		<div id="kt_app_toolbar" class="app-toolbar py-3 py-lg-6">
			<!--begin::Toolbar container-->
			<div id="kt_app_toolbar_container" class="app-container container-xxl d-flex flex-stack">
				<!--begin::Page title-->
				<div class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
					<!--begin::Title-->
					<h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">메일 쓰기</h1>
					<!--end::Title-->
					<!--begin::Breadcrumb-->
					<ul class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 my-0 pt-1">
						<!--begin::Item-->
						<li class="breadcrumb-item text-muted">
							<a href="/" class="text-muted text-hover-primary">Home</a>
						</li>
						<!--end::Item-->
						<!--begin::Item-->
						<li class="breadcrumb-item">
							<span class="bullet bg-gray-500 w-5px h-2px"></span>
						</li>
						<!--end::Item-->
						<!--begin::Item-->
						<li class="breadcrumb-item text-muted">
							<a href="/mail" class="text-muted text-hover-primary">받은메일함</a>
						</li>
						<!--end::Item-->
					</ul>
					<!--end::Breadcrumb-->
				</div>
				<!--end::Page title-->
				<!--begin::Actions-->
				<div class="d-flex align-items-center gap-2 gap-lg-3">
					<!--begin:: 이걸로 주소록 불러오기가 될까-->
<!-- 					<button onclick="wOpen()" class="btn btn-sm fw-bold btn-primary openEmp">주소록</button> -->
					<button class="btn btn-sm fw-bold btn-primary adrss" onclick="setChildText()">주소록</button>
<!-- 					<a href="#" class="btn btn-sm fw-bold btn-primary openEmp">주소록?</a> 이거 지워 ?-->
					<!--end::Primary button-->
				</div>
				<!--end::Actions-->
			</div>
			<!--end::Toolbar container-->
		</div>
		<!--end::Toolbar-->
		<!--begin::Content-->
		<div id="kt_app_content" class="app-content flex-column-fluid">
			<!--begin::Content container-->
			<div id="kt_app_content_container" class="app-container container-xxl">
<!-- 사이드바 넣을자리 					begin::Sidebar -->
				<!--end::Sidebar-->
				<!--begin::Content-->
				<div class="flex-lg-row-fluid ms-lg-7 ms-xl-10">
					<!--begin::Card-->
					<div class="card">
						<div class="card-body p-0">
							<!--begin::Form-->
							<form id="kt_inbox_compose_form" method="post" action="/mail/send" enctype="multipart/form-data">
								<!--begin::Body-->
								<div class="d-block">
									<!--begin::받는사람-->
									<div class="d-flex align-items-center border-bottom px-8 min-h-50px">
										<!--begin::Label-->
										<div class="text-gray-900 w-75px">받는사람</div>
										<!--end::Label-->
										<!--begin::Input-->
										<input type="text" id="pRec" name="realMail" class="form-control form-control-transparent border-0 " value="${mail.emp[0].emplNm }(${mail.ofcpsCodeNm})" data-kt-inbox-form="tagify" />
										<input type="hidden" id="emplHidden" name="rec_to" value="${mail.emplNo }"/>
										<!--end::Input-->
									</div>
									<!--end::받는사람-->
									<!--begin::참조-->
									<div class="d-flex align-items-center border-bottom px-8 min-h-50px">
										<!--begin::Label-->
										<div class="text-gray-900 w-75px">참조</div>
										<!--end::Label-->
										<!--begin::Input-->
										<input type="text" id="pCc" class="form-control form-control-transparent border-0" id="ccPeople" value="" data-kt-inbox-form="tagify" />
										<input type="hidden" id="ccHidden" name="ref_to" />
										<!--end::Input-->
									</div>
									<!--end::참조-->
									<!--begin::제목-->
									<div class="border-bottom ">
										<input class="form-control form-control-transparent border-0 px-8 min-h-45px" name="subject" value="RE:${mail.emailSj }" placeholder="제목" />
									</div>
									<!--end::제목-->
									<!--begin::내용-->
									<div id="kt_inbox_form_editor" class="d-flex align-items-center border-bottom px-8 min-h-50px">
										<textarea class="d-flex align-items-center border-bottom px-8 min-h-50px form-control form-control-transparent border-0 px-8 min-h-45px" name="content" rows="15" data-kt-element="input" placeholder="내용">




---------원본 메일---------
보낸 사람 : ${mail.emp[0].emplNm }(${mail.com[0].cmmnCodeNm })
제목 : ${mail.emailSj }
내용 : ${mail.emailCn }</textarea>
									</div>
									<!--end::내용-->
									<!--begin::첨부파일 버릴까 고민중-->
									<div class="border-bottom dropzone dropzone-queue px-8 py-4" id="kt_inbox_reply_attachments" data-kt-inbox-form="dropzone">
<!-- 										<input type="file"> -->
											<input type="file" class="wf-content-area drop-zone form-controll" name="mailFile" multiple />
									</div>
									<!--end:: 첨부파일 -->
								</div>
								<!--end::Body-->
								<!--begin::Footer-->
								<div class="d-flex flex-stack flex-wrap gap-2 py-5 ps-8 pe-5 border-top">
									<!--begin::Actions-->
									<div class="d-flex align-items-center me-3">
										<!--begin::Send-->
										<div class="me-4">
											<!--begin::Submit-->
											<span class="btn btn-primary fs-bold px-6 indicator-label send">보내기</span>
											<span class="indicator-progress">Please wait... 
											<span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
											<!--end::Submit-->
										</div>
										<div class="me-4">
											<!--begin::Submit-->
											<span class="btn btn-primary fs-bold px-6 indicator-label temp">임시 저장</span>
											<span class="indicator-progress">Please wait... 
											<span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
<!-- 											</span> -->
											<!--end::Submit-->
										</div>
										<!--end::Send-->
										<!--begin::첨부파일 업로드 -->
<!-- 										<span class="btn btn-icon btn-sm btn-clean btn-active-light-primary me-2" id="kt_inbox_reply_attachments_select" data-kt-inbox-form="dropzone_upload"> -->
<!-- 											<input type="file"> -->
<!-- 											<input type="file" class="ki-duotone ki-paper-clip fs-2 m-0"  /> -->
<!-- 											<i class="ki-duotone ki-paper-clip fs-2 m-0"></i> -->
<!-- 										</span> -->
										<!--end::Upload attachement-->
										<!--begin::지도 ? 뭐지 지워버려 ? -->
<!-- 										<span class="btn btn-icon btn-sm btn-clean btn-active-light-primary" title="얘는 뭐야"> -->
<!-- 											<i class="ki-duotone ki-geolocation fs-2 m-0"> -->
<!-- 												<span class="path1"></span> -->
<!-- 												<span class="path2"></span> -->
<!-- 											</i> -->
<!-- 										</span> -->
										<!--end::Pin-->
									</div>
									<!--end::Actions-->
									<!--begin::Toolbar-->
									<div class="d-flex align-items-center">
										<!--begin::More actions-->
										<span class="btn btn-icon btn-sm btn-clean btn-active-light-primary me-2" data-toggle="tooltip" title="설정인데 뭐쓰지 여따가">
											<i class="ki-duotone ki-setting-2 fs-2">
												<span class="path1"></span>
												<span class="path2"></span>
											</i>
										</span>
										<!--end::More actions-->
									</div>
									<!--end::Toolbar-->
								</div>
								<!--end::Footer-->
							</form>
							<!--end::Form-->
						</div>
					</div>
					<!--end::Card-->
				</div>
				<!--end::Content-->
			</div>
			<!--end::Inbox App - Compose -->
		</div>
		<!--end::Content container-->
	</div>
	<!--end::Content-->
</div>
<!--end::Content wrapper-->

<script>
// var popup;

// function setChildText() {

// }
 
document.addEventListener("DOMContentLoaded", () => {
	$(".adrss").on("click", function(e) {
		e.preventDefault();
		
		var popup = window.open("/adrs","주소록",'width=900px,height=800px');
		
		let emplHidden = $("#emplHidden").val();
		let emplValue = $("#pRec").val();
		
		let ccHidden = $("#ccHidden").val();
		let ccValue = $("#pCc").val();
		
		popup.onload = function() {
			popup.postMessage({ emplHidden: emplHidden, emplValue: emplValue , ccHidden: ccHidden, ccValue: ccValue }, window.location.origin);
		}
	})
	
	$(".send").on("click", function(e) {
		let frmData = new FormData();

		let realMail = $('input[name=realMail]').val(); // 받는사람
		let rec = $('input[name=rec_to]').val(); // 받는사람
		let ref = $('input[name=ref_to]').val(); // 참조
		let title = $('input[name=subject]').val(); // 제목
		let content = $('textarea[name=content]').val(); // 내용
		let tbAttachFile = $('input[name=mailFile]')[0].files; // 첨부파일
		
// 		let mailData;

// 		mailData = {
// 			realMail : realMail,
// 			recptnEmailAdres : rec,
// 			refrn : ref,
// 			emailSj : title,
// 			emailCn : content,
// 			atchFileNo : att
// 		}

		frmData.append("recptnEmailAdres", rec );
		frmData.append("refrn", ref);            
		frmData.append("emailSj", title);          
		frmData.append("emailCn", content);      
		for (let id=0; id< tbAttachFile.length; id++) {
			frmData.append("tbAttachFile", tbAttachFile[id]);   
		}	
		
		$.ajax({
			url : "/mail/send"
			, data : frmData
			, method : "post"
			, contentType : false
			, processData : false
			, success : function(res) {
				if(res == "success") {
					alert("메일발송이 완료되었습니다!");
					location.href="/mail/sendMailList";
				}
			}
		})
	})
	
	$(".temp").on("click", function(e) {
		let rec = $('input[name=rec_to]').val(); // 받는사람
		let ref = $('input[name=ref_to]').val(); // 참조
		let title = $('input[name=subject]').val(); // 제목
		let content = $('textarea[name=content]').val(); // 내용
	// 	let ncard ; // 명함
	// 	let att ; // 첨부파일
		
		// DB컬럼명 : 변수명
		let mailData = {
			recptnEmailAdres : rec,
			refrn : ref, 
			emailSj : title,
			emailCn : content
		}
		
		console.log(mailData);
		
		$.ajax({
			url : "/mail/temp"
			, data : JSON.stringify(mailData)
			, method : "post"
			, dataType : "text"
			, contentType : "application/json; charset=utf-8" 
			, success : function(res) {
				if(res == "success") {
					location.href="/mail";
				} 
			}
		})
	})
	
})
</script>
