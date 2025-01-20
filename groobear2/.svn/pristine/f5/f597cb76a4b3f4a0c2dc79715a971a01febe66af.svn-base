<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<security:authentication property="principal.realUser" var="realUser"/>
<!-- 비밀번호 검증 -->
<div class="modal fade" tabindex="-1" id="mypagePasswordAccess">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">비밀번호 인증</h3>
                <!--begin::Close-->
                <div class="btn btn-icon btn-sm btn-active-light-primary ms-2" data-bs-dismiss="modal" aria-label="Close">
                    <i class="ki-duotone ki-cross fs-1"><span class="path1"></span><span class="path2"></span></i>
                </div>
                <!--end::Close-->
            </div>
            <div class="modal-body">
               <input class="form-control form-control-lg form-control-solid"
                type="password" placeholder="비밀번호 입력" name="mypagePasswordAccess" autocomplete="off" />
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">닫기</button>
                <button type="button" id="mypageAccessBtn" class="btn btn-primary">인증</button>
            </div>
        </div>
    </div>
</div>
<!-- 비밀번호 검증 끝 -->
<!--begin::Modal - 부서 선택-->
<div class="modal fade" id="departmentOrganization" tabindex="-1" aria-hidden="true">
	<!--begin::Modal dialog-->
	<div class="modal-dialog mw-450px">
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
				<div class="modal-body pt-0 pb-10">
					<!--begin::Heading-->
					<div class="text-center mb-4">
						<!--begin::Title-->
						<h1>조직도</h1>
						<!--end::Title-->
					</div>
					<!--end::Heading-->
					<!--begin::Separator-->
					<div class="separator d-flex flex-center mb-4">
						<span class="text-uppercase bg-body fs-7 fw-semibold text-muted px-3"></span>
					</div>
					<!--end::Separator-->
					<div class="d-flex mb-3" style="flex-direction: column; align-items: center;">
						<div class="d-flex col-md-12 justify-content-center mb-3" style="align-items : center">
							<input type="text" class="form-control form-control-lg form-control-solid col-6" style="width : 60%" id="organizationSearch" value="">
							<button class="btn btn-primary ms-5" onclick="fSch()">검색</button>
						</div>
						<div class="col-md-12">
							<div class="tree-container" style="border-radius:20px">
								<h4>그루베어</h4>
								<div id="jstreeOrganization"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--end::Modal body-->
		</div>
		<!--end::Modal content-->
	</div>
	<!--end::Modal dialog-->
</div>
<!--end::Modal - 부서 선택-->
	<!--begin::Header-->
	<div id="kt_app_header" class="app-header" data-kt-sticky="true" data-kt-sticky-activate="{default: true, lg: true}" data-kt-sticky-name="app-header-minimize" data-kt-sticky-offset="{default: '200px', lg: '0'}" data-kt-sticky-animation="false">
		<!--begin::Header container-->
		<div class="app-container container-fluid d-flex align-items-stretch justify-content-between" id="kt_app_header_container">
			<!--begin::Mobile logo-->
			<div class="d-flex align-items-center flex-grow-1 flex-lg-grow-0">
				<a href="/" class="d-lg-none">
					<img alt="Logo" src="${pageContext.request.contextPath}/resources/demo1/assets/media/logos/logo.png" class="h-30px" />
				</a>
			</div>
			<!--end::Mobile logo-->
			<!--begin::Header wrapper-->
			<div class="d-flex align-items-stretch justify-content-between flex-lg-grow-1" id="kt_app_header_wrapper">
				<!--begin::Menu wrapper-->
				<div class="app-header-menu app-header-mobile-drawer align-items-stretch" data-kt-drawer="true" data-kt-drawer-name="app-header-menu" data-kt-drawer-activate="{default: true, lg: false}" data-kt-drawer-overlay="true" data-kt-drawer-width="250px" data-kt-drawer-direction="end" data-kt-drawer-toggle="#kt_app_header_menu_toggle" data-kt-swapper="true" data-kt-swapper-mode="{default: 'append', lg: 'prepend'}" data-kt-swapper-parent="{default: '#kt_app_body', lg: '#kt_app_header_wrapper'}">
					<!-- 대 메뉴 -->
					<!--begin::Menu-->
					<div id="kt_app_header_menu" data-kt-menu="true" class="menu menu-rounded menu-column menu-lg-row my-5 my-lg-0 align-items-stretch fw-semibold px-2 px-lg-0" >
						<!--begin:Menu item-->
						<div class="menu-item me-0 me-lg-2">
							<!--begin:Menu link-->
							<!--end:Menu link-->
						</div>
						<!--end:Menu item-->
					</div>
					<!--end::Menu-->
				</div>
				<!--end::Menu wrapper-->
				<!--begin::Navbar-->
				<div class="app-navbar flex-shrink-0">
					<!--begin::Search-->
					<div class="app-navbar-item align-items-stretch ms-1 ms-md-4">
						<div id="kt_header_search" class="header-search d-flex align-items-stretch" data-kt-search-keypress="true" data-kt-search-min-length="2" data-kt-search-enter="enter" data-kt-search-layout="menu" data-kt-menu-trigger="auto" data-kt-menu-overflow="false" data-kt-menu-permanent="true" data-kt-menu-placement="bottom-end">
							<div class="d-flex align-items-center" data-kt-search-element="toggle" id="kt_header_search_toggle" style="font-size: medium;">
								<span class="text-primary" style="font-weight: bolder;">${realUser.emplNm } ${realUser.rspofcCodeNm }</span><span>님 반갑습니다</span>
							</div>
						</div>
					</div>
					<div class="app-navbar-item align-items-stretch ms-1 ms-md-4">
						<!--begin::Search-->
						<div id="kt_header_search" class="header-search d-flex align-items-stretch" data-kt-search-keypress="true" data-kt-search-min-length="2" data-kt-search-enter="enter" data-kt-search-layout="menu" data-kt-menu-trigger="auto" data-kt-menu-overflow="false" data-kt-menu-permanent="true" data-kt-menu-placement="bottom-end">
							<!--begin::Search toggle-->
							<div class="d-flex align-items-center" data-kt-search-element="toggle" id="kt_header_search_toggle">
							<div class="btn btn-icon btn-custom btn-icon-muted btn-active-light btn-active-color-primary w-35px h-35px">
								<button type="button" style="-webkit-appearance: none; -moz-appearance: none; appearance: none; background-color: transparent; border: 0;" id="selectOrganization">
									<i class="bi bi-diagram-3-fill"></i>
								</button>
							</div>
							</div>
							<!--end::Search toggle-->
						</div>
						<!--end::Search-->
					</div>
					<!--begin::Chat-->
					<div class="app-navbar-item ms-1 ms-md-4">
						<!--begin::Menu wrapper-->
						<div class="btn btn-icon btn-custom btn-icon-muted btn-active-light btn-active-color-primary w-35px h-35px position-relative">
							<button type="button" style="-webkit-appearance: none; -moz-appearance: none; appearance: none; background-color: transparent; border: 0;" id="goChatting">
								<i class="ki-duotone ki-message-text-2 fs-2">
									<span class="path1"></span>
									<span class="path2"></span>
									<span class="path3"></span>
								</i>
							</button>
							<span class="bullet bullet-dot bg-success h-6px w-6px position-absolute translate-middle top-0 start-50 animation-blink"></span>
						</div>
						<!--end::Menu wrapper-->
					</div>
					<!--end::Chat-->					
					<div class="app-navbar-item align-items-stretch ms-1 ms-md-4">
						<!--begin::Search-->
						<div id="kt_header_search" class="header-search d-flex align-items-stretch" data-kt-search-keypress="true" data-kt-search-min-length="2" data-kt-search-enter="enter" data-kt-search-layout="menu" data-kt-menu-trigger="auto" data-kt-menu-overflow="false" data-kt-menu-permanent="true" data-kt-menu-placement="bottom-end">
							<!--begin::Search toggle-->
							<div class="d-flex align-items-center" data-kt-search-element="toggle" id="kt_header_search_toggle">
								<div class="btn btn-icon btn-custom btn-icon-muted btn-active-light btn-active-color-primary w-35px h-35px">
									<i class="ki-duotone ki-magnifier fs-2">
										<span class="path1"></span>
										<span class="path2"></span>
									</i>
								</div>
							</div>
							<!--end::Search toggle-->
						</div>
						<!--end::Search-->
					</div>
					<!--end::Search-->
					<!--begin::Activities-->
					<div class="app-navbar-item ms-1 ms-md-4">
						<!--begin::Drawer toggle-->
						<div class="btn btn-icon btn-custom btn-icon-muted btn-active-light btn-active-color-primary w-35px h-35px">
							<i class="ki-duotone ki-messages fs-2">
								<span class="path1"></span>
								<span class="path2"></span>
								<span class="path3"></span>
								<span class="path4"></span>
								<span class="path5"></span>
							</i>
						</div>
						<!--end::Drawer toggle-->
					</div>
					<!--end::Activities-->
					<!--begin::Notifications-->
					<div class="app-navbar-item ms-1 ms-md-4">
						<!--begin::Menu- wrapper-->
						<div class="btn btn-icon btn-custom btn-icon-muted btn-active-light btn-active-color-primary w-35px h-35px" data-kt-menu-trigger="{default: 'click', lg: 'hover'}" data-kt-menu-attach="parent" data-kt-menu-placement="bottom-end" id="kt_menu_item_wow">
							<i class="ki-duotone ki-notification-status fs-2">
								<span class="path1"></span>
								<span class="path2"></span>
								<span class="path3"></span>
								<span class="path4"></span>
							</i>
						</div>
						<!--end::Menu wrapper-->
					</div>
					<!--end::Notifications-->
					<!--begin::My apps links-->
					<div class="app-navbar-item ms-1 ms-md-4">
						<!--begin::Menu wrapper-->
						<div class="btn btn-icon btn-custom btn-icon-muted btn-active-light btn-active-color-primary w-35px h-35px" data-kt-menu-trigger="{default: 'click', lg: 'hover'}" data-kt-menu-attach="parent" data-kt-menu-placement="bottom-end">
							<i class="ki-duotone ki-element-11 fs-2">
								<span class="path1"></span>
								<span class="path2"></span>
								<span class="path3"></span>
								<span class="path4"></span>
							</i>
						</div>
						<!--end::Menu wrapper-->
					</div>
					<!--end::My apps links-->
					<!--begin::Theme mode-->
					<div class="app-navbar-item ms-1 ms-md-4">
						<!--begin::Menu toggle-->
						<a href="#" class="btn btn-icon btn-custom btn-icon-muted btn-active-light btn-active-color-primary w-35px h-35px" data-kt-menu-trigger="{default:'click', lg: 'hover'}" data-kt-menu-attach="parent" data-kt-menu-placement="bottom-end">
							<i class="ki-duotone ki-night-day theme-light-show fs-1">
								<span class="path1"></span>
								<span class="path2"></span>
								<span class="path3"></span>
								<span class="path4"></span>
								<span class="path5"></span>
								<span class="path6"></span>
								<span class="path7"></span>
								<span class="path8"></span>
								<span class="path9"></span>
								<span class="path10"></span>
							</i>
							<i class="ki-duotone ki-moon theme-dark-show fs-1">
								<span class="path1"></span>
								<span class="path2"></span>
							</i>
						</a>
						<!--begin::Menu toggle-->
						<!--begin::Menu-->
						<div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-title-gray-700 menu-icon-gray-500 menu-active-bg menu-state-color fw-semibold py-4 fs-base w-150px" data-kt-menu="true" data-kt-element="theme-mode-menu">
							<!--begin::Menu item-->
							<div class="menu-item px-3 my-0">
								<a href="#" class="menu-link px-3 py-2" data-kt-element="mode" data-kt-value="light">
									<span class="menu-icon" data-kt-element="icon">
										<i class="ki-duotone ki-night-day fs-2">
											<span class="path1"></span>
											<span class="path2"></span>
											<span class="path3"></span>
											<span class="path4"></span>
											<span class="path5"></span>
											<span class="path6"></span>
											<span class="path7"></span>
											<span class="path8"></span>
											<span class="path9"></span>
											<span class="path10"></span>
										</i>
									</span>
									<span class="menu-title">Light</span>
								</a>
							</div>
							<!--end::Menu item-->
							<!--begin::Menu item-->
							<div class="menu-item px-3 my-0">
								<a href="#" class="menu-link px-3 py-2" data-kt-element="mode" data-kt-value="dark">
									<span class="menu-icon" data-kt-element="icon">
										<i class="ki-duotone ki-moon fs-2">
											<span class="path1"></span>
											<span class="path2"></span>
										</i>
									</span>
									<span class="menu-title">Dark</span>
								</a>
							</div>
							<!--end::Menu item-->
							<!--begin::Menu item-->
							<div class="menu-item px-3 my-0">
								<a href="#" class="menu-link px-3 py-2" data-kt-element="mode" data-kt-value="system">
									<span class="menu-icon" data-kt-element="icon">
										<i class="ki-duotone ki-screen fs-2">
											<span class="path1"></span>
											<span class="path2"></span>
											<span class="path3"></span>
											<span class="path4"></span>
										</i>
									</span>
									<span class="menu-title">System</span>
								</a>
							</div>
							<!--end::Menu item-->
						</div>
						<!--end::Menu-->
					</div>
					<!--end::Theme mode-->
					<!--begin::User menu-->
					<div class="app-navbar-item ms-1 ms-md-4" id="kt_header_user_menu_toggle">
						<!--begin::Menu wrapper-->
						<div class="cursor-pointer symbol symbol-35px" data-kt-menu-trigger="{default: 'click', lg: 'hover'}" data-kt-menu-attach="parent" data-kt-menu-placement="bottom-end">
							<img src="${pageContext.request.contextPath}/resources/image/${realUser.proflPhotoCours}" class="rounded-3" alt="user" />
						</div>
						<!--begin::User account menu-->
						<div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg menu-state-color fw-semibold py-4 fs-6 w-275px" data-kt-menu="true">
							<!--begin::Menu item-->
							<div class="menu-item px-3">
								<div class="menu-content d-flex align-items-center px-3">
									<!--begin::Avatar-->
									<div class="symbol symbol-50px me-5">
										<img alt="Logo" src="${pageContext.request.contextPath}/resources/image/${realUser.proflPhotoCours}" />
									</div>
									<!--end::Avatar-->
									<!--begin::Username-->
									<div class="d-flex flex-column">
										<div class="fw-bold d-flex align-items-center fs-5">${realUser.emplNm } 
										<span class="badge badge-light-success fw-bold fs-8 px-2 py-1 ms-2">${realUser.ofcpsCodeNm }</span></div>
										<a href="#" class="fw-semibold text-muted text-hover-primary fs-7">${realUser.emailAdres }</a>
									</div>
									<!--end::Username-->
								</div>
							</div>
							<!--end::Menu item-->
							<!--begin::Menu separator-->
							<div class="separator my-2"></div>
							<!--end::Menu separator-->
							<!--begin::Menu item-->
							<div class="menu-item px-5">
								<a href="${pageContext.request.contextPath}/attendance" class="menu-link px-5">근태정보</a>
							</div>
							<div class="menu-item px-5">
								<a data-bs-toggle="modal" data-bs-target="#mypagePasswordAccess" class="menu-link px-5">마이페이지</a>
							</div>
							<!--end::Menu item-->
							<!--begin::Menu item-->
							<div class="menu-item px-5">
		                        <a href="${pageContext.request.contextPath}/project/projectList#kt_tab_pane_5" class="menu-link px-5">
		                           <span class="menu-text">나의 프로젝트</span>
		                        </a>
	                     	</div>
							<!--end::Menu item-->
							<div class="menu-item px-5">
								<a href="${pageContext.request.contextPath}/reservation/reservationList" class="menu-link px-5">
									<span class="menu-title">내 예약</span>
								</a>
							</div>
							<!--begin::Menu item-->
							<div class="menu-item px-5">
								<a href="${pageContext.request.contextPath}/schedule" class="menu-link px-5">
									<span class="menu-title">내 일정</span>
								</a>
							</div>
							<!--end::Menu item-->
							<!--begin::Menu item-->
							<div class="menu-item px-5">
								<a href="${pageContext.request.contextPath}/adrs/List" class="menu-link px-5">주소록</a>
							</div>
							<!--end::Menu item-->
							<!--begin::Menu separator-->
							<div class="menu-item px-5" data-kt-menu-trigger="{default: 'click', lg: 'hover'}" data-kt-menu-placement="left-start" data-kt-menu-offset="-15px, 0">
								<a href="#" class="menu-link px-5">
									<span class="menu-title position-relative">화면모드 
									<span class="ms-5 position-absolute translate-middle-y top-50 end-0">
										<i class="ki-duotone ki-night-day theme-light-show fs-2">
											<span class="path1"></span>
											<span class="path2"></span>
											<span class="path3"></span>
											<span class="path4"></span>
											<span class="path5"></span>
											<span class="path6"></span>
											<span class="path7"></span>
											<span class="path8"></span>
											<span class="path9"></span>
											<span class="path10"></span>
										</i>
										<i class="ki-duotone ki-moon theme-dark-show fs-2">
											<span class="path1"></span>
											<span class="path2"></span>
										</i>
									</span></span>
								</a>
								<!--begin::Menu-->
								<div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-title-gray-700 menu-icon-gray-500 menu-active-bg menu-state-color fw-semibold py-4 fs-base w-150px" data-kt-menu="true" data-kt-element="theme-mode-menu">
									<!--begin::Menu item-->
									<div class="menu-item px-3 my-0">
										<a href="#" class="menu-link px-3 py-2" data-kt-element="mode" data-kt-value="light">
											<span class="menu-icon" data-kt-element="icon">
												<i class="ki-duotone ki-night-day fs-2">
													<span class="path1"></span>
													<span class="path2"></span>
													<span class="path3"></span>
													<span class="path4"></span>
													<span class="path5"></span>
													<span class="path6"></span>
													<span class="path7"></span>
													<span class="path8"></span>
													<span class="path9"></span>
													<span class="path10"></span>
												</i>
											</span>
											<span class="menu-title">Light</span>
										</a>
									</div>
									<!--end::Menu item-->
									<!--begin::Menu item-->
									<div class="menu-item px-3 my-0">
										<a href="#" class="menu-link px-3 py-2" data-kt-element="mode" data-kt-value="dark">
											<span class="menu-icon" data-kt-element="icon">
												<i class="ki-duotone ki-moon fs-2">
													<span class="path1"></span>
													<span class="path2"></span>
												</i>
											</span>
											<span class="menu-title">Dark</span>
										</a>
									</div>
									<!--end::Menu item-->
									<!--begin::Menu item-->
									<div class="menu-item px-3 my-0">
										<a href="#" class="menu-link px-3 py-2" data-kt-element="mode" data-kt-value="system">
											<span class="menu-icon" data-kt-element="icon">
												<i class="ki-duotone ki-screen fs-2">
													<span class="path1"></span>
													<span class="path2"></span>
													<span class="path3"></span>
													<span class="path4"></span>
												</i>
											</span>
											<span class="menu-title">System</span>
										</a>
									</div>
									<!--end::Menu item-->
								</div>
								<!--end::Menu-->
							</div>
							<div class="separator my-2"></div>
							<!--end::Menu separator-->
							<!--begin::Menu item-->
							<!--end::Menu item-->
							<!--begin::Menu item-->
							<div class="menu-item px-5">
								<a href="/logOut" class="menu-link px-5">로그아웃</a>
							</div>
							<!--end::Menu item-->
						</div>
						<!--end::User account menu-->
						<!--end::Menu wrapper-->
					</div>
					<!--end::User menu-->
					<!--begin::Header menu toggle-->
					<div class="app-navbar-item d-lg-none ms-2 me-n2" title="Show header menu">
						<div class="btn btn-flex btn-icon btn-active-color-primary w-30px h-30px" id="kt_app_header_menu_toggle">
							<i class="ki-duotone ki-element-4 fs-1">
								<span class="path1"></span>
								<span class="path2"></span>
							</i>
						</div>
					</div>
					<!--end::Header menu toggle-->
					<!--begin::Aside toggle-->
					<!--end::Header menu toggle-->
				</div>
				<!--end::Navbar-->
			</div>
			<!--end::Header wrapper-->
		</div>
		<!--end::Header container-->
	</div>
	<!--end::Header-->

	<script>

	</script>