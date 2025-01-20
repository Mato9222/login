<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<!--begin::Head-->
<head>
<title>그루베어</title>
<meta charset="utf-8" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/demo1/assets/media/logos/favicon.ico" />

<!--begin::Fonts(mandatory for all pages)-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700" />
<!--end::Fonts-->
<tiles:insertAttribute name="preScript" />
<style>
	.time_body {
    	display: -webkit-box;
    	display: -ms-flexbox;
    	display: flex;
    	-ms-flex-wrap: wrap;
    	flex-wrap: wrap;
    	margin: 16px -3px 0;
	}
    .tree-container {
        border: 1px solid #ddd;
        padding: 10px;
        height: 400px;
        overflow-y: auto;
    }
    .selected-employees {
        border: 1px solid #ddd;
        padding: 10px;
        height: 400px;
        overflow-y: auto;
    }
    .list-group-item {
    width: 40%; /* 원하는 너비로 조정하세요 */
    }
</style>
<style>
    .selected-employees {
        max-height: 400px; /* 선택된 직원 목록의 최대 높이 지정 */
        overflow-y: auto; /* 내용이 넘칠 경우 스크롤 표시 */
    }
    .selected-employees li {
        cursor: pointer; /* 선택된 직원 아이템에 마우스 커서를 포인터로 설정하여 클릭 가능하도록 함 */
        padding: 5px;
        border: 1px solid #ccc;
        margin-bottom: 3px;
        background-color: #f9f9f9;
    }
</style>
<style>
    .delete-button {
        width: 25px;
        height: 25px;
        float : right;
        display: flex;
        justify-content: center;
        align-items: center;
		font-size : 10px;        
    }
    .RR-button {
        width: 65px;
        height: 35px;
        display: flex;
        justify-content: center;
        align-items: center;
		font-size : 12px;        
    }
</style>

</head>
<!--end::Head-->
<body data-context-path="${pageContext.request.contextPath}"
	id="kt_app_body" data-kt-app-layout="dark-sidebar"
	data-kt-app-header-fixed="true" data-kt-app-sidebar-enabled="true"
	data-kt-app-sidebar-fixed="true" data-kt-app-sidebar-hoverable="true"
	data-kt-app-sidebar-push-header="true"
	data-kt-app-sidebar-push-toolbar="true"
	data-kt-app-sidebar-push-footer="true"
	data-kt-app-toolbar-enabled="true" class="app-default"
	>
	<script>
		var defaultThemeMode = "light";
		var themeMode;
		if (document.documentElement) {
			if (document.documentElement.hasAttribute("data-bs-theme-mode")) {
				themeMode = document.documentElement
						.getAttribute("data-bs-theme-mode");
			} else {
				if (localStorage.getItem("data-bs-theme") !== null) {
					themeMode = localStorage.getItem("data-bs-theme");
				} else {
					themeMode = defaultThemeMode;
				}
			}
			if (themeMode === "system") {
				themeMode = window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark"
						: "light";
			}
			document.documentElement.setAttribute("data-bs-theme", themeMode);
		}
		
		

	</script>
	<!--begin::App-->
	<div class="d-flex flex-column flex-root app-root" id="kt_app_root">
		<!--begin::Page-->
		<div class="app-page flex-column flex-column-fluid" id="kt_app_page">
			<!-- ======= Header ======= -->

			<tiles:insertAttribute name="header" />

			<!-- End Header -->
			<!--begin::Wrapper-->
			<div class="app-wrapper flex-column flex-row-fluid"
				id="kt_app_wrapper">
				<!-- ======= Sidebar ======= -->

				<tiles:insertAttribute name="leftMenu" />

				<!-- End Sidebar-->

				<!--   <main id="main" class="main"> -->

				<!-- ======= Main ======= -->
				<div class="app-main flex-column flex-row-fluid" id="kt_app_main">
					<tiles:insertAttribute name="content" />

					<!-- ======= Footer ======= -->
					<tiles:insertAttribute name="footer" />
					<!-- End Footer -->
				</div>
				<!-- End main -->
				<!--   </main> -->
			</div>
			<!--end::Wrapper-->
		</div>
		<!--end::Page-->
	</div>
	<!--end::App-->
	<!-- ======= Drawer ======= -->
<%-- 	<tiles:insertAttribute name="drawer" /> --%>
	<tiles:insertAttribute name="scrolltop" />
<!-- 	<div id="modalArea"> -->
	<tiles:insertAttribute name="modal" />
		<script>
		document.addEventListener("DOMContentLoaded", () => {
			const modalBtn = document.querySelector('#newModal');
			myModal = new bootstrap.Modal('#kt_modal_invite_friends', {focus:false});
			modalBtn.addEventListener('click', function(){
				myModal.show();
			})
		})
		
		</script>
<!-- 	</div> -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<tiles:insertAttribute name="postScript" />
</body>

</html>