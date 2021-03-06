<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*,model.memo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	function read(memono) {
		var url = "read.do";
		url += "?memono=" + memono;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";

		location.href = url; // url 이동하라
	}
	function create() {
		var url = "${pageContext.request.contextPath }/memo/create.do";
		url += "?col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";

		location.href = url; // url 이동하라
	}
</script>
</head>
<body>
<section id="list" name="contact"></section>
	<div id="w">
		<div class="title" ><h3>메모 목록</h3></div>
		<div class="search">
			<form method="post" action="./list.do">
				<select name="col">
					<!-- 검색할 컬럼 -->
					<option value="title"
				<c:if test="${col=='title'}">selected='selected'</c:if>>
				제목</option>
					<option value="cotent"
				<c:if test="${col=='cotent'}">selected='selected'</c:if>>
				내용</option>
					<option value="total">전체출력</option>
				</select> <input type="text" name="word" value="${word }" />
				<!-- 검색어 -->
				<input type="submit" class="button_mini" value="검색" />
				<input type="button" class="button_mini" value="등록" onclick="create()" />
			</form>
		</div>

		<table>
			<tr>
				<th class="table-bordered th">번호</th>
				<th class="table-bordered th">제목</th>
				<th class="table-bordered th">날짜</th>
				<th class="table-bordered th">조회수</th>
			</tr>
			<c:choose>
			<c:when test="${fn:length(list)==0 }">
			<tr>
				<td colspan="4" class="table-bordered td text-align-c">등록된 메모가 없습니다.</td>
			</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td class="table-bordered td">${dto.memono}</td>
						<td class="table-bordered td"><a href="javascript:read('${dto.memono}')"> ${dto.title}</a></td>
						<td class="table-bordered td">${dto.wdate}</td>
						<td class="table-bordered td">${dto.viewcnt}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
			</c:choose>
		</table>
	<div class='bottom'>
		${paging }
	</div>
	</div>
</body>
</html>
