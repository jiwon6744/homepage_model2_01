<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<div id="w">
	<div class="title">회원 탈퇴</div>

	<form name='frm' method='POST' action='./deleteProc.do'>
	<input type="hidden" name="id" value="${id }">
	<input type="hidden" name="oldfile" value="${oldfile }">
	<div class="content">
	탈퇴를 하시면 더이상 컨텐트를 제공받을 수 없습니다.<br>
	그래도 탈퇴를 원하신다면 아래 탈퇴 버튼을 눌러주세요.<br>
	</div>
		<div class='bottom'>
			<input type='submit' value='탈퇴' class="button"> 
			<input type='button' value='취소' class="button" onclick="history.back()">
		</div>
	</form>
</div>
</body>
</html>
