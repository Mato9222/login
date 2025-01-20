document.addEventListener("DOMContentLoaded", () => {
	const dropzoneElement = document.querySelector("#kt_dropzonejs_example_3");
	const myDropzone = Dropzone.forElement(dropzoneElement);
    // 플랫피커
    $("#kt_datepicker_1").flatpickr();
    $("#kt_datepicker_2").flatpickr();
	 

	flatpickr("#kt_datepicker_1", {
        minDate: "today"
      });
	flatpickr("#kt_datepicker_2", {
        minDate: "today"
      });
    // ck editor
    ClassicEditor
        .create(document.querySelector('#worksCon'), {
            licenseKey: 'eU5USHA5OURMMVdUZE9LeFhNanYyVGZDTlNEZFZndzRVbGZwTThvRkVwdlFPRGZXRHZ3dUhnT056eXRMQmc9PS1NakF5TkRBMk1qST0='
        })
        .then(newEditor => {
            editor = newEditor;
        })
        .catch(error => {
            console.error(error);
        });
   
    // 등록 버튼 클릭 시 등록 폼 보이기/숨기기
     $('#registerButton').on('click', () => {
        $('#registrationForm').toggle();
        $('#worklist').toggle();
    }); 
     
    	 var worksNoInput = document.querySelector('#worksNoInput');
	     var worksTitle = document.querySelector('#detail_worksTitle');
	     var worksCon = document.querySelector('#sntncCnArea');
	     var workSttusCode = document.querySelector('#detail_workSttusCode');
	     var worksOrd = document.querySelector('#detail_worksOrd');
	     var emplNm2 = document.querySelector('#detail_prjctMbrNo2');
	     var bgnde = document.querySelector('#detail_bgnde');
	     var closOn = document.querySelector('#detail_closOn');
	     var progrsRt = document.querySelector('#detail_progrsRt');
	     var writede = document.querySelector('#detail_writede');
     
    // 일감 제목 클릭시 상세조회
    $(document).on('click','.work_title',(e)=>{
    	var worksNo = e.target.dataset.worksno;
    	worksTitle.innerHTML = '';
    	worksCon.innerHTML = '';
    	workSttusCode.innerHTML = '';
    	worksOrd.innerHTML = '';
    	emplNm2.innerHTML = '';
    	bgnde.innerHTML = '';
    	closOn.innerHTML = '';
    	progrsRt.innerHTML = '';
    	writede.innerHTML = '';
    	$.ajax({
    		url:`/projectWork/detailWork/${worksNo}`,
    		method:'GET',
    		success:function(resp){
    			console.log("resp==>",resp);
    			worksNoInput.value = resp.worksNo;
    			console.log("worksNoInput",worksNoInput.value);
    			worksTitle.innerHTML = resp.worksTitle;
    			workSttusCode.innerHTML = resp.workSttusCode;
    			writede.innerHTML = "작성일시 : "+resp.writede;
    			switch (resp.workSttusCode) {
                case 'G01':
                	workSttusCode.innerHTML = '<span class="badge badge-primary">진행중</span>';
                    break;
                case 'G02':
                	workSttusCode.innerHTML = '<span class="badge badge-success">완료</span>';
                    break;
                case 'G03':
                	workSttusCode.innerHTML = '<span class="badge badge-secondary">대기</span>';
                    break;
                case 'G04':
                	workSttusCode.innerHTML = '<span class="badge badge-warning">보류</span>';
                    break;
                default:
                	workSttusCode.innerHTML = '상태 없음';
            }
    			
    			switch(resp.worksOrd){
    			case 1:
    				worksOrd.className = 'text-primary';
    				worksOrd.innerHTML = '낮음&nbsp;<span class="ki-outline ki-graph-up text-primary"></span>';
                    break;
                case 2:
                	worksOrd.className = 'text-success';
                	worksOrd.innerHTML = '보통&nbsp;<span class="ki-outline ki-graph-up text-success"></span>';
                    break;
                case 3:
                	worksOrd.className = 'text-info';
                	worksOrd.innerHTML = '높음&nbsp;<span class="ki-outline ki-graph-up text-info"></span>';
                    break;
                case 4:
                	worksOrd.className = 'text-warning';
                	worksOrd.innerHTML = '긴급&nbsp;<span class="ki-outline ki-graph-up text-warning"></span>';
                    break;
                case 5:
                	worksOrd.className = 'text-danger';
                	worksOrd.innerHTML = '즉시&nbsp;<span class="ki-outline ki-graph-up text-danger"></span>';
                    break;
                default:
                    worksOrdSpan.innerHTML = '정보 없음';
            }
    			emplNm2.innerHTML = resp.emplNm2;
    			bgnde.innerHTML = resp.bgnde;
    			closOn.innerHTML = resp.closOn;
    			progrsRt.innerHTML = resp.progrsRt+'%';
    			$('#detail_work').toggle();
    	    	$('#worklist').toggle();
    		},
    		errors:function(error){
    			console.log(error);
    		}
    	})
    	
    })
    //일감 삭제
    $('[data-bs-toggle="delete"]').on('click', () => {
    	var worksNo = $('#worksNoInput').val();
        
    	Swal.fire({
            text: "정말로 현재 일감을 삭제하시겠습니까?",
            icon: "warning",
            showCancelButton: true,
            buttonsStyling: false,
            confirmButtonText: "예",
            cancelButtonText: "아니요",
            customClass: {
                confirmButton: "btn btn-primary",
                cancelButton: "btn btn-active-light"
            }
        }).then(function (result) {
            if (result.value) {
                $.ajax({
                    url:`/projectWork/deleteWork/${worksNo}`,
                    method:"PUT",
                    dataType:"json",
                    success:function(resp){
                        if(resp=='ok'){
                        	 location.reload();
                        }
                    }
                })

            } else if (result.dismiss === 'cancel') {
                Swal.fire({
                    text: "일정이 삭제되지 않았습니다.",
                    icon: "error",
                    buttonsStyling: false,
                    confirmButtonText: "예",
                    customClass: {
                        confirmButton: "btn btn-primary",
                    }
                });
            }
        });
    });
    
	// 일감 수정
	$('[data-bs-toggle="update"]').on('click', () => {
		var worksNo = $('#worksNoInput').val();
	    console.log("worksNo===>",worksNo);
	    // 작성일자와 담당자 데이터 유지
	    var writede = $('#detail_writede').text();
	    var prjctMbrNo2 = $('#detail_prjctMbrNo2').text();
	
	    // 현재 값 가져오기
	    var worksTitle = $('#detail_worksTitle').text();
	    var workSttusCode = $('#detail_workSttusCode').text();
	    var worksOrd = $('#detail_worksOrd').text();
	    var bgnde = $('#detail_bgnde').text();
	    var closOn = $('#detail_closOn').text();
	    var progrsRtVal = $('#detail_progrsRt').text().replace('%', '');
	    var sntncCnAreaVal = $('#sntncCnArea').text();
	
	    $('#detail_worksTitle').text(worksTitle);
	
	    // 나머지 input 요소 초기화
	    $('#detail_workSttusCode').text(workSttusCode);
	    $('#detail_worksOrd').text(worksOrd);
	    $('#detail_prjctMbrNo2').text(prjctMbrNo2); // 담당자 데이터 유지
	    $('#detail_bgnde').replaceWith('<input class="form-control" placeholder="Pick a date" id="kt_datepicker_3" value="' + bgnde + '"/>');
	    $('#detail_closOn').replaceWith('<input class="form-control" placeholder="Pick a date" id="kt_datepicker_4" value="' + closOn + '"/>');
	    
	    $("#kt_datepicker_3").flatpickr();
	    $("#kt_datepicker_4").flatpickr();
	    
	    $('#detail_progrsRt').replaceWith('<input id="detail_progrsRtI" class="form-control" type="text" value="' + progrsRtVal+'%'+ '" placeholder="진척도">');
	    $('#sntncCnArea').replaceWith('<textarea id="sntncCnArea" class="form-control" rows="3">' + sntncCnAreaVal + '</textarea>'); // 작업 이력 데이터 유지
	
	    // 작성일자는 그대로 표시
	    $('#detail_writede').text(writede); // 작성일자 데이터 유지
	
	    // detail_work 영역 보이기
	    $('#detail_work').show();
	
	    $('[data-bs-toggle="update"]').off('click.update').on('click.update', () => {
	        console.log("Checking elements:");
	        console.log("kt_datepicker_3: ", $('#kt_datepicker_3'));
	        console.log("kt_datepicker_4: ", $('#kt_datepicker_4'));
	        console.log("detail_progrsRt: ", $('#detail_progrsRt'));
			
	        const worksNoVal = worksNo;
	        const worksTitleVal = $('#detail_worksTitle').text();
	        const workSttusCodeVal = $('#detail_workSttusCode').text(); 
	        const worksOrdVal = $('#detail_worksOrd').text(); 
	        const bgndeVal = $('#kt_datepicker_3').val(); 
	        const closOnVal = $('#kt_datepicker_4').val(); 
	        const progrsRtVal = $('#detail_progrsRtI').val(); 
	        const sntncCnAreaVal = $('#sntncCnArea').val();
			
	        console.log("worksNoVal ==> ", worksNoVal);
	        console.log("worksTitleVal ==> ", worksTitleVal);
	        console.log("workSttusCodeVal ==> ", workSttusCodeVal);
	        console.log("worksOrdVal ==> ", worksOrdVal);
	        console.log("bgnde ==> ", bgndeVal);
	        console.log("closOn ==> ", closOnVal);
	        console.log("progrsRt ==> ", progrsRtVal);
	
	        $.ajax({
	            url: '/projectWork/updateWork',
	            method: 'PUT',
	            contentType: 'application/json',
	            data: JSON.stringify({
	            	worksNo: worksNoVal,
	                bgnde: bgndeVal,
	                closOn: closOnVal,
	                progrsRt: progrsRtVal,
	            }),
	            success: function(resp) {
	                console.log("resp===>", resp);
	                if(resp == 'ok'){
	                    location.reload();
	                    $('#worklist').show();
	                }
	            },
	            error: function(xhr, status, error) {
	                // 요청이 실패한 경우 수행할 작업
	            }
	        });
	    });
	});
    
    $('[data-bs-toggle="back"]').on('click',()=>{
    	$('#detail_work').toggle();
    	$('#worklist').toggle();
    })
    
    var $worksTitle = $('input[name=worksTitle]');
    var $worksCon = $('#worksCon');
    var $prjctMbrNo = $('input[name=prjctMbrNo]').val();
    var $prjctMbrNo2 = $('#prjctMbrNo2');
    var $bgnde = $('#kt_datepicker_1');
    var $closOn = $('#kt_datepicker_2');
    var $worksOrd = $('#worksOrd')
	
    
    $('#insert_newwork_btn').on('click',()=>{
    	let worksTitle = $worksTitle.val();
    	let worksCon = editor.getData();
    	let prjctMbrNo = $prjctMbrNo;
    	let prjctMbrNo2 = $prjctMbrNo2.val();
    	let bgnde = $bgnde.val();
    	let closOn = $closOn.val();
    	let worksOrd = $worksOrd.val();
		const currentFileNames = myDropzone.files.map(file => file.name);
    	

		const projectWorkVO = {
    			
    			worksTitle: worksTitle,
    			worksCon: worksCon,
    			prjctMbrNo: prjctMbrNo,
    			prjctMbrNo2: prjctMbrNo2,
    			bgnde: bgnde,
    			closOn: closOn,
    			worksOrd: worksOrd,
    	}
    	const sendData = {
				projectWorkVO:projectWorkVO,
				attach:currentFileNames,
				attachTemp:uploadedFileList
		}
    	$.ajax({
    		url:'/projectWork/insertWork',
    		method:'POST',
    		data: JSON.stringify(sendData),
    		contentType:"application/json",
    		success:function(resp){
    			location.reload();
    		}
    	})
    })
    const render=()=>{
    	
    }
    $('#tab_works').on('shown.bs.tab',()=>{
    	console.log("사랑");
    	$('#worklist').show();
    	
    	$('#registrationForm').hide();
    	
    })
    
	$('#go_works').on('click', function() {
        $('#tab_works').trigger('click');
    });
});