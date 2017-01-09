<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<!-- *********************************************** -->
<body>
	<!-- *********************************************** -->
<div id ="w">
	<div class="title"><h3>게시판 답변</h3></div>

	<form name='frm' 
		  method='POST' 
		  enctype="multipart/form-data" 
		  action='./replyProc.do'>
		  
	<!-- 답변을 등록하기 위해서 -->
	<input type="hidden" name="grpno" value="${dto.grpno }">
	<input type="hidden" name="indent" value="${dto.indent }">
	<input type="hidden" name="ansnum" value="${dto.ansnum }">
	<!-- 페이지와 검색 유지를 위해서 -->
	<input name="col" value="${param.col }" type="hidden">
	<input name="word" value="${param.word }" type="hidden">
	<input name="nowPage" value="${param.nowPage }" type="hidden">
	<!-- 부모글 삭제를 막기 위해서 -->
	<input name="bbsno" value="${dto.bbsno }" type="hidden">
		<table>
			<tr>
				<th>성명</th>
				<td>
					<input type="text" name="wname">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" value="${dto.title }">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="10" cols="45" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="passwd">
				</td>
			</tr>
			<tr>
				<th>파일</th>
				<td>
					<input type="file" name="filename">
				</td>
			</tr>
		</table>
		<div class='bottom'>
			<input type='submit' value='등록' class="button"> 
			<input type='button' value='취소' class="button" onclick="history.back()">
		</div>
	</form>
</div>

	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>
