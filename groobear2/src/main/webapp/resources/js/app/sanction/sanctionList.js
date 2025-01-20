const submitBtn = document.querySelector('#submitSanctionLine');
const fSchBtn = document.querySelector('#fSch')
document.addEventListener("DOMContentLoaded", () => {
    var script = document.createElement('script');
    script.src = 'https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.16/jstree.min.js';
    script.onload = function() {
        $.ajax({
            url: '/dept/tree',
            method: 'GET',
            success: function(data) {
                $("#kt_docs_jstree_contextual").jstree({
                    "core" : {
                        "themes" : {
                            "responsive": false
                        },  
                        "check_callback" : true,
                        'data': data,
                    },
                    'search': {
                        'show_only_matches': true
                    },
                    "types" : {
                        "default" : {
                            "icon" : "ki-solid ki-folder text-primary"
                        },
                        "file" : {
                            "icon" : "ki-solid ki-file text-primary"
                        }
                    },
                    "plugins" : [ "contextmenu", "search", "types" ]
                })
                $('#kt_docs_jstree_contextual').on('select_node.jstree', function (e, data) {
                    var node = data.node;
                    if (node.original && node.original.type === 'employee') {
                        var emplName = node.original.emplNm;
                        var emplId = node.id;
                        var emplCode = node.original.emplCode;
						var emplProfile = node.original.profile;
                        addEmployeeToList(emplId, emplName, emplCode, emplProfile);
                    }
                });
            },
            error: function(xhr, status, error) {
                console.error('에러:', status, error); // Debug log
            }
        });
    }

    document.body.appendChild(script);
	
    loadSanctionLineList();
	if(fSchBtn){
		fSchBtn.addEventListener('click', ()=>{
			 var searchString = $("#schName").val();
			 $("#kt_docs_jstree_contextual").jstree(true).search(searchString);
		})
	}

    $('#closeBtn').on('click', function () {
        resetSelectedEmployees();
    });

	var nextIndex = 1; // 초기 인덱스 값 설정
	
	// 선택된 직원을 추가하는 함수
function addEmployeeToList(emplId, emplName, emplCode, emplProfile, sanctnSortate) {
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
    
    // Create the action buttons
    var upButton = $('<button>').addClass('btn btn-light-primary btn-sm').text('↑');
    var downButton = $('<button>').addClass('btn btn-light-primary btn-sm').text('↓');
    var deleteButton = $('<button>').addClass('btn btn-light-danger btn-sm').text('X');
    
    // Create the select element
    var select = $('<select>').attr('id', 'mySelect').addClass('form-select fs-8 fw-bold').attr('data-control', 'select2').attr('data-placeholder', '결재종류').attr('data-hide-search', 'true');
    select.append($('<option>').attr('value', '').text('결재구분')).append($('<option>').attr('value', '결재').text('결재')).append($('<option>').attr('value', '수신').text('수신')).append($('<option>').attr('value', '참조').text('참조'));

    // Set the selected option based on sanctnSortate value
    if (sanctnSortate && sanctnSortate !== '결재구분') {
        select.val(sanctnSortate);
    }
    
    // Append elements to the section div
    sectionDiv.append(authorDiv)
              .append($('<div>').css('width', '50px').append(upButton))
              .append($('<div>').css('width', '50px').append(downButton))
              .append($('<div>').css('width', '50px').append(deleteButton))
              .append($('<div>').css('width', '100px').append(select));
    
    // Append the symbol and section divs to the main container
    listItem.append(symbolDiv).append(sectionDiv);
    
    // Create the separator
    var separator = $('<div>').addClass('separator separator-dashed my-4');
    
    // Create a wrapper to hold the listItem and separator together, and add the data-emplid attribute
    var wrapper = $('<div>').addClass('employee-wrapper').attr('data-emplid', emplId);
    wrapper.append(listItem).append(separator);
    
    // Append the wrapper to the selected employees list
    $('#selectedEmployees').append(wrapper);
    
    // Increment the next index
    nextIndex++;
    
    // Set up the click events for the buttons
    upButton.click(function() {
        var currentWrapper = $(this).closest('.employee-wrapper');
        var prevWrapper = currentWrapper.prev('.employee-wrapper');
        if (prevWrapper.length !== 0) {
            currentWrapper.insertBefore(prevWrapper);
            resetIndexes();
        }
    });
    
    downButton.click(function() {
        var currentWrapper = $(this).closest('.employee-wrapper');
        var nextWrapper = currentWrapper.next('.employee-wrapper');
        if (nextWrapper.length !== 0) {
            currentWrapper.insertAfter(nextWrapper);
            resetIndexes();
        }
    });
    
    deleteButton.click(function() {
        var currentWrapper = $(this).closest('.employee-wrapper');
        currentWrapper.remove();
        resetIndexes();
    });
    
    // Function to reset the indexes
    function resetIndexes() {
            nextIndex = 1; // Reset the index counter
            $('#selectedEmployees .badge').each(function(index) {
                $(this).text(nextIndex);
                nextIndex++;
            });
    }

    function checkSelectionLimits() {
        var approvalCount = 0;
        var recipientCount = 0;
        
        $('#selectedEmployees select').each(function() {
            var value = $(this).val();
            if (value === '결재') {
                approvalCount++;
            } else if (value === '수신') {
                recipientCount++;
            }
        });
        
        return {
            approvalCount: approvalCount,
            recipientCount: recipientCount
        };
    }

    // Add change event handler to the select element
    select.change(function() {
        var counts = checkSelectionLimits();
        var selectedValue = $(this).val();

        if (selectedValue === '결재' && counts.approvalCount > 3) {
            Swal.fire({
                text: "결재는 최대 3명까지 등록 가능합니다.",
                icon: "warning",
                buttonsStyling: false,
                confirmButtonText: "확인",
                customClass: {
                    confirmButton: "btn btn-primary"
                }
            });
            $(this).val('');
        } else if (selectedValue === '수신' && counts.recipientCount > 1) {
            Swal.fire({
                text: "수신은 1명만 등록 가능합니다.",
                icon: "warning",
                buttonsStyling: false,
                confirmButtonText: "확인",
                customClass: {
                    confirmButton: "btn btn-primary"
                }
            });
            $(this).val('');
        }
    });
}


    // 결재라인 데이터를 수집하고 폼을 제출하는 함수
if (submitBtn) {
    submitBtn.addEventListener('click', () => {
        var sanctnLineData = { sclineDetailList: [] };

        // Function to check if all selections are valid
        function checkSelectionValidity() {
            var valid = true;
            $('#selectedEmployees select').each(function() {
                var value = $(this).val();
                if (value === '' || value === '결재구분') {
                    valid = false;
                }
            });
            return valid;
        }

        // Check if all selections are valid
        var validSelections = checkSelectionValidity();

        if (!validSelections) {
            Swal.fire({
                text: "모든 결재 항목을 선택해주세요.",
                icon: "warning",
                buttonsStyling: false,
                confirmButtonText: "확인",
                customClass: {
                    confirmButton: "btn btn-primary"
                }
            });
            return;
        }

        // Count the number of selected employees for each role
        var approvalList = [];
        var recipientList = [];
        var referenceList = [];

        $('#selectedEmployees .employee-wrapper').each(function() {
            var sanctnOrdr;
            var sanctnSortate = $(this).find('select').val();
            if (sanctnSortate === '결재') {
                sanctnOrdr = 1;
                approvalList.push($(this).data('emplid'));
            } else if (sanctnSortate === '수신') {
                sanctnOrdr = 2;
                recipientList.push($(this).data('emplid'));
            } else if (sanctnSortate === '참조') {
                sanctnOrdr = 3;
                referenceList.push($(this).data('emplid'));
            }

            var emplId = $(this).data('emplid');
            sanctnLineData.sclineDetailList.push({
                sanctnOrdr: sanctnOrdr,
                sanctnEmplNo: emplId,
                sanctnSortate: sanctnSortate
            });
        });

        // Concatenate all employee IDs with the appropriate order
        var orderedEmplIds = approvalList.concat(recipientList, referenceList);

        // Assign sanctnOrdr based on the order of employee IDs
        sanctnLineData.sclineDetailList.forEach(function(employee) {
            employee.sanctnOrdr = orderedEmplIds.indexOf(employee.sanctnEmplNo) + 1;
        });

        Swal.fire({
            title: '결재라인명',
            input: 'text',
            inputPlaceholder: '결재라인명 입력',
            showCancelButton: true,
            confirmButtonText: '등록',
            cancelButtonText: '취소',
            customClass: {
                confirmButton: 'btn btn-primary',
                cancelButton: 'btn btn-active-light'
            },
            preConfirm: (inputValue) => {
                if (!inputValue) {
                    Swal.showValidationMessage('결재라인명을 입력해주세요.');
                }
                return inputValue;
            }
        }).then((Result) => {
            if (Result.isConfirmed) {
                // Create a new array to hold the updated data
                var updatedSanctnLineData = { sclineDetailList: [] };

                // Push the existing data to the new array, excluding duplicates
                sanctnLineData.sclineDetailList.forEach(function(employee) {
                    var exists = updatedSanctnLineData.sclineDetailList.some(function(existingEmployee) {
                        return existingEmployee.sanctnEmplNo === employee.sanctnEmplNo;
                    });
                    if (!exists) {
                        updatedSanctnLineData.sclineDetailList.push(employee);
                    }
                });

                $('#selectedEmployees > div.employee-wrapper').each(function(index, item) {
                    var sanctionSelect = $(item).find('select').val();
                    var emplId = $(item).data('emplid');
                    // Check if the employee ID already exists in the updated data
                    var exists = updatedSanctnLineData.sclineDetailList.some(function(existingEmployee) {
                        return existingEmployee.sanctnEmplNo === emplId;
                    });
                    if (!exists) {
                        updatedSanctnLineData.sclineDetailList.push({
                            sanctnOrdr: index + 1,
                            sanctnEmplNo: emplId,
                            sanctnSortate: sanctionSelect
                        });
                    }
                });
                
                const sanctnLnNm = Result.value;
                updatedSanctnLineData.sanctnLnNm = sanctnLnNm;
                
                $.ajax({
                    url: '/scline',
                    method: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(updatedSanctnLineData),
                    success: function (data) {
                        Swal.fire({
                            text: "결재라인이 등록되었습니다.",
                            icon: "success",
                            buttonsStyling: false,
                            confirmButtonText: "확인",
                            customClass: {
                                confirmButton: "btn btn-primary"
                            }
                        });
                        loadSanctionLineList();
                        resetSelectedEmployees();
                    },
                    error: function (xhr, status, error) {
                        console.error('에러:', status, error);
                    }
                });

            }
        });
    });
}


function createSclineItems(data) {
    var $sclineList = $('#sclineList');
    $sclineList.empty(); // 리스트 초기화

    var seen = new Set();
    var uniqueData = [];

    $.each(data, function(index, scline) {
        if (!seen.has(scline.sanctnLnNm)) {
            seen.add(scline.sanctnLnNm);
            uniqueData.push(scline);
        }
    });
    // 결재라인 데이터를 반복하여 리스트 아이템 생성
    $.each(uniqueData, function(index, scline) {
        var $listItem = $('<div>').addClass('card bg-light rounded hover-elevate-up col-3 pt-1 mb-5').css({'width': '220px', 'height': '50px'});
        var $menuItem = $('<div>').addClass('menu-item mb-3 d-flex justify-content-center align-items-center').css('height', '100%');
        var $link = $('<span>').addClass('menu-link active');
        var $menuIcon = $('<span>').addClass('menu-icon');
        var $icon = $('<i>').addClass('ki-duotone ki-profile-user fs-2 me-3').html('<span class="path1"></span> <span class="path2"></span> <span class="path3"></span> <span class="path4"></span>');
        var $menuTitle = $('<span>').addClass('menu-title fw-bold').text(scline.sanctnLnNm);
        var $button = $('<button>').addClass('btn btn-danger btn-sm').text('X');

        $link.append($menuIcon.append($icon)).append($menuTitle).append($button);
        $menuItem.append($link);
        $listItem.append($menuItem);
        $sclineList.append($listItem);

        // 링크 클릭 시 이벤트 핸들러 설정
        $link.on('click', function() {
            // 클릭된 결재라인의 세부 정보 표시
            showSclineDetail(scline.sanctnLineNo);
        });

        $button.on('click', function() {
            // 클릭된 결재라인 삭제
            deleteScline(scline.sanctnLineNo);
            // 삭제된 결재라인 항목을 화면에서 제거
            $listItem.remove();
        });
    });
}


    function loadSanctionLineList() {
        $.ajax({
            url: '/scline',
            method: 'GET',
            success: function(data) {
                createSclineItems(data);
            },
            error: function(xhr, status, error) {
                console.error('에러:', status, error); // Debug log
            }
        });
    }

    function deleteScline(data){
        $.ajax({
           url: '/scline',
           type: 'DELETE',
           contentType : 'application/json', 
           data : JSON.stringify(data),
           success : function(resp){
            Swal.fire({
                 text: "결재라인이 삭제되었습니다.",
                 icon: "success",
                 buttonsStyling: false,
                 confirmButtonText: "확인",
                 customClass: {
                     confirmButton: "btn btn-primary"
                 }
            })
           },
            error: function(xhr, status, error) {
                console.error('에러:', status, error); // Debug log
            }   
        })
    }
    function resetSelectedEmployees() {
        $('#selectedEmployees').empty(); // 선택된 직원 목록 초기화
        nextIndex = 1; // 다음 직원 인덱스 초기화
    }

    function showSclineDetail(scline) {
        $.ajax({
            url: '/scline/detail',
            type: 'GET',
            data: {sclineNo: scline},
            success: function(resp) {
                resetSelectedEmployees();
                const list = resp[0].sclineDetailList;
                list.forEach(function(e) {
                    addEmployeeToList(e.sanctnEmplNo, e.emplNm, e.ofcpsCode + ", " + e.rspofcCode, e.proflPhotoCours, e.sanctnSortate);
                });
            },
            error: function(xhr, status, error) {
                console.error('에러:', status, error); // Debug log
            }
        });
    }

    /*
    function resetSelectedEmployees() {
        $('#selectedEmployees').empty(); // 선택된 직원 목록 초기화
        nextIndex = 1; // 다음 직원 인덱스 초기화
    }
*/

    /*
    function loadSanctionLineList() {
        $.ajax({
            url: '/scline',
            method: 'GET',
            success: function(data) {
                createSclineItems(data);
            },
            error: function(xhr, status, error) {
                console.error('에러:', status, error); // Debug log
            }
        });
    }
*/
/*
    function createSclineItems(data) {
        var $sclineList = $('#sclineList');
        $sclineList.empty(); // 리스트 초기화

        var seen = new Set();
        var uniqueData = [];
        
        $.each(data, function(index, scline) {
            if (!seen.has(scline.sanctnLnNm)) {
                seen.add(scline.sanctnLnNm);
                uniqueData.push(scline);
            }
        });

        // 결재라인 데이터를 반복하여 리스트 아이템 생성
        $.each(uniqueData, function(index, scline) {
            var $listItem = $('<li>').addClass('list-group-item d-flex justify-content-between align-items-center text-center mb-2');
            var $link = $('<a>').attr('href', '#').text(scline.sanctnLnNm);
            var $button = $('<button>').addClass('btn btn-light-danger btn-sm').attr('id', 'kt_docs_sweetalert_html').text('X');
            
            $listItem.append($link);
            $listItem.append($button);
            $sclineList.append($listItem);

            // 링크 클릭 시 이벤트 핸들러 설정
            $link.on('click', function() {
                // 클릭된 결재라인의 세부 정보 표시
                showSclineDetail(scline.sanctnLineNo);
            });
            
            $button.on('click', function() {
                // 클릭된 결재라인 삭제
                deleteScline(scline.sanctnLineNo);
                // 삭제된 결재라인 항목을 화면에서 제거
                $listItem.remove();
            });
        });
    }
*/

/*
    function showSclineDetail(scline) {
        $.ajax({
            url: '/scline/detail',
            type: 'GET',
            data: {sclineNo: scline},
            success: function(resp) {
                resetSelectedEmployees();
                const list = resp[0].sclineDetailList;
                list.forEach(function(e) {
                    addEmployeeToList(e.sanctnEmplNo, e.emplNm + " (" + e.ofcpsCode + ", " + e.rspofcCode + ")");
                });
            },
            error: function(xhr, status, error) {
                console.error('에러:', status, error); // Debug log
            }
        });
    }
*/
});
