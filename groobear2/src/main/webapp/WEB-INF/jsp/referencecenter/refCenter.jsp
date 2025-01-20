<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!-- 여기부터 JSP로 만들기 -->
<!-- 메인 영역 -->
<div class="app-main flex-column flex-row-fluid" id="kt_app_main">
	<!--begin::Content wrapper-->
	<div class="d-flex flex-column flex-column-fluid">
		<!--begin::Content-->
		<div id="kt_app_content" class="app-content flex-column-fluid">
			<!--begin::Content container-->
			<div id="kt_app_content_container" class="app-container container-xxl">
				<!-- 카드 대문 영역 -->
				<div class="card card-flush pb-0 bgi-position-y-center bgi-no-repeat mb-10" style="background-size: auto calc(100% + 10rem); background-position-x: 100%; background-image: url('${pageContext.request.contextPath}/resources/demo1/assets/media/illustrations/sketchy-1/4.png')">
					<!--begin::Card header-->
					<div class="card-header pt-10">
						<div class="d-flex align-items-center">
							<!--begin::Icon-->
							<div class="symbol symbol-circle me-5">
								<div class="symbol-label bg-transparent text-primary border border-secondary border-dashed">
									<i class="ki-duotone ki-abstract-47 fs-2x text-primary">
										<span class="path1"></span>
										<span class="path2"></span>
									</i>
								</div>
							</div>
							<!--end::Icon-->
							<!--begin::Title-->
							<div class="d-flex flex-column">
								<h2 class="mb-1">File Manager</h2>
								<div class="text-muted fw-bold">
									99999999999 GB 
									<span class="mx-3">|</span>
									99999999999 items
								</div>
							</div>
							<!--end::Title-->
						</div>
					</div>
					<!--end::Card header-->
					<!--begin::Card body-->
					<div class="card-body pb-0">
						<!--begin::Navs-->
						<div class="d-flex overflow-auto h-55px">
							<ul class="nav nav-stretch nav-line-tabs nav-line-tabs-2x border-transparent fs-5 fw-semibold flex-nowrap">
								<!--begin::Nav item-->
								<li class="nav-item">
									<a class="nav-link text-active-primary me-6 active" href="#">Files</a>
								</li>
								<!--end::Nav item-->
							</ul>
						</div>
						<!--begin::Navs-->
					</div>
					<!--end::Card body-->
				</div>
				<div class="card card-flush">
					<!-- 카드 헤더 영역 -->
					<div class="card-header pt-8">
						<div class="card-title">
							<!-- 검색 영역 -->
							<div class="d-flex align-items-center position-relative my-1">
								<i class="ki-duotone ki-magnifier fs-1 position-absolute ms-6">
									<span class="path1"></span>
									<span class="path2"></span>
								</i>
								<input type="text" data-kt-filemanager-table-filter="search" class="form-control form-control-solid w-250px ps-15" placeholder="Search Files & Folders" />
							</div>
						</div>
						<div class="card-toolbar">
							<div class="d-flex justify-content-end" data-kt-filemanager-table-toolbar="base">
								<!-- 새폴더 버튼 -->
								<button type="button" class="btn btn-flex btn-light-primary me-3" id="kt_file_manager_new_folder">
								<i class="ki-duotone ki-add-folder fs-2">
									<span class="path1"></span>
									<span class="path2"></span>
								</i>새폴더</button>
								<!-- 파일 업로드 버튼 -->
								<button type="button" class="btn btn-flex btn-primary" data-bs-toggle="modal" data-bs-target="#kt_modal_upload">
								<i class="ki-duotone ki-folder-up fs-2">
									<span class="path1"></span>
									<span class="path2"></span>
								</i>파일 업로드</button>
							</div>
							<!-- 파일 삭제 버튼 -->
							<div class="d-flex justify-content-end align-items-center d-none" data-kt-filemanager-table-toolbar="selected">
								<div class="fw-bold me-5">
								<span class="me-2" data-kt-filemanager-table-select="selected_count"></span>선택됨</div>
								<button type="button" class="btn btn-danger" data-kt-filemanager-table-select="delete_selected">선택 삭제</button>
							</div>
						</div>
					</div>


					<!--begin::Card body-->
					<div class="card-body">
						<!-- 폴더 경로 표시, 아이템 갯수 표시 -->
						<div class="d-flex flex-stack">
							<!-- 폴더 경로 표시 -->
							<div class="badge badge-lg badge-light-primary">
								<div class="d-flex align-items-center flex-wrap">
								<i class="ki-duotone ki-abstract-32 fs-2 text-primary me-3">
									<span class="path1"></span>
									<span class="path2"></span>
								</i>
								<a href="#">경로1</a>
								<i class="ki-duotone ki-right fs-2 text-primary mx-1"></i>
								<a href="#">경로2</a>
								<i class="ki-duotone ki-right fs-2 text-primary mx-1"></i>
								<a href="#">경로3</a>
								<i class="ki-duotone ki-right fs-2 text-primary mx-1"></i>현재폴더</div>
								${path}
							</div>
							<!-- 아이템 갯수 표시 -->
							<div class="badge badge-lg badge-primary">
								<span id="kt_file_manager_items_counter"> items</span>
							</div>
						</div>
						<!--end::Table header-->
						<!-- 파일 테이블 -->
						<table id="kt_file_manager_list" data-kt-filemanager-table="folders" class="table align-middle table-row-dashed fs-6 gy-5">
							<thead>
								<tr class="text-start text-gray-500 fw-bold fs-7 text-uppercase gs-0">
									<th class="w-10px pe-2">
										<div class="form-check form-check-sm form-check-custom form-check-solid me-3">
											<input class="form-check-input" type="checkbox" data-kt-check="true" data-kt-check-target="#kt_file_manager_list .form-check-input" value="1" />
										</div>
									</th>
									<th class="min-w-250px">Name</th>
									<th class="min-w-10px">Size</th>
									<th class="min-w-125px">Last Modified</th>
									<th class="w-125px"></th>
								</tr>
							</thead>
							<tbody class="fw-semibold text-gray-600">
								<!-- 폴더 -->
								<tr>
									<td>
										<div class="form-check form-check-sm form-check-custom form-check-solid">
											<input class="form-check-input" type="checkbox" value="1" />
										</div>
									</td>

									<!-- 파일요청URL, 파일명 -->
									<td data-order="account">
										<div class="d-flex align-items-center">
											<span class="icon-wrapper">
												<i class="ki-duotone ki-folder fs-2x text-primary me-4">
													<span class="path1"></span>
													<span class="path2"></span>
												</i>
											</span>
											<a href="apps/file-manager/files/.html" class="text-gray-800 text-hover-primary">폴더</a>
										</div>
									</td>

									<!-- 디스플레이 파일크기 -->
									<td>-</td>

									<!-- 파일 수정일시 -->
									<td>-</td>

									<!-- 더보기 메뉴 -->
									<td class="text-end" data-kt-filemanager-table="action_dropdown">
										<div class="d-flex justify-content-end">
											<div class="ms-2">
												<button type="button" class="btn btn-sm btn-icon btn-light btn-active-light-primary me-2" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">
													<i class="ki-duotone ki-dots-square fs-5 m-0">
														<span class="path1"></span>
														<span class="path2"></span>
														<span class="path3"></span>
														<span class="path4"></span>
													</i>
												</button>
												<!--begin::Menu-->
												<div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-600 menu-state-bg-light-primary fw-semibold fs-7 w-150px py-4" data-kt-menu="true">
													<!-- 이름 바꾸기 -->
													<div class="menu-item px-3">
														<a href="#" class="menu-link px-3" data-kt-filemanager-table="rename">이름 바꾸기</a>
													</div>
													<!-- 다운로드 -->
													<div class="menu-item px-3">
														<a href="#" class="menu-link px-3">다운로드</a>
													</div>
													<!-- 이동 -->
													<div class="menu-item px-3">
														<a href="#" class="menu-link px-3" data-kt-filemanager-table-filter="move_row" data-bs-toggle="modal" data-bs-target="#kt_modal_move_to_folder">이동</a>
													</div>
													<!-- 삭제 -->
													<div class="menu-item px-3">
														<a href="#" class="menu-link text-danger px-3" data-kt-filemanager-table-filter="delete_row">삭제</a>
													</div>
												</div>
											</div>
										</div>
									</td>
								</tr>

								<!-- 파일 시작 -->
								<tr>
									<td>
										<div class="form-check form-check-sm form-check-custom form-check-solid">
											<input class="form-check-input" type="checkbox" value="1" />
										</div>
									</td>

									<!-- 파일요청URL, 파일명 -->
									<td data-order="index.html"><!-- ? -->
										<div class="d-flex align-items-center">
											<span class="icon-wrapper">
												<i class="ki-duotone ki-files fs-2x text-primary me-4"></i>
											</span>
											<a href="#" class="text-gray-800 text-hover-primary">파일.html</a>
										</div>
									</td>

									<!-- 디스플레이 파일크기 -->
									<td>583 KB</td>

									<!-- 파일 수정일시 -->
									<td>10 Mar 2024, 10:30 am</td>

									<!-- 더보기 메뉴 -->
									<td class="text-end" data-kt-filemanager-table="action_dropdown">
										<div class="d-flex justify-content-end">
											<!--begin::More-->
											<div class="ms-2">
												<button type="button" class="btn btn-sm btn-icon btn-light btn-active-light-primary me-2" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">
													<i class="ki-duotone ki-dots-square fs-5 m-0">
														<span class="path1"></span>
														<span class="path2"></span>
														<span class="path3"></span>
														<span class="path4"></span>
													</i>
												</button>
												<!--begin::Menu-->
												<div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-600 menu-state-bg-light-primary fw-semibold fs-7 w-150px py-4" data-kt-menu="true">
													<!-- 이름 바꾸기 -->
													<div class="menu-item px-3">
														<a href="#" class="menu-link px-3" data-kt-filemanager-table="rename">이름 바꾸기</a>
													</div>

													<!-- 다운로드 -->
													<div class="menu-item px-3">
														<a href="#" class="menu-link px-3">다운로드</a>
													</div>

													<!-- 이동 -->
													<div class="menu-item px-3">
														<a href="#" class="menu-link px-3" data-kt-filemanager-table-filter="move_row" data-bs-toggle="modal" data-bs-target="#kt_modal_move_to_folder">이동</a>
													</div>

													<!-- 삭제 -->
													<div class="menu-item px-3">
														<a href="#" class="menu-link text-danger px-3" data-kt-filemanager-table-filter="delete_row">삭제</a>
													</div>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<!-- 파일 끝 -->
								${contentLength}
							</tbody>
						</table>
						<!--end::Table-->
					</div>
					<!--end::Card body-->
				</div>

				<!-- 업로드 템플릿 영역 -->
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
								<button class="btn btn-icon btn-light-primary me-3" id="kt_file_manager_add_folder">
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

				<!-- 이름바꾸기 템플릿 영역 -->
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
				
				<!-- 액션 템플릿 -->
				<div class="d-none" data-kt-filemanager-template="action">
					<div class="d-flex justify-content-end">
						<!--begin::Share link-->
						
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
				
				<!-- 체크박스 액션 -->
				<div class="d-none" data-kt-filemanager-template="checkbox">
					<div class="form-check form-check-sm form-check-custom form-check-solid">
						<input class="form-check-input" type="checkbox" value="1" />
					</div>
				</div>



				<%-- 모달 중복으로 주석처리함
				<!-- 모달 - Upload File-->
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
									<h2 class="fw-bold">업로드 파일</h2>
									<!--begin::Close-->
									<div class="btn btn-icon btn-sm btn-active-icon-primary" data-bs-dismiss="modal">
										<i class="ki-duotone ki-cross fs-1">
											<span class="path1"></span>
											<span class="path2"></span>
										</i>
									</div>
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
												<a class="dropzone-select btn btn-sm btn-primary me-2">파일 선택</a>
												<a class="dropzone-upload btn btn-sm btn-light-primary me-2">모두 업로드</a>
												<a class="dropzone-remove-all btn btn-sm btn-light-primary">모두 삭제</a>
											</div>
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
													<!--begin::Progress-->
													<div class="dropzone-progress">
														<div class="progress bg-gray-300">
															<div class="progress-bar bg-primary" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0" data-dz-uploadprogress=""></div>
														</div>
													</div>
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
										<span class="form-text fs-6 text-muted">첨부 가능 최대 용량은 1Mbyte 입니다.</span>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>

				<!-- 모달 - New Product-->
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
									<h2 class="fw-bold">Move to folder</h2>
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
										<div class="d-flex">
											<!--begin::Checkbox-->
											<div class="form-check form-check-custom form-check-solid">
												<!--begin::Input-->
												<input class="form-check-input me-3" name="move_to_folder" type="radio" value="0" id="kt_modal_move_to_folder_0" />
												<!--end::Input-->
												<!--begin::Label-->
												<label class="form-check-label" for="kt_modal_move_to_folder_0">
													<div class="fw-bold">
													<i class="ki-duotone ki-folder fs-2 text-primary me-2">
														<span class="path1"></span>
														<span class="path2"></span>
													</i>account</div>
												</label>
												<!--end::Label-->
											</div>
											<!--end::Checkbox-->
										</div>
										<!--end::Item-->
										<div class='separator separator-dashed my-5'></div>
										<!--begin::Item-->
										<div class="d-flex">
											<!--begin::Checkbox-->
											<div class="form-check form-check-custom form-check-solid">
												<!--begin::Input-->
												<input class="form-check-input me-3" name="move_to_folder" type="radio" value="1" id="kt_modal_move_to_folder_1" />
												<!--end::Input-->
												<!--begin::Label-->
												<label class="form-check-label" for="kt_modal_move_to_folder_1">
													<div class="fw-bold">
													<i class="ki-duotone ki-folder fs-2 text-primary me-2">
														<span class="path1"></span>
														<span class="path2"></span>
													</i>apps</div>
												</label>
												<!--end::Label-->
											</div>
											<!--end::Checkbox-->
										</div>
										<!--end::Item-->
										<div class='separator separator-dashed my-5'></div>
										<!--begin::Item-->
										<div class="d-flex">
											<!--begin::Checkbox-->
											<div class="form-check form-check-custom form-check-solid">
												<!--begin::Input-->
												<input class="form-check-input me-3" name="move_to_folder" type="radio" value="2" id="kt_modal_move_to_folder_2" />
												<!--end::Input-->
												<!--begin::Label-->
												<label class="form-check-label" for="kt_modal_move_to_folder_2">
													<div class="fw-bold">
													<i class="ki-duotone ki-folder fs-2 text-primary me-2">
														<span class="path1"></span>
														<span class="path2"></span>
													</i>widgets</div>
												</label>
												<!--end::Label-->
											</div>
											<!--end::Checkbox-->
										</div>
										<!--end::Item-->
										<div class='separator separator-dashed my-5'></div>
										<!--begin::Item-->
										<div class="d-flex">
											<!--begin::Checkbox-->
											<div class="form-check form-check-custom form-check-solid">
												<!--begin::Input-->
												<input class="form-check-input me-3" name="move_to_folder" type="radio" value="3" id="kt_modal_move_to_folder_3" />
												<!--end::Input-->
												<!--begin::Label-->
												<label class="form-check-label" for="kt_modal_move_to_folder_3">
													<div class="fw-bold">
													<i class="ki-duotone ki-folder fs-2 text-primary me-2">
														<span class="path1"></span>
														<span class="path2"></span>
													</i>assets</div>
												</label>
												<!--end::Label-->
											</div>
											<!--end::Checkbox-->
										</div>
										<!--end::Item-->
										<div class='separator separator-dashed my-5'></div>
										<!--begin::Item-->
										<div class="d-flex">
											<!--begin::Checkbox-->
											<div class="form-check form-check-custom form-check-solid">
												<!--begin::Input-->
												<input class="form-check-input me-3" name="move_to_folder" type="radio" value="4" id="kt_modal_move_to_folder_4" />
												<!--end::Input-->
												<!--begin::Label-->
												<label class="form-check-label" for="kt_modal_move_to_folder_4">
													<div class="fw-bold">
													<i class="ki-duotone ki-folder fs-2 text-primary me-2">
														<span class="path1"></span>
														<span class="path2"></span>
													</i>documentation</div>
												</label>
												<!--end::Label-->
											</div>
											<!--end::Checkbox-->
										</div>
										<!--end::Item-->
										<div class='separator separator-dashed my-5'></div>
										<!--begin::Item-->
										<div class="d-flex">
											<!--begin::Checkbox-->
											<div class="form-check form-check-custom form-check-solid">
												<!--begin::Input-->
												<input class="form-check-input me-3" name="move_to_folder" type="radio" value="5" id="kt_modal_move_to_folder_5" />
												<!--end::Input-->
												<!--begin::Label-->
												<label class="form-check-label" for="kt_modal_move_to_folder_5">
													<div class="fw-bold">
													<i class="ki-duotone ki-folder fs-2 text-primary me-2">
														<span class="path1"></span>
														<span class="path2"></span>
													</i>layouts</div>
												</label>
												<!--end::Label-->
											</div>
											<!--end::Checkbox-->
										</div>
										<!--end::Item-->
										<div class='separator separator-dashed my-5'></div>
										<!--begin::Item-->
										<div class="d-flex">
											<!--begin::Checkbox-->
											<div class="form-check form-check-custom form-check-solid">
												<!--begin::Input-->
												<input class="form-check-input me-3" name="move_to_folder" type="radio" value="6" id="kt_modal_move_to_folder_6" />
												<!--end::Input-->
												<!--begin::Label-->
												<label class="form-check-label" for="kt_modal_move_to_folder_6">
													<div class="fw-bold">
													<i class="ki-duotone ki-folder fs-2 text-primary me-2">
														<span class="path1"></span>
														<span class="path2"></span>
													</i>modals</div>
												</label>
												<!--end::Label-->
											</div>
											<!--end::Checkbox-->
										</div>
										<!--end::Item-->
										<div class='separator separator-dashed my-5'></div>
										<!--begin::Item-->
										<div class="d-flex">
											<!--begin::Checkbox-->
											<div class="form-check form-check-custom form-check-solid">
												<!--begin::Input-->
												<input class="form-check-input me-3" name="move_to_folder" type="radio" value="7" id="kt_modal_move_to_folder_7" />
												<!--end::Input-->
												<!--begin::Label-->
												<label class="form-check-label" for="kt_modal_move_to_folder_7">
													<div class="fw-bold">
													<i class="ki-duotone ki-folder fs-2 text-primary me-2">
														<span class="path1"></span>
														<span class="path2"></span>
													</i>authentication</div>
												</label>
												<!--end::Label-->
											</div>
											<!--end::Checkbox-->
										</div>
										<!--end::Item-->
										<div class='separator separator-dashed my-5'></div>
										<!--begin::Item-->
										<div class="d-flex">
											<!--begin::Checkbox-->
											<div class="form-check form-check-custom form-check-solid">
												<!--begin::Input-->
												<input class="form-check-input me-3" name="move_to_folder" type="radio" value="8" id="kt_modal_move_to_folder_8" />
												<!--end::Input-->
												<!--begin::Label-->
												<label class="form-check-label" for="kt_modal_move_to_folder_8">
													<div class="fw-bold">
													<i class="ki-duotone ki-folder fs-2 text-primary me-2">
														<span class="path1"></span>
														<span class="path2"></span>
													</i>dashboards</div>
												</label>
												<!--end::Label-->
											</div>
											<!--end::Checkbox-->
										</div>
										<!--end::Item-->
										<div class='separator separator-dashed my-5'></div>
										<!--begin::Item-->
										<div class="d-flex">
											<!--begin::Checkbox-->
											<div class="form-check form-check-custom form-check-solid">
												<!--begin::Input-->
												<input class="form-check-input me-3" name="move_to_folder" type="radio" value="9" id="kt_modal_move_to_folder_9" />
												<!--end::Input-->
												<!--begin::Label-->
												<label class="form-check-label" for="kt_modal_move_to_folder_9">
													<div class="fw-bold">
													<i class="ki-duotone ki-folder fs-2 text-primary me-2">
														<span class="path1"></span>
														<span class="path2"></span>
													</i>pages</div>
												</label>
												<!--end::Label-->
											</div>
											<!--end::Checkbox-->
										</div>
										<!--end::Item-->
									</div>
									<!--end::Input group-->
									<!--begin::Action buttons-->
									<div class="d-flex flex-center mt-12">
										<!--begin::Button-->
										<button type="button" class="btn btn-primary" id="kt_modal_move_to_folder_submit">
											<span class="indicator-label">Save</span>
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
				모달 중복으로 주석처리함 --%>


			</div>
			<!--end::Content container-->
		</div>
		<!--end::Content-->
	</div>
	<!--end::Content wrapper-->
	<!-- 풋터 날리기 -->
</div>
<!-- 여기까지 JSP로 만들기 -->

<!-- 자료실 스크립트 시작 -->
<script>
	// DOM 로드 후 실행
	document.addEventListener("DOMContentLoaded", function(){
		
		// 자료실 최상위의 디렉터리 경로와 폴더,파일 리스트 요청 URL : /refCenter/root
		let url = "/refCenter/path";

		// 요청
		$.ajax({
			url : url, 
			method : "GET",	
			contentType : "application/json",
			data : JSON.stringify("test"),
			dataType : "json", 
			success : function(response){
				if(!response){ // response 가 null, undefined, 화이트스페이스가 아닌경우
					alert("su");
				} else {
					alert("er");
				}
			},
			error : function(error){

			}
		});
	});
</script>