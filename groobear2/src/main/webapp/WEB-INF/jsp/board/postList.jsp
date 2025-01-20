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
				<div class="card">
					<!-- 카드 헤더 -->
					<div id="searchUI" class="card-header" style="justify-content:left;align-items:center;">
						<!-- 카테고리 검색조건 선택 박스 -->
						<div class="text-gray-700 fs-7 me-2">카테고리</div>
						<div class="" style="margin: 1rem 1rem 1rem 0;">
							<form:select path="paginationInfo.simpleCondition.searchType2" class="form-select">
								<form:option label="전체" value=""></form:option>
								<c:forEach items="${categoryList}" var="item">
									<form:option label="${item.cmmnCodeNm}" value="${item.cmmnCode}"/>
								</c:forEach>
							</form:select>
						</div>
						&nbsp;
						<!-- 제목,내용 검색조건 선택 박스 -->
						<div class="text-gray-700 fs-7 me-2">검색조건</div>
						<div style="margin: 1rem 1rem 1rem 0;">
							<form:select path="paginationInfo.simpleCondition.searchType" class="form-select">
								<form:option value="전체"></form:option>
								<form:option label="제목" value="title"></form:option>
								<form:option label="작성자" value="writer"></form:option>
							</form:select>
						</div>
						&nbsp;
						<!-- 검색어 박스 -->
						<div class="text-gray-700 fs-7 me-2">검색어</div>
						<div style="margin: 1rem 1rem 1rem 0;">
							<form:input path="paginationInfo.simpleCondition.searchWord" class="form-control" style="width: 200px;height:40px" placeholder="검색어 입력"/>
						</div>

						<!-- 검색 버튼 -->
						<div class="justify-content-end" style="margin: 1rem 1rem 1rem 0;">
							<a id="searchBtn" href="#" class="btn btn-primary">검색</a>
						</div>
						<c:set var="adminAt" value="${bbsNo eq 2 and realUser.emplNo == 2406121}"></c:set>
						<c:set var="deptAt" value="${bbsNo eq 3}"></c:set>
						<c:if test="${adminAt}">
							<!-- 글쓰기 버튼 -->
							<div style="float: right;">
								<div class="justify-content-end" style="margin: 1rem 1rem 1rem 0; float: right;" >
									<a href="${pageContext.request.contextPath}/board/${bbsNo}/new" class="btn btn-primary" >글쓰기</a>
								</div>
							</div>
						</c:if>
						<c:if test="${deptAt}">
							<!-- 글쓰기 버튼 -->
							<div style="float: right;">
								<div class="justify-content-end" style="margin: 1rem 1rem 1rem 0; float: right;" >
									<a href="${pageContext.request.contextPath}/board/${bbsNo}/new" class="btn btn-success" >글쓰기</a>
								</div>
							</div>
						</c:if>
					</div>
					<div style="margin-top:15px; margin-bottom:15px; margin-left: 20px;">Record count : ${paginationInfo.totalRecord}</div>
					<!--begin::Card body-->
					<div class="card-body pt-0">
						<!-- 게시글 목록 시작 -->
						<table id="kt_subscriptions_table" class="table align-middle table-row-dashed fs-6 gy-5">
							<thead>
								<tr class="text-center text-muted fw-bold fs-7 text-uppercase gs-0">
									<th style="text-align: center; width: 10%;">번호</th>
									<th style="text-align: center; width: 10%;">카테고리</th>
									<th style="text-align: center; width: 40%;">제목</th>
									<th style="text-align: center; width: 15%;">작성자</th>
									<th style="text-align: center; width: 15%;">작성일시</th>
								</tr>
							</thead>
							<tbody class="text-gray-600 fw-semibold">
								<c:choose>
									<c:when test="${not empty postList}">
										<c:forEach items="${postList}" var="item" varStatus="status">
											<tr>
												<!-- 글번호 -->
												<td class="text-center"><c:out value="${item.rnum}"/></td>
												<!-- 카테고리 -->
												<td class="text-center">
													<!-- 뱃지 -->
													<c:if test="${item.ctgryCode eq 'N01'}">
														<span class="badge badge-light-danger">공지</span>
													</c:if>
													<c:if test="${item.ctgryCode eq 'N02'}">
														<span class="badge badge-light-success">업무</span>
													</c:if>
													<c:if test="${item.ctgryCode eq 'N03'}">
														<span class="badge badge-light-primary">일반</span>
													</c:if>
													<c:if test="${item.ctgryCode eq 'N04'}">
														<span class="badge badge-light-secondary">기타</span>
													</c:if>
												</td>
												<!-- 제목 -->
												<td class="text-left"><a href="${pageContext.request.contextPath}/board/${bbsNo}/${item.sntncNo}"><c:out value="${item.sntncSj}"/></a>
													<!-- 첨부파일여부 -->
													<c:if test="${item.atchFileAt eq 'Y'}">
														<i class="ki-duotone ki-folder-up">
															<span class="path1"></span>
															<span class="path2"></span>
														</i>
													</c:if>
												</td>
												<!-- 작성자 -->
												<td class="text-center"><c:out value="${item.employeeVO.emplNm}(${item.employeeVO.emplId})"/></td>
												<!-- 작성일 -->
												<td class="text-center"><c:out value="${item.registDt}"/></td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="5">검색 결과 없음.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<!-- 페이징 처리 -->
						<ul class="pagination">
							<!-- 이전 버튼 -->
							
							<c:choose>
								<c:when test="${paginationInfo.firstPage > paginationInfo.pageSize}">
									<c:set var="previousPG" value="${paginationInfo.firstPage - paginationInfo.pageSize}"></c:set>
									<li class="page-item previous"><a onclick="paging(${previousPG})" class="page-link"><i class="previous"></i></a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item previous disabled"><a href="#" class="page-link"><i class="previous"></i></a></li>
								</c:otherwise>
							</c:choose>
						
							<!-- 페이지 버튼 -->
							<c:if test="${paginationInfo.lastPage > paginationInfo.totalPage}">
								<c:set var="endPage" value="${paginationInfo.totalPage}"></c:set>
							</c:if>
							<c:if test="${paginationInfo.lastPage <= paginationInfo.totalPage}">
								<c:set var="endPage" value="${paginationInfo.lastPage}"></c:set>
							</c:if>
							<c:forEach var="i" begin="${paginationInfo.firstPage}" end="${endPage}" >
								<c:choose>
									<c:when test="${paginationInfo.currentPage eq i}">
										 <li class="page-item active"><div class="page-link">${i}</div></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a href="#" onclick="paging(${i})" class="page-link">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<!-- 다음 버튼 -->
							<c:choose>
								<c:when test="${paginationInfo.lastPage < paginationInfo.totalPage}">
									<c:set var="lastPG" value="${paginationInfo.currentPage + 1}"></c:set>
									<li class="page-item next"><a href="#" onclick="paging(${lastPG})"  class="page-link"><i class="next"></i></a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item next disabled"><a href="#" class="page-link"><i class="next"></i></a></li>
								</c:otherwise>
							</c:choose>
						</ul>
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

<!-- 검색조건, 검색어 서버로 전송 할 폼 -->
<form:form id="searchForm" modelAttribute="paginationInfo" method="get" >
	<form:hidden path="simpleCondition.searchType2"/>
	<form:hidden path="simpleCondition.searchType"/>
	<form:hidden path="simpleCondition.searchWord"/>
	<input type="hidden" name="currentPage" value="1" />
</form:form>

<script>

//페이지 정보 전송
function paging(page){
	searchForm.currentPage.value = page;
	searchForm.submit();
}

/* DOMContentLoaded */
document.addEventListener('DOMContentLoaded', function(){
	
	
	
	// 검색조건 + 검색어 + 페이지정보 전송
	const $searchForm = $("#searchForm");
	$("#searchBtn").on("click", function(event){
		let $searchUI = $(this).parents("#searchUI");
		$searchUI.find(":input[name]").each(function(idx, ipt){
			let name = this.name;
			let value = $(this).val();
			searchForm[name].value = value;
		});
		$searchForm.submit();
	});
});
	
</script>