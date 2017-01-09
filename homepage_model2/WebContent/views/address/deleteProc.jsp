<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
function alist() {
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
		<div class="title"><h3>회원 삭제 결과</h3></div>
		<div class="content">
		<c:choose>
			<c:when test="${flag }">
				회원정보 삭제 성공
			</c:when>
			<c:otherwise>
				회원 정보 삭제 실패
			</c:otherwise>
		
		</c:choose>
		</div>
		<div class="bottom">
			<input type="button" class="button" value="목록" onclick="alist()">
		</div>
	</div>
</body>
</html>
