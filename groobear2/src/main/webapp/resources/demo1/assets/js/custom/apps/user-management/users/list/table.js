const filterSearch = document.querySelector("[data-kt-user-table-filter='search']");
const filterForm = document.querySelector("[data-kt-user-table-filter='form']");
const filterButton = filterForm.querySelector("[data-kt-user-table-filter='filter']");
const selectOptions = filterForm.querySelectorAll("select");

const datatable = $("#kt_table_users").DataTable({
    "info": false
	, "order": []
	, "pageLength": 10
	, "lengthChange": false
	, "language": {
        "zeroRecords": "검색 결과가 없습니다."
    }
});

filterSearch.addEventListener("keyup", function (e) {
	datatable.search(e.target.value).draw();
});

filterButton.addEventListener("click", function () {
    let filterString = "";
    let isAllSelected = false;

    selectOptions.forEach((item, index) => {
        if (item.value && item.value !== "") {
            if (item.value === "전체") {
                isAllSelected = true;
            } else {
                if (index !== 0) {
                    filterString += " ";
                }
                switch (item.value) {
                    case "A01":
                        filterString += "사원";
                        break;
                    case "A02":
                        filterString += "선임";
                        break;
                    case "A03":
                        filterString += "책임";
                        break;
                    case "A04":
                        filterString += "수석";
                        break;
                    case "A05":
                        filterString += "이사";
                        break;
                    case "A06":
                        filterString += "상무";
                        break;
                    case "A07":
                        filterString += "전무";
                        break;
                    case "A08":
                        filterString += "사장";
                        break;
                    default:
                        filterString += item.value;
                }
            }
        }
    });
    if (isAllSelected) {
        datatable.search("").draw(); // "전체"가 선택되었을 때 모든 항목 표시
    } else {
        datatable.search(filterString).draw(); // 그렇지 않으면 필터된 항목 표시
    }
});

$("#insertBtn").on("click", function(){
	location.href = "/employee/new";
});