$("#employee_encpnDe").flatpickr({dateFormat: "Y/m/d"});

$("#auto_insert_button").on("click", function(e){
	let name= $("input[name=employee_name]")
	let id = $("input[name=employee_id]")
	let password = $("input[name=employee_passowrd]")
	let ihidnum = $("input[name=employee_ihidnum]")
	let cmmnCode = $("input[name=employee_cmmnCode]")
	let department = $("input[name=employee_department]")
	let rank = $("select[name=employee_rank]")
	let rspofc = $("select[name=employee_rspofc]")
	let phone = $("input[name=employee_phone]")
	let emgncContactNtwkNo = $("input[name=employee_emgncContactNtwkNo]")
	let lxtnNo = $("input[name=employee_lxtnNo]")
	let zip = $("input[name=employee_zip]")
	let bassAdres = $("input[name=employee_bassAdres]")
	let detailAdres = $("input[name=employee_detailAdres]")
	let email = $("input[name=employee_email]")
	let encpnDe = $("#employee_encpnDe")
	
	name.val("김안녕")
	id.val("hiyo")
	password.val("hiyo")
	lxtnNo.val("145")
	email.val("hiyo@ddit.com")
	ihidnum.val("001010-4434567")
	phone.val("010-1234-5678")
	emgncContactNtwkNo.val("010-8765-4321")
	zip.val("35230")
	bassAdres.val("대전 서구 둔산동 1095")
	detailAdres.val("하이스트빌 202호")
})

$("#employee_insert_button").on("click", function(e){
	let nameValue = $("input[name=employee_name]").val();
	let idValue = $("input[name=employee_id]").val();
	let passwordValue = $("input[name=employee_passowrd]").val();
	let ihidnumValue = $("input[name=employee_ihidnum]").val();
	let cmmnCodeValue = $("input[name=employee_cmmnCode]").val();
	let departmentValue = $("input[name=employee_department]").val();
	let rankValue = $("select[name=employee_rank]").val();
	let rspofcValue = $("select[name=employee_rspofc]").val();
	let phoneValue = $("input[name=employee_phone]").val();
	let emgncContactNtwkNoValue = $("input[name=employee_emgncContactNtwkNo]").val();
	let lxtnNoValue = $("input[name=employee_lxtnNo]").val();
	let zipValue = $("input[name=employee_zip]").val();
	let bassAdresValue = $("input[name=employee_bassAdres]").val();
	let detailAdresValue = $("input[name=employee_detailAdres]").val();
	let emailValue = $("input[name=employee_email]").val();
	let encpnDeValue = $("#employee_encpnDe").val();
	
//	let imageWrapper = $(".image-input-wrapper");
//	let backgroundImage = imageWrapper.css("background-image");
//	let imageUrl = backgroundImage.slice(38, -2);
	
//	let data = {
//		proflPhotoCours : imageUrl
//		, emplNm : nameValue
//		, emplId : idValue
//		, emplPw : passwordValue
//		, ihidnum : ihidnumValue
//		, cmmnCode : cmmnCodeValue
//		, deptNo : departmentValue
//		, ofcpsCode : rankValue
//		, rspofcCode : rspofcValue
//		, moblphonNo : phoneValue
//		, emgncContactNtwkNo : emgncContactNtwkNoValue
//		, lxtnNo : lxtnNoValue
//		, bassAdres : bassAdresValue
//		, detailAdres : detailAdresValue
//		, zip : zipValue
//		, emailAdres : emailValue
//		, encpnDe : encpnDeValue
//	};
	
//	console.log("data : ", data);
	
	let formData = new FormData();
	formData.append("multipartFile", fileInput.files[0]);
	formData.append("emplNm", nameValue);
	formData.append("emplId", idValue);
	formData.append("emplPw", passwordValue);
	formData.append("ihidnum", ihidnumValue);
	formData.append("cmmnCode", cmmnCodeValue);
	formData.append("deptNo", departmentValue);
	formData.append("ofcpsCode", rankValue);
	formData.append("rspofcCode", rspofcValue);
	formData.append("moblphonNo", phoneValue);
	formData.append("emgncContactNtwkNo", emgncContactNtwkNoValue);
	formData.append("lxtnNo", lxtnNoValue);
	formData.append("zip", zipValue);
	formData.append("bassAdres", bassAdresValue);
	formData.append("detailAdres", detailAdresValue);
	formData.append("emailAdres", emailValue);
	formData.append("encpnDe", encpnDeValue);
	
	$.ajax({
		method : "post"
		, url : "/employee/new"
		, contentType : false
		, processData : false
		, cache : false
		, data : formData
		, success : function(valueData){
			if (valueData == "success") {
			    swal.fire({
			        text : "등록 완료."
					, icon : "success"
					, buttonsStyling : false
					, confirmButtonText : "확인"
					, customClass : {
			            confirmButton : "btn fw-bold btn-light-primary"
			        }
			    }).then((result) => {
			        if (result.isConfirmed) {
			            location.href = "/employee/list";
			        }
			    });
			}
			else{
			}
		}
	})
})

let node;

let script = document.createElement("script");
script.src = "https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.16/jstree.min.js";
script.onload = function() {
    $.ajax({
        method : "GET",
        url : "/dept/tri",
        success: function(data) {
            $("#jstree_department").jstree({
                "core": {
                    "data": data
					, "check_callback": true
                },
                "search": {
                    "show_only_matches": true
                },
                "plugins": ["search", "html"]
            });
            $("#jstree_department").on("select_node.jstree", function (e, data) {
                node = data.node;
            });
        },
        error : function(xhr, status, error) {
            console.error("에러:", status, error);
        }
    });
}

document.body.appendChild(script);

$("#selectDepartment").on("click", function() {
	$("#employee_insert_department").modal("show");
});

function fSch() {
	$("#jstree_department").jstree(true).search($("#departmentSearch").val());
}

function submitDepartment() {
	$("input[name = employee_departmentNm]").val(node.text);
	$("input[name = employee_department]").val(node.id);
	$("#employee_insert_department").modal("hide");
}