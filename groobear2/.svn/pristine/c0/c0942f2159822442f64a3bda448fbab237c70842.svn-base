<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="${pageContext.request.contextPath}/resources/js/signature_pad.min.js" type="text/javascript"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/js/app.js" type="text/javascript"></script> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/css.css">
<!--begin::Main-->
<div class="app-main flex-column flex-row-fluid" id="kt_app_main">
<security:authentication property="principal.realUser" var="realUser"/>
<c:set value="${emplPw}" var="emplPw" />
<input type="hidden" name="emplPw" value="${emplPw}" />
	<!--begin::Content wrapper-->
	<div class="d-flex flex-column flex-column-fluid">
		<!--begin::Toolbar-->
		<div id="kt_app_toolbar" class="app-toolbar py-3 py-lg-6">
			<!--begin::Toolbar container-->
			<div id="kt_app_toolbar_container" class="app-container container-xxl d-flex flex-stack">
				<!--begin::Page title-->
				<div class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
					<!--begin::Title-->
					<h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">전자 서명 설정</h1>
					<!--end::Title-->
					<!--begin::Breadcrumb-->
					<ul class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 my-0 pt-1">
						<!--begin::Item-->
						<li class="breadcrumb-item text-muted">
							<a href="index.html" class="text-muted text-hover-primary">메인</a>
						</li>
						<!--end::Item-->
						<!--begin::Item-->
						<li class="breadcrumb-item">
							<span class="bullet bg-gray-500 w-5px h-2px"></span>
						</li>
						<!--end::Item-->
						<!--begin::Item-->
						<li class="breadcrumb-item text-muted">전자 서명 설정</li>
						<!--end::Item-->
					</ul>
					<!--end::Breadcrumb-->
				</div>
				<!--end::Page title-->
				<!--begin::Actions-->
				<!--end::Actions-->
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
					<!--begin::Card body-->
					<div class="card-body">
						<!--begin:::Tabs-->
						<ul class="nav nav-tabs nav-line-tabs nav-line-tabs-2x border-transparent fs-4 fw-semibold mb-15">
							<!--begin:::Tab item-->
							<li class="nav-item">
								<a class="nav-link text-active-primary d-flex align-items-center pb-5 active" data-bs-toggle="tab" href="#kt_ecommerce_settings_general">
								<i class="ki-duotone ki-home fs-2 me-2"></i>전자서명</a>
							</li>
						</ul>
						<!--end:::Tabs-->
						<!--begin:::Tab content-->
						<div class="tab-content" id="myTabContent">
							<!--begin:::Tab pane-->
							<div class="tab-pane fade show active" id="kt_ecommerce_settings_general" role="tabpanel">
								<!--begin::Form-->
								<form id="kt_ecommerce_settings_general_form" class="form" action="#">
									<!--begin::Heading-->
									<div class="row mb-7">
										<div class="col-12 text-center">
											<h2>전자 서명 등록</h2>
										</div>
									</div>
									<!--end::Heading-->
								<div class="row fv-row mb-7">
								    <div class="col-md-6 d-flex flex-column align-items-center">
								        <!--begin::Label-->
								        <label class="fs-6 fw-bold form-label mt-3">
								            <span style="font-size: 15px;">서명 신규 등록</span>
								        </label>
								        <!--end::Label-->
								        <div id="signature-pad" class="m-signature-pad mt-3">
								            <div class="m-signature-pad--body">
								                <canvas></canvas>    
								            </div>
								            <div class="m-signature-pad--footer">
								                <div class="description">전자서명 입력</div>
								                <button type="button" class="btn btn-secondary btn-sm" data-action="clear">지우기</button>
								                <button type="button" class="btn btn-success btn-sm" style="float: right;" data-action="save">저장</button>
								            </div>
								        </div>
								    </div>
								    <div class="col-md-6 d-flex flex-column align-items-center">
								        <label class="fs-6 fw-bold form-label mt-3">
								            <span style="font-size: 15px;">현재 사용중인 서명</span>
								        </label>
								        <div class="mt-3" style="border: 1px solid #e8e8e8;">
								            <img id="signatureImage" src="${pageContext.request.contextPath}/resources/image/sign/${realUser.sanctnCtpntUrl}" style="width:400px; height:400px;"/>
								        </div>
								    </div>      
								</div>

									<!--begin::Action buttons-->
									<!--end::Action buttons-->
								</form>
								<!--end::Form-->
							</div>
							<!--end:::Tab pane-->
						</div>
						<!--end:::Tab content-->
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
</div>
<!--end:::Main-->
<script>
document.addEventListener("DOMContentLoaded", () => {
// 	var emplPw = document.querySelector('input[name="emplPw"]').value;
	var canvas = $("#signature-pad canvas")[0];
	var sign = new SignaturePad(canvas, {
		minWidth: 1,
		maxWidth: 5,
		penColor: "rgb(0, 0, 0)"
	});
	$("[data-action]").on("click", function(){
		if ( $(this).data("action")=="clear" ){
			sign.clear();			
		}
		else if ( $(this).data("action")=="save" ){
			if (sign.isEmpty()) {
			    Swal.fire({
			        text: "서명을 입력해 주세요",
			        icon: "error",
			        buttonsStyling: false,
			        confirmButtonText: "확인",
			        customClass: {
			            confirmButton: "btn btn-primary"
			        }
			    });
			} else {
// 				let formData = new FormData();
				const signURL = sign.toDataURL();
				console.log("사인 저장 데이터 : ", signURL);
// 				formData.append("signURL", signURL)
				$.ajax({
					url : "/sanctionSet/signURL",
					method : "POST",
					dataType : "json",
// 					contentType : false,
// 					processData : false,
// 					cache : false,
					data : {
						sign : sign.toDataURL(),
// 						emplPw : emplPw,
						_method : 'PUT'
					},
					success : function(r){
						var imageURL = "${pageContext.request.contextPath}/resources/image/sign/"+r.fileName;
						$("#signatureImage").attr("src", imageURL);
					    Swal.fire({
					        text: "정상 처리되었습니다.",
					        icon: "success",
					        buttonsStyling: false,
					        confirmButtonText: "확인",
					        customClass: {
					            confirmButton: "btn btn-primary"
					        }
					    })
						sign.clear();
					},
					error : function(res){
						console.log(res);
					}
				});
			}
		}
	})
	function resizeCanvas(){
		var canvas = $("#signature-pad canvas")[0];
		var ratio =  Math.max(window.devicePixelRatio || 1, 1);
		canvas.width = canvas.offsetWidth * ratio;
		canvas.height = canvas.offsetHeight * ratio;
		canvas.getContext("2d").scale(ratio, ratio);
	}
	$(window).on("resize", function(){
		resizeCanvas();
	});
	resizeCanvas();
})
</script>