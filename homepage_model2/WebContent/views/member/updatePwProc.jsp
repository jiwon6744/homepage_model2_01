<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<div id="w">
	<div class="title"><h3>패스워드 변경 처리</h3></div>
	<div class="content">
		<c:choose>
			<c:when test="${flag }">
				패스워드 변경을 성공했습니다.<br>
				로그인을 해주세요.<br>
			</c:when>
			<c:otherwise>
				패스워드 변경을 실패했습니다.
			</c:otherwise>
		</c:choose>
	</div>
	<div class='bottom'>
	<c:choose>
		<c:when test="${flag }">
			<input type='button' value='로그인' class="button" onclick="location.href='./login.do'">
		</c:when>
		<c:otherwise>
			<input type='button' value='다시시도' class="button" onclick="history.back()">
		</c:otherwise>
	</c:choose>
		<input type='button' value='홈' class="button" onclick="location.href='${pageContext.request.contextPath}/index.jsp'">
	</div>
</div>
</body>
</html>
