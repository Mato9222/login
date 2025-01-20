let organizationScript = document.createElement("script");
organizationScript.src = "https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.16/jstree.min.js";
organizationScript.onload = function() {
    $.ajax({
        method : "GET",
        url : "/dept/organ",
        success: function(data) {
            $("#jstreeOrganization").jstree({
                "core": {
                    "data": data
					, "check_callback": true
                },
                "search": {
                    "show_only_matches": true
                },
                "plugins": ["search", "html"]
            });
            $("#jstreeOrganization").on("select_node.jstree", function (e, data) {
                node = data.node;
            });
        },
        error : function(xhr, status, error) {
            console.error("에러:", status, error);
        }
    });
}

document.body.appendChild(organizationScript);

$("#selectOrganization").on("click", function() {
    $("#departmentOrganization").modal("show");
});

function fSch() {
	$("#jstreeOrganization").jstree(true).search($("#organizationSearch").val());
}

$("#goChatting").on("click", function() {
	location.href = "/chat/chatting";
})