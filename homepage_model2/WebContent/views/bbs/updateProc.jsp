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
	<!-- *********************************************** -->
	<div id="w">
		<div class="title"><h3>게시판 수정 결과</h3></div>

		<div class="content">
			<c:choose>
				<c:when test="${not pflag }">
					패스워드가 일치하지 않습니다.
				</c:when>
				<c:when test="${flag }">
					글을 수정했습니다.
				</c:when>
				<c:otherwise>
					글 수정을 실패했습니다.
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${not pflag }">
					<div class='bottom'>
						<input type='button' value='다시 시도' class="button" onclick="history.back()"> 
						<input type='button' value='목록' 	class="button" onclick="blist()">
					</div>
				</c:when>
				<c:otherwise>
					<div class='bottom'>
						<input type='button' value='다시 등록' class="button" onclick="location.href='create.do'"> 
						<input type='button' value='목록' class="button" onclick="blist()">
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>
