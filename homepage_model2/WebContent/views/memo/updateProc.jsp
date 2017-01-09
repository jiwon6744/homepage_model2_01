<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	function mlist() {
		var url = "list.do";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
</script>
</head>
<body>
<div id="w">
	<div class="title"><h3>메모 결과</h3></div>
	<div class="content">
	<c:choose>
		<c:when test="${flag }">
			메모 수정 성공
		</c:when>
		<c:otherwise>
			메모 수정 성공
		</c:otherwise>
	</c:choose>
	</div>
	<div class="bottom">
		<input type="button" value="목록" class="button" onclick="mlist()">
	</div>
</div>
</body>
</html>
