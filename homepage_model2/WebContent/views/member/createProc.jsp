<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리</title>
</head>
<body>
<div id="w">
	<div class="title"><h3>회원가입 결과</h3></div>
	<div class="content">
	<c:choose>
		<c:when test="${flag }">
			회원가입을 했습니다.
		</c:when>
		<c:otherwise>
			회원가입을 실패했습니다
		</c:otherwise>
	</c:choose>
	</div>
	<c:choose>
		<c:when test="${flag }">
		<div class='bottom'>
			<input type='button' value='로그인' class="button" onclick="location.href='login.do'"> 
			<input type='button' value='HOME' class="button" onclick="location.href='${pageContext.request.contextPath}/index.jsp'">
		</div>
			</c:when>	
			<c:otherwise>
		<div class='bottom'>
			<input type='button' value='다시시도' class="button" onclick="location.href='history.back()'"> 
			<input type='button' value='HOME' class="button" onclick="location.href='${pageContext.request.contextPath}/index.jsp'">
		</div>
		 </c:otherwise>
	</c:choose>
</div>
</body>
</html>
