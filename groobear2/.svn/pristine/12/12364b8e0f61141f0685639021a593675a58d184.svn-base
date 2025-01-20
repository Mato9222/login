<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<table class="table table-bordered">
	<tr>
		<th>제목</th>
		<td>${board.boTitle }</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${board.boWriter }</td>
	</tr>
	<tr>
		<th>IP</th>
		<td>${board.boIp }</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>${board.boEmail }</td>
	</tr>
		<tr>
		<th>작성일</th>
		<td>${board.boDate }</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${board.boHit }</td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td>
			<c:if test="${not empty board.atchList }">
				<c:forEach items="${board.atchList }" var="atch" varStatus="vs">
					<c:url value="/board/${boNo }/atch/${atch.atchNo }" var="downloadUrl" />
					<a href="${downloadUrl }" title="${atch.atchFancysize },${atch.atchDowncount }명 다운">
						${atch.atchFilename }
					</a>${not vs.last ? "&nbsp;" : "" }
				</c:forEach>
			</c:if>
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${board.boContent }</td>
	</tr>
	<tr>
		<td colspan="2">
				<a class="btn btn-primary" href="<c:url value='/board/${boNo }/edit'/>">글수정</a>
				<a class="btn btn-danger" href="javascript:;" onclick="deleteFunction();">글삭제</a>
		</td>
	</tr>
</table>
<form id="deleteForm" method="post" action="<c:url value='/board/${boNo }' />">
	<input type="text" name="_method" value="delete" />
	<input type="password" name="boPasswd" />
</form>
<script>
	function deleteFunction(){
		let password = prompt("비밀번호 입력 : ");
		if(password){
			deleteForm.boPasswd.value = password;
			deleteForm.requestSubmit();
		}
	}
</script>