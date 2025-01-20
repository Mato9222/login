<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type = "text/css">
	.select2.select2-container.select2-container--bootstrap5{
		width : 66% !important;
	}
</style>
<!--begin::Content-->
<div id="employee_insert_div" class="collapse show">
	<!--begin::Form-->
	<form id="employee_insert_form" method="post" class="form" style="display : flex; flex-wrap : wrap;">
		<!--begin::Card body-->
		<div class="card-body border-top p-9" style="width : 50%">
			<!--begin::Input group-->
			<div class="row mb-6"  style="display : flex; align-items : center;">
				<!--begin::Label-->
				<label class="col-lg-3 col-form-label fw-semibold fs-6">프로필 사진</label>
				<!--end::Label-->
				<!--begin::Col-->
				<div class="col-lg-3">
					<!--begin::Image input-->
					<div class="image-input image-input-outline" data-kt-image-input="true" style="background-image: url('assets/media/svg/avatars/blank.svg')">
						<!--begin::Preview existing avatar-->
						<div class="image-input-wrapper w-200px h-200px ms-15" style="background-image:url('${pageContext.request.contextPath}/resources/image/${empl.proflPhotoCours}')"></div>
						<!--end::Preview existing avatar-->
						<!--begin::Label-->
						<label class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow" data-kt-image-input-action="change" data-bs-toggle="tooltip" title="프로필 등록">
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
					<div class="form-text ms-16 w-150px">png, jpg, jpeg.</div>
					<!--end::Hint-->
				</div>
				<!--end::Col-->
			</div>
			<!--end::Input group-->
			<!--begin::Input group-->
			<div class="row mb-6">
				<!--begin::Label-->
				<label class="col-lg-3 col-form-label fw-semibold fs-6">부서</label>
				<!--end::Label-->
				<!--begin::Col-->
				<div class="d-flex col-lg-8 fv-row">
					<input type="text" name="employee_departmentNm" class="form-control form-control-lg form-control-solid w-250px me-5" placeholder="부서" value="" required readonly/>
					<input type="hidden" name="employee_department" value="" required readonly/>
					<button class="btn btn-info" id="selectDepartment">선택</button>
				</div>
				<!--end::Col-->
			</div>
			<!--end::Input group-->
			<!--begin::Input group-->
			<div class="row mb-6">
				<label class="col-lg-3 col-form-label fw-semibold fs-6">직위</label>
				<select class="form-select form-select-solid fw-bold" name="employee_rank" data-kt-select2="true" data-placeholder="직위 선택" data-allow-clear="true" data-kt-user-table-filter="role" data-hide-search="true" required>
					<option value></option>
					<c:forEach var="commonOfcpsList" items="${commonOfcpsList}">
						<option value="${commonOfcpsList.cmmnCode}">${commonOfcpsList.cmmnCodeNm}</option>
					</c:forEach>
				</select>
			</div>
			<!--end::Input group-->
			<!--begin::Input group-->
			<div class="row mb-6">
				<label class="col-lg-3 col-form-label fw-semibold fs-6">직책</label>
				<select class="form-select form-select-solid fw-bold" name="employee_rspofc" data-kt-select2="true" data-placeholder="직책 선택" data-allow-clear="true" data-kt-user-table-filter="role" data-hide-search="true" required>
					<option value></option>
					<c:forEach var="commonRspofcList" items="${commonRspofcList}">
						<option value="${commonRspofcList.cmmnCode}">${commonRspofcList.cmmnCodeNm}</option>
					</c:forEach>
				</select>
			</div>
			<!--end::Input group-->
			<!--begin::Input group-->
			<div class="row mb-6">
				<!--begin::Label-->
				<label class="col-lg-3 col-form-label fw-semibold fs-6">내선번호</label>
				<!--end::Label-->
				<!--begin::Col-->
				<div class="col-lg-8 fv-row fv-plugins-icon-container">
					<input type="tel" name="employee_lxtnNo" class="form-control form-control-lg form-control-solid" placeholder="***" value="" pattern="[0-9]{3}" title="(예 : 123)" required/>
					<div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
				</div>
				<!--end::Col-->
			</div>
			<!--end::Input group-->
			<!--begin::Input group-->
			<div class="row mb-6">
				<!--begin::Label-->
				<label class="col-lg-3 col-form-label fw-semibold fs-6">이메일</label>
				<!--end::Label-->
				<!--begin::Col-->
				<div class="col-lg-8 fv-row">
					<input type="email" name="employee_email" class="form-control form-control-lg form-control-solid" placeholder="이메일" value="" required/>
				</div>
				<!--end::Col-->
			</div>
			<!--end::Input group-->
			<!--begin::Input group-->
			<div class="row mb-6">
				<!--begin::Label-->
				<label class="col-lg-3 col-form-label fw-semibold fs-6">입사일</label>
				<!--end::Label-->
				<!--begin::Col-->
				<div class="col-lg-8 fv-row">
					<input class="form-control form-control-lg form-control-solid" placeholder="입사일" id="employee_encpnDe" required/>
				</div>
				<!--end::Col-->
			</div>
			<!--end::Input group-->
		</div>
		<div class="card-body border-top p-9" style="width : 50%">
			<!--begin::Input group-->
			<div class="row mb-6">
				<!--begin::Label-->
				<label class="col-lg-3 col-form-label fw-semibold fs-6">이름</label>
				<!--end::Label-->
				<!--begin::Col-->
				<div class="col-lg-8 fv-row">
					<input type="text" name="employee_name" class="form-control form-control-lg form-control-solid" placeholder="이름" value="" required/>
				</div>
				<!--end::Col-->
			</div>
			<!--end::Input group-->
			<!--begin::Input group-->
			<div class="row mb-6">
				<!--begin::Label-->
				<label class="col-lg-3 col-form-label fw-semibold fs-6">아이디</label>
				<!--end::Label-->
				<!--begin::Col-->
				<div class="col-lg-8 fv-row">
					<input type="text" name="employee_id" class="form-control form-control-lg form-control-solid" placeholder="아이디" value="" required/>
				</div>
				<!--end::Col-->
			</div>
			<!--end::Input group-->
			<!--begin::Input group-->
			<div class="row mb-6">
				<!--begin::Label-->
				<label class="col-lg-3 col-form-label fw-semibold fs-6">비밀번호</label>
				<!--end::Label-->
				<!--begin::Col-->
				<div class="col-lg-8 fv-row">
					<input type="password" name="employee_passowrd" class="form-control form-control-lg form-control-solid" placeholder="비밀번호" value="" required/>
				</div>
				<!--end::Col-->
			</div>
			<!--end::Input group-->
			<!--begin::Input group-->
			<div class="row mb-6">
				<!--begin::Label-->
				<label class="col-lg-3 col-form-label fw-semibold fs-6">주민등록번호</label>
				<!--end::Label-->
				<!--begin::Col-->
				<div class="col-lg-8 fv-row">
					<input type="text" name="employee_ihidnum" class="form-control form-control-lg form-control-solid" placeholder="******-*******" value="" pattern="[0-9]{6}-[0-9]{7}" required/>
				</div>
				<!--end::Col-->
			</div>
			<!--end::Input group-->
			<!--begin::Input group-->
			<div class="d-flex col mb-6">
				<!--begin::Label-->
				<label class="col-lg-3 col-form-label fw-semibold fs-6">성별</label>
				<!--end::Label-->
				<!--begin::Roles-->
				<!--begin::Input row-->
				<c:forEach var="commonCmmnList" items="${commonCmmnList}" varStatus="status">
					<div class="d-flex fv-col">
						<!--begin::Radio-->
						<div class="form-check form-check-custom form-check-solid">
							<!--begin::Input-->
							<input class="form-check-input me-3" name="employee_cmmnCode" type="radio" value="${commonCmmnList.cmmnCode}" id="${commonCmmnList.cmmnCode}"/>
							<!--end::Input-->
							<!--begin::Label-->
							<label class="form-check-label" for="${commonCmmnList.cmmnCode}">
								<div class="fw-bold text-gray-800 me-10">${commonCmmnList.cmmnCodeNm}</div>
							</label>
							<!--end::Label-->
						</div>
						<!--end::Radio-->
					</div>
					<!--end::Input row-->
				</c:forEach>
				<!--end::Roles-->
			</div>
			<!--end::Input group-->
			<!--begin::Input group-->
			<div class="row mb-6">
				<!--begin::Label-->
				<label class="col-lg-3 col-form-label fw-semibold fs-6">휴대폰 번호</label>
				<!--end::Label-->
				<!--begin::Col-->
				<div class="col-lg-8 fv-row fv-plugins-icon-container">
					<input type="tel" name="employee_phone" class="form-control form-control-lg form-control-solid" placeholder="***-****-****" value="" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" title="(예 : 010-1234-5678)" required/>
					<div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
				</div>
				<!--end::Col-->
			</div>
			<!--end::Input group-->
			<!--begin::Input group-->
			<div class="row mb-6">
				<!--begin::Label-->
				<label class="col-lg-3 col-form-label fw-semibold fs-6">비상 연락처</label>
				<!--end::Label-->
				<!--begin::Col-->
				<div class="col-lg-8 fv-row fv-plugins-icon-container">
					<input type="tel" name="employee_emgncContactNtwkNo" class="form-control form-control-lg form-control-solid" placeholder="***-****-****" value="" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" title="(예 : 010-1234-5678)" required/>
					<div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
				</div>
				<!--end::Col-->
			</div>
			<!--end::Input group-->
			<!--begin::Input group-->
			<div class="row mb-6">
				<!--begin::Label-->
				<label class="col-lg-3 col-form-label fw-semibold fs-6">우편번호</label>
				<!--end::Label-->
				<!--begin::Col-->
				<div class="col-lg-8 fv-row fv-plugins-icon-container d-flex">
					<input type="number" name="employee_zip" class="form-control form-control-lg form-control-solid" id="zip" placeholder="우편번호" value="" required readonly />
					<button type="button" onclick="sample6_execDaumPostcode()" class="btn btn-primary ms-5 w-80px">찾기</button>
				</div>
				<!--end::Col-->
			</div>
			<!--end::Input group-->
			<!--begin::Input group-->
			<div class="row mb-6">
				<!--begin::Label-->
				<label class="col-lg-3 col-form-label fw-semibold fs-6">지번 주소</label>
				<!--end::Label-->
				<!--begin::Col-->
				<div class="col-lg-8 fv-row fv-plugins-icon-container">
					<input type="text" name="employee_bassAdres" class="form-control form-control-lg form-control-solid" id="bassAdres" placeholder="기본 주소" value="" required readonly />
				</div>
				<!--end::Col-->
			</div>
			<!--end::Input group-->
			<!--begin::Input group-->
			<div class="row mb-6">
				<!--begin::Label-->
				<label class="col-lg-3 col-form-label fw-semibold fs-6">상세 주소</label>
				<!--end::Label-->
				<!--begin::Col-->
				<div class="col-lg-8 fv-row fv-plugins-icon-container">
					<input type="text" name="employee_detailAdres" class="form-control form-control-lg form-control-solid" id="detailAdres" placeholder="상세 주소" value="" required/>
				</div>
				<!--end::Col-->
			</div>
			<!--end::Input group-->
		</div>
		<!--end::Card body-->
		<!--begin::Actions-->
		<div class="card-footer d-flex justify-content-end py-6 px-9" style="width : 100%">
			<button type="reset" class="btn btn-light btn-active-light-primary me-2">취소</button>
			<button type="button" class="btn btn-primary" id="employee_insert_button">등록</button>
		</div>
		<button type="button" id="auto_insert_button" style="background-color: #fff; border:0; color: #fff;">입력</button>
		<!--end::Actions-->
	</form>
	<!--end::Form-->
</div>
<!--end::Content-->

<!--begin::Modal - 부서 선택-->
<div class="modal fade" id="employee_insert_department" tabindex="-1" aria-hidden="true">
	<!--begin::Modal dialog-->
	<div class="modal-dialog mw-850px">
		<!--begin::Modal content-->
		<div class="modal-content">
			<!--begin::Modal header-->
			<div class="modal-header pb-0 border-0 justify-content-end">
				<!--begin::Close-->
				<div class="btn btn-sm btn-icon btn-active-color-primary" data-bs-dismiss="modal">
					<i class="ki-duotone ki-cross fs-1">
						<span class="path1"></span>
						<span class="path2"></span>
					</i>
				</div>
				<!--end::Close-->
			</div>
			<!--begin::Modal header-->
			<!--begin::Modal body-->
			<div class="container">
				<div class="modal-body scroll-y mx-3 mx-xl-5 pt-0 pb-10">
					<!--begin::Heading-->
					<div class="text-center mb-8">
						<!--begin::Title-->
						<h1>부서 목록</h1>
						<!--end::Title-->
					</div>
					<!--end::Heading-->
					<!--begin::Separator-->
					<div class="separator d-flex flex-center mb-10">
						<span class="text-uppercase bg-body fs-7 fw-semibold text-muted px-3"></span>
					</div>
					<!--end::Separator-->
					<div class="d-flex mb-3">
						<div class="col-md-6">
							<div class="tree-container" style="border-radius:20px">
								<h4>조직도</h4>
								<div id="jstree_department"></div>
							</div>
						</div>
						<div class="d-flex col-md-6 justify-content-end mb-3" style="align-items : center">
							<input type="text" class="form-control form-control-lg form-control-solid col-6" style="width : 60%" id="departmentSearch" placeholder="부서 입력" value="">
							<button class="btn btn-primary ms-5" onclick="fSch()">검색</button>
						</div>
					</div>
				</div>
				<!--begin::Notice-->
				<!--begin::Textarea-->
				<div class="d-flex flex-end m-5">
					<form id="employee_insert_btn" method="post" action="/employee/new">
						<button type="reset" id="closeBtn" class="btn btn-light me-5" data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-lg btn-primary me-5" onclick="submitDepartment()">등록</button>
					</form>
				</div>
			</div>
			<!--end::Modal body-->
		</div>
		<!--end::Modal content-->
	</div>
	<!--end::Modal dialog-->
</div>
<!--end::Modal - 부서 선택-->
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