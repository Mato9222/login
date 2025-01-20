<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
      <style>
        .link-container {
            display: flex;
            justify-content: space-between;
            width: 100%;
            max-width: 800px; /* 최대 너비를 설정하여 중앙에 배치 */
            margin: 0 auto; /* 가운데 정렬 */
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .link-column {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
            width: 48%;
        }
        .link-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px; /* 패딩을 더 넓게 설정 */
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
        }
        .link-item a {
            color: gray;
            text-decoration: none;
            font-weight: bold;
        }
        .link-item a:hover {
            color: blue;
        }
		 th.min-w-50px {
		     min-width: 50px;
		 }
		 th.min-w-100px {
		     min-width: 100px;
		 }
		 th.min-w-150px {
		     min-width: 150px;
		 }
		 th.min-w-300px {
		     min-width: 300px;
		 }
		 #sntncCn {
        white-space: pre-wrap;
	    }
    </style>
    
						<!--begin::Content wrapper-->
						<div class="d-flex flex-column flex-column-fluid">
							<security:authentication property="principal.realUser" var="user"/>
							<!--begin::Toolbar-->
							<div id="kt_app_toolbar" class="app-toolbar py-3 py-lg-6">
								<!--begin::Toolbar container-->
								<div id="kt_app_toolbar_container" class="app-container container-xxl d-flex flex-stack">
									<!--begin::Page title-->
									<div class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
										<!--begin::Title-->
										<h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">프로젝트 정보</h1>
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
											<li class="breadcrumb-item text-muted">프로젝트</li>
											<!--end::Item-->
											<li class="breadcrumb-item">
												<span class="bullet bg-gray-500 w-5px h-2px"></span>
											</li>
											<li class="breadcrumb-item text-muted">프로젝트 정보</li>
										</ul>
										<!--end::Breadcrumb-->
									</div>
									<!--end::Page title-->
								</div>
								<!--end::Toolbar container-->
							</div>
							<!--end::Toolbar-->
							<!--begin::Content-->
							<div id="kt_app_content" class="app-content flex-column-fluid">
								<!--begin::Content container-->
								<div id="kt_app_content_container" class="app-container container-xxl">
									<!--begin::Navbar-->
									<div class="card mb-6 mb-xl-9">
										<div class="card-body pt-9 pb-0">
											<!--begin::Details-->
											<div class="d-flex flex-wrap flex-sm-nowrap mb-6">
												<!--begin::Image-->
												<div class="d-flex flex-center flex-shrink-0 bg-light rounded w-100px h-100px w-lg-150px h-lg-150px me-7 mb-4">
													<img src="${pageContext.request.contextPath}/resources/demo1/assets/media/logos/logo.png" alt="image" class="p-3" style="width:150px; height:150px;"/>
												</div>
												<!--end::Image-->
												<!--begin::Wrapper-->
												<div class="flex-grow-1">
													<!--begin::Head-->
													<div class="d-flex justify-content-between align-items-start flex-wrap mb-2">
														<!--begin::Details-->
														<div class="d-flex flex-column">
															<!--begin::Status-->
															<div class="d-flex align-items-center mb-1">
																<span class="text-gray-800 text-hover-primary fs-2 fw-bold me-3">${detailList[0].prjctNm}</span>
																    <c:if test="${detailList[0].prjctSttusCode eq 'Z01'}">
														        <span class="badge badge-light-primary fw-bold px-4 py-3">계획</span>
														        </c:if>
														    	<c:if test="${detailList[0].prjctSttusCode eq 'Z02'}">
														        <span class="badge badge-light-warning fw-bold px-4 py-3">진행중</span>
														        </c:if>
														    	<c:if test="${detailList[0].prjctSttusCode eq 'Z03'}">
														        <span class="badge badge-light-success fw-bold px-4 py-3">완료</span>
														        </c:if>
														    	<c:if test="${detailList[0].prjctSttusCode eq 'Z04'}">
														        <span class="badge badge-light-danger fw-bold px-4 py-3">중단</span>
														        </c:if>
															</div>
															<!--end::Status-->
															<!--begin::Description-->
															<div class="d-flex flex-wrap fw-semibold mb-4 fs-5 text-gray-500">${detailList[0].prjctDc}</div>
															<!--end::Description-->
														</div>
														<!--end::Details-->
													</div>
													<!--end::Head-->
													<!--begin::Info-->
													<div class="d-flex flex-wrap justify-content-start">
														<!--begin::Stats-->
														<div class="d-flex flex-wrap">
															<!--begin::Stat-->
															<div class="border border-gray-300 border-dashed rounded min-w-125px py-3 px-4 me-6 mb-3">
																<!--begin::Number-->
																<div class="d-flex align-items-center">
																	<div class="fs-4 fw-bold myProjectStartDate3">${detailList[0].prjctBgnde}</div>
																</div>
																<!--end::Number-->
																<!--begin::Label-->
																<div class="fw-semibold fs-6 text-gray-500 ">프로젝트 시작일자</div>
																<!--end::Label-->
															</div>
															<!--end::Stat-->
															<!--begin::Stat-->
															<div class="border border-gray-300 border-dashed rounded min-w-125px py-3 px-4 me-6 mb-3">
																<!--begin::Number-->
																<div class="d-flex align-items-center">
																	<div class="fs-4 fw-bold myProjectEndDate4">${detailList[0].prjctClosOn}</div>
																</div>
																<!--end::Number-->
																<!--begin::Label-->
																<div class="fw-semibold fs-6 text-gray-500 ">프로젝트 종료일자</div>
																<!--end::Label-->
															</div>
															<!--end::Stat-->
															<!--begin::Stat-->
															<div class="border border-gray-300 border-dashed rounded min-w-125px py-3 px-4 me-6 mb-3">
																<!--begin::Number-->
																<div class="d-flex align-items-center">
																	<i class="ki-duotone ki-arrow-up fs-3 text-success me-2">
																		<span class="path1"></span>
																		<span class="path2"></span>
																	</i>
																	<div class="fs-4 fw-bold" data-kt-countup="true" data-kt-countup-value="15000" data-kt-countup-prefix="$">0</div>
																</div>
																<!--end::Number-->
																<!--begin::Label-->
																<div class="fw-semibold fs-6 text-gray-500">작업 예산</div>
																<!--end::Label-->
															</div>
															<!--end::Stat-->
														</div>
														<!--end::Stats-->
														<!--begin::Users-->
														<div class="symbol-group symbol-hover mb-3">
															<!--begin::User-->
															<c:forEach items="${detailList}" var="dl">
																<c:forEach items="${dl.pjMemberVO}" var="pvo">
																	<div class="symbol symbol-35px symbol-circle" data-bs-toggle="tooltip" title="${pvo.empVO.emplNm}">
																		<img src="${pageContext.request.contextPath}/resources/image/${pvo.empVO.proflPhotoCours}">
																	</div>
																</c:forEach>
															</c:forEach>
															<!--end::User-->
														</div>
														<!--end::Users-->
													</div>
													<!--end::Info-->
												</div>
												<!--end::Wrapper-->
											</div>
											<!--end::Details-->
											<div class="separator"></div>
											<!--begin::Nav-->
											<ul class="nav nav-stretch nav-line-tabs nav-line-tabs-2x border-transparent fs-5 fw-bold">
												<li class="nav-item">
													<a class="nav-link active" data-bs-toggle="tab" href="#kt_tab_pane_1">프로젝트 개요</a>
												</li>
												<li class="nav-item">
													<a class="nav-link" data-bs-toggle="tab" href="#kt_tab_pane_2">작업내역</a>
												</li>
												<li class="nav-item">
													<a class="nav-link" data-bs-toggle="tab" href="#kt_tab_pane_3" id="tab_works">일감</a>
												</li>
												<li class="nav-item">
													<a class="nav-link" data-bs-toggle="tab" href="#kt_tab_pane_4">Gantt 차트</a>
												</li>
												<li class="nav-item">
													<a class="nav-link" data-bs-toggle="tab" href="#kt_tab_pane_5">파일</a>
												</li>
												<li class="nav-item">
													<a class="nav-link" data-bs-toggle="tab" href="#kt_tab_pane_6" id="tab_post">게시판</a>
												</li>
											</ul>
											<!--end::Nav-->
										</div>
									</div>
									<!--end::Navbar-->
									<!-- tab 컨텐트 -->
									<div class="tab-content" id="myTabContent">
									<!--프로젝트 개요 tab-->
										<div class="tab-pane fade show active" id="kt_tab_pane_1" role="tabpanel">
											<div class="row gx-6 gx-xl-9">
												<!--begin::Col-->
												<div class="col-lg-6">
												    <!--begin::Summary-->
												    <div class="card card-flush h-lg-100">
												        <!--begin::Card header-->
												        <div class="card-header mt-6">
												            <!--begin::Card title-->
												            <div class="card-title flex-column">
												                <h3 class="fw-bold mb-1">일감 진행 현황</h3>
												                <div class="fs-6 fw-semibold text-gray-500">프로젝트 일감 전체 진행 현황</div>
												            </div>
												            <!--end::Card title-->
												            <!--begin::Card toolbar-->
												            <div class="card-toolbar">
												                <a class="btn btn-light btn-sm" id="go_works">일감 보기</a>
												            </div>
												            <!--end::Card toolbar-->
												        </div>
												        <!--end::Card header-->
												        <!--begin::Card body-->
												        
												        <div class="card-body p-9 pt-5">
												            <!--begin::Wrapper-->
												            <div class="d-flex flex-wrap">
												                <!--begin::Chart-->
												                <div class="position-relative d-flex flex-center h-100 w-100 mb-7">
												                    <canvas id="kt_chartjs_1" class="w-100 h-100"></canvas>
												                </div>
												                <!--end::Chart-->
												            </div>
												            <!--end::Wrapper-->
												        </div>
												        <!--end::Card body-->
												    </div>
												    <!--end::Summary-->
												</div>
												<!--end::Col-->
												<!--begin::Col-->
													<div class="col-lg-6">
													    <!--begin::Graph-->
													    <div class="card card-flush h-lg-100">
													        <!--begin::Card header-->
													        <div class="card-header mt-6">
													            <!--begin::Card title-->
													            <div class="card-title flex-column">
													                <h3 class="fw-bold mb-1">구성 팀원 소개</h3>
													                <div class="fs-6 fw-semibold text-gray-500">프로젝트 구성원 소개</div>
													            </div>
													            <!--end::Card title-->
													        </div>
													        <!--end::Card header-->
													        <!--begin::Card body-->
													        <div class="card-body pt-10 pb-0 px-5">
													            <!--begin::Table Container-->
													            <div id="kt_project_overview_graph" class="card-rounded-bottom" style="max-height: 300px; overflow-y: auto;">
													                <table class="table align-middle table-row-dashed fs-6 gy-5">
													                    <thead>
													                        <tr class="text-start text-muted fw-bold fs-7 text-uppercase gs-0">
													                            <th class="min-w-50px"></th>
													                            <th class="min-w-75px">이름</th>
													                            <th class="min-w-75px">역할</th>
													                            <th class="min-w-75px">직책</th>
													                        </tr>
													                    </thead>
													                    <tbody class="text-gray-600 fw-semibold">
													                        <c:forEach items="${detailList}" var="dl">
													                            <c:forEach items="${dl.pjMemberVO}" var="pvo">
													                                <tr class="text-start text-muted fw-bold fs-7 text-uppercase gs-0">
													                                    <td>
													                                        <div class="symbol symbol-circle symbol-50px">
													                                            <img src="${pageContext.request.contextPath}/resources/image/${pvo.empVO.proflPhotoCours}" alt="Profile Photo">
													                                        </div>
													                                    </td>
													                                    <td class="emplNm">${pvo.empVO.emplNm}</td>
													                                    <td>${pvo.prjctRoleCodeNm}</td>
													                                    <td>${pvo.empVO.rspofcCodeNm}</td>
													                                </tr>
													                            </c:forEach>
													                        </c:forEach>
													                    </tbody>
													                </table>
													            </div>
													            <!--end::Table Container-->
													        </div>
													        <!--end::Card body-->
													    </div>
													    <!--end::Graph-->
													</div>
												<!--end::Col-->
												<!--begin::Col-->
												<div class="col-lg-6">
													<!--begin::Card-->
													<div class="card card-flush h-lg-100">
														<!--begin::Card header-->
														<div class="card-header mt-6">
															<!--begin::Card title-->
															<div class="card-title flex-column">
																<h3 class="fw-bold mb-1">팀원별 주간 일감 진행 현황</h3>
																<div class="fs-6 text-gray-500">주간별 진행도</div>
															</div>
															<!--end::Card title-->
														</div>
														<!--end::Card header-->
														<!--팀원별 주간 일감 진행 현황 표시작-->
														<div class="card-body p-9 pt-4">
															<div class="card card-bordered">
														    	<div class="card-body">
														        	<div id="kt_apexcharts_1" style="height: 350px;"></div>
														    	</div>
															</div>
														</div>
														<!--팀원별 주간 일감 진행 현황 표끝-->
														<!--end::Card body-->
													</div>
													<!--end::Card-->
												</div>
												<!--end::Col-->
												<!--begin::Col-->
												<div class="col-lg-6">
													<!--begin::Card-->
													<div class="card card-flush h-lg-100">
														<!--begin::Card header-->
														<div class="card-header mt-6">
															<!--begin::Card title-->
															<div class="card-title flex-column">
																<h3 class="fw-bold mb-1">프로젝트 일정</h3>
																<div class="fs-6 fw-semibold text-gray-500">일정 등록 및 조회</div>
															</div>
															<div class="card-body p-9 pt-4">
																<div id="kt_docs_fullcalendar_selectable"></div>
															</div>
															<!--end::Card title-->
														</div>
														<!--end::Card header-->
													</div>
													<!--end::Card-->
												</div>
											</div>
										</div>
										<!--프로젝트 개요 tab 끝-->
										<!-- 작업내역 tab 시작 -->
										<div class="tab-pane fade" id="kt_tab_pane_2" role="tabpanel">
											<div class="card card-p-0 card-flush">
													<div class="card-title flex-column">
														<h3 class="fw-bold mb-1">작업 내역</h3>
														<div class="fs-6 text-gray-500">프로젝트 내 구성원 작업 내역</div>
													</div>
												<div class="card-header align-items-center py-5 gap-2 gap-md-5">
													<div class="card-title">
														<!--begin::Search-->
														<div class="d-flex align-items-center position-relative my-1">
															<i class="ki-duotone ki-magnifier fs-3 position-absolute ms-5">
																	 <span class="path1"></span>
																	 <span class="path2"></span>
															</i>
															<input type="text" data-kt-filter="search" class="form-control form-control-solid w-250px ps-14" placeholder="작업내역 검색" />
														</div>
														<!--end::Search-->
														<!--begin::Export buttons-->
														<div id="kt_datatable_example_1_export" class="d-none"></div>
														<!--end::Export buttons-->
													</div>
												</div>
												<div class="card-body">
													<ul>
														<c:forEach items="${logList }" var="log">
															<c:if test="${log.logClass eq '일감'}" >
															<li><span class="text-primary">${log.wmName}</span>님이&nbsp;&nbsp; 
																<span class="text-dark" style="font-weight:bold;">[${log.logClass}]${log.worksTitle }</span>를(을)
																<span class="text-dark" class="text-dark" style="font-weight:bold;">${log.logDate }</span>에&nbsp; 
																<c:if test="${log.logStatus eq'수정'}">
																	<span class="text-success">${log.logStatus }</span>하셨습니다.
																</c:if> 
																<c:if test="${log.logStatus eq'등록'}">
																	<span class="text-success">${log.logStatus }</span>하셨습니다.
																</c:if>
																<c:if test="${log.logStatus eq '삭제'}">
																	<span class="text-danger">${log.logStatus }</span>하셨습니다.
																</c:if> 
														</c:if>
														<c:if test="${log.logClass eq '게시글'}" >
															<li><span class="text-primary">${log.pmName}</span>님이&nbsp;&nbsp;
															 <span class="text-dark" style="font-weight:bold;">[${log.logClass}]${log.sntncSj }</span>를(을)
															 <span class="text-dark" class="text-dark" style="font-weight:bold;">${log.logDate }</span>에&nbsp;
															<c:if test="${log.logStatus eq'수정'}">
																<span class="text-success">${log.logStatus }</span>하셨습니다.
															</c:if> 
															<c:if test="${log.logStatus eq'등록'}">
																<span class="text-success">${log.logStatus }</span>하셨습니다.
															</c:if>
														</c:if>
														</c:forEach>
													</ul>
												</div>
											</div>
									</div>
										<!-- 작업내역 tab 끝 -->
										<!-- 일감 tab시작 -->
									<div class="tab-pane fade" id="kt_tab_pane_3" role="tabpanel">
									    <div id="worklist" class="flex-column flex-column-fluid">
									        <!--begin::Toolbar-->
									        <div id="kt_app_toolbar" class="app-toolbar py-3 py-lg-6">
									            <!--begin::Toolbar container-->
									            <div id="kt_app_toolbar_container" class="app-container container-xxl d-flex flex-stack">
									                <!--begin::Page title-->
									                <div class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
									                    <!--begin::Title-->
									                    <h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">일감</h1>
									                    <!--end::Title-->
									                </div>
									                <!--end::Page title-->
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
									                    <!--begin::Card header-->
									                    <div class="card-header border-0 pt-6">
									                        <div class="card-title d-flex justify-content-between w-100">
									                            <!--begin::Search-->
									                            <div class="d-flex align-items-center position-relative my-1">
									                                <i class="ki-duotone ki-magnifier fs-3 position-absolute ms-5">
									                                    <span class="path1"></span>
									                                    <span class="path2"></span>
									                                </i>
									                                    <input type="text" data-kt-subscription-table-filter="search" class="form-control form-control-solid w-250px ps-12 me-3" placeholder="일감 검색" />
									                            </div>
									                             <div>
									                             	<c:set value="${ProjectRoleName}" var="Nm" />
									                             		<c:if test="${Nm eq 'M02'}">
									                                       <button id="registerButton" type="button" class="btn btn-primary">등록</button>
									                                    </c:if>
									                             </div>
									                            <!--end::Search-->
									                        </div>
									                    </div>
									                    <!--end::Card header-->
									                    <!--begin::Card body-->
									                    <div class="card-body pt-0">
									                        <!--begin::Table-->
									                        <table class="table align-middle table-row-dashed fs-6 gy-5" id="kt_subscriptions_table">
									                            <thead>
									                                <tr class="text-start text-muted fw-bold fs-7 text-uppercase gs-0">
									                                    <th class="min-w-50px">#</th>
 									                                    <th class="min-w-50px">일감 상태</th> 
									                                    <th class="min-w-50px">일감 순서</th>
 									                                    <th class="min-w-150px">일감 제목</th>
 									                                    <th class="min-w-80px">담당자</th> 
 									                                    <th class="min-w-80px m-10">수정(변경)일</th> 
									                                </tr>
									                            </thead>
									                            <tbody class="text-gray-600 fw-semibold">
									                            <c:set var="totalItems" value="${fn:length(workList)}" />
									                                	<c:forEach items="${workList}" var="work" varStatus="status"> 
											                               		<c:set var="worksNo" value="${work.worksNo}">
											                               		</c:set>
									                                		<tr class="text-start text-muted fw-bold fs-7 text-uppercase gs-0">
									                                	 		<c:set var="reverseIndex" value="${totalItems - status.index}" />
											                                    <td>${reverseIndex }</td>
											                                    <c:if test="${work.workSttusCode eq 'G01'}">
											                                    	<td><span class="badge badge-primary">진행중</span></td>
											                                    </c:if>
											                                    <c:if test="${work.workSttusCode eq 'G02'}">
											                                    	<td><span  class="badge badge-success">완료</span></td>
											                                    </c:if>
											                                    <c:if test="${work.workSttusCode eq 'G03'}">
											                                    	<td><span  class="badge badge-secondary">대기</span></td>
											                                    </c:if>
											                                    <c:if test="${work.workSttusCode eq 'G04'}">
											                                    	<td><span  class="badge badge-warning">보류</span></td>
											                                    </c:if>
											                                    <c:if test="${work.worksOrd eq 1}">
											                                    	<td class="text-primary">
											                                    	낮음&nbsp;<span class="ki-outline ki-graph-up text-primary"></span>
											                                    	</td>
											                                    </c:if>	
											                                    <c:if test="${work.worksOrd eq 2}">
											                                    	<td class="text-success">
											                                    	보통&nbsp;<span class="ki-outline ki-graph-up text-success"></span>
											                                    	</td>
											                                    </c:if>	
											                                    <c:if test="${work.worksOrd eq 3}">
											                                    	<td class="text-info">
											                                    	높음&nbsp;<span class="ki-outline ki-graph-up text-info"></span>
											                                    	</td>
											                                    </c:if>	
											                                    <c:if test="${work.worksOrd eq 4}">
											                                    	<td class="text-warning">
											                                    	긴급&nbsp;<span class="ki-outline ki-graph-up text-warning"></span>
											                                    	</td>
											                                    </c:if>	
											                                    <c:if test="${work.worksOrd eq 5}">
											                                    	<td class="text-danger">
											                                    	즉시&nbsp;<span class="ki-outline ki-graph-up text-danger"></span>
											                                    	</td>
											                                    </c:if>	
											                                    <td class="work_title text-muted text-hover-primary" data-worksno="${worksNo }">${work.worksTitle}</td>
											                                    <td>${work.emplNm2}</td>
											                                    <td>${work.modide}</td>
									                                		</tr>
									                                    </c:forEach> 
									                            </tbody>
									                        </table>
									                        <!--end::Table-->
									                    </div>
									                    <!--end::Card body-->
									                </div>
									                <!--end::Card-->
									            </div>
									            <!--end::Content container-->
									        </div>
									        <!--end::Content-->
									    </div>
									    <!-- 등록폼 -->
									<div id="registrationForm" class="flex-column flex-column-fluid p-4" style="display: none;">
									    <div class="card-title flex-column">
									        <h3 class="fw-bold mb-4">새 일감 등록</h3>
									    </div>
									    <div class="mb-4">
									        <label class="required fs-5 fw-semibold mb-2">일감 제목</label>
									        <input name="worksTitle" type="text" class="form-control" placeholder="일감 제목을 입력하세요" aria-label="Task Title" aria-describedby="basic-addon1"/>
									    </div>
									    <div class="mb-4">
									        <label class="required fs-5 fw-semibold mb-2">일감 설명</label>
									        <div id="worksCon" class="form-control" style="height: 150px;"></div>
									    </div>
									    <div class="container mb-4">
									        <div class="row mb-4">
									            <div class="d-flex justify-content-between w-100">
									                <div class="mb-0" style="width: 48%;">
									                    <label class="required fs-5 fw-semibold mb-2">일감 순서</label>
									                    <select id="worksOrd" class="form-select" data-control="select2" data-placeholder="순서를 선택하세요">
									                        <option></option>
									                        <option value="1">낮음</option>
									                        <option value="2">보통</option>
									                        <option value="3">높음</option>
									                        <option value="4">긴급</option>
									                        <option value="5">즉시</option>
									                    </select>
									                </div>
									                <div class="mb-0" style="width: 48%;">
									                    <label class="required fs-5 fw-semibold mb-2">담당자</label>
									                    <select id="prjctMbrNo2" class="form-select" data-control="select2" data-placeholder="담당자를 선택하세요">
									                        <option></option>
									                        <c:forEach items="${detailList}" var="dl">
									                            <c:forEach items="${dl.pjMemberVO}" var="pvo">
									                                <option value="${pvo.prjctMbrNo}">${pvo.empVO.emplNm}</option>
									                            </c:forEach>
									                        </c:forEach>
									                    </select>
									                </div>
									            </div>
									        </div>
									        <div class="row">
									            <div class="d-flex justify-content-between w-100">
									                <div class="mb-0" style="width: 48%;">
									                    <label for="kt_datepicker_1" class="form-label">일감 시작일</label>
									                    <input class="form-control" placeholder="Pick a date" id="kt_datepicker_1"/>
									                </div>
									                <div class="mb-0" style="width: 48%;">
									                    <label for="kt_datepicker_2" class="form-label">일감 종료일</label>
									                    <input class="form-control" placeholder="Pick a date" id="kt_datepicker_2"/>
									                </div>
									            </div>
									        </div>
									    </div>
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
									    <input type="hidden" name="prjctMbrNo" value="${kbsprjctMbrNo}" >
									    <!-- 등록 버튼 -->
									    <div class="d-flex justify-content-end">
									        <button id="insert_newwork_btn" type="button" class="btn btn-primary">등록</button>
									    </div>
									</div>
									    <!-- 등록폼 끝 -->
									    <!-- 상세조회 폼 -->
									    <div id="detail_work" class="app-content flex-column-fluid" style="display: none;">
											<div id="kt_app_content_container" class="app-container container-xxl">
												<div class="d-flex flex-column ">
														<div class="card">
															<div class="card-header align-items-center py-5 gap-5">
																<div class="d-flex">
																	<!-- 목록으로 -->
																	<a href="#" class="btn btn-sm btn-icon btn-clear btn-active-light-primary me-3" data-bs-toggle="back" data-bs-placement="top" title="Back">
																		<i class="ki-duotone ki-arrow-left fs-1 m-0">
																			<span class="path1"></span>
																			<span class="path2"></span>
																		</i>
																	</a>
																</div>
																<div class="d-flex align-items-center">
																	<!-- 글수정 -->
																	<a href="#" title="수정" data-bs-toggle="update" data-bs-placement="top" class="btn btn-sm btn-icon btn-light btn-active-light-primary me-2">
																		<i class="ki-duotone ki-message-edit fs-2 m-0">
																			<span class="path1"></span>
																			<span class="path2"></span>
																			<span class="path3"></span>
																		</i>
																	</a>
																	<!-- 글삭제 -->
																	<a href="#" title="삭제" data-bs-toggle="delete" data-bs-placement="top" class="btn btn-sm btn-icon btn-light btn-active-light-primary me-2">
																		<i class="ki-duotone ki-trash fs-2 m-0">
																			<span class="path1"></span>
																			<span class="path2"></span>
																			<span class="path3"></span>
																			<span class="path4"></span>
																			<span class="path5"></span>
																		</i>
																	</a>
																</div>
															</div>
															<div class="card-body">
																<!--begin::Title-->
																<div class="d-flex flex-wrap gap-2 justify-content-between mb-8">
																	<div class="d-flex align-items-center flex-wrap gap-2">
																		<!-- 게시글 제목 -->
																		<h2 id="detail_worksTitle" class="fw-bold me-3 my-1"></h2>
																		<input type="hidden" id="worksNoInput" name="detail_worksNo">
																	</div>
																	<div class="d-flex align-items-center flex-wrap gap-2">
																			<span id="detail_writede" class="fw-semibold text-muted text-end me-3"> </span>
																	</div>
																</div>
																<!--end::Title-->
																<!--begin::Message accordion-->
																<div data-kt-inbox-message="message_wrapper">
																	<!--begin::Message header-->
																	  <div class="d-flex flex-wrap gap-2 flex-stack" data-kt-inbox-message="header">
																	        <!--begin::Author-->
																	        <div class="d-flex align-items-center w-100">
																	            <div class="pe-5 w-100">
																	                <!--begin::Author details-->
																	                <div class="link-container">
																	                    <div class="link-column">
																	                        <div class="link-item">
																	                            <a href="#" class="fw-bold text-gray-900 text-hover-primary">상태:</a>
																	                            <span id="detail_workSttusCode"></span>
																	                        </div>
																	                        <div class="link-item">
																	                            <a href="#" class="fw-bold text-gray-900 text-hover-primary">우선 순위:</a>
																	                            <span id="detail_worksOrd">
																	                            </span>
																	                        </div>
																	                        <div class="link-item">
																	                            <a href="#" class="fw-bold text-gray-900 text-hover-primary">담당자:</a>
																	                            <span id="detail_prjctMbrNo2"></span>
																	                        </div>
																	                    </div>
																	                    <div class="link-column">
																	                        <div class="link-item">
																	                            <a href="#" class="fw-bold text-gray-900 text-hover-primary">일감 시작일:</a>
																	                            <span id="detail_bgnde"></span>
																	                        </div>
																	                        <div class="link-item">
																	                            <a href="#" class="fw-bold text-gray-900 text-hover-primary">일감 종료일:</a>
																	                            <span id="detail_closOn"></span>
																	                        </div>
																	                        <div class="link-item">
																	                            <a href="#" class="fw-bold text-gray-900 text-hover-primary">진척도:</a>
																	                            <span id="detail_progrsRt"></span>
																	                        </div>
																	                    </div>
																	                </div>
																	                <!--end::Author details-->
																	            </div>
																	        </div>
																	        <!--end::Author-->
																	    </div>
																	<!-- 구분선-->
																	<div class="separator my-6"></div>
																	<!-- 게시글 내용 -->
																	<input type="hidden" id="cn" value="" />
																	<div class="collapse fade show" data-kt-inbox-message="message">
																		<div id="sntncCnArea" class="py-5">작업 이력</div>
																	</div>
																</div>
																<!-- 구분선-->
																<div class="separator my-6"></div>
															</div>
														</div>
												</div>
											</div>
										</div>
									    <!-- 상세조회 폼끝 -->
									</div>
									<!-- 일감 tab 끝 -->
									
									<!-- 간트차트 시작 -->
									<div class="tab-pane fade" id="kt_tab_pane_4" role="tabpanel">
										<div id="gantt_here" style="height:500px; width:100%;"></div>
									</div>
									<!-- 간트차트 끝 -->
									
									<!-- 파일 시작 -->
									<div class="tab-pane fade" id="kt_tab_pane_5" role="tabpanel">
						<!--begin::Content wrapper-->
						<div class="d-flex flex-column flex-column-fluid">
							<!--begin::Toolbar-->
							<div id="kt_app_toolbar" class="app-toolbar py-3 py-lg-6">
								<!--begin::Toolbar container-->
								<div id="kt_app_toolbar_container" class="app-container container-xxl d-flex flex-stack">
									<!--begin::Page title-->
									<div class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
										<!--begin::Title-->
										<h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">자료실</h1>
										<!--end::Title-->
									</div>
									<!--end::Page title-->
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
										<!--begin::Card header-->
										<div class="card-header pt-8">
											<div class="card-title">
												<!--begin::Search-->
												<div class="d-flex align-items-center position-relative my-1">
													<i class="ki-duotone ki-magnifier fs-1 position-absolute ms-6">
														<span class="path1"></span>
														<span class="path2"></span>
													</i>
													<input type="text" data-kt-filemanager-table-filter="search" class="form-control form-control-solid w-250px ps-15" placeholder="파일 & 폴더 찾기" />
												</div>
												<!--end::Search-->
											</div>
											<!--begin::Card toolbar-->
											<div class="card-toolbar">
												<!--begin::Toolbar-->
												<div class="d-flex justify-content-end" data-kt-filemanager-table-toolbar="base">
													<!--begin::Export-->
													<button type="button" class="btn btn-flex btn-light-primary me-3" id="kt_file_manager_new_folder">
													<i class="ki-duotone ki-add-folder fs-2">
														<span class="path1"></span>
														<span class="path2"></span>
													</i>폴더 생성</button>
													<!--end::Export-->
													<!--begin::Add customer-->
													<button type="button" class="btn btn-flex btn-primary" data-bs-toggle="modal" data-bs-target="#kt_modal_upload">
													<i class="ki-duotone ki-folder-up fs-2">
														<span class="path1"></span>
														<span class="path2"></span>
													</i>파일 등록</button>
													<!--end::Add customer-->
												</div>
												<!--end::Toolbar-->
												<!--begin::Group actions-->
												<div class="d-flex justify-content-end align-items-center d-none" data-kt-filemanager-table-toolbar="selected">
													<div class="fw-bold me-5">
													<span class="me-2" data-kt-filemanager-table-select="selected_count"></span>Selected</div>
													<button type="button" class="btn btn-danger" data-kt-filemanager-table-select="delete_selected">선택 삭제</button>
												</div>
												<!--end::Group actions-->
											</div>
											<!--end::Card toolbar-->
										</div>
										<!--end::Card header-->
										<!--begin::Card body-->
										<div class="card-body">
											<!--begin::Table header-->
											<div class="d-flex flex-stack">
												<!--begin::Folder Stats-->
												<div class="badge badge-lg badge-primary">
													<span id="kt_file_manager_items_counter">총 파일 수 : ${attachCount}</span>
												</div>
												<!--end::Folder Stats-->
											</div>
											<!--end::Table header-->
											<!--begin::Table-->
											<table id="kt_file_manager_list" data-kt-filemanager-table="files" class="table align-middle table-row-dashed fs-6 gy-5">
												<thead>
													<tr class="text-start text-gray-500 fw-bold fs-7 text-uppercase gs-0">
														<th class="w-10px pe-2">
															<div class="form-check form-check-sm form-check-custom form-check-solid me-3">
																<input class="form-check-input" type="checkbox" data-kt-check="true" data-kt-check-target="#kt_file_manager_list .form-check-input" value="1" />
															</div>
														</th>
														<th class="min-w-250px">파일 이름</th>
														<th class="min-w-100px">파일 크기</th>
														<th class="min-w-125px">마지막 수정일</th>
														<th class="w-125px"></th>
													</tr>
												</thead>
												<tbody class="fw-semibold text-gray-600">
													<c:forEach items="${attachList}" var="attach">
													<c:url value="/attach/${attach.atchFileNo }/${attach.atchFileSeq }" var="downloadUrl"/>
													<tr>
														<td>
															<div class="form-check form-check-sm form-check-custom form-check-solid">
																<input class="form-check-input" type="checkbox" value="1" />
															</div>
														</td>
														<td>${attach.fileNm}</td>
														<td>${attach.fileSizeContraction}</td>
														<td>${attach.updDate}</td>
														<td class="text-end" data-kt-filemanager-table="action_dropdown">
															<div class="d-flex justify-content-end">
																<!--begin::More-->
																<div class="ms-2">
																	<button type="button" class="btn btn-sm btn-icon btn-light btn-active-light-primary" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">
																		<i class="ki-duotone ki-dots-square fs-5 m-0">
																			<span class="path1"></span>
																			<span class="path2"></span>
																			<span class="path3"></span>
																			<span class="path4"></span>
																		</i>
																	</button>
																	<!--begin::Menu-->
																	<div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-600 menu-state-bg-light-primary fw-semibold fs-7 w-150px py-4" data-kt-menu="true">
																		<!--begin::Menu item-->
																		<div class="menu-item px-3">
																			<a href="${downloadUrl}" class="menu-link px-3" >다운로드</a>
																		</div>
																		<!--end::Menu item-->
																		<!--begin::Menu item-->
																		<div class="menu-item px-3">
																			<a href="#" class="menu-link px-3" data-kt-filemanager-table="rename">이름 변경</a>
																		</div>
																		<!--end::Menu item-->
																		<!--begin::Menu item-->
																		<div class="menu-item px-3">
																			<a href="#" class="menu-link px-3" data-kt-filemanager-table-filter="move_row" data-bs-toggle="modal" data-bs-target="#kt_modal_move_to_folder">폴더 이동</a>
																		</div>
																		<!--end::Menu item-->
																		<!--begin::Menu item-->
																		<div class="menu-item px-3">
																			<a href="#" class="menu-link text-danger px-3" data-kt-filemanager-table-filter="delete_row">삭제</a>
																		</div>
																		<!--end::Menu item-->
																	</div>
																	<!--end::Menu-->
																</div>
																<!--end::More-->
															</div>
														</td>
													</tr>
													</c:forEach>
												</tbody>
											</table>
											<!--end::Table-->
										</div>
										<!--end::Card body-->
									</div>
									<!--end::Card-->
									<!--begin::Upload template-->
									<table class="d-none">
										<tr id="kt_file_manager_new_folder_row" data-kt-filemanager-template="upload">
											<td></td>
											<td id="kt_file_manager_add_folder_form" class="fv-row">
												<div class="d-flex align-items-center">
													<!--begin::Folder icon-->
													<span id="kt_file_manager_folder_icon">
														<i class="ki-duotone ki-folder fs-2x text-primary me-4">
															<span class="path1"></span>
															<span class="path2"></span>
														</i>
													</span>
													<!--end::Folder icon-->
													<!--begin:Input-->
													<input type="text" name="new_folder_name" placeholder="Enter the folder name" class="form-control mw-250px me-3" />
													<!--end:Input-->
													<!--begin:Submit button-->
													<button class="btn btn-icon btn-light-primary me-3" id="kt_file_manager_add_folder" onclick="newFolder()">
														<span class="indicator-label">
															<i class="ki-duotone ki-check fs-1"></i>
														</span>
														<span class="indicator-progress">
															<span class="spinner-border spinner-border-sm align-middle"></span>
														</span>
													</button>
													<!--end:Submit button-->
													<!--begin:Cancel button-->
													<button class="btn btn-icon btn-light-danger" id="kt_file_manager_cancel_folder">
														<span class="indicator-label">
															<i class="ki-duotone ki-cross fs-1">
																<span class="path1"></span>
																<span class="path2"></span>
															</i>
														</span>
														<span class="indicator-progress">
															<span class="spinner-border spinner-border-sm align-middle"></span>
														</span>
													</button>
													<!--end:Cancel button-->
												</div>
											</td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</table>
									<!--end::Upload template-->
									<!--begin::Rename template-->
									<div class="d-none" data-kt-filemanager-template="rename">
										<div class="fv-row">
											<div class="d-flex align-items-center">
												<span id="kt_file_manager_rename_folder_icon"></span>
												<input type="text" id="kt_file_manager_rename_input" name="rename_folder_name" placeholder="Enter the new folder name" class="form-control mw-250px me-3" value="" />
												<button class="btn btn-icon btn-light-primary me-3" id="kt_file_manager_rename_folder">
													<i class="ki-duotone ki-check fs-1"></i>
												</button>
												<button class="btn btn-icon btn-light-danger" id="kt_file_manager_rename_folder_cancel">
													<span class="indicator-label">
														<i class="ki-duotone ki-cross fs-1">
															<span class="path1"></span>
															<span class="path2"></span>
														</i>
													</span>
													<span class="indicator-progress">
														<span class="spinner-border spinner-border-sm align-middle"></span>
													</span>
												</button>
											</div>
										</div>
									</div>
									<!--end::Rename template-->
									<!--begin::Action template-->
									<div class="d-none" data-kt-filemanager-template="action">
										<div class="d-flex justify-content-end">
											<!--begin::Share link-->
											<div class="ms-2" data-kt-filemanger-table="copy_link">
												<button type="button" class="btn btn-sm btn-icon btn-light btn-active-light-primary" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">
													<i class="ki-duotone ki-fasten fs-5 m-0">
														<span class="path1"></span>
														<span class="path2"></span>
													</i>
												</button>
												<!--begin::Menu-->
												<div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-600 menu-state-bg-light-primary fw-semibold fs-7 w-300px" data-kt-menu="true">
													<!--begin::Card-->
													<div class="card card-flush">
														<div class="card-body p-5">
															<!--begin::Loader-->
															<div class="d-flex" data-kt-filemanger-table="copy_link_generator">
																<!--begin::Spinner-->
																<div class="me-5" data-kt-indicator="on">
																	<span class="indicator-progress">
																		<span class="spinner-border spinner-border-sm align-middle ms-2"></span>
																	</span>
																</div>
																<!--end::Spinner-->
																<!--begin::Label-->
																<div class="fs-6 text-gray-900">Generating Share Link...</div>
																<!--end::Label-->
															</div>
															<!--end::Loader-->
															<!--begin::Link-->
															<div class="d-flex flex-column text-start d-none" data-kt-filemanger-table="copy_link_result">
																<div class="d-flex mb-3">
																	<i class="ki-duotone ki-check fs-2 text-success me-3"></i>
																	<div class="fs-6 text-gray-900">Share Link Generated</div>
																</div>
																<input type="text" class="form-control form-control-sm" value="https://path/to/file/or/folder/" />
																<div class="text-muted fw-normal mt-2 fs-8 px-3">Read only. 
																<a href="apps/file-manager/settings/.html" class="ms-2">Change permissions</a></div>
															</div>
															<!--end::Link-->
														</div>
													</div>
													<!--end::Card-->
												</div>
												<!--end::Menu-->
											</div>
											<!--end::Share link-->
											<!--begin::More-->
											<div class="ms-2">
												<button type="button" class="btn btn-sm btn-icon btn-light btn-active-light-primary" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">
													<i class="ki-duotone ki-dots-square fs-5 m-0">
														<span class="path1"></span>
														<span class="path2"></span>
														<span class="path3"></span>
														<span class="path4"></span>
													</i>
												</button>
												<!--begin::Menu-->
												<div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-600 menu-state-bg-light-primary fw-semibold fs-7 w-150px py-4" data-kt-menu="true">
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<a href="#" class="menu-link px-3">Download File</a>
													</div>
													<!--end::Menu item-->
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<a href="#" class="menu-link px-3" data-kt-filemanager-table="rename">Rename</a>
													</div>
													<!--end::Menu item-->
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<a href="#" class="menu-link px-3" data-kt-filemanager-table-filter="move_row" data-bs-toggle="modal" data-bs-target="#kt_modal_move_to_folder">Move to folder</a>
													</div>
													<!--end::Menu item-->
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<a href="#" class="menu-link text-danger px-3" data-kt-filemanager-table-filter="delete_row">Delete</a>
													</div>
													<!--end::Menu item-->
												</div>
												<!--end::Menu-->
											</div>
											<!--end::More-->
										</div>
									</div>
									<!--end::Action template-->
									<!--begin::Checkbox template-->
									<div class="d-none" data-kt-filemanager-template="checkbox">
										<div class="form-check form-check-sm form-check-custom form-check-solid">
											<input class="form-check-input" type="checkbox" value="1" />
										</div>
									</div>
									<!--end::Checkbox template-->
									<!--begin::Modals-->
									<!--begin::Modal - Upload File-->
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
														<h2 class="fw-bold">Upload files</h2>
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
																	<a class="dropzone-select btn btn-sm btn-primary me-2">파일 업로드</a>
																	<a class="dropzone-upload btn btn-sm btn-light-primary me-2">전체 다운로드</a>
																	<a class="dropzone-remove-all btn btn-sm btn-light-primary">전체 삭제</a>
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
															<span class="form-text fs-6 text-muted">Max file size is 1MB per file.</span>
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
									<!--begin::Modal - New Product-->
									<div class="modal fade" id="kt_modal_move_to_folder" tabindex="-1" aria-hidden="true">
										<!--begin::Modal dialog-->
										<div class="modal-dialog modal-dialog-centered mw-650px">
											<!--begin::Modal content-->
											<div class="modal-content">
												<!--begin::Form-->
												<form class="form" action="#" id="kt_modal_move_to_folder_form">
													<!--begin::Modal header-->
													<div class="modal-header">
														<!--begin::Modal title-->
														<h2 class="fw-bold">폴더 이동</h2>
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
														<div class="form-group fv-row">
															<!--begin::Item-->
															 <c:forEach items="${files}" var="f">
													            <div class="d-flex">
													                <div class="form-check form-check-custom form-check-solid">
													                    <input class="form-check-input me-3" name="move_to_folder" type="radio" value="${f.path}" id="kt_modal_move_to_folder_${f.path}" />
													                    <label class="form-check-label" for="kt_modal_move_to_folder_${f.path}">
													                        <div class="fw-bold directory-item" data-path="${f.path}">
													                            <i class="ki-duotone ki-folder fs-2 text-primary me-2">
													                                <span class="path1"></span>
													                                <span class="path2"></span>
													                            </i>${f.name}
													                        </div>
													                    </label>
													                </div>
													            </div>
													            <div class='separator separator-dashed my-5'></div>
													        </c:forEach>
															<!--begin::Item-->
														</div>
														<!--end::Input group-->
														<!--begin::Action buttons-->
														<div class="d-flex flex-center mt-12">
															<!--begin::Button-->
															<button type="button" class="btn btn-primary" id="kt_modal_move_to_folder_submit">
																<span class="indicator-label">저장</span>
																<span class="indicator-progress">Please wait... 
																<span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
															</button>
															<!--end::Button-->
														</div>
														<!--begin::Action buttons-->
													</div>
													<!--end::Modal body-->
												</form>
												<!--end::Form-->
											</div>
										</div>
									</div>
									<!--end::Modal - Move file-->
									<!--end::Modals-->
								</div>
								<!--end::Content container-->
							</div>
							<!--end::Content-->
						</div>
						<!--end::Content wrapper-->
											
										
									</div>
									<!-- 파일 끝 -->
									
									<!-- 게시판 시작 -->
									<div class="tab-pane fade" id="kt_tab_pane_6" role="tabpanel">
										<!--  게시판 리스트 폼 -->
										<div id="postListForm" class="py-5">
										    <!--begin::Wrapper-->
										    <div class="d-flex flex-stack flex-wrap mb-5">
										        <!--begin::Search-->
										        <div class="d-flex align-items-center position-relative my-1 mb-2 mb-md-0">
										            <i class="ki-duotone ki-magnifier fs-1 position-absolute ms-6">
										                <span class="path1"></span><span class="path2"></span>
										            </i>
										            <input type="text" data-kt-docs-table-filter="search" class="form-control form-control-solid w-250px ps-15" placeholder="게시글 검색"/>
										        </div>
										        <!--end::Search-->
										
										        <!--begin::Toolbar-->
										        <div class="d-flex justify-content-end" data-kt-docs-table-toolbar="base">
										            <!--begin::Add customer-->
										            <button type="button" class="btn btn-primary" data-bs-toggle="tooltip" id="post_insert">
										                <i class="ki-duotone ki-plus fs-2"></i> 글쓰기
										            </button>
										            <!--end::Add customer-->
										        </div>
										        <!--end::Toolbar-->
										
										        <!--begin::Group actions-->
										        <div class="d-flex justify-content-end align-items-center d-none" data-kt-docs-table-toolbar="selected">
										            <div class="fw-bold me-5">
										                <span class="me-2" data-kt-docs-table-select="selected_count"></span> Selected
										            </div>
										            <button type="button" class="btn btn-danger" data-kt-docs-table-select="delete_selected">
										                Selection Action
										            </button>
										        </div>
										        <!--end::Group actions-->
										    </div>
										    <!--end::Wrapper-->
										
										    <!--begin::Datatable-->
										    <table id="kt_datatable_example_1" class="table align-middle table-row-dashed min-h-100px fs-6 gy-5">
										        <thead>
										            <tr class="text-start text-gray-500 fw-bold fs-7 text-uppercase gs-0">
										                <th class="min-w-50px">글번호</th>
										                <th class="min-w-300px">제목</th>
										                <th class="min-w-100px">작성자</th>
										                <th class="min-w-150px">작성일자</th>
										            </tr>
										        </thead>
										        <tbody class="text-gray-600 fw-semibold">
										        </tbody>
										    </table>
										    <!--end::Datatable-->
										</div>
									    <!--게시판 리스트 폼 끝-->
									    <!-- 게시글 등록폼 -->
										<div id="postInsertForm" class="flex-column flex-column-fluid p-4" style="display: none;">
										    <div class="card-title flex-column">
										        <h3 id="formTitle" class="fw-bold mb-4">새 게시글 작성</h3>
										    </div>
										    <div class="mb-4">
										        <label class="required fs-5 fw-semibold mb-2">글 제목</label>
										        <input name="sntncSj" type="text" class="form-control" placeholder="제목을 입력하세요" aria-label="Task Title" aria-describedby="basic-addon1"/>
										        <input type="hidden" name="post_prjctCode" value="${kbsPrjctCode}" data-post-prjctcode="post_prjctCode">
										        <input type="hidden" id="post_sntncNo" name="post_sntncNo">
										    </div>
										    <div class="mb-4">
										        <label class="required fs-5 fw-semibold mb-2">글 내용</label>
										        <div id="sntncCn" class="form-control" style="height: 300px; overflow-y: auto;">
										            <p><strong>1. 오늘 계획</strong></p>
										            <p><strong>2. 계획 대비 진행 현황</strong></p>
										            <p><strong>3. 지연 이슈</strong></p>
										            <p><strong>4. 이슈 대응 방안</strong></p>
										            <p><strong>5. 내일 계획</strong></p>
										            <p><strong>6. 비고</strong></p>
										            <p><em>일일업무일지 게시글의 제목은 다음과 같은 형식으로 함. ex) 04/22_김병수_업무일지</em></p>
										            <p><em>각 팀원은 상기 사항이 명시된 일일업무일지를 매일 오후 6시까지 작성함.</em></p>
										            <p><em>업무일지 작성전, 본인이 담당자로 지정된 업무(일감)의 진척도를 업데이트함.</em></p>
										            <p><em>1. 모든 팀원이 일지 작성 규칙에 따라주길 바랍니다.</em></p>
										            <p><em>팀장은 먼저 규칙준수에 모범을 보이고, 각 팀원들의 업무일지를 확인하여 일정을 관리하길 바랍니다.</em></p>
										            <p><em>2. 매일 작업의 종료시 작업 상황을 커밋하여 산출물을 최종 동기화해주길 바랍니다.</em></p>
										            <p><em>3. 등록된 일감 기한에 맞춰 일정이 차질없이 진행되길 바랍니다.</em></p>
										        </div>
										    </div>
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
											            <div class="dropzone dropzone-queue mb-2" id="kt_dropzonejs_example_4">
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
										    <!-- 등록 버튼 -->
										    <div class="d-flex justify-content-end">
										        <button id="insert_newpost_btn" type="button" class="btn btn-primary">등록</button>
										    </div>
										</div>
									<!-- 게시글 등록 폼 끝 -->
									<!-- 게시글 상세조회 폼 -->
										<div id="detail_post" class="app-content flex-column-fluid" style="display: none;">
											<div id="kt_app_content_container" class="app-container container-xxl">
												<div class="d-flex flex-column ">
														<div class="card">
															<div class="card-header align-items-center py-5 gap-5">
																<div class="d-flex">
																	<!-- 목록으로 -->
																	<a href="#" class="btn btn-sm btn-icon btn-clear btn-active-light-primary me-3" data-post-toggle="back" data-bs-placement="top" title="Back">
																		<i class="ki-duotone ki-arrow-left fs-1 m-0">
																			<span class="path1"></span>
																			<span class="path2"></span>
																		</i>
																	</a>
																</div>
																<div class="d-flex align-items-center">
																	<!-- 글수정 -->
																	<a href="#" title="수정" data-post-toggle="update" data-bs-placement="top" class="btn btn-sm btn-icon btn-light btn-active-light-primary me-2">
																		<i class="ki-duotone ki-message-edit fs-2 m-0">
																			<span class="path1"></span>
																			<span class="path2"></span>
																			<span class="path3"></span>
																		</i>
																	</a>
																	<!-- 글삭제 -->
																	<a href="#" title="삭제" data-post-toggle="delete" data-bs-placement="top" class="btn btn-sm btn-icon btn-light btn-active-light-primary me-2">
																		<i class="ki-duotone ki-trash fs-2 m-0">
																			<span class="path1"></span>
																			<span class="path2"></span>
																			<span class="path3"></span>
																			<span class="path4"></span>
																			<span class="path5"></span>
																		</i>
																	</a>
																</div>
															</div>
															<div class="card-body">
																<!--begin::Title-->
																<div class="d-flex flex-wrap gap-2 justify-content-between mb-8">
																	<div class="d-flex align-items-center flex-wrap gap-2">
																		<!-- 게시글 제목 -->
																		<h2 id="detail_postTitle" class="fw-bold me-3 my-1"></h2>
																		<input type="hidden" id="worksNoInput" name="detail_worksNo">
																	</div>
																	<div class="d-flex align-items-center flex-wrap gap-2">
																			<span class="fw-semibold text-end me-3">작성자:</span>
																			<span id="detail_writer" class="fw-semibold text-muted text-end me-3"></span>
																	</div>
																</div>
																<!--end::Title-->
																<!--begin::Message accordion-->
																<div data-kt-inbox-message="message_wrapper">
																	<!-- 구분선-->
																	<div class="separator my-6"></div>
																	<!-- 구분선 끝-->
																	<!-- 게시글 내용 -->
																	<input type="hidden" id="cn" value="" />
																	<div class="collapse fade show" data-kt-inbox-message="message">
																		<div id="detail_sntncCn" class="py-5">
																		</div>
																	</div>
																</div>
																<!-- 구분선-->
																<div class="separator my-6"></div>
															</div>
														</div>
												</div>
											</div>
										</div>
									<!-- 게시글 상세조회 폼끝 -->
									</div>
									<!-- 게시판 끝 -->
								</div>
									<!-- tab 컨텐츠 끝 -->
									<!--end::Row-->
									<!--end::Card-->
								</div>
								<!--end::Content container-->
							</div>
							<!--end::Content-->
						</div>
						<!--end::Content wrapper-->
<script src="${pageContext.request.contextPath }/resources/js/app/upload/fileUpload.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/app/upload/fileUpload2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/app/project/chartandcalendar.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/app/project/datatable.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/app/project/postDatatable.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/app/project/aboutWork.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/app/project/postCRUD.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/app/project/ganttChart.js"></script>
<script>
function newFolder(){
	let folder = document.querySelector('input[name=new_folder_name]').value;
	console.log("folder==>",folder);
	$.ajax({
		url:'/attach/createDirectory',
		method:'POST',
		contentType:'application/json',
		data:JSON.stringify(folder),
		success:function(resp){
			if(resp=='ok'){
				console.log("만세");
			}
		}
	})
}
document.addEventListener('DOMContentLoaded',()=>{
	var selectors = ['.myProjectStartDate3', '.myProjectEndDate4'];

	// 각 선택자에 해당하는 모든 요소를 선택합니다.
	selectors.forEach(function(selector) {
	    var elements = document.querySelectorAll(selector);

	    elements.forEach(function(element) {
	        var fullDateTime = element.textContent.trim();
	        var dateOnly = fullDateTime.split(' ')[0].split('T')[0];
	        element.textContent = dateOnly;
	    });
	});

    $(document).on('click', '.directory-item', function() {
        var path = $(this).data('path');
        console.log("path",path);
        var $this = $(this);
        console.log("$this",$this);
        $.ajax({
            url: '/attach/listSubDirectories/',
            method: 'GET',
            contentType:'application/json',
            data:JSON.stringify(path),
            success: function(resp) {
            	
            	console.log("resp",resp);
                var subDirHtml = '';
                $.each(resp, function(index, dir) {
                    subDirHtml += '<div class="directory-item" data-path="' + path + '/' + dir + '">' +
                                  '<i class="ki-duotone ki-folder fs-2 text-primary me-2">' +
                                  '<span class="path1"></span>' +
                                  '<span class="path2"></span>' +
                                  '</i>' + dir +
                                  '</div>' +
                                  '<div class="separator separator-dashed my-5"></div>';
                });
                $this.after(subDirHtml);
                $this.off('click'); // Prevent further clicks on the same item
            },
            error: function(xhr) {
                alert('하위 디렉토리를 불러오는 중 오류가 발생했습니다: ' + xhr.responseText);
            }
        });
    });
});
</script>