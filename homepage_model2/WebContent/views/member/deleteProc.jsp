<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<!-- *********************************************** -->
<body>
<div id="w">
	<div class="title">회원 탈퇴</div>
	<div class="content">
		<c:choose>
			<c:when test="${flag }">
				탈퇴 성공
			</c:when>
			<c:otherwise>
				탈퇴 실패
			</c:otherwise>
		</c:choose>
	</div>
	<div class='bottom'>
		<input type='button' value='홈' class="button"
			onclick="location.href='${pageContext.request.contextPath}/index.jsp'"> 
			<input type='button' value='다시시도' class="button" onclick="history.back()">
	</div>
</div>
</body>
</html>
