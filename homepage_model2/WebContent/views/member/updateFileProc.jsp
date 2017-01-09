<%@page import="org.apache.tomcat.util.http.fileupload.UploadContext"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
function read() {
	var url = "read.do";
	url += "?id=${id}";
		location.href = url;

	}
</script>
</head>
<!-- *********************************************** -->
<body>
<div id="w">
	<div class="title">사진변경</div>
	<div class="content">
	<c:choose>
		<c:when test="${flag }">
			사진을 변경하였습니다.
		</c:when>
		<c:otherwise>
			사진변경 실패했습니다.
		</c:otherwise>
	</c:choose>
	</div>
	<div class='bottom'>
	<c:choose>
		<c:when test="${flag }">
			<input type='submit' value='나의정보' class="button" onclick="read()">
		</c:when>
		<c:otherwise>
			<input type='button' value='다시시도' class="button" onclick="history.back()">
		</c:otherwise>
	</c:choose>
	</div>
</div>
</body>
</html>
