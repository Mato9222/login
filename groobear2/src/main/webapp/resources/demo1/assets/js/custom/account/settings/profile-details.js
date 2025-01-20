const mypageAccessBtn = document.querySelector("#mypageAccessBtn");
document.addEventListener("DOMContentLoaded", () => {
    if (mypageAccessBtn) {
        mypageAccessBtn.addEventListener("click", () => {
            const emplPw = $("input[name='mypagePasswordAccess']").val();
            $.ajax({
                url: "/access/mypage",
                method: "POST",
				contentType: "application/json",
                data: JSON.stringify({ emplPw: emplPw }), // 데이터는 객체로 전달
                success: function (data) {
                    if (data.success) {
                        Swal.fire({
                            text: "인증에 성공하였습니다.",
                            icon: "success",
                            buttonsStyling: false,
                            confirmButtonText: "확인",
                            customClass: {
                                confirmButton: "btn btn-primary"
                            }
                        }).then(() => { // then 메서드를 여기로 이동
                            location.href = "/mypage";
                        });
                    } else {
                        Swal.fire({
                            text: "비밀번호가 일치하지 않습니다.",
                            icon: "error", // "danger"가 아니라 "error"
                            buttonsStyling: false,
                            confirmButtonText: "확인",
                            customClass: {
                                confirmButton: "btn btn-primary"
                            }
                        });
                    }
                }
            });
        });
    }
});

$("#kt_account_profile_details_submit").on("click", function(e){
	let phoneValue = $("input[name=phone]").val();
	let lxtnNoValue = $("input[name=lxtnNo]").val();
	let emailValue = $("input[name=email]").val();
	let zipValue = $("input[name=zip]").val();
	let bassAdresValue = $("input[name=bassAdres]").val();
	let detailAdresValue = $("input[name=detailAdres]").val();
	let emgncContactNtwkNoValue = $("input[name=emgncContactNtwkNo]").val();
	
//	console.log("data : ", data);
	let formData = new FormData();	// enctype : 자동으로 "multipart/form-data" 
	formData.append("multipartFile", fileInput.files[0]);	// 1개인 경우
	formData.append("moblphonNo", phoneValue);
	formData.append("lxtnNo", lxtnNoValue);
	formData.append("emailAdres", emailValue);
	formData.append("zip", zipValue);
	formData.append("bassAdres", bassAdresValue);
	formData.append("detailAdres", detailAdresValue);
	formData.append("emgncContactNtwkNo", emgncContactNtwkNoValue);
	
	$.ajax({
		method : "post"
		, url : "/mypage/settings"
		, contentType : false
		, processData : false
		, cache : false
		, data : formData
//		, dataType : "text"
		, success : function(valueData){
//			console.log("valueData : ", valueData);
			if (valueData == "success") {
			    swal.fire({
			        text: "변경 완료."
					, icon: "success"
					, buttonsStyling: false
					, confirmButtonText: "확인"
					, customClass: {
			            confirmButton: "btn fw-bold btn-light-primary"
			        }
			    }).then((result) => {
			        if (result.isConfirmed) {
			            location.href = "/mypage";
			        }
			    });
			}
		}
	})
})
$("#cancleSettings").on("click", function(e){
	swal.fire({
		text: "수정을 취소하시겠습니까?",
		icon: "warning",
		buttonsStyling: false,
		showDenyButton: true,
		confirmButtonText: "네",
		denyButtonText: "아니오",
		customClass: {
			confirmButton: "btn btn-primary",
			denyButton: "btn btn-light-danger"
	    }
	}).then((result) => {
		if (result.isConfirmed) {
			swal.fire({
				text: "수정을 취소했습니다", 
				icon: "success",
				confirmButtonText: "확인",
				buttonsStyling: false,
				customClass: {
					confirmButton: "btn btn-light-primary"
				}
			}).then((result) => {
		        if (result.isConfirmed) {
		            location.href = "/mypage";
		        }
		    });
		}
	});
})