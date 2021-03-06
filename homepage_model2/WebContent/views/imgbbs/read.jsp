<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
.curImg {
	margin-right: 0;
	border-style: solid;
	border-width: 3px;
	width: 100px;
	height: 80px;
}

.ncurImg {
	margin-right: 0;
	border-style: solid;
	border-width: 3px;
	width: 100px;
	height: 80px;
}
</style>
<script type="text/javascript">
	function icreate() {
		var url = "./create.do";
		location.href = url;
	}

	function iupdate() {
		var url = "./update.do";
		url += "?no=${no}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		url += "&oldfile=${dto.filename}";
		location.href = url;
	}

	function idelete() {
		var url = "./delete.do";
		url += "?no=${no}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		url += "&oldfile=${dto.filename}";
		location.href = url;
	}
	function ireply() {
		var url = "./reply.do";
		url += "?no=${no}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}

	function ilist() {
		var url = "./list.do";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}

	function down(filename) {
		var url = "${pageContext.request.contextPath}/download";
		url += "?dir=/views/imgbbs/storage";
		url += "&filename=" + filename;

		location.href = url;

	}
	function readGo(no) {
		var url = "./read.do";
		url = url + "?no=" + no;
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
</script>
</head>
<body>
	<div id="w">
		<DIV class="title">
			<h3>조회</h3>
		</DIV>

		<TABLE>
			<TR>
				<TD colspan="2" class="table-bordered td text-align-c"><img
					src="${pageContext.request.contextPath }/views/imgbbs/storage/${dto.filename}">
				</TD>
			</TR>
			<TR>
				<TH class="table-bordered th">제목</TH>
				<TD class="table-bordered td">${dto.title}</TD>
			</TR>
			<TR>
				<TH class="table-bordered th">내용</TH>
				<TD class="table-bordered td">${dto.content}</TD>
			</TR>
			<TR>
				<TH class="table-bordered th">성명</TH>
				<TD class="table-bordered td">${dto.name}</TD>
			</TR>
			<TR>
				<TH class="table-bordered th">조회수</TH>
				<TD class="table-bordered td">${dto.viewcnt}</TD>
			</TR>
			<TR>
				<TH class="table-bordered th">등록일</TH>
				<TD class="table-bordered td">${dto.wdate}</TD>
			</TR>
			<TR>
				<TH class="table-bordered th">파일 다운</TH>
				<TD class="table-bordered td"><a
					href="javascript:down('${dto.filename }')"> <c:choose>
							<c:when test="${empty dto.filename }">파일없음</c:when>
							<c:otherwise> 
						${dto.filename } <span class='glyphicon glyphicon-file'></span>
							</c:otherwise>
						</c:choose>
				</a></TD>
			</TR>
		</TABLE>

		<TABLE style="width: 50%">
			<TR>
				<c:forEach var="i" begin="1" end="5">
					<c:choose>
						<c:when test="${empty files[i] }">
							<td><img class="curImg"
								src="${pageContext.request.contextPath }/views/imgbbs/images/noimg.png"
								width="100%">
							<td>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${noArr[i]==no}">
									<td class="td_padding"><a
										href="javascript:readGo('${noArr[i]}')"> <img
											class="curImg"
											src="${pageContext.request.contextPath }/views/imgbbs/storage/${files[i]}"
											width="100%" border="0">
									</a></td>

								</c:when>
								<c:otherwise>
									<td class="td_padding"><a
										href="javascript:readGo('${noArr[i]}')"> <img
											class="ncurImg"
											src="${pageContext.request.contextPath }/views/imgbbs/storage/${files[i]}"
											width="100%" border="0">
									</a></td>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</TR>
		</TABLE>

		<DIV class='bottom'>
			<input type="button" value="등록" class="button" onclick="icreate()">
			<input type="button" value="목록" class="button" onclick="ilist()">
			<input type="button" value="수정" class="button" onclick="iupdate()">
			<input type="button" value="삭제" class="button" onclick="idelete()">
			<input type="button" value="답변" class="button" onclick="ireply()">
		</DIV>
	</div>
</body>
<!-- *********************************************** -->
</html>
