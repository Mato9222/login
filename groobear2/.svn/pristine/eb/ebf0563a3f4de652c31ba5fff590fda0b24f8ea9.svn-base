<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <style>
        body {
           font-family: Arial, sans-serif; 
        } 
        
        .address-book {
            display: flex;
            height: 100vh;
        }
        
        .sidebar {
            width: 150px;
            border-right: 1px solid #ccc;
            padding: 10px;
        }
        
        .sidebar ul {
            list-style: none;
            padding: 0;
        }
        
        .sidebar ul li {
            padding: 10px;
            cursor: pointer;
        }
        
        .sidebar ul li:hover {
            background-color: #f0f0f0;
        }
        
        .content {
            flex: 1;
            padding: 10px;
        }
        
        .filter {
            margin-bottom: 10px;
        }
        
        .recipients {
            display: flex;
            justify-content: space-between;
            align-content:center;
        }
        
        .list {
            width: 50%;
            height: 612px;   
            border: 1px solid #ccc;
            padding : 20px;
            overflow : auto;
        }
        
        .non-click {
            width: 100%;
            height: 275px;   
            border: 1px solid #ccc;
            border-left: 0px solid;
            padding : 20px;
            overflow : auto;
        }
        
        .selDiv { 
            border: 1px solid skyblue; 
        } 
        
        .rec-list h3 {
            margin-top: 0;
        }
        
        .rec-list ul {
            list-style: none;
            padding: 0;
        }
       
        .row {
	        --bs-gutter-x: 1.5rem;
	        --bs-gutter-y: 0;
	        display: flex;
	        flex-wrap: wrap;
	        margin-top: 0;
	        margin-right: 0;
	        margin-left: 0;
	        padding: 0;
        }
        
        
    </style>
</head>
<body>
    <div class="address-book">
        <div class="sidebar">
            <ul>
                <li class="emplList">직원 주소록</li>
                <li class="">개인 주소록</li>
            </ul>
        </div>
        <div class="content">
            <div class="filter">
            </div>
            <div class="recipients">
            
                <div class="list">
	                <h3>리스트</h3>
	                <div class="form-check form-check-sm form-check-custom form-check-solid me-4 me-lg-7">
						<input class="form-check-input" type="checkbox" data-kt-check="true" id="allCheck"
							data-kt-check-target="#kt_inbox_listing .form-check-input" value="1"> 전체
					</div>
	                <div class="address-list">
		                <div class="empl">
		                	<!-- 주소록 목록 동적 출력 -->
		                </div>
	                </div>
                </div>
                <div class="row card-body pb-4 d-flex Sflex-wrap align-items-center">
                    <div class="row card-body pb-4 d-flex flex-wrap align-items-center recGroup"> 
                   		<h3>받는 사람</h3>
	                    <ul class="non-click recValue" id="recValue"> </ul>
 					</div>
					<div class="row card-body pb-4 d-flex flex-wrap align-items-center ccGroup">
                    	<h3> 참조</h3>
	                    <ul class="non-click ccValue" > </ul>
<!-- 	                    <input type="hidden" id="ccHidden" value=""/>  -->
                    </div>
                </div>
            </div>
            <div class="me-4">
	            <button type="button" class="btn btn-primary fs-bold px-6 indicator-label send" >확인</button>
	            <span class="btn btn-primary fs-bold px-6 indicator-label" onclick="window.close()">취소</span>
            </div>
        </div>
    </div>
</body>

<script>
// 사이드리스트에서 목록리스트 출력
	const nonClick = document.querySelectorAll(".non-click");
	function handleClick(e) {
	// 	div에서 모든 "selDiv" 클래스 제거
		nonClick.forEach((e) => {
			e.classList.remove("selDiv");
		});
	// 	클릭한 div만 "selDiv" 클래스 추가
		e.target.classList.add("selDiv");
        
		$("input[name=chk]").prop("checked", false);
        syncCheckboxes();
	}

	// 데이터 넣을 받는사람 or 참조 선택하기 
	nonClick.forEach((e) => {
		e.addEventListener("click", handleClick);
	});
	
	document.addEventListener("DOMContentLoaded", () => {
		// 받는사람 리스트에서 체크박스 목록과 동기화
        function syncCheckboxes() {
            $(".recGroup .user").each(function() {
                let emplId = $(this).attr('id');
                
                console.log("동기 :", emplId);
                
                $(`.emplSel input[value='\${emplId}']`).prop('checked', true);
            });
        }
		
		window.addEventListener("message", (event) => {
	        if (event.origin !== window.location.origin) {
	            return;
	        }

	        let { emplHidden, emplValue } = event.data;
	        let { ccValue , ccHidden } = event.data;
	        
			console.log("받아온 값1 ",emplHidden, emplValue);
			console.log("받아온 값2 ", ccValue , ccHidden);
			
	        if (emplHidden && emplValue) {
	            let empl = `
	                <li class='user' id='\${emplHidden}'>
	                    <span class='userItem'>\${emplValue}</span>
	                    <input type="hidden" class="recHidden" value="\${emplHidden}"/> 
	                   <button class="remove-btn"> x </button>
	                </li>`;
	            
	            document.querySelector(".recValue").value = empl;
	            syncCheckboxes();
	        }
	        if (ccHidden && ccValue) {
	            let ccEmpl = `
	                <li class='user' id='\${ccHidden}'>
	                    <span class='userItem'>\${ccValue}</span>
	                    <input type="hidden" class="recHidden" value="\${ccHidden}"/> 
                    	<i class="ki-duotone ki-cross fs-5">
		        			<span class="path1"></span>
		        			<span class="path2"></span>
		        		</i>	                    
	        		<button class="remove-btn"> x </button>
	                </li>`;
	            
	            document.querySelector(".ccValue").value = ccEmpl;
	            syncCheckboxes();
	        }
	    });
		
		
	// 	목록리스트에서 받는사람 or 참조 값 보내기
		$(document).on("change", ".emplSel", function(e) {
			let emplSel = event.target.checked;
			
			var emplNo = $(this).find('input[type="hidden"]').val();
			if(emplSel) {
				var emplName = $(this).find('input[name="chk"]').val();
				
				var userItem = ""; 
				
				userItem = `<li class='user remove-btn' id='\${emplNo}'>
								<span class='userItem'>\${emplName}</span>
								<input type="hidden" class="recHidden" value="\${emplNo}"/> 
								 <i class="ki-duotone ki-cross fs-5 remove-btn">
				        			<span class="path1"></span>
				        			<span class="path2"></span>
				        		</i>	                    
							</li>`;
				$(".selDiv").append(userItem);
			} else {
				$(`#\${emplNo}`).remove();
			}
		})
		
	   	// 목록에서 아이템 제거 버튼 클릭 시 제거 
		$(document).on("click", ".remove-btn", function(e) {
	        $(this).closest('.user').remove();
	    });
		
		// 확인 버튼 클릭 시 부모 창으로 값 전달
		$('.send').on("click", function(e) {
			var recItem = [];
			var recHidden = [];
			var rec = "";
			
			var ccItem = [];
			var ccHidden = [];
			var cc = "";
			
			$('.recGroup .userItem').each(function() {
				recItem.push($(this).text());
				rec = recItem.join();
				opener.document.getElementById("pRec").value = rec;
			})
			
			$('.recGroup .recHidden').each(function() {
				recHidden.push($(this).val());
				rec = recHidden.join();
				opener.document.getElementById("emplHidden").value = rec;
			})
			
			$('.ccGroup .userItem').each(function() {
				ccItem.push($(this).text());
				cc = ccItem.join();
				opener.document.getElementById("pCc").value = cc;
			})
			
			$('.ccGroup .recHidden').each(function() {
				ccHidden.push($(this).val());
				cc = ccHidden.join();
				opener.document.getElementById("ccHidden").value = cc;
			})
			
	 		window.close();
	    });
		
	//  직원리스트 동적 출력 
	   	$(".emplList").on("click", function(e) {
	   		$.ajax({
	   			url : "/adrs/emplList"
	   			, method : "get"
	   			, success : function(res) {
	   				$(".empl").empty();
	   				
					let emplHtml = "";
					
	   				res.forEach(emplList => {
	   					let emplName = emplList.emplNm;
	   					let emplCmm = emplList.cmmnCodeNm;
	   					let email = emplList.emailAdres;
	   					let emplNo = emplList.emplNo;
	   					
	   					emplAtt = `\${emplName}(\${emplCmm})`;
	   					emplValue = `\${emplName}(\${emplCmm}) &lt;\${email}&gt;`;
	   					
	   					emplHtml += `
	   							<div class="form-check form-check-sm form-check-custom form-check-solid mt-3 emplSel">
			   						<input class="form-check-input" id="emplValue" name="chk" type="checkbox" value="\${emplAtt}" data-empl-nm="\${emplName}"> \${emplValue}
									<input type="hidden" value="\${emplNo}" id="emplNo" name="emplNo">
								</div>
							`;
					})
					$(".empl").append(emplHtml);
	   			}
	   		})
	   	})
	   	
	   	$("#allCheck").on("click", function() {
	   		let checked = $('#allCheck').is(':checked');
	   		
	   		if (checked) {
	   			$('input:checkbox').prop('checked',true);
	   		} else {
	   			$('input:checkbox').prop('checked',false);
	   		}
	   			
// 	   		let chkList = $("input[name=chk]");
	   		
// 	   		if($("#allCheck").is(":checked")) {
// 	   			chkList.prop("checked", true);
// 	   		} else {
// 	   			chkList.prop("checked", false);
// 	   		}
	   		
	   	})
	})


</script>