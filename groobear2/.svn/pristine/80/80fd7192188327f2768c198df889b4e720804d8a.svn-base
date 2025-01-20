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
					<!--begin::Breadcrumb-->
					<ul class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 my-0 pt-1">
						<!--begin::Item-->
						<li class="breadcrumb-item text-muted">
							<a href="${pageContext.request.contextPath}/" class="text-muted text-hover-primary">Home</a>
						</li>
						<!--begin::Item-->
						<li class="breadcrumb-item">
							<span class="bullet bg-gray-500 w-5px h-2px"></span>
						</li>
						<!--begin::Item-->
						<li class="breadcrumb-item text-muted">
							<c:if test="${bbsNo eq 2}">
								<a href="${pageContext.request.contextPath}/board/${bbsNo}" class="text-muted text-hover-primary">공지사항</a>
							</c:if>
							<c:if test="${bbsNo eq 3}">
								<a href="${pageContext.request.contextPath}/board/${bbsNo}" class="text-muted text-hover-primary">부서게시판</a>
							</c:if>
						</li>
						<!--end::Item-->
					</ul>
				</div>
			</div>
		</div>
		<!--end::Toolbar-->
		<div id="kt_app_content" class="app-content flex-column-fluid">
			<div id="kt_app_content_container" class="app-container container-xxl">
				<div class="d-flex flex-column ">
					<div class="card mb-5">
						<!-- 카드 헤더 영역 -->
						<div class="card-header align-items-center py-5 gap-5">
							<div class="d-flex">
								<!-- 목록으로 -->
								<a href="${pageContext.request.contextPath}/board/${bbsNo}" class="btn btn-sm btn-icon btn-clear btn-active-light-primary me-3" data-bs-toggle="tooltip" data-bs-placement="top" title="Back">
									<i class="ki-duotone ki-arrow-left fs-1 m-0">
										<span class="path1"></span>
										<span class="path2"></span>
									</i>
								</a>
							</div>
							<div class="d-flex align-items-center">
								<c:set var="boninAt" value="${realUser.emplNo == postVO.emplNo}"></c:set>
								<c:if test="${boninAt}">
									<!-- 글수정 -->
									<a href="${pageContext.request.contextPath}/board/${bbsNo}/${postVO.sntncNo}/edit" title="수정" data-bs-toggle="tooltip" data-bs-placement="top" class="btn btn-sm btn-icon btn-light btn-active-light-primary me-2">
										<i class="ki-duotone ki-message-edit fs-2 m-0">
											<span class="path1"></span>
											<span class="path2"></span>
											<span class="path3"></span>
										</i>
									</a>
									<!-- 글삭제 -->
									<a href="${pageContext.request.contextPath}/board/${bbsNo}/${postVO.sntncNo}/delete" title="삭제" data-bs-toggle="tooltip" data-bs-placement="top" class="btn btn-sm btn-icon btn-light btn-active-light-primary me-2">
										<i class="ki-duotone ki-trash fs-2 m-0">
											<span class="path1"></span>
											<span class="path2"></span>
											<span class="path3"></span>
											<span class="path4"></span>
											<span class="path5"></span>
										</i>
									</a>
								</c:if>
								<!-- 프린트 -->
								<a href="#" title="Print" data-bs-toggle="tooltip" data-bs-placement="top" class="btn btn-sm btn-icon btn-light btn-active-light-primary me-2">
									<i class="ki-duotone ki-printer fs-2">
										<span class="path1"></span>
										<span class="path2"></span>
										<span class="path3"></span>
										<span class="path4"></span>
										<span class="path5"></span>
									</i>
								</a>
							</div>
						</div>
						<!-- 카드 바디 영역 -->
						<div class="card-body">
							<!-- 게시글 타이틀 영역 -->
							<div class="d-flex flex-wrap gap-2 justify-content-between mb-8">
								<!-- 게시글 제목, 카테고리 -->
								<div class="d-flex align-items-center flex-wrap gap-2">
									<!-- 게시글 제목 -->
									<h2 class="fw-semibold me-3 my-1"><c:out value="${postVO.sntncSj}"/></h2>
									<!-- 카테고리 뱃지 -->
									<c:if test="${postVO.ctgryCode eq 'N01'}">
										<span class="badge badge-light-danger">공지</span>
									</c:if>
									<c:if test="${postVO.ctgryCode eq 'N02'}">
										<span class="badge badge-light-success">업무</span>
									</c:if>
									<c:if test="${postVO.ctgryCode eq 'N03'}">
										<span class="badge badge-light-primary">일반</span>
									</c:if>
									<c:if test="${postVO.ctgryCode eq 'N04'}">
										<span class="badge badge-light-secondary">기타</span>
									</c:if>
								</div>
								<!-- 조회수, 작성일시 -->
								<div class="d-flex align-items-center flex-wrap gap-2">
										<span class="fw-semibold text-muted text-end me-3">조회수 : <c:out value="${postVO.rdcnt}"/></span>
										<span class="fw-semibold text-muted text-end me-3">작성일시 : <c:out value="${postVO.registDt}"/></span>
								</div>
							</div>

							<!-- 작성자 정보 -->
							<div class="d-flex flex-wrap gap-2 justify-content-between mb-8">
								<!--begin::Author-->
								<div class="d-flex align-items-center" >
									<!--begin::Avatar-->
									<div class="symbol symbol-50 me-4 gap-2" >
										<span class="symbol-label" style="background-image:url('${pageContext.request.contextPath}/resources/image/${postVO.employeeVO.proflPhotoCours}');"></span>
									</div>
									<!--end::Avatar-->
									<div class="pe-5">
										<!-- 작성자명, 작성자 아이디 -->
										<div class="d-flex align-items-center flex-wrap gap-1" >
											<a href="#" class="fw-bold text-gray-900 text-hover-primary"><c:out value="${postVO.employeeVO.emplNm}"/>(<c:out value="${postVO.employeeVO.emplId}"/>)</a>
										</div>
										<!--end::Author details-->
										<%-- <div data-kt-inbox-message="details">
											하위영역
										</div> --%>
									</div>
								</div>
								<!-- 수정일시 -->
								<div class="d-flex align-items-center flex-wrap">
									<!-- 수정일시 있음 -->
									<c:if test="${not empty postVO.upddeDt}">
										<!--begin::Date-->
										<span class="fw-semibold text-muted text-end me-3">수정일시 : ${postVO.upddeDt}</span>
									</c:if>
									<!-- 수정일시 없음 -->
									<c:if test="${empty postVO.upddeDt}">
										<div class="d-flex">
											<!-- 수정일시 : 수정 시 수정일시 출력된다 -->
										</div>
									</c:if>
								</div>
							</div>

							<!-- 게시글 내용 -->
							<div data-kt-inbox-message="message_wrapper">
								<!--begin::Message header-->
								<!-- <div class="d-flex flex-wrap gap-2 flex-stack" data-kt-inbox-message="header"> -->
									<!-- 글 헤더  -->
								<!-- </div> -->
								
								<!-- 구분선-->
								<div class="separator my-6"></div>
								
								<!-- 게시글 내용 -->
								<input type="hidden" id="cn" value="<c:out value='${postVO.sntncCn}'/>" />
								<div class="collapse fade show" data-kt-inbox-message="message" style="padding-left: 2rem;">
									<div id="sntncCnArea" class="py-5">${postVO.sntncCn}</div>
								</div>
							</div>
							
							<!-- 구분선-->
							<div class="separator my-6"></div>

							<!-- 첨부파일 -->
							<div class="row mb-8" style="padding-left: 2rem;">
								<div class="col-xl-2">
									<div class="fs-6 fw-semibold mt-2 mb-3">첨부파일</div>
								</div>
								<div class="col-xl-9 fv-row">
									<c:if test="${not empty postVO.attchFileList}">
										<c:forEach items="${postVO.attchFileList}" var="item" varStatus="vs">
											<c:url value="/board/${bbsNo}/${postVO.sntncNo}/attach/${item.atchFileNo}/${item.atchFileSeq}" var="downloadUrl"/>
											<a href="${downloadUrl}" title="${item.fileSizeContraction}, ${item.fileDownCnt}번 다운"><!-- 파일크기(축약형), 다운로드수 -->
												${item.fileNm}
											</a>${not vs.last ? "<br>" : "" }
										</c:forEach>
									</c:if>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
</div>


<script type="text/javascript">
/* DOMContentLoaded */
document.addEventListener('DOMContentLoaded', () => {
	// TODO : 게시글 내용
	const sntncCnAreaTag = document.querySelector("#sntncCnArea");
	
	const cn = "${postVO.sntncCn}";
	
	sntncCnAreaTag.innerHTML = cn;
	
	
	
});
</script>
