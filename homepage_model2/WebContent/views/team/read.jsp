<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	function tlist(){
		var url = "list.do";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
	function imgUpdate(){
		var url = "updateFile.do";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		url += "&teamno=${dto.teamno}";
		url += "&oldfile=${dto.filename}";
		location.href = url;
	}
</script>
</head>
<body>
<div id="w">
	<div class="title"><h3>팀 조회</h3></div>
	<table>
		<tr>
			<td colspan="2" class="table-bordered">
				<div class="text-align-c">
					<img src='${pageContext.request.contextPath }/views/team/storage/${dto.filename}'>
				</div>
			</td>
		</tr>
		<tr>
			<th class="table-bordered th">이름</th>
			<td class="table-bordered td">${dto.name }</td>
		</tr>
		<tr>
			<th class="table-bordered th">성별</th>
			<td class="table-bordered td">${dto.gender }</td>
		</tr>
		<tr>
			<th class="table-bordered th">전화번호</th>
			<td class="table-bordered td">${dto.phone }</td>
		</tr>
		<tr>
			<th class="table-bordered th">주소</th>
			<td class="table-bordered td">${dto.address1 }<br>
				${dto.address2 }<br> 우(${dto.zipcode })
			</td>
		</tr>
		<tr>
			<th class="table-bordered th">스킬</th>
			<td class="table-bordered td">${dto.skillstr }</td>
		</tr>
		<tr>
			<th class="table-bordered th">취미</th>
			<td class="table-bordered td">${dto.hobby }</td>
		</tr>
	</table>
	<div class="bottom">
		<input type="button" class="button" value="글쓰기" onclick="location.href='./create.do'"> 
		<input type="button" class="button" value="목록" onclick="tlist()"> 
		<input type="button" class="button" value="사진변경" onclick="imgUpdate()">
		<input type='button' value='다운로드' class="button" onclick="location.href='${pageContext.request.contextPath }/download?dir=/views/team/storage&filename=${dto.filename }'">
	</div>
</div>
</body>
</html>
