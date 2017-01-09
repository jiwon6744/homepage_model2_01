<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<div id="w">
	<div class="title"><h3>로그인</h3></div>
	<form name='frm' method='POST' action='${pageContext.request.contextPath }/member/loginProc.do'>
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="id" value='${c_id_val }'>
					<c:choose>
						<c:when test="${c_id=='Y' }">
							<label><input type='checkbox' name='c_id' value='Y' checked='checked'> ID 저장</label>
						</c:when>
						<c:otherwise>
							<label><input type='checkbox' name='c_id' value='Y'> ID 저장</label>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="passwd"></td>
			</tr>
		</table>
		<div class='bottom'>
			<input type='submit' value='로그인' class="button"> 
			<input type='button' value='회원가입' class="button" onclick="location.href='agree.do'">
		</div>
	</form>
</div>
</body>
</html>
