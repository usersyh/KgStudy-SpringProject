<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>modify</title>
<meta charset="utf-8">
<!-- css 파일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/board.css?after">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
/* 버튼 JQuery */
	$(document).ready(function() {
		$("button").on("click", function(e) {
			var formData = $("#frm");
			var btn = $(this).data("btn"); // data-btn="list"
			if (btn == 'modify') {
				formData.attr("action", "${cpath}/board/modify.do");
			} else if (btn == 'remove') {
				formData.find("#title").remove();
				formData.find("#content").remove();
				formData.attr("action", "${cpath}/board/remove.do");
				formData.attr("method", "get")
			} else if (btn == 'list') {
				formData.find("#board_id").remove();
				formData.find("#title").remove();
				formData.find("#content").remove();
				formData.find("#writer").remove();
				formData.attr("action", "${cpath}/board/list.do");
				formData.attr("method", "get")
			}
			formData.submit();
		});
	});
</script>
</head>
<body>
<%@include file="../include/header.jsp"%>

<div class="jumbotron text-center">
  <h1>STUDY TOGETHER</h1>
  <p style="color: white;">고객의 취향을 맞춘 다양한 공간!</p>
</div>

	<div class="container">
		<h2>KG STUDY</h2>
		<div class="panel panel-default">
			<div class="panel-heading">문의 게시판</div>
			<div class="panel-body">
				<form id="frm" method="post">
					<table class="table table-bordered">
						<tr>
							<td>번호</td>
							<td><input type="text" class="form-control" name="board_id"
								readonly="readonly" value="${vo.board_id}" /></td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input type="text" class="form-control" name="title" value="<c:out value='${vo.title}'/>" /></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input type="text" class="form-control" name="writer" readonly="readonly" value="${vo.writer}" /></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea rows="10" class="form-control" name="content"><c:out value='${vo.content}' /></textarea></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;">
							<c:if test="${!empty loginUser && loginUser.user_id eq vo.user_id}">
								<button type="button" data-btn="modify" class="btn btn-sm btn-success">수정</button>
								<button type="button" data-btn="remove" class="btn btn-sm btn-warning">삭제</button>
							</c:if> 
							<c:if test="${empty loginUser || loginUser.user_id ne vo.user_id}">
								<button disabled="disabled" type="button" class="btn btn-sm btn-success">수정</button>
								<button disabled="disabled" type="button" class="btn btn-sm btn-warning">삭제</button>
							</c:if>
								<button type="button" data-btn="list" class="btn btn-sm btn-success">목록</button></td>
						</tr>
					</table>
						<input type="hidden" name="page" value="<c:out value='${cri.page}'/>"/>
						<input type="hidden" name="perPageNum" value="<c:out value='${cri.perPageNum}'/>"/>	
          				<input type="hidden" name="type" value="<c:out value='${cri.type}'/>"/>
          				<input type="hidden" name="keyword" value="<c:out value='${cri.keyword}'/>"/>
				</form>
			</div>
			<!-- <div class="panel-footer">문의 게시판</div> -->
		</div>
	</div>

</body>
</html>