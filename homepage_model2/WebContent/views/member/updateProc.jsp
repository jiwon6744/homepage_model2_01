<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	function mlist() {
		var url = "${pageContext.request.contextPath}/admin/list.do";
		url += "?col=${param.col}";	
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
}
	function read() {
		var url = "read.do";
		url += "?id=${id}";
		location.href = url;
	}
</script>
</head>
<body>
<div id="w">

	<div class="title"></div>

	<div class="content">
	<c:choose>
		<c:when test="${flag }">
			정보 수정 성공
		</c:when>
		<c:otherwise>
			정보 수정 실패
		</c:otherwise>
	</c:choose>
	</div>
	<div class='bottom'>
	<c:choose>
		<c:when test="${not empty id && grade=='A' }">
			<input type='button' value='회원목록' class="button" onclick="mlist()">
		</c:when>
		<c:otherwise>
			<input type='button' value='정보확인' class="button" onclick="read()"> 
			<input type='button' value='다시시도' class="button" onclick="history.back()">
		</c:otherwise>
	</c:choose>
	</div>
</div>
</body>
</html>
