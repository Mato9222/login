const passwordAccessBtn = document.querySelector('#passwordAccessBtn');
document.addEventListener("DOMContentLoaded", () => {
    if (passwordAccessBtn) {
        passwordAccessBtn.addEventListener('click', () => {
            const emplPw = $('input[name="passwordAccess"]').val();
            $.ajax({
                url: '/access/password',
                method: 'POST',
				contentType: 'application/json',
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
                            location.href = "/sanctionList/setting";
                        });
                    } else {
                        Swal.fire({
                            text: "비밀번호가 일치하지 않습니다.",
                            icon: "error", // 'danger'가 아니라 'error'
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
