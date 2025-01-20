<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--begin::Content wrapper-->
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
				<h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">마이 페이지</h1>
				<!--end::Title-->
			</div>
			<!--end::Page title-->
			<!--begin::Actions-->
			<div class="d-flex align-iz`tems-center gap-2 gap-lg-3">
				<!--begin::Filter menu-->
				<div class="m-0"></div>
				<!--end::Filter menu-->
			</div>
			<!--end::Actions-->
		</div>
		<!--end::Toolbar container-->
	</div>
	<!--end::Toolbar-->
	<!--begin::Content-->
	<div id="kt_app_content" class="app-content flex-column-fluid">
		<!--begin::Content container-->
		<div id="kt_app_content_container"
			class="app-container container-xxl">
			<!--begin::Navbar-->
			<div class="card mb-5 mb-xl-10">
				<div class="card-body pt-9 pb-0">
					<!--begin::Details-->
					<div class="d-flex flex-wrap flex-sm-nowrap">
						<!--begin: Pic-->
						<div class="me-7 mb-4">
							<div class="symbol symbol-100px symbol-lg-160px symbol-fixed position-relative">
								<img src="${pageContext.request.contextPath}/resources/image/${empl.proflPhotoCours}" alt="image" />
							</div>
						</div>
						<!--end::Pic-->
						<!--begin::Info-->
						<div class="flex-grow-1 mt-5">
							<!--begin::Title-->
							<div class="d-flex justify-content-between align-items-start flex-wrap mb-2">
								<!--begin::User-->
								<div class="d-flex flex-column">
									<!--begin::Name-->
									<div class="d-flex align-items-center mb-4">
										<a class="text-gray-900 text-hover-primary fs-2 fw-bold me-1 mb-3">${empl.emplNm}</a>
									</div>
									<!--end::Name-->
									<!--begin::Info-->
									<div class="d-flex flex-wrap fw-semibold fs-6 mb-3 pe-2">
										<a class="d-flex align-items-center text-gray-500 text-hover-primary me-5 mb-2">
											<i class="ki-duotone ki-data">
												<span class="path1"></span>
												<span class="path2"></span>
												<span class="path3"></span>
												<span class="path4"></span>
												<span class="path5"></span>
											</i>${empl.deptNm}
										</a>
										<a class="d-flex align-items-center text-gray-500 text-hover-primary me-5 mb-2">
											<i class="ki-duotone ki-profile-circle fs-4 me-1">
												<span class="path1"></span>
												<span class="path2"></span>
												<span class="path3"></span>
											</i>${empl.ofcpsCodeNm}
										</a>
									</div>
									<div class="d-flex flex-wrap fw-semibold fs-6 mb-3 pe-2">
										<a href="/mail/send" class="d-flex align-items-center text-gray-500 text-hover-primary mb-2">
											<i class="ki-duotone ki-sms fs-4">
												<span class="path1"></span>
												<span class="path2"></span>
											</i>${empl.emailAdres}
										</a>
									</div>
									<!--end::Info-->
								</div>
								<!--end::User-->
							</div>
							<!--end::Title-->
						</div>
						<div class="flex-grow-1 mt-5">
							<div class="row mb-7">
								<label class="col-lg-4 fw-semibold text-muted">입사일</label>
								<div class="col-lg-8">
									<span class="fw-bold fs-6 text-gray-800">${empl.encpnDe}</span>
								</div>
							</div>
							<div class="row mb-7">
								<label class="col-lg-4 fw-semibold text-muted">근속년수</label>
								<div class="col-lg-8">
									<span class="fw-bold fs-6 text-gray-800">${empl.cnwkYycnt}</span>
								</div>
							</div>
							<div class="row mb-7">
								<label class="col-lg-4 fw-semibold text-muted">내선번호</label>
								<div class="col-lg-8">
									<span class="fw-bold fs-6 text-gray-800">${empl.lxtnNo}</span>
								</div>
							</div>
						</div>
						<!--end::Info-->
					</div>
					<!--end::Details-->
					<!--begin::Navs-->
					<ul class="nav nav-stretch nav-line-tabs nav-line-tabs-2x border-transparent fs-5 fw-bold">
						<!--begin::Nav item-->
						<li class="nav-item mt-2">
							<a class="nav-link text-active-primary ms-0 me-10 py-5 active" href="${pageContext.request.contextPath}/mypage/settings">프로필 수정</a>
						</li>
						<!--end::Nav item-->
					</ul>
					<!--begin::Navs-->
				</div>
			</div>
			<!--end::Navbar-->
			<!--begin::Basic info-->
			<div class="card mb-5 mb-xl-10">
				<!--begin::Card header-->
				<div class="card-header border-0 cursor-pointer" role="button" data-bs-toggle="collapse" data-bs-target="#kt_account_profile_details" aria-expanded="true" aria-controls="kt_account_profile_details">
					<!--begin::Card title-->
					<div class="card-title m-0">
						<h3 class="fw-bold m-0">나의 정보</h3>
					</div>
					<!--end::Card title-->
				</div>
				<!--begin::Card header-->
				<!--begin::Content-->
				<div id="kt_account_settings_profile_details" class="collapse show">
					<!--begin::Form-->
					<form id="kt_account_profile_details_form" method="post" class="form" enctype="multipart/form-data" style="display : flex; flex-wrap : wrap;">
						<!--begin::Card body-->
						<div class="card-body border-top p-9" style="width: 50%">
							<!--begin::Input group-->
							<div class="row mb-6 d-flex" style="align-items: center;">
								<!--begin::Label-->
								<label class="col-lg-4 col-form-label fw-semibold fs-6">프로필 사진</label>
								<!--end::Label-->
								<!--begin::Col-->
								<div class="col-lg-8">
									<!--begin::Image input-->
									<div class="image-input image-input-outline" data-kt-image-input="true" style="background-image: url('assets/media/svg/avatars/blank.svg')">
										<!--begin::Preview existing avatar-->
										<div class="image-input-wrapper w-150px h-150px ms-18" style="background-image:url('${pageContext.request.contextPath}/resources/image/${empl.proflPhotoCours}')"></div>
										<!--end::Preview existing avatar-->
										<!--begin::Label-->
										<label class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow" data-kt-image-input-action="change" data-bs-toggle="tooltip" title="프로필 변경">
											<i class="ki-duotone ki-pencil fs-7">
												<span class="path1"></span>
												<span class="path2"></span>
											</i> 
											<!--begin::Inputs-->
											<input type="file" id="fileInput" name="avatar" accept=".png, .jpg, .jpeg" />
											<input type="hidden" name="avatar_remove" />
											<!--end::Inputs-->
										</label>
										<!--end::Label-->
										<!--begin::Cancel-->
										<span class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow" data-kt-image-input-action="cancel" data-bs-toggle="tooltip" title="취소">
											<i class="ki-duotone ki-cross fs-2">
												<span class="path1"></span>
												<span class="path2"></span>
											</i>
										</span>
										<!--end::Cancel-->
										<!--begin::Remove-->
										<span class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow" data-kt-image-input-action="remove" data-bs-toggle="tooltip" title="프로필 삭제">
											<i class="ki-duotone ki-cross fs-2">
												<span class="path1"></span>
												<span class="path2"></span>
											</i>
										</span>
										<!--end::Remove-->
									</div>
									<!--end::Image input-->
									<!--begin::Hint-->
									<div class="form-text ms-18">png, jpg, jpeg.</div>
									<!--end::Hint-->
								</div>
								<!--end::Col-->
							</div>
							<!--end::Input group-->
							<!--begin::Input group-->
							<div class="row mb-6">
								<!--begin::Label-->
								<label class="col-lg-4 col-form-label fw-semibold fs-6">이름</label>
								<!--end::Label-->
								<!--begin::Col-->
								<div class="col-lg-8 fv-row">
									<input type="text" name="name" class="form-control form-control-lg form-control-solid" placeholder="${empl.emplNm}" value="${empl.emplNm}" readonly />
								</div>
								<!--end::Col-->
							</div>
							<!--end::Input group-->
							<!--begin::Input group-->
							<div class="row mb-6">
								<!--begin::Label-->
								<label class="col-lg-4 col-form-label fw-semibold fs-6">부서</label>
								<!--end::Label-->
								<!--begin::Col-->
								<div class="col-lg-8 fv-row">
									<input type="text" name="department" class="form-control form-control-lg form-control-solid" placeholder="${empl.deptNm}" value="${empl.deptNm}" readonly />
								</div>
								<!--end::Col-->
							</div>
							<!--end::Input group-->
							<!--begin::Input group-->
							<div class="row mb-6">
								<!--begin::Label-->
								<label class="col-lg-4 col-form-label fw-semibold fs-6">직위</label>
								<!--end::Label-->
								<!--begin::Col-->
								<div class="col-lg-8 fv-row">
									<input type="text" name="rank" class="form-control form-control-lg form-control-solid" placeholder="${empl.ofcpsCodeNm}" value="${empl.ofcpsCodeNm}" readonly />
								</div>
								<!--end::Col-->
							</div>
							<!--end::Input group-->
							<!--begin::Input group-->
							<div class="row mb-6">
								<!--begin::Label-->
								<label class="col-lg-4 col-form-label fw-semibold fs-6">내선번호</label>
								<!--end::Label-->
								<!--begin::Col-->
								<div class="col-lg-8 fv-row">
									<input type="tel" name="lxtnNo" class="form-control form-control-lg form-control-solid" placeholder="${empl.lxtnNo}" value="${empl.lxtnNo}" />
								</div>
								<!--end::Col-->
							</div>
							<!--end::Input group-->
						</div>
						<div class="card-body border-top p-9" style="width: 50%">
							<!--begin::Input group-->
							<div class="row mt-12 mb-6">
								<!--begin::Label-->
								<label class="col-lg-4 col-form-label fw-semibold fs-6">이메일</label>
								<!--end::Label-->
								<!--begin::Col-->
								<div class="col-lg-8 fv-row">
									<input type="text" name="email" class="form-control form-control-lg form-control-solid" placeholder="${empl.emailAdres}" value="${empl.emailAdres}" />
								</div>
								<!--end::Col-->
							</div>
							<!--end::Input group-->
							<!--begin::Input group-->
							<div class="row mb-6">
								<!--begin::Label-->
								<label class="col-lg-4 col-form-label fw-semibold fs-6">
									<span class="required">휴대폰 번호</span>
								</label>
								<!--end::Label-->
								<!--begin::Col-->
								<div class="col-lg-8 fv-row fv-plugins-icon-container">
									<input type="tel" name="phone" class="form-control form-control-lg form-control-solid" placeholder="${empl.moblphonNo}" value="${empl.moblphonNo}" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required/>
									<div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
								</div>
								<!--end::Col-->
							</div>
							<!--end::Input group-->
							<!--begin::Input group-->
							<div class="row mb-6">
								<!--begin::Label-->
								<label class="col-lg-4 col-form-label required fw-semibold fs-6">우편 번호</label>
								<!--end::Label-->
								<!--begin::Col-->
								<div class="col-lg-8 fv-row fv-plugins-icon-container d-flex">
									<input type="number" name="zip" class="form-control form-control-lg form-control-solid" id="zip" style="width: 230px;" placeholder="${empl.zip}" value="${empl.zip}" required readonly />
									<button type="button" onclick="sample6_execDaumPostcode()" class="btn btn-primary ms-5 w-80px">찾기</button>
								</div>
								<!--end::Col-->
							</div>
							<!--end::Input group-->
							<!--begin::Input group-->
							<div class="row mb-6">
								<!--begin::Label-->
								<label class="col-lg-4 col-form-label required fw-semibold fs-6">지번 주소</label>
								<!--end::Label-->
								<!--begin::Col-->
								<div class="col-lg-8 fv-row fv-plugins-icon-container">
									<input type="text" name="bassAdres" class="form-control form-control-lg form-control-solid" id="bassAdres" placeholder="${empl.bassAdres}" value="${empl.bassAdres}" required readonly />
								</div>
								<!--end::Col-->
							</div>
							<!--end::Input group-->
							<!--begin::Input group-->
							<div class="row mb-6">
								<!--begin::Label-->
								<label class="col-lg-4 col-form-label required fw-semibold fs-6">상세 주소</label>
								<!--end::Label-->
								<!--begin::Col-->
								<div class="col-lg-8 fv-row fv-plugins-icon-container">
									<input type="text" name="detailAdres" class="form-control form-control-lg form-control-solid" id="detailAdres" placeholder="${empl.detailAdres}" value="${empl.detailAdres}" required />
								</div>
								<!--end::Col-->
							</div>
							<!--end::Input group-->
							<!--begin::Input group-->
							<div class="row mb-6">
								<!--begin::Label-->
								<label class="col-lg-4 col-form-label required fw-semibold fs-6">비상 연락처</label>
								<!--end::Label-->
								<!--begin::Col-->
								<div class="col-lg-8 fv-row fv-plugins-icon-container">
									<input type="tel" name="emgncContactNtwkNo" class="form-control form-control-lg form-control-solid" placeholder="${empl.emgncContactNtwkNo}" value="${empl.emgncContactNtwkNo}" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required/>
									<div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
								</div>
								<!--end::Col-->
							</div>
							<!--end::Input group-->
						</div>
						<!--end::Card body-->
						<!--begin::Actions-->
						<div class="card-footer d-flex justify-content-end py-6 px-9" style="width : 100%">
							<button type="button" class="btn btn-light btn-active-light-primary me-2" id="cancleSettings">취소</button>
							<button type="button" class="btn btn-primary" id="kt_account_profile_details_submit">저장</button>
						</div>
						<!--end::Actions-->
					</form>
					<!--end::Form-->
				</div>
				<!--end::Content-->
			</div>
			<!--end::Basic info-->
		</div>
		<!--end::Content container-->
	</div>
	<!--end::Content-->
</div>
<!--end::Content wrapper-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zip').value = data.zonecode;
                document.getElementById("bassAdres").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAdres").focus();
            }
        }).open();
    }
</script>