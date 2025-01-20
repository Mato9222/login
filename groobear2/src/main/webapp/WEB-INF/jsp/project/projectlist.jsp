<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>
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
										<h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">프로젝트</h1>
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
										</ul>
										<!--end::Breadcrumb-->
									</div>
									<!--end::Page title-->
									<!--begin::Actions-->
									<div class="d-flex align-items-center gap-2 gap-lg-3">
										<!--begin::Primary button-->
										<c:if test="${user.rspofcCode ne 'B01' }">
										<a href="/project/viewProjectForm" class="btn btn-sm fw-bold btn-primary">프로젝트 등록</a>
										</c:if>
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
									<!--begin::Stats-->
									<div class="row gx-6 gx-xl-9">
										<div class="col-lg-6 col-xxl-4">
											<!--begin::Card-->
											<div class="card h-100">
												<!--begin::Card body-->
												<div class="card-body p-9">
													<!--begin::Heading-->
													<div class="fs-3hx fw-bold">${sum}</div>
													<div class="fs-4 fw-semibold text-gray-500 mb-7">현 프로젝트 현황</div>
													<!--end::Heading-->
													<!--begin::Wrapper-->
													<div class="d-flex flex-wrap">
														<!--begin::Chart-->
														<div class="d-flex flex-center h-100px w-100px me-9 mb-5">
															<canvas id="kt_project_list_chart"></canvas>
														</div>
														<!--end::Chart-->
														<!--begin::Labels-->
														<div class="d-flex flex-column justify-content-center flex-row-fluid pe-11 mb-5">
															<!--begin::Label-->
															<div class="d-flex fs-6 fw-semibold align-items-center mb-3">
																<div class="bullet bg-warning me-3"></div>
																<div class="text-gray-500">진행중</div>
																<div id="projectZ02Count"class="ms-auto fw-bold text-gray-700">${two }</div>
															</div>
															<!--end::Label-->
															<!--begin::Label-->
															<div class="d-flex fs-6 fw-semibold align-items-center mb-3">
																<div class="bullet bg-success me-3"></div>
																<div class="text-gray-500">완료</div>
																<div id="projectZ03Count" class="ms-auto fw-bold text-gray-700">${three }</div>
															</div>
															<!--end::Label-->
															<!--begin::Label-->
															<div class="d-flex fs-6 fw-semibold align-items-center mb-3">
																<div class="bullet bg-primary 300 me-3"></div>
																<div class="text-gray-500">시작전</div>
																<div id="projectZ01Count" class="ms-auto fw-bold text-gray-700">${one }</div>
															</div>
															<div class="d-flex fs-6 fw-semibold align-items-center">
																<div class="bullet bg-danger 300 me-3"></div>
																<div class="text-gray-500">중단됨</div>
																<div id="projectZ04Count" class="ms-auto fw-bold text-gray-700">${four }</div>
															</div>
															<!--end::Label-->
														</div>
														<!--end::Labels-->
													</div>
													<!--end::Wrapper-->
												</div>
												<!--end::Card body-->
											</div>
											<!--end::Card-->
										</div>
										<div class="col-lg-6 col-xxl-4">
											<!--begin::Budget-->
											<div class="card h-100">
												<div class="card-body p-9">
													<canvas id="kt_chartjs_2" class="mh-400px"  style="height: 250px; width: 100%;"></canvas>
												</div>
											</div>
											<!--end::Budget-->
										</div>
										<div class="col-lg-6 col-xxl-4">
											<!--begin::Clients-->
											<div class="card h-100">
												<div class="card-body p-9">
													<canvas id="kt_chartjs_3" class="mh-400px" style="height: 250px; width: 100%;"></canvas>
												</div>
											</div>
											<!--end::Clients-->
										</div>
									</div>
									<!--end::Stats-->
									<!--begin::Toolbar-->
									<div class="d-flex flex-wrap flex-stack my-5">
											<div class="card-toolbar m-0">
												<!--begin::Tab nav-->
												<ul class="nav nav-stretch nav-line-tabs nav-line-tabs-2x border-transparent fs-5 fw-bold">
												    <li class="nav-item">
												        <a class="nav-link active" data-bs-toggle="tab" href="#kt_tab_pane_4">회사 프로젝트</a>
												    </li>
												    <li class="nav-item">
												        <a class="nav-link" data-bs-toggle="tab" href="#kt_tab_pane_5">나의 프로젝트</a>
												    </li>
												</ul>
												<!--end::Tab nav-->
											</div>
									</div>
									<!--end::Toolbar-->
									<!--begin::Row-->
									<div class="tab-content" id="myTabContent">
									    <div class="tab-pane fade show active" id="kt_tab_pane_4" role="tabpanel">
											<div class="row g-6 g-xl-9">
											<c:forEach items="${proList }" var="pj">
												<!--begin::Col-->
												<div class="col-md-6 col-xl-4">
													<!--begin::Card-->
													
														<!--begin::Card header-->
														<div class="card-header border-0 pt-9 d-flex justify-content-between align-items-center">
														    <!--begin::Card Title-->
														    <div class="card-title m-0 d-flex align-items-center">
														        <!--begin::Avatar-->
														        <div class="symbol symbol-100px w-100px bg-light me-3">
														            <img src="${pageContext.request.contextPath}/resources/demo1/assets/media/logos/logo.png" alt="image" class="p-3" />
														        </div>
														        <!--end::Avatar-->
														    </div>
														    <!--end::Card Title-->
														    <!--begin::Card toolbar-->
														    <div class="card-toolbar">
														    	<c:if test="${pj.prjctSttusCode eq 'Z01'}">
														        <span class="badge badge-light-primary fw-bold px-4 py-3">계획</span>
														        </c:if>
														    	<c:if test="${pj.prjctSttusCode eq 'Z02'}">
														        <span class="badge badge-light-warning fw-bold px-4 py-3">진행중</span>
														        </c:if>
														    	<c:if test="${pj.prjctSttusCode eq 'Z03'}">
														        <span class="badge badge-light-success fw-bold px-4 py-3">완료</span>
														        </c:if>
														    	<c:if test="${pj.prjctSttusCode eq 'Z04'}">
														        <span class="badge badge-light-danger fw-bold px-4 py-3">중단</span>
														        </c:if>
														    </div>
														    <!--end::Card toolbar-->
														</div>
														<!--end:: Card header-->
														<!--begin:: Card body-->
														<div class="card-body p-9">
															<div id="kt_activity_today" class="card-body p-0 tab-pane fade show active" role="tabpanel" aria-labelledby="kt_activity_today_tab">
															<!--begin::Name-->
															<div class="fs-3 fw-bold text-gray-900">
															<a href="${pageContext.request.contextPath}/project/detailProject/${pj.prjctCode}">${pj.prjctNm }</a>
															</div>
															<!--end::Name-->
															<!--begin::Description-->
															<p class="text-gray-500 fw-semibold fs-5 mt-1 mb-7">${pj.prjctDc }</p>
															<!--end::Description-->
															<!--begin::Info-->
															<div class="d-flex flex-wrap mb-5">
																<!--begin::Due-->
																<div class="border border-gray-300 border-dashed rounded min-w-125px py-3 px-4 me-7 mb-3">
																	<div class="fw-semibold text-gray-500">프로젝트 시작일자</div>
																	<div id="projectStartDate" class="fs-6 text-gray-800 fw-bold projectStartDate">${pj.prjctBgnde}</div>
																</div>
																<!--end::Due-->
																<!--begin::Budget-->
																<div class="border border-gray-300 border-dashed rounded min-w-125px py-3 px-4 mb-3">
																	<div class="fw-semibold text-gray-500">프로젝트 종료일자</div>
																	<div id="projectEndDate" class="fs-6 text-gray-800 fw-bold projectEndDate">${pj.prjctClosOn }</div>
																</div>
																<!--end::Budget-->
															</div>
															<!--end::Info-->
															<!--begin::Progress-->
															<div class="h-4px w-100 bg-light mb-5" data-bs-toggle="tooltip" title="This project 100% completed">
																<div class="bg-success rounded h-4px" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
															</div>
															<!--end::Progress-->
															<!--begin::Users-->
															<div class="symbol-group symbol-hover">
																<!--begin::User-->
																<c:forEach items="${pj.pjMemberVO }" var="memVO">
																		<div class="symbol symbol-circle symbol-50px">
		        															<img src="${pageContext.request.contextPath}/resources/image/${memVO.empVO.proflPhotoCours}" alt="image"/>
		    															</div>	
																</c:forEach>
															</div>
															<!--end::Users-->
															</div>
														</div>
														<!--end:: Card body-->
													<!--end::Card-->
												</div>
												<!--end::Col-->
												</c:forEach>
												<div class="card border-hover-primary"></div>
											</div>
									    </div>
									    <div class="tab-pane fade" id="kt_tab_pane_5" role="tabpanel">
									    	<div class="tab-pane fade show active" id="kt_tab_pane_4" role="tabpanel">
											<div class="row g-6 g-xl-9">
											<c:forEach items="${myProList }" var="mypj">
												<!--begin::Col-->
												<div class="col-md-6 col-xl-4">
													<!--begin::Card-->
														<!--begin::Card header-->
														<div class="card-header border-0 pt-9 d-flex justify-content-between align-items-center">
														    <!--begin::Card Title-->
														    <div class="card-title m-0 d-flex align-items-center">
														        <!--begin::Avatar-->
														        <div class="symbol symbol-100px w-100px bg-light me-3">
														            <img src="${pageContext.request.contextPath}/resources/demo1/assets/media/logos/logo.png" alt="image" class="p-3" />
														        </div>
														        <!--end::Avatar-->
														    </div>
														    <!--end::Card Title-->
														    <!--begin::Card toolbar-->
														    <div class="card-toolbar">
														        <c:if test="${mypj.prjctSttusCode eq 'Z01'}">
														        <span class="badge badge-light-primary fw-bold px-4 py-3">계획</span>
														        </c:if>
														    	<c:if test="${mypj.prjctSttusCode eq 'Z02'}">
														        <span class="badge badge-light-warning fw-bold px-4 py-3">진행중</span>
														        </c:if>
														    	<c:if test="${mypj.prjctSttusCode eq 'Z03'}">
														        <span class="badge badge-light-success fw-bold px-4 py-3">완료</span>
														        </c:if>
														    	<c:if test="${mypj.prjctSttusCode eq 'Z04'}">
														        <span class="badge badge-light-danger fw-bold px-4 py-3">중단</span>
														        </c:if>
														    </div>
														    <!--end::Card toolbar-->
														</div>
														<!--end:: Card header-->
														<!--begin:: Card body-->
														<div class="card-body p-9">
															<div id="kt_activity_today" class="card-body p-0 tab-pane fade show active" role="tabpanel" aria-labelledby="kt_activity_today_tab">
															<!--begin::Name-->
															<div class="fs-3 fw-bold text-gray-900">
																<a href="${pageContext.request.contextPath}/project/detailProject/${mypj.prjctCode}">${mypj.prjctNm }</a>
															</div>
															<!--end::Name-->
															<!--begin::Description-->
															<p class="text-gray-500 fw-semibold fs-5 mt-1 mb-7">${mypj.prjctDc }</p>
															<!--end::Description-->
															<!--begin::Info-->
															<div class="d-flex flex-wrap mb-5">
																<!--begin::Due-->
																<div class="border border-gray-300 border-dashed rounded min-w-125px py-3 px-4 me-7 mb-3">
																	<div class="fw-semibold text-gray-500">프로젝트 시작일자</div>
																	<div id="projectStartDate" class="fs-6 text-gray-800 fw-bold myProjectStartDate">${mypj.prjctBgnde}</div>
																</div>
																<!--end::Due-->
																<!--begin::Budget-->
																<div class="border border-gray-300 border-dashed rounded min-w-125px py-3 px-4 mb-3">
																	<div class="fw-semibold text-gray-500">프로젝트 종료일자</div>
																	<div id="projectEndDate" class="fs-6 text-gray-800 fw-bold myProjectEndDate">${mypj.prjctClosOn }</div>
																</div>
																<!--end::Budget-->
															</div>
															<!--end::Info-->
															<!--begin::Progress-->
															<div class="h-4px w-100 bg-light mb-5" data-bs-toggle="tooltip" title="This project 100% completed">
																<div class="bg-success rounded h-4px" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
															</div>
															<!--end::Progress-->
															<!--begin::Users-->
															<div class="symbol-group symbol-hover">
																<!--begin::User-->
																<c:forEach items="${mypj.pjMemberVO }" var="memVO">
																		<div class="symbol symbol-circle symbol-50px">
		        															<img src="${pageContext.request.contextPath}/resources/image/${memVO.empVO.proflPhotoCours}" alt="image"/>
		    															</div>	
																</c:forEach>
															</div>
															<!--end::Users-->
															</div>
														</div>
														<!--end:: Card body-->
													<!--end::Card-->
												</div>
												<!--end::Col-->
												</c:forEach>
												<div class="card border-hover-primary"></div>
											</div>
									    </div>
									    </div>
									</div>
									<!--end::Row-->
									
									<!--begin::Pagination-->
									<div class="d-flex flex-stack flex-wrap pt-10">
										<div class="fs-6 fw-semibold text-gray-700"></div>
										<!--begin::Pages-->
										<ul class="pagination">
											<li class="page-item previous">
												<a href="#" class="page-link">
													<i class="previous"></i>
												</a>
											</li>
											<li class="page-item active">
												<a href="#" class="page-link">1</a>
											</li>
											<li class="page-item">
												<a href="#" class="page-link">2</a>
											</li>
											<li class="page-item">
												<a href="#" class="page-link">3</a>
											</li>
											<li class="page-item">
												<a href="#" class="page-link">4</a>
											</li>
											<li class="page-item">
												<a href="#" class="page-link">5</a>
											</li>
											<li class="page-item">
												<a href="#" class="page-link">6</a>
											</li>
											<li class="page-item next">
												<a href="#" class="page-link">
													<i class="next"></i>
												</a>
											</li>
										</ul>
										<!--end::Pages-->
									</div>
									<!--end::Pagination-->
								</div>
								<!--end::Content container-->
							</div>
							<!--end::Content-->
						</div>
						<!--end::Content wrapper-->
<script>
	document.addEventListener('DOMContentLoaded',()=>{
		let one = ${one };
		let three = ${three };
        let sum = ${sum};
		var dateElements = document.querySelectorAll('.myProjectStartDate, .myProjectEndDate');
		var dateElements2 = document.querySelectorAll('.projectStartDate, .projectEndDate');
        
        // 각 요소에 대해 날짜만 추출하여 설정
        dateElements.forEach(function(element) {
            var fullDateTime = element.textContent.trim();
            var dateOnly = fullDateTime.split(' ')[0].split('T')[0];
            element.textContent = dateOnly;
        });
        // 각 요소에 대해 날짜만 추출하여 설정
        dateElements2.forEach(function(element) {
            var fullDateTime = element.textContent.trim();
            var dateOnly = fullDateTime.split(' ')[0].split('T')[0];
            element.textContent = dateOnly;
        });
     // 연별 그래프
        var ctx = document.getElementById('kt_chartjs_2');

        // Define colors
        var primaryColor = KTUtil.getCssVariableValue('--kt-primary');
        var dangerColor = KTUtil.getCssVariableValue('--kt-danger');

        // Define fonts
        var fontFamily = KTUtil.getCssVariableValue('--bs-font-sans-serif');

        // Chart labels
        const labels = ['2월', '3월', '4월', '5월', '6월'];

        // Chart data
        const data = {
            labels: labels,
            datasets: [
                {
                    label: '총 프로젝트 수주 수', // Label for the first dataset
                    data: [4, 6, 3, 8, sum], // Data for the first dataset
                    backgroundColor: primaryColor // Background color for bars in the first dataset
                },
                {
                    label: '프로젝트 완료 개수', // Label for the second dataset
                    data: [4, 5, 3, 6, three], // Data for the second dataset
                    backgroundColor: dangerColor // Background color for bars in the second dataset
                }
            ]
        };

        // Chart config
        const config = {
            type: 'line',
            data: data,
            options: {
                plugins: {
                    title: {
                        display: false,
                    }
                },
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        min: 0,
                        max: 10,
                        ticks: {
                            stepSize: 2,
                            callback: function(value) {
                                return Number.isInteger(value) ? value : '';
                            }
                        }
                    }
                }
            },
            defaults: {
                global: {
                    defaultFont: fontFamily
                }
            }
        };

        var myChart = new Chart(ctx, config);
	    
	    
	 // 파이 차트
	    var ctx1 = document.getElementById('kt_chartjs_3');

	    // Define colors
	    var successColor = KTUtil.getCssVariableValue('--kt-success');
	    var warningColor = KTUtil.getCssVariableValue('--kt-warning');
	    var infoColor = KTUtil.getCssVariableValue('--kt-info');

	    // Chart labels
	    const pieLabels = ['A사', 'B사', 'C사', 'D사', 'E사'];

	    // Chart data
	    const pieData = {
	        labels: pieLabels,
	        datasets: [{
	            label: '고객사별 프로젝트 수요(최근 5년간)',
	            data: [10, 13, 17, 12 , 19],
	            backgroundColor: [
	                '#FFC107', // 예시로 추가된 색상
	                /* '#03A9F4'  // 예시로 추가된 색상 */
	            ],
	            hoverOffset: 4
	        }]
	    };

	    // Chart config
	    const pieConfig = {
	        type: 'bar',
	        data: pieData,
	        options: {
	            plugins: {
	                title: {
	                    display: false,
	                }
	            },
	            responsive: true,
	        },
	        defaults:{
	            global: {
	                defaultFont: fontFamily
	            }
	        }
	    };

	    var myChart1 = new Chart(ctx1, pieConfig);
	    
	    const hash = window.location.hash;
	    if (hash === "#kt_tab_pane_5") {
	        const tab = document.querySelector('a[data-bs-toggle="tab"][href="' + hash + '"]');
	        const tabInstance = new bootstrap.Tab(tab);
	        tabInstance.show();
	        const target = document.querySelector(hash);
	        target.scrollIntoView({ behavior: "smooth" });
	    }
	})
    
</script>