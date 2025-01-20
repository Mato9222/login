
// 전역함수 정의 구역!	
const sanctionBtn = document.querySelector('#newSanctionBtn');
const newSanctionSchBtn = document.querySelector('#newSanctionFnSch');

document.addEventListener("DOMContentLoaded", () => {
	loadSanctionLineList2();
    
    var script = document.createElement('script');
    script.src = 'https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.16/jstree.min.js';
    script.onload = function() {
        $.ajax({
            url: '/dcform/tree',
            method: 'GET',
            success: function(data) {
                var treeData = [];
                var parentMap = {};

                treeData.push({ id: 'root', parent: '#', text: '결재양식' });
                data.forEach(item => {
                    if (!parentMap[item.parent]) {
                        parentMap[item.parent] = true;
                        treeData.push({
                            id: item.parent,
                            parent: 'root',
                            text: item.parent,
							icon: 'ki-outline ki-folder'
                        });
                    }
                    treeData.push({
                        id: item.child,
                        parent: item.parent,
                        text: item.child,
						no: item.no,
						cn: item.cn,
                        icon: 'ki-outline ki-message-text-2 text-danger fs-7'
                    });
                });

				$('#kt_docs_jstree_basic').jstree({
				    "core" : {
				        "themes" : {
				            "responsive": false
				    },	
			        "check_callback" : true,
			        'data': treeData,
					},
			        'search': {
			            'show_only_matches': true
			        },
				    "types" : {
				        "default" : {
				            "icon" : "ki-solid ki-folder"
				        },
				        "file" : {
				            "icon" : "ki-solid ki-file"
				        }
				    },
			   		"plugins" : ["search", "types" ]
                })

                $('#kt_docs_jstree_basic').on("select_node.jstree", function(e, data) {
                    $('#kt_docs_jstree_basic').jstree("deselect_all", true);
                    
                    // Apply highlight to the selected node
                    $("#" + data.node.id + "_anchor").addClass('jstree-clicked');
                    if (!data.node.children.length) {
                        var selectedText = data.node.text;
                        var selectedNo = data.node.original.no;
                        var selectedCn = data.node.original.cn;
                        $('#selectDoc').val(selectedText);
						$('#selectDocNo').val(selectedNo);
						$('#selectDocCn').val(selectedCn);
                    }
                });
            },
            error: function(xhr, status, error) {
                console.error('에러:', status, error);
            }
        });
    }

    document.body.appendChild(script);
	
    $('#kt_modal_new_sanction').on('shown.bs.modal', function () {
        loadSanctionLineList2();
    });
	
if (sanctionBtn) {
    sanctionBtn.addEventListener('click', function() {
        var selectedDoc = $('#selectDoc').val();
        var selectedDocNo = $('#selectDocNo').val();
        var selectedDocCn = $('#selectDocCn').val();
        var sclineList = [];

        $('#selectedEmployees2 .employee-wrapper').each(function() {
            var employeeInfo = $(this).find('.badge').text();
            var emplName = $(this).find('.text-hover-primary').text();
            var emplCode = $(this).find('.text-muted').text();
            var proflPhotoCours = $(this).attr('data-profile');
            var sanctnLineNo = $(this).attr('data-sanctnLineNo');
            var sanctnCtpntUrl = $(this).attr('data-sanctnCtpntUrl');
            var sanctnEmplNo = $(this).attr('data-emplid');
			var sanctnSortate = $(this).attr('data-sanctnSortate');
            var employee = {
                sanctnOrdr: employeeInfo,
                sanctnEmplNm: emplName,
                sanctnofcpsCodeNm: emplCode,
                sanctnproflPhotoCours: proflPhotoCours,
                doorSign: selectedDoc,
                sanctnLineNo: sanctnLineNo,
                sanctnEmplNo: sanctnEmplNo,
                docRaisngNo: selectedDocNo,
                docCn: selectedDocCn,
                sanctnCtpntUrl: sanctnCtpntUrl,
				sanctnSortate: sanctnSortate
            };
            sclineList.push(employee);
        });

        // 결재양식과 결재라인이 선택되지 않았을 때 SweetAlert로 안내 메시지 표시
        if (!selectedDoc) {
            Swal.fire({
                text: "결재양식을 선택해주세요.",
                icon: "warning",
                buttonsStyling: false,
                confirmButtonText: "확인",
                customClass: {
                    confirmButton: "btn btn-primary"
                }
            });			
            return; // 선택되지 않은 항목이 있으므로 더 이상 진행하지 않음
        }
        if (sclineList.length === 0) {
	          Swal.fire({
                text: "결재라인을 선택해주세요.",
                icon: "warning",
                buttonsStyling: false,
                confirmButtonText: "확인",
                customClass: {
                    confirmButton: "btn btn-primary"
                }
            });	
            return; // 선택되지 않은 항목이 있으므로 더 이상 진행하지 않음
        }

        $.ajax({
            url: '/sanctionDoc',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(sclineList),
            success: function(data) {
                window.location.href = "/sanctionDoc";
            }
        });

    });
}

    newSanctionSchBtn.addEventListener('click', ()=>{
        $('#kt_docs_jstree_basic').jstree(true).search($("#docName").val());
	})

    function resetSelectedEmployees2() {
        $('#selectedEmployees2').empty();
        nextIndex = 1;
    }

    function resetSelectedDoc() {
        $('#selectDoc').val('');
    }

    $('#closeBtn2').on('click', function () {
        resetSelectedEmployees2();
        resetSelectedDoc();
    });

    function loadSanctionLineList2() {
        $.ajax({
            url: '/scline',
            method: 'GET',
            success: function(data) {
                createSclineItems2(data);
            },
            error: function(xhr, status, error) {
                console.error('에러:', status, error);
            }
        });
    }

    function createSclineItems2(data) {
        var $sclineList2 = $('#sclineList2');
        $sclineList2.empty();

        var seen2 = new Set();
        var uniqueData2 = [];
        
        $.each(data, function(index, scline) {
            if (!seen2.has(scline.sanctnLnNm)) {
                seen2.add(scline.sanctnLnNm);
                uniqueData2.push(scline);
            }
        });

        $.each(uniqueData2, function(index, scline) {
            var $listItem2 =  $('<div>').addClass('card bg-light rounded hover-elevate-up col-3 pt-1 mb-5').css({'width': '220px', 'height': '50px'});
			var $menuItem2 = $('<div>').addClass('menu-item mb-3 d-flex justify-content-center align-items-center').css('height', '100%');
	        var $link2 = $('<span>').addClass('menu-link active');
	        var $menuIcon2 = $('<span>').addClass('menu-icon');
	        var $icon2 = $('<i>').addClass('ki-duotone ki-profile-user fs-2 me-3').html('<span class="path1"></span> <span class="path2"></span> <span class="path3"></span> <span class="path4"></span>');
	        var $menuTitle2 = $('<span>').addClass('menu-title fw-bold').text(scline.sanctnLnNm);

	        $link2.append($menuIcon2.append($icon2)).append($menuTitle2);
	        $menuItem2.append($link2);
	        $listItem2.append($menuItem2);
	        $sclineList2.append($listItem2);

            $link2.on('click', function() {
                showSclineDetail2(scline.sanctnLineNo);
            });
        });
    }

    var nextIndex = 1;

function addEmployeeToList2(emplId, emplName, emplCode, emplProfile, sanctnSortate, sanctnCtpntUrl, sanctnLineNo) {
    // Create the main div container
    var listItem = $('<div>').addClass('d-flex flex-stack list-group-item w-100');
    
    // Create the symbol div with the badge and image
    var symbolDiv = $('<div>').addClass('symbol symbol-40px me-5');
    var badge = $('<span>').addClass('badge badge-square badge-primary').text(nextIndex);
    var img = $('<img>').attr('src', `/resources/image/${emplProfile}`).addClass('h-50 align-self-center').attr('alt', '').css('margin-left', '10px');
    symbolDiv.append(badge).append(img);
    
    // Create the section div with employee info
    var sectionDiv = $('<div>').addClass('d-flex align-items-center flex-row-fluid flex-wrap');
    var authorDiv = $('<div>').addClass('flex-grow-1 me-2');
    var authorLink = $('<a>').addClass('text-gray-800 text-hover-primary fs-6 fw-bold').text(emplName);
    var authorSpan = $('<span>').addClass('text-muted fw-semibold d-block fs-7').text(emplCode);
    authorDiv.append(authorLink).append(authorSpan);
    
    // Create the non-editable input element for sanctnSortate and center-align the text
    var sanctnInput = $('<input>').attr('type', 'text')
                                  .addClass('form-control fs-8 fw-bold text-center')
                                  .val(sanctnSortate || '결재선택')
                                  .prop('readonly', true);
    
    // Append elements to the section div
    sectionDiv.append(authorDiv)
              .append($('<div>').css('width', '100px').append(sanctnInput));
    
    // Append the symbol and section divs to the main container
    listItem.append(symbolDiv).append(sectionDiv);
    
    // Create the separator
    var separator = $('<div>').addClass('separator separator-dashed my-4');
    
    // Create a wrapper to hold the listItem and separator together, and add the data attributes
    var wrapper = $('<div>').addClass('employee-wrapper').attr('data-emplid', emplId).attr('data-profile', emplProfile).attr('data-sanctnCtpntUrl', sanctnCtpntUrl).attr('data-sanctnLineNo', sanctnLineNo).attr('data-sanctnSortate', sanctnSortate);
    wrapper.append(listItem).append(separator);
    
    // Append the wrapper to the selected employees list
    $('#selectedEmployees2').append(wrapper);
    
    // Increment the next index
    nextIndex++;
}

		function showSclineDetail2(scline) {
		    $.ajax({
		        url: '/scline/detail',
		        type: 'GET',
		        data: { sclineNo: scline },
		        success: function(resp) {
		            resetSelectedEmployees2();
		            const list2 = resp[0].sclineDetailList;
		            list2.forEach(function(e) {
		                addEmployeeToList2(e.sanctnEmplNo, e.emplNm, e.ofcpsCode + ", " + e.rspofcCode, e.proflPhotoCours, e.sanctnSortate, e.sanctnCtpntUrl, resp[0].sanctnLineNo);
		            });
		        },
		        error: function(xhr, status, error) {
		            console.error('에러:', status, error);
		        }
		    });
		}
});
