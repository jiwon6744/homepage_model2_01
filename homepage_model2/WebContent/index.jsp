<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="title">JIWON`S HOMEPAGE</c:set>
<c:if test="${not empty sessionScope.id && sessionScope.grade=='A'}">
	<c:set var="title">admin page</c:set>
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
	<section id="banner">
		<div class="content">
			<header>
				<h1>${title }</h1>
			</header>
			<c:choose>
				<c:when test="${empty sessionScope.id }">
					<ul class="actions">
						<li><a
							href="${pageContext.request.contextPath}/member/login.do"
							class="button big">login</a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="actions">
						<li><a
							href="${pageContext.request.contextPath}/member/logout.do"
							class="button big">logout</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
	</section>
	<jsp:include page="/template/bottom.jsp" />
</body>
</html>
