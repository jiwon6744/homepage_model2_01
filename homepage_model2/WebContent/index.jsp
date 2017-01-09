<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${empty sessionScope.id }">
		<c:set var="str">로그인 해주세요!!</c:set>
	</c:when>
	<c:otherwise>
		<c:set var="str">안녕하세요 ${sessionScope.id } 님!</c:set>
	</c:otherwise>
</c:choose>

<c:set var="title">JIWON`S HOMEPAGE</c:set>
<c:if test="${not empty sessionScope.id && sessionScope.grade=='A'}">
	<c:set var="title">관리자 페이지</c:set>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
</style>
</head>
<body>
	<jsp:include page="/template/top.jsp" />
	<div class="content" id="w">
		<h3>${title }</h3><br><br>
		<h3>${str }</h3><br><br>
		<c:choose>
			<c:when test="${empty sessionScope.id }">
				<input type="button" value="로그인" onclick="location.href='${pageContext.request.contextPath}/member/login.do'" class="button">
			</c:when>
			<c:otherwise>
				<input type="button" value="로그아웃" onclick="location.href='${pageContext.request.contextPath}/member/logout.do'" class="button">
			</c:otherwise>
		</c:choose>
	</div>
	<jsp:include page="/template/bottom.jsp" />
</body>
</html>
