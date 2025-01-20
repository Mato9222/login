<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@	taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<security:authentication property="principal.realUser" var="realUser"/>
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
					<!-- 타이틀 -->
					<c:if test="${bbsNo eq 2}">
						<h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">공지사항</h1>
					</c:if>
					<c:if test="${bbsNo eq 3}">
						<h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">부서게시판</h1>
					</c:if>
					<!--end::Title-->
					<!--begin::Breadcrumb-->
					<ul class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 my-0 pt-1">
						<!--begin::Item-->
						<li class="breadcrumb-item text-muted">
							<a href="${pageContext.request.contextPath}/" class="text-muted text-hover-primary">Home</a>
						</li>
						<!--end::Item-->
						<!--begin::Item-->
						<li class="breadcrumb-item">
							<span class="bullet bg-gray-500 w-5px h-2px"></span>
						</li>
						<!--end::Item-->
						<li class="breadcrumb-item text-muted">
							<c:if test="${bbsNo eq 2}">
								<a href="${pageContext.request.contextPath}/board/${bbsNo}" class="text-muted text-hover-primary">공지사항</a>
							</c:if>
							<c:if test="${bbsNo eq 3}">
								<a href="${pageContext.request.contextPath}/board/${bbsNo}" class="text-muted text-hover-primary">부서게시판</a>
							</c:if>
						</li>
					</ul>
					<!--end::Breadcrumb-->
				</div>
				<!--end::Page title-->
				
			</div>
			<!--end::Toolbar container-->
		</div>
		<!--end::Toolbar-->
		<div id="kt_app_content" class="app-content flex-column-fluid">
			<div id="kt_app_content_container" class="app-container container-xxl">
				<div class="d-flex flex-column">
					<div class="card">
						<div class="card-header">
							<div class="card-title fs-3 fw-bold">등록</div>
							<c:set var="deptAt" value="${bbsNo eq 3}"></c:set>
							<c:if test="${deptAt}">
								<!-- 자동입력 버튼 -->
								<div style="float: right;">
									<div class="justify-content-end" style="margin: 1rem 1rem 1rem 0; float: right;" onclick="autoFnc()" >
										<a href="#" class="btn btn-success">자동입력</a>
									</div>
								</div>
							</c:if>
						</div>
						<!-- 폼 시작 -->
						<form id="postfrm" action="${pageContext.request.contextPath}/board/${bbsNo}/new"  method="post" enctype="multipart/form-data" class="form" >
							<!-- 히든 데이터 -->
							<input type="hidden" id="bbsNo" name="bbsNo" value="${bbsNo}"/><!-- 게시판번호 -->
							<input type="hidden" id="emplNo" name="emplNo" value="${realUser.emplNo}"/><!-- 사원번호 -->
							
							
							<div class="card-body p-9">
								<c:set var="adminAt" value="${bbsNo eq 2 and realUser.emplNo == 2406121}"></c:set>
								<c:set var="deptAt" value="${bbsNo eq 3}"></c:set>
								<c:if test="${adminAt}">
									<!-- 게시글 공개여부 -->
									<div class="row mb-8">
										<div class="col-xl-2">
											<div class="fs-6 fw-semibold mt-2 mb-3">공개여부</div>
										</div>
										<div class="col-xl-9 fv-row" style="display: flex;flex-direction: row;flex-wrap: nowrap;justify-content: flex-start;align-items: center;">
											<div class="form-check form-check-custom form-check-success form-check-solid" style="margin-right:2rem;">
												<input class="form-check-input" type="radio" value="Y" name="othbcAt" id="othbc" checked />
												<label class="form-check-label" for="othbc">
													공개
												</label>
											</div>
											<div class="form-check form-check-custom form-check-danger form-check-solid">
												<input class="form-check-input" type="radio" value="N" name="othbcAt" id="nonOthbc"  />
												<label class="form-check-label" for="nonOthbc">
													비공개
												</label>
											</div>
										</div>
									</div>
									<!-- 관리자여부 -->
									<div class="row mb-8">
										<div class="col-xl-2">
											<div class="fs-6 fw-semibold mt-2 mb-3">관리자여부</div>
										</div>
										<div class="col-xl-9 fv-row" style="display: flex;flex-direction: row;flex-wrap: nowrap;justify-content: flex-start;align-items: center;">
											<div class="form-check form-check-custom form-check-success form-check-solid" style="margin-right:2rem;">
												<input class="form-check-input" type="radio" value="Y" name="mngrAt" id="Mngr" checked/>
												<label class="form-check-label" for="Mngr">
													관리자
												</label>
											</div>
											<div class="form-check form-check-custom form-check-danger form-check-solid">
												<input class="form-check-input" type="radio" value="N" name="mngrAt" id="nonMngr"/>
												<label class="form-check-label" for="nonMngr">
													비관리자
												</label>
											</div>
										</div>
									</div>
								</c:if>
								
								
								<!-- 게시글 제목 -->
								<div class="row mb-8">
									<div class="col-xl-2">
										<div class="fs-6 fw-semibold mt-2 mb-3">제목</div>
									</div>
									<div class="col-xl-9 fv-row">
										<input type="text" name="sntncSj" value="<c:out value='${postVO.sntncSj}'/>" class="form-control" placeholder=""/>
									</div>
								</div>
								<!--  -->
								<!-- 카테고리 -->
								<div class="row mb-8">
									<div class="col-xl-2">
										<div class="fs-6 fw-semibold mt-2 mb-3">카테고리</div>
									</div>
									<div class="col-xl-9 fv-row">
										<select id="cmmnCode" name="cmmnCode" class="form-select form-control-solid" >
											<c:forEach items="${categoryList}" var="item">
												<c:if test="${postVO.ctgryCode eq item.cmmnCode}">
													<option label="${item.cmmnCodeNm}" value="${item.cmmnCode}" selected></option>
												</c:if>
												<c:if test="${postVO.ctgryCode ne item.cmmnCode}">
													<option label="${item.cmmnCodeNm}" value="${item.cmmnCode}"></option>
												</c:if>
											</c:forEach>
										</select>
									</div>
								</div>
								<!-- 게시글 내용 -->
								<div class="row mb-8">
									<div class="col-xl-2">
										<div class="fs-6 fw-semibold mt-2 mb-3">내용</div>
									</div>
									<div class="col-xl-9 fv-row">
										<div class="py-5" data-bs-theme="light">
											<textarea id="sntncCn" name="sntncCn"></textarea>
										</div>
									</div>
								</div>
								<!-- TODO : 첨부파일 -->
								<div class="row mb-8">
									<div class="col-xl-2">
										<div class="fs-6 fw-semibold mt-2 mb-3">첨부파일</div>
									</div>
									<div class="col-xl-9 fv-row">
										<input type="hidden" id="atchFileAt" name="atchFileAt" value="${postVO.atchFileAt}"/>
	 									<input type="file" id="atchFile" name="atchFile" multiple="multiple" class="form-control"/>
									</div>
								</div>
							</div>
							<!--end::Card body-->
							<!-- 버튼 영역 -->
							<div class="card-footer d-flex justify-content-end py-6 px-9">
								<button type="button" id="cancelBtn" class="btn btn-light btn-active-light-primary me-2">취소</button>
								<button type="button" id="saveBtn" class="btn btn-primary" >저장</button>
							</div>
							
						</form>
						<!--end:Form-->
					</div>
					<!--end::Card-->
				</div>
				<!--end::Inbox App - Compose -->
			</div>
			<!--end::Content container-->
		</div>
		<!--end::Content-->
	</div>
	<!--end::Content wrapper-->
</div>
<!--end:::Main-->

<script>

/* 전역변수 */
let CKTextEditor; // 텍스트에디터

function autoFnc(){
	let sntncSj = $("input[name = sntncSj]"); // 제목
	sntncSj.val(`[부서공지] 시큐어 코딩 가이드 교육`);
	
	let neyong = `
		<br>
		KISA 한국인터넷진흥원 시큐어 코딩 가이드에 따라 교육 진행 하고자 합니다.<br>
		<br>
		첨부한 Javascript_시큐어코딩_가이드(2023년_개정본).pdf<br>
		<br>
		다운로드하여 출력 후 참석바랍니다.<br>
		<br>
		<br>
		* 태블릿 소지자는 태블릿에서 pdf 실행하시기 바랍니다.<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		교육일시 : 2024. 06. 17. ( 14:00 ~ 18:00 )<br>
		<br>
		교육장소 : 회의실1번<br>
		<br>
		교육인원 : 개발2팀 신규인력<br>
		<br>
	`;
		
	CKTextEditor.setData(neyong);
}

/* DOMContentLoaded */
document.addEventListener('DOMContentLoaded', () => {

	// CK 에디터에 작성한 내용 가져오는 스크립트
	ClassicEditor
       .create( document.querySelector("#sntncCn"), {
        licenseKey: 'eU5USHA5OURMMVdUZE9LeFhNanYyVGZDTlNEZFZndzRVbGZwTThvRkVwdlFPRGZXRHZ3dUhnT056eXRMQmc9PS1NakF5TkRBMk1qST0=',
    } )
    .then(editor => {
		CKTextEditor = editor; // textArea HTML 내용
	})
	.catch(error => {
		console.error(error);
	});



	// input 태그 선택 
	let bbsNoTag = $("#bbsNo"); // 게시판번호
	//let emplNoTag = $("#emplNo"); // 사원번호
	if(bbsNoTag.val() == 2){
		let othbcAtTag = $("input[name = othbcAt]:checked"); // 공개여부
		let mngrAtTag = $("input[name = mngrAt]:checked"); // 관리자여부
	}
	let sntncSjTag = $("input[name = sntncSj]"); // 제목
	let ctgryCodeTag = $("#cmmnCode option:selected"); // 카테고리
	let atchFileAtTag = $("#atchFileAt"); // 첨부파일여부
	let atchFileTag = $("#atchFile"); // 첨부파일
	

	// DOM 로드 이후 저장 클릭 이벤트
	$("#saveBtn").on("click", function(event){
		// 카테고리 미선택 시
		let ctgryCodeValidation = ctgryCodeTag.val();
		if(!ctgryCodeValidation){
			console.log("카테고리선택해라");
			return;
		}
		
		// 저장 시 선택하는 input 태그들은 값을 다시 가져오기
		if(bbsNoTag.val() == 2){
			othbcAtTag = $("input[name = othbcAt]:checked"); // 공개여부
			mngrAtTag = $("input[name = mngrAt]:checked"); // 관리자여부
		}
		ctgryCodeTag = $("#cmmnCode option:selected"); // 카테고리
		

		
		// 폼 데이터 객체 생성
		let frmData = new FormData();

		// 폼 데이터 셋팅
		// 폼 데이터 값 가져오기
		let bbsNo = bbsNoTag.val();
		let othbcAt = "";
		let mngrAt = "";
		if(bbsNo == 2){
			othbcAt = othbcAtTag.val();
			mngrAt = mngrAtTag.val();
		} else {
			othbcAt = 'Y';
			mngrAt = 'N';
		}
		let ctgryCode = ctgryCodeTag.val();
		let sntncSj = sntncSjTag.val();
		let atchFileAt = atchFileAtTag.val();
		let atchFiles = atchFileTag[0].files; // 첨부파일리스트
		
		// 첨부파일여부( 있음 : Y, 없음 : N)
		if( !atchFiles.length ){
			atchFileAtTag.val("N");
			
		} else {
			atchFileAtTag.val("Y");
		}
		atchFileAt = atchFileAtTag.val();

		// 폼 데이터 객체에 추가
		frmData.append("bbsNo", bbsNo);
		frmData.append("othbcAt", othbcAt);
		frmData.append("mngrAt", mngrAt);
		frmData.append("ctgryCode", ctgryCode);
		frmData.append("sntncSj", sntncSj);
		frmData.append("sntncCn", CKTextEditor.getData());
		frmData.append("atchFileAt", atchFileAt);
		for (let index = 0; index < atchFiles.length; index++) {
			frmData.append("tbAttachFile", atchFiles[index]);
		}

		// 폼 데이터 확인
		// for (let key of frmData.keys()) {
		// 	console.log(key, ":", frmData.get(key));
		// }
		
		// 비동기 전송
		let url = `/board/\${bbsNo}/new`;
		$.ajax({
			url : url
			, type : "post"
			, data : frmData
			, contentType : false
			, processData : false
			, success : function(res) {
				if(res == "success") {
					location.href = `/board/\${bbsNoTag.val()}`;
				}
			}
		}); // end ajax
	});

	/* 취소 버튼 - 목록으로 이동 */
	$("#cancelBtn").on("click", function(e){
		bbsNo = bbsNo.value;
		console.log(bbsNo);
 		location.href = `${pageContext.request.contextPath}/board/\${bbsNo}`;
	});
});

</script>