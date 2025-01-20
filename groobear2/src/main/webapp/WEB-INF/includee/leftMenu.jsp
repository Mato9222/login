<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<security:authentication property="principal.realUser" var="realUser" />
					<!--begin::Sidebar-->
					<div id="kt_app_sidebar" class="app-sidebar flex-column" data-kt-drawer="true" data-kt-drawer-name="app-sidebar" data-kt-drawer-activate="{default: true, lg: false}" data-kt-drawer-overlay="true" data-kt-drawer-width="225px" data-kt-drawer-direction="start" data-kt-drawer-toggle="#kt_app_sidebar_mobile_toggle">
						<!--begin::Logo-->
						<div class="app-sidebar-logo px-6" id="kt_app_sidebar_logo">
							<a href="/">
								<img alt="Logo" src="${pageContext.request.contextPath}/resources/demo1/assets/media/logos/logo_dark_large.png" class="h-90px app-sidebar-logo-default" />
								<img alt="Logo" src="${pageContext.request.contextPath}/resources/demo1/assets/media/logos/logo_dark.png" class="h-40px app-sidebar-logo-minimize" />
							</a>
							<!--end::Logo image-->
							<!--begin::Sidebar toggle-->
							<!--begin::Minimized sidebar setup:
            if (isset($_COOKIE["sidebar_minimize_state"]) && $_COOKIE["sidebar_minimize_state"] === "on") { 
                1. "src/js/layout/sidebar.js" adds "sidebar_minimize_state" cookie value to save the sidebar minimize state.
                2. Set data-kt-app-sidebar-minimize="on" attribute for body tag.
                3. Set data-kt-toggle-state="active" attribute to the toggle element with "kt_app_sidebar_toggle" id.
                4. Add "active" class to to sidebar toggle element with "kt_app_sidebar_toggle" id.
            }
        -->
							<div id="kt_app_sidebar_toggle" class="app-sidebar-toggle btn btn-icon btn-shadow btn-sm btn-color-muted btn-active-color-primary h-30px w-30px position-absolute top-50 start-100 translate-middle rotate" data-kt-toggle="true" data-kt-toggle-state="active" data-kt-toggle-target="body" data-kt-toggle-name="app-sidebar-minimize">
								<i class="ki-duotone ki-black-left-line fs-3 rotate-180">
									<span class="path1"></span>
									<span class="path2"></span>
								</i>
							</div>
							<!--end::Sidebar toggle-->
						</div>
						<!--end::Logo-->
						<!--begin::sidebar menu-->
						<div class="app-sidebar-menu overflow-hidden flex-column-fluid">
							<!--begin::Menu wrapper-->
							<div id="kt_app_sidebar_menu_wrapper" class="app-sidebar-wrapper">
								<!--begin::Scroll wrapper-->
								<div id="kt_app_sidebar_menu_scroll" class="scroll-y my-5 mx-3" data-kt-scroll="true" data-kt-scroll-activate="true" data-kt-scroll-height="auto" data-kt-scroll-dependencies="#kt_app_sidebar_logo, #kt_app_sidebar_footer" data-kt-scroll-wrappers="#kt_app_sidebar_menu" data-kt-scroll-offset="5px" data-kt-scroll-save-state="true">
									<!--begin::Menu-->
									<div class="menu menu-column menu-rounded menu-sub-indention fw-semibold fs-6" id="#kt_app_sidebar_menu" data-kt-menu="true" data-kt-menu-expand="false">
										<!--begin:Menu item-->
										<div class="menu-item pt-5">
											<!--begin:Menu content-->
											<div class="menu-content">
												<span class="menu-heading fw-bold text-uppercase fs-7">메뉴</span>
											</div>
											<!--end:Menu content-->
										</div>
										<!--end:Menu item-->
										<!--begin:Menu item-->
										<div data-kt-menu-trigger="click" class="menu-item menu-accordion">
											<!--begin:Menu link-->
											<span class="menu-link">
												<span class="menu-icon">
													<i class="ki-duotone ki-sms fs-2">
														<span class="path1"></span>
														<span class="path2"></span>
													</i>
												</span>
												<span class="menu-title">메일함</span>
												<span class="menu-arrow"></span>
											</span>
											<!--end:Menu link-->
											<!--begin:Menu sub-->
											<div class="menu-sub menu-sub-accordion">
												<!--begin:Menu item-->
												<div class="menu-item">
													<!--begin:Menu link-->
													<a class="menu-link" href="${pageContext.request.contextPath}/mail/send">
														<span class="menu-bullet">
															<span class="bullet bullet-dot"></span>
														</span>
														<span class="menu-title">메일쓰기</span>
													</a>
													<!--end:Menu link-->
												</div>
												<!--end:Menu item-->
												<!--begin:Menu item-->
												<div class="menu-item">
													<!--begin:Menu link-->
													<a class="menu-link" href="${pageContext.request.contextPath}/mail">
														<span class="menu-bullet">
															<span class="bullet bullet-dot"></span>
														</span>
														<span class="menu-title">받은메일함</span>
														<span class="menu-badge">
															<span class="badge badge-success mailCount"></span>
														</span>
													</a>
													<!--end:Menu link-->
												</div>
												<!--end:Menu item-->
												<!--begin:Menu item-->
												<div class="menu-item">
													<!--begin:Menu link-->
													<a class="menu-link" href="${pageContext.request.contextPath}/mail/sendMailList">
														<span class="menu-bullet">
															<span class="bullet bullet-dot"></span>
														</span>
														<span class="menu-title">보낸메일함</span>
														<span class="menu-badge">
															<span class="badge badge-success"></span>
														</span>
													</a>
													<!--end:Menu link-->
												</div>
												<!--end:Menu item-->
												<!--begin:Menu item-->
												<div class="menu-item">
													<!--begin:Menu link-->
													<a class="menu-link" href="${pageContext.request.contextPath}/mail/tempList">
														<span class="menu-bullet">
															<span class="bullet bullet-dot"></span>
														</span>
														<span class="menu-title">임시보관함</span>
														<span class="menu-badge">
															<span class="badge badge-success tempCount"></span>
														</span>
													</a>
													<!--end:Menu link-->
												</div>
												<!--end:Menu item-->
												<!--begin:Menu item-->
												<div class="menu-item">
													<!--begin:Menu link-->
													<a class="menu-link" href="/mail/trashList">
														<span class="menu-bullet">
															<span class="bullet bullet-dot"></span>
														</span>
														<span class="menu-title">휴지통</span>
														<span class="menu-badge">
															<span class="badge badge-success"></span>
														</span>
													</a>
													<!--end:Menu link-->
												</div>
												<!--end:Menu item-->
												
											</div>
											<!--end:Menu sub-->
										</div>
										<!--end:Menu item-->										
										<div data-kt-menu-trigger="click" class="menu-item menu-accordion">
											<!--begin:Menu link-->
											<span class="menu-link">
												<span class="menu-icon">
													<i class="ki-duotone ki-notepad-edit fs-2">
														<span class="path1"></span>
														<span class="path2"></span>
														<span class="path3"></span>
														<span class="path4"></span>
													</i>
												</span>
												<span class="menu-title">전자결재</span>
												<span class="menu-arrow"></span>
											</span>										
										<!--begin:Menu item-->
										<div class="menu-sub menu-sub-accordion">
                                    <!--begin:Menu item-->
                                    <div class="menu-item">
                                       <!--begin:Menu link-->
                                       <a class="menu-link" href="#">
                                          <span class="menu-bullet">
                                             <span class="bullet bullet-dot"></span>
                                          </span>
                                          <span class="menu-title" data-bfs-toggle="modal" id="newModal" data-bgs-target="#kt_modal_invite_friends">결재라인 등록</span>
                                       </a>
                                       <!--end:Menu link-->
                                    </div>
                                    <!--end:Menu item-->
                                    <!--begin:Menu item-->
                                    <div class="menu-item">
                                       <!--begin:Menu link-->
                                       <a class="menu-link" href="#">
                                          <span class="menu-bullet">
                                             <span class="bullet bullet-dot"></span>
                                          </span>
                                          <span class="menu-title" data-bs-toggle="modal" data-bs-target="#kt_modal_new_sanction">새 결재 진행</span>
                                       </a>
                                       <!--end:Menu link-->
                                    </div>
                                    <!--end:Menu item-->
                                    <!--begin:Menu item-->
                                    <div class="menu-item">
                                       <!--begin:Menu link-->
                                       <a class="menu-link" href="/sanctionDoc/list">
                                          <span class="menu-bullet">
                                             <span class="bullet bullet-dot"></span>
                                          </span>
                                          <span class="menu-title">기안 진행 문서</span>
                                       </a>
                                       <!--end:Menu link-->
                                    </div>
                                    <div class="menu-item">
                                       <!--begin:Menu link-->
                                       <a class="menu-link" href="/sanctionList/finish">
                                          <span class="menu-bullet">
                                             <span class="bullet bullet-dot"></span>
                                          </span>
                                          <span class="menu-title">기안 완료 문서</span>
                                       </a>
                                       <!--end:Menu link-->
                                    </div>
                                    <!--end:Menu item-->
                                    <!--begin:Menu item-->
                                    <div class="menu-item">
                                       <!--begin:Menu link-->
                                       <a class="menu-link" href="/sanctionDoc/wait">
                                          <span class="menu-bullet">
                                             <span class="bullet bullet-dot"></span>
                                          </span>
                                          <span class="menu-title">결재 대기 문서</span>
                                       </a>
                                       <!--end:Menu link-->
                                    </div>
                                    <!--end:Menu item-->
                                    <!--begin:Menu item-->
                                    <div class="menu-item">
                                       <!--begin:Menu link-->
                                       <a class="menu-link" href="/sanctionList/receive">
                                          <span class="menu-bullet">
                                             <span class="bullet bullet-dot"></span>
                                          </span>
                                          <span class="menu-title">수신 문서</span>
                                       </a>
                                       <!--end:Menu link-->
                                    </div>
                                    <div class="menu-item">
                                       <!--begin:Menu link-->
                                       <a class="menu-link" href="/sanctionList/reference">
                                          <span class="menu-bullet">
                                             <span class="bullet bullet-dot"></span>
                                          </span>
                                          <span class="menu-title">참조 문서</span>
                                       </a>
                                       <!--end:Menu link-->
                                    </div>
                                    <!--end:Menu item-->
                                    <!--begin:Menu item-->
                                    <div class="menu-item">
                                       <!--begin:Menu link-->
                                       <a class="menu-link" href="/sanctionList/saveDocument">
                                          <span class="menu-bullet">
                                             <span class="bullet bullet-dot"></span>
                                          </span>
                                          <span class="menu-title">임시 저장 문서</span>
                                       </a>
                                       <!--end:Menu link-->
                                    </div>
                                    <div class="menu-item">
                                       <!--begin:Menu link-->
                                       <a class="menu-link" href="/sanctionList/sanctionBox">
                                          <span class="menu-bullet">
                                             <span class="bullet bullet-dot"></span>
                                          </span>
                                          <span class="menu-title">결재문서함</span>
                                       </a>
                                       <!--end:Menu link-->
                                    </div>
                                    <!--end:Menu item-->
                                    <!--begin:Menu item-->
                                    <div class="menu-item">
                                       <!--begin:Menu link-->
                                       <a class="menu-link" data-bs-toggle="modal" data-bs-target="#passwordAccess">
                                          <span class="menu-bullet">
                                             <span class="bullet bullet-dot"></span>
                                          </span>
                                          <span class="menu-title">전자 서명 설정</span>
                                       </a>
                                       <!--end:Menu link-->
                                    </div>
                                    <!--end:Menu item-->
                                 </div>
                                 </div>
										<!--begin:Menu item-->
										<div data-kt-menu-trigger="click" class="menu-item menu-accordion">
											<!--begin:Menu link-->
											<a class="menu-link" href="${pageContext.request.contextPath}/project/projectList">
												<span class="menu-icon">
													<i class="ki-duotone ki-cube-2 fs-2">
														<span class="path1"></span>
														<span class="path2"></span>
													</i>
												</span>
												<span class="menu-title">프로젝트</span>
											</a>
											<!--end:Menu link-->
										</div>
										<!--end:Menu item-->
										<!--begin:Menu item-->
										<div data-kt-menu-trigger="click" class="menu-item menu-accordion">
											<!--begin:Menu link-->
											<span class="menu-link">
												<span class="menu-icon">
													<i class="ki-duotone ki-directbox-default fs-2">
														<span class="path1"></span>
														<span class="path2"></span>
													</i>
												</span>
												<span class="menu-title">게시판</span>
												<span class="menu-arrow"></span>
											</span>
											<!--end:Menu link-->
											<!--begin:Menu sub-->
											<div class="menu-sub menu-sub-accordion">
												<!--begin:Menu item-->
												<div class="menu-item">
													<!--begin:Menu link-->
													<a class="menu-link" href="${pageContext.request.contextPath}/board/2">
														<span class="menu-bullet">
															<span class="bullet bullet-dot"></span>
														</span>
														<span class="menu-title">공지사항</span>
													</a>
													<!--end:Menu link-->
												</div>
												<!--end:Menu item-->
											</div>
											<!--end:Menu sub-->
											<!--begin:Menu sub-->
											<div class="menu-sub menu-sub-accordion">
												<!--begin:Menu item-->
												<div class="menu-item">
													<!--begin:Menu link-->
													<a class="menu-link" href="${pageContext.request.contextPath}/board/3">
														<span class="menu-bullet">
															<span class="bullet bullet-dot"></span>
														</span>
														<span class="menu-title">부서 게시판</span>
													</a>
													<!--end:Menu link-->
												</div>
												<!--end:Menu item-->
											</div>
											<!--end:Menu sub-->
										</div>
										<!--end:Menu item-->
										
										<!-- 자료실 -->
										<!--begin:Menu item-->
										<div data-kt-menu-trigger="click" class="menu-item menu-accordion">
											<!--begin:Menu link-->
											<a class="menu-link" href="${pageContext.request.contextPath}/reservation/reservationList">
												<span class="menu-icon">
													<i class="ki-duotone ki-timer fs-2">
														<span class="path1"></span>
														<span class="path2"></span>
														<span class="path3"></span>
													</i>
												</span>
												<span class="menu-title">예약/신청</span>
											</a>
											<!--end:Menu link-->
										</div>
										<!--end:Menu item-->
										<div class="menu-item">
											<!--begin:Menu link-->
											<a class="menu-link" href="${pageContext.request.contextPath}/schedule">
												<span class="menu-icon">
													<i class="ki-duotone ki-calendar-8 fs-2">
														<span class="path1"></span>
														<span class="path2"></span>
														<span class="path3"></span>
														<span class="path4"></span>
														<span class="path5"></span>
														<span class="path6"></span>
													</i>
												</span>
												<span class="menu-title">일정</span>
											</a>
											<!--end:Menu link-->
										</div>
										<!--end:Menu item-->
										<!--begin:Menu item-->
										<security:authorize access="${realUser.rspofcCodeNm eq '대표이사' }">
										<div class="menu-item">
											<!--begin:Menu link-->
											<a class="menu-link" href="${pageContext.request.contextPath}/employee/list">
												<span class="menu-icon">
													<i class="ki-duotone ki-people">
														<span class="path1"></span>
														<span class="path2"></span>
														<span class="path3"></span>
														<span class="path4"></span>
														<span class="path5"></span>
													</i>
												</span>
												<span class="menu-title">사원 목록</span>
											</a>
											<!--end:Menu link-->
										</div>										
										</security:authorize>
										<!--begin:Menu item-->
										<!--end:Menu item-->
									</div>
									<!--end::Menu-->
								</div>
								<!--end::Scroll wrapper-->
							</div>
							<!--end::Menu wrapper-->
						</div>
						<!--end::sidebar menu-->
						<!--begin::Footer-->
						<div class="app-sidebar-footer flex-column-auto pt-2 pb-6 px-6" id="kt_app_sidebar_footer">
							<a href="/logOut" class="btn btn-flex flex-center btn-custom btn-primary overflow-hidden text-nowrap px-0 h-40px w-100" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-dismiss-="click" title="200+ in-house components and 3rd-party plugins">
								<span class="btn-label">로그아웃</span>
								<i class="ki-duotone ki-document btn-icon fs-2 m-0">
									<span class="path1"></span>
									<span class="path2"></span>
								</i>
							</a>
						</div>
						<!--end::Footer-->
					</div>
					<!--end::Sidebar-->
					
<script>
document.addEventListener("DOMContentLoaded", () => {
	$.ajax({
		type: "get" ,
	    url: "/mail/count" ,
	    success: function(res) {
			let mailCount = res.mailCount;
			let tempCount = res.tempCount;
			
			$(".tempCount").append(tempCount);
			$(".mailCount").append(mailCount);
			
	    }
	})
})
</script>