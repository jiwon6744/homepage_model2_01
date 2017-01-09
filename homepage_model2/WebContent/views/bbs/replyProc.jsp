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
		url += "?col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
</script>
</head>
<!-- *********************************************** -->
<body>
<div id="w">
	<div class="title"><h3>게시판 처리 결과</h3></div>
	<div class="content">
		<c:choose>
			<c:when test="${flag }">
				답변글이 등록되었습니다.
			</c:when>
			<c:otherwise>
				답변글 등록이 실패했습니다.
			</c:otherwise>
		</c:choose>
		<div class="bottom">
			<input type="button" value="계속 등록" class="button" onclick="location.href='./create.do'" /> 
			<input type="button" value="목록" class="button" onclick="blist()" />
		</div>
	</div>
</div>

</body>
</html>
