<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
						<!--begin::Content wrapper-->
						<div class="d-flex flex-column flex-column-fluid">
							<!--begin::Toolbar-->
							<div id="kt_app_toolbar" class="app-toolbar py-3 py-lg-6">
								<!--begin::Toolbar container-->
								<div id="kt_app_toolbar_container" class="app-container container-xxl d-flex flex-stack">
									<!--begin::Page title-->
									<div class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
										<!--begin::Title-->
										<h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">프로젝트 등록</h1>
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
											<li class="breadcrumb-item text-muted">프로젝트 목록</li>
											<!--end::Item-->
											<li class="breadcrumb-item">
												<span class="bullet bg-gray-500 w-5px h-2px"></span>
											</li>
											<li class="breadcrumb-item text-muted">프로젝트 등록</li>
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
									<!--begin::Careers - Apply-->
									<div class="card">
										<!--begin::Body-->
										<div class="card-body p-lg-17">
											<!--begin::Hero-->
											<div class="position-relative mb-17">
												<!--begin::Overlay-->
												<div class="overlay overlay-show">
													<!--begin::Image-->
													<div class="bgi-no-repeat bgi-position-center bgi-size-cover card-rounded min-h-250px" style="background-image:url('assets/media/stock/1600x800/img-1.jpg')"></div>
													<!--end::Image-->
													<!--begin::layer-->
													<div class="overlay-layer rounded bg-black" style="opacity: 0.4"></div>
													<!--end::layer-->
												</div>
												<!--end::Overlay-->
												<!--begin::Heading-->
												<div class="position-absolute text-white mb-8 ms-10 bottom-0">
													<!--begin::Title-->
													<h3 class="text-white fs-2qx fw-bold mb-3 m">프로젝트를 등록해주세요.</h3>
													<!--end::Title-->
													<!--begin::Text-->
													<div class="fs-5 fw-semibold">앉아서. 스크린만 보면서. 개처럼 일하라.</div>
													<!--end::Text-->
												</div>
												<!--end::Heading-->
											</div>
											<!--end::-->
											<!--begin::Layout-->
											<div class="d-flex flex-column flex-lg-row mb-17">
												<!--begin::Content-->
												<div class="flex-lg-row-fluid me-0 me-lg-20">
													<!--begin::Form-->
													<form action="m-0" class="form mb-15" method="post" id="kt_careers_form">
														<!--begin::Input group-->
														<div class="row mb-5">
															<!--begin::Col-->
															<div class="col-md-6 fv-row">
																<!--begin::Label-->
																<label class="required fs-5 fw-semibold mb-2">프로젝트 명</label>
																<!--end::Label-->
																<!--begin::Input-->
																<input type="text" class="form-control form-control-solid" placeholder="" name="prjctNm" />
																<!--end::Input-->
															</div>
															<!--end::Col-->
														</div>
														<!--end::Input group-->
														<!--begin::Input group-->
														<div class="d-flex flex-column mb-8">
															<label class="fs-6 fw-semibold mb-2">프로젝트 개요</label>
															<textarea class="form-control form-control-solid" rows="4" name="prjctDc" placeholder=""></textarea>
														</div>
														<!--end::Input group-->
														<div class="mb-0">
    														<label class="form-label">프로젝트 일정</label>
														    <input class="form-control form-control-solid" placeholder="Pick date rage" id="kt_daterangepicker_1"/>
														</div>
														<div class="row">
															<!-- 조직도 -->
															<div class="col-md-6">
																<label class="fs-6 fw-semibold mb-2">팀원 선택</label>
																<div id="kt_docs_jstree_contextual2"></div>
															</div>
															<div class="col-md-6">
																<div class="selected-employees">
																	<label class="fs-6 fw-semibold mb-2">선택된 팀원</label>
																		<ul id="selectedEmployees" class="list-group">
																		<!-- Hidden template for select box -->
																		<!-- 선택된 직원 목록 -->
																	</ul>
																		<div id="roleSelectTemplate" style="display: none;">
																		    <select class="form-select mt-2 role-select">
																		        <c:forEach items="${ccList}" var="cc">
																		            <option value="${cc.cmmnCode}">${cc.cmmnCodeDcCn}</option>
																		        </c:forEach>
																		    </select>
																		</div>
																</div>
															</div>
														</div>
														<!--begin::Separator-->
														<div class="separator mb-8"></div>
														<!--end::Separator-->
														<!--begin::Submit-->
														<button type="button" class="btn btn-primary" id="project_insert_btn">
															<!--begin::Indicator label-->
															<span class="indicator-label">프로젝트 등록</span>
															<!--end::Indicator label-->
															<!--begin::Indicator progress-->
															<span class="indicator-progress">등록 진행중..
															<span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
															<!--end::Indicator progress-->
														</button>
														<!--end::Submit-->
													</form>
													<!--end::Form-->
												</div>
												<!--end::Content-->
											</div>
											<!--end::Layout-->
										</div>
										<!--end::Body-->
									</div>
									<!--end::Careers - Apply-->
								</div>
								<!--end::Content container-->
							</div>
							<!--end::Content-->
						</div>
						<!--end::Content wrapper-->

<script>
	document.addEventListener('DOMContentLoaded',()=>{
		
		const prjctNmEl = document.querySelector('[name=prjctNm]');
		const prjctDcEl = document.querySelector('[name=prjctDc]');
		const prjctDateEl = document.querySelector('#kt_daterangepicker_1');
		
		// 일정 설정 만들기
		$("#kt_daterangepicker_1").daterangepicker();
		let value = $("#kt_daterangepicker_1").val();
		console.log("value=",value);
		
		// 조직도 만들기
		var script = document.createElement('script');
        script.src = 'https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.16/jstree.min.js';
        script.onload = function() {
            $.ajax({
                url: '/dept/tree',
                method: 'GET',
                success: function(data) {
                	console.log("data==>",data);
                    $('#kt_docs_jstree_contextual2').jstree({
                        'core': {
                            'data': data,
                            'check_callback': true
                        },
                        
                        'search': {
                            'show_only_matches': true
                        },
                        'plugins': ["search", "html"]
                    })
                    $('#kt_docs_jstree_contextual2').on('select_node.jstree', function (e, data) {
                        var node = data.node;
                        console.log("node=>",node);
                        if (node.original && node.original.type === 'employee') {
                            var emplName = node.text;
                            var emplId = node.id;
                            addEmployeeToList(emplId, emplName);
                        }
                    });
                },
                error: function(xhr, status, error) {
                    console.error('에러:', status, error); // Debug log
                }
            });
        }
        document.body.appendChild(script);
        var nextIndex = 1;
        // 선택된 직원을 추가하는 함수
    	function addEmployeeToList(emplId, emplName) {
		    var emplIndex = $('<span>').addClass('empl-index').text("[" + nextIndex + "] ");
		    var emplInfo = $('<span>').text(emplName);
		    var deleteButton = $('<button>').addClass('btn btn-danger btn-sm ms-auto delete-button').html('X');
		    // 가져온 템플릿을 복제하여 셀렉트 박스로 사용
		    var roleSelectTemplate = $('#roleSelectTemplate').html();
		    var roleSelect = $(roleSelectTemplate).clone();

		    var infoDiv = $('<div>').addClass('d-flex align-items-center w-100').append(emplIndex, emplInfo, deleteButton);
		    var listItem = $('<li>').attr('id', emplId).addClass('list-group-item w-100').append(infoDiv, roleSelect);
		
		    deleteButton.click(function() {
		        $(this).closest('li').remove();
		        resetIndexes();
		    });
		
		    $('#selectedEmployees').append(listItem);
		    nextIndex++;
		    resetIndexes();
		}
		
		function resetIndexes() {
		    $('#selectedEmployees .empl-index').each(function(index) {
		        $(this).text("[" + (index + 1) + "] ");
		    });
		}
		 
		
		
		$("#project_insert_btn").on("click",function(){
			let prjctNm = prjctNmEl.value;
			let prjctDc = prjctDcEl.value;
			let date = prjctDateEl.value;
			let cutDate = date.split(" - ");
			console.log("1===========>",cutDate[0]);
			console.log("2===========>",cutDate[1]);
			let [month, day, year] = cutDate[0].split('/');
			console.log("month==>",month);
			console.log("day==>",day);
			console.log("year==>",year);
			let [month2, day2, year2] = cutDate[1].split('/');

			// yyyy-mm-dd 형식으로 조합하여 반환
			let prjctBgnde = year+'-'+month+'-'+day;
			let prjctClosOn = year2+'-'+month2+'-'+day2;
			
			console.log("Start date:", prjctBgnde); 
			console.log("End date:", prjctClosOn);     
			console.log("date ==>",date);
			
			let data = {
					pjMemberVO:[]
			}
			    $('#selectedEmployees li').each(function() {
			        let emplId = $(this).attr('id');
			        let roleId = $(this).find('select').val(); // 선택된 역할의 값

			        data.pjMemberVO.push({
			        	emplNo: emplId,
			        	prjctRoleCode: roleId	
			        });
			    });
			    
			    data.prjctNm=prjctNm;
				data.prjctDc=prjctDc;
				data.prjctBgnde=prjctBgnde;
				data.prjctClosOn=prjctClosOn;
	
			    console.log("프로젝트 데이터==>",data);
			    Swal.fire({
			        text: "프로젝트 등록이 완료되었습니다.",
			        icon: "success",
			        buttonsStyling: false,
			        confirmButtonText: "등록 완료!",
			        customClass: {
			            confirmButton: "btn btn-primary"
			        }
			    }).then(function (result) {
		                if (result.value) {
		        			$.ajax({
		        				url:'/project/insertProject',
		        				method:'POST',
		        				contentType:'application/json',
		        				data:JSON.stringify(data),
		        				success:function(resp){
		        					if(resp=='ok'){
		        						console.log("resp==>",resp);
		        						location.href = "/project/projectList"
		        					}
		        				}
		        			})

		                } else if (result.dismiss === 'cancel') {
		                    Swal.fire({
		                        text: "예약이 취소되지 않았습니다.",
		                        icon: "error",
		                        buttonsStyling: false,
		                        confirmButtonText: "예",
		                        customClass: {
		                            confirmButton: "btn btn-primary",
		                        }
		                    });
		                }
		            });
		})
		
		
	})
	
	

</script>