<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/board/${boNo}" var="baseUrl"/>
<form:form modelAttribute="targetBoard" enctype="multipart/form-data" id="boardForm" method="post">
	<input type="hidden" name="_method" value="put" />
<table class="table table-bordered">
	<tr>
		<th>제목</th>
		<td>${targetBoard.boTitle }
			<form:hidden path="boTitle" class="form-control"/>
			<form:errors path="boTitle" element="span" cssClass="text-danger"/></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${targetBoard.boWriter }
			<form:hidden path="boWriter" />
			<form:errors path="boWriter" element="span" cssClass="text-danger"/></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><form:password path="boPasswd" class="form-control"/>
			<form:errors path="boPasswd" element="span" cssClass="text-danger"/></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><form:input type="email" path="boEmail" class="form-control"/>
			<form:errors path="boEmail" element="span" cssClass="text-danger"/></td>
	</tr>
	<tr>
		<th>아이피</th>
		<td>${targetBoard.boIp }
			<form:hidden path="boIp" />
			<form:errors path="boIp" element="span" cssClass="text-danger"/></td>
	</tr>
<c:if test="${not empty targetBoard.atchList }">
	<tr>
		<th>기존 파일</th>
		<td>
			<c:forEach items="${targetBoard.atchList }" var="atch">
				<span class="atch-span">
				${atch.atchFilename }
				<a class="text-danger delatch" href="javascript:;" data-atch="${atch.atchNo }">X</a>
				</span>
			</c:forEach>
		</td>
	</tr>
</c:if>
	<tr>
		<th>파일</th>
		<td>
			<input type="file" name="boFiles" class="form-control" />
			<input type="file" name="boFiles" class="form-control" />
			<input type="file" name="boFiles" class="form-control" />
			<form:errors path="boFiles" element="span" cssClass="text-danger"/>
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td><form:textarea path="boContent" class="form-control"/>
			<form:errors path="boContent" element="span" cssClass="text-danger"/></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="등록" class="btn btn-primary"/>
			<input type="reset" value="취소" class="btn btn-warning"/>
		</td>
	</tr>
</table>
</form:form>
<script>
	$(boardForm).on("click", ".delatch", function(event){
		let atchNo = this.dataset.atch;
		let $target = $(this);
		let csrfHeaderName = $("meta[name='_csrf_header']").attr("content");
		let csrfToken = $("meta[name='_csrf']").attr("content");
		if(confirm("삭제할테요?")){
			let url = `${baseUrl}/atch/\${atchNo}`;
			$.ajax({
				url:url
				, method:"delete"
				, dataType:"text"
				, headers : {
					[csrfHeaderName] : csrfToken	
				}, success:function(resp){
					if(resp==="SUCCESS"){
						$target.parent(".atch-span").remove();
					}					
				}
			});
		}
	});
</script>
		