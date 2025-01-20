"use strict";

// Class definition
var KTAccountSettingsProfileDetails = function () {
    // Private variables
    var form;
    var submitButton;
    var validation;

    // Private functions
    var initValidation = function () {
        // Init form validation rules. For more info check the FormValidation plugin's official documentation:https://formvalidation.io/
        validation = FormValidation.formValidation(
            form,
            {
                fields: {
                    phone: {
                        validators: {
                            notEmpty: {
                                message: '휴대폰 번호는 필수 입력입니다.'
                            }
                        }
                    },
                    bassAdres: {
                        validators: {
                            notEmpty: {
                                message: '기본 주소는 필수 입력입니다.'
                            }
                        }
                    },
                    detailAdres: {
                        validators: {
                            notEmpty: {
                                message: '상세 주소는 필수 입력입니다.'
                            }
                        }
                    },
                    emgncContactNtwkNo: {
                        validators: {
                            notEmpty: {
                                message: '비상 연락처는 필수 입력입니다.'
                            }
                        }
                    },
                },
                plugins: {
                    trigger: new FormValidation.plugins.Trigger(),
                    submitButton: new FormValidation.plugins.SubmitButton(),
                    //defaultSubmit: new FormValidation.plugins.DefaultSubmit(), // Uncomment this line to enable normal button submit after form validation
                    bootstrap: new FormValidation.plugins.Bootstrap5({
                        rowSelector: '.fv-row',
                        eleInvalidClass: '',
                        eleValidClass: ''
                    })
                }
            }
        );
    }

    var handleForm = function () {
        submitButton.addEventListener('click', function (e) {
            e.preventDefault();

            validation.validate().then(function (status) {
                if (status == 'Valid') {

                    swal.fire({
                        text: "변경 완료.",
                        icon: "success",
                        buttonsStyling: false,
                        confirmButtonText: "네",
                        customClass: {
                            confirmButton: "btn fw-bold btn-light-primary"
                        }
                    });

                } else {
                    swal.fire({
                        text: "변경 실패.",
                        icon: "error",
                        buttonsStyling: false,
                        confirmButtonText: "네",
                        customClass: {
                            confirmButton: "btn fw-bold btn-light-primary"
                        }
                    });
                }
            });
        });
    }

    // Public methods
    return {
        init: function () {
            form = document.getElementById('kt_account_profile_details_form');
            
            if (!form) {
                return;
            }

            submitButton = form.querySelector('#kt_account_profile_details_submit');

            initValidation();
        }
    }
}();

// On document ready
KTUtil.onDOMContentLoaded(function() {
    KTAccountSettingsProfileDetails.init();
});
