var KTSigninGeneral = function () {
    // Elements
    var form;
    var submitButton;
    var validator;

    // Handle form
    var handleValidation = function (e) {
        // Init form validation rules. For more info check the FormValidation plugin's official documentation:https://formvalidation.io/
        validator = FormValidation.formValidation(
            form,
            {
                fields: {
                    'emplId': {
                        validators: {
                            notEmpty: {
                                message: 'ID를 입력해주세요'
                            }
                        }
                    },
                    'emplPW': {
                        validators: {
                            notEmpty: {
                                message: '패스워드를 입력해주세요'
                            }
                        }
                    }
                },
                plugins: {
                    trigger: new FormValidation.plugins.Trigger(),
                    bootstrap: new FormValidation.plugins.Bootstrap5({
                        rowSelector: '.fv-row',
                        eleInvalidClass: '',  // comment to enable invalid state icons
                        eleValidClass: '' // comment to enable valid state icons
                    })
                }
            }
        );
    }

    var handleSubmit = function (e) {
        // Handle form submit
        form.addEventListener('submit', function (e) {
            e.preventDefault(); // Prevent default form submission

            // Validate form
            validator.validate().then(function (status) {
                if (status == 'Valid') {
                    // Show loading indication
                    submitButton.setAttribute('data-kt-indicator', 'on');

                    // Disable button to avoid multiple click
                    submitButton.disabled = true;

                    // Prepare form data
                    var formData = new FormData(form);

                    // Send login request to the server using fetch API
                    fetch(form.getAttribute('action'), {
                        method: 'POST',
                        body: formData
                    })
                    .then(function(response) {
                        if (response.ok && !new URL(response.url).searchParams.has("error")) {
                            // Handle successful login response
                            return response.text();
                        } else {
                            // Handle error response
                            throw new Error('네트워크 오류');
                        }
                    })
                    .then(function(data) {
                        // Handle successful login data
                        // Here you can redirect the user or perform any other actions
                        console.log(data); // Log response data to the console

                        // Show message popup for successful login
                        Swal.fire({
                            text: "로그인 성공",
                            icon: "success",
                            buttonsStyling: false,
                            confirmButtonText: "확인",
                            customClass: {
                                confirmButton: "btn btn-primary"
                            }
                        }).then(function () {
                            // Redirect to the specified URL
                            var redirectUrl = form.getAttribute('data-kt-redirect-url');
                            if (redirectUrl) {
                                location.href = redirectUrl;
                            }
                        });
                    })
                    .catch(function(error) {
                        // Handle error
                        console.error('There has been a problem with your fetch operation:', error);

                        // Show message popup for failed login
                        Swal.fire({
                            text: "로그인 실패",
                            icon: "error",
                            buttonsStyling: false,
                            confirmButtonText: "확인",
                            customClass: {
                                confirmButton: "btn btn-primary"
                            }
                        });
                    })
                    .finally(function() {
                        // Hide loading indication
                        submitButton.removeAttribute('data-kt-indicator');

                        // Enable button
                        submitButton.disabled = false;
                    });
                } else {
                    // Show error popup for validation errors
                    Swal.fire({
                        text: "입력값을 확인해주세요",
                        icon: "error",
                        buttonsStyling: false,
                        confirmButtonText: "확인",
                        customClass: {
                            confirmButton: "btn btn-primary"
                        }
                    });
                }
            });
        });
    }

    // Public functions
    return {
        // Initialization
        init: function () {
            form = document.querySelector('#kt_sign_in_form');
            submitButton = document.querySelector('#kt_sign_in_submit');

            handleValidation();
            handleSubmit();
        }
    };
}();

// On document ready
KTUtil.onDOMContentLoaded(function () {
    KTSigninGeneral.init();
});
