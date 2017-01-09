<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
function ilist(){
	var url = "./list.do";
	url += "?col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href = url;
	}
</script>
</head>
<body>
	<div id="w">
		<DIV class="title"><h3>삭제처리</h3></DIV>
		<div class="content">
			<c:choose>
				<c:when test="${not pflag }">
					패스워드가 틀렸습니다.
				</c:when>
				<c:when test="${flag }">
					글을 삭제하였습니다.
				</c:when>
				<c:otherwise>
					글 삭제를 실패했습니다.				
				</c:otherwise>
			</c:choose>
		</div>
		<c:choose>
			<c:when test="${not pflag }">
				<DIV class='bottom'>
					<input type='button' value='다시시도' class="button" onclick="history.back()"> 
					<input type='button' value='목록' class="button" onclick="ilist()">
				</DIV>
			</c:when>
			<c:otherwise>
				<DIV class='bottom'>
					<input type='submit' value='다시등록' class="button" onclick="location='./create.do'"> 
					<input type='button' value='목록' class="button" onclick="ilist()">
				</DIV>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>
