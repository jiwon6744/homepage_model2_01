<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	function blist() {
		var url = "list.do";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
</script>
</head>
<!-- *********************************************** -->
<body>
	<div id="w">
		<div class="title"><h3>게시판 삭제 결과</h3></div>
		<div class="content">
		<c:choose>
			<c:when test="${not pflag}">
					패스워드가 일치하지 않습니다.
			</c:when>
			<c:when test="${flag }">
					글을 삭제했습니다.
			</c:when>
			<c:otherwise>
					글을 삭제하지 못했습니다.(Error)
			</c:otherwise>
		</c:choose>
		</div>
		<c:choose>
			<c:when test="${not pflag }">
				<div class='bottom'>
					<input type='button' value='다시 시도' onclick="history.back()" 	class="button"> 
					<input type='button' value='목록' 	onclick="blist()" class="button">
				</div>
			</c:when>
			<c:otherwise>
				<div class='bottom'>
					<input type='button' value='다시 등록' 	onclick="location.href='create.do'" class="button"> 
					<input type='button' value='목록' onclick="blist()" class="button">
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>
