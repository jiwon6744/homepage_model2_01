<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
function inCheck(f) {
	if(f.fname.value==""){
		alert("사진을 선택하세요.");
		f.fname.focus();
		return false;
	}
}
</script>
</head>
<!-- *********************************************** -->
<body>
<div id="w">
	<div class="title"><h3>사진 수정</h3></div>

	<form name='frm' 
		  method='POST' 
		  action='./updateFileProc.do'
		  enctype="multipart/form-data"
		  onsubmit="return inCheck(this)">
		<input type="hidden" name="id" value="${param.id }">
		<input type="hidden" name="oldfile" value="${param.oldfile }">
		<table>
			<tr>
				<th class="table-bordered th">원본파일</th>
				<td class="text-align-c table-bordered td">
					<img src="${pageContext.request.contextPath }/views/member/storage/${param.oldfile}"style="width:500px"><br> 원본파일명:${param.oldfile}
				</td>
			</tr>
			<tr>
				<th class="table-bordered th">변경파일</th>
				<td class="table-bordered td">
					<input type="file" name="fname" accept=".png,.gif,.jpg">
				</td>
			</tr>
		</table>

		<div class='bottom'>
			<input type='submit' value='변경' class="button"> 
			<input type='button' value='취소' class="button" onclick="history.back()">
		</div>
	</form>
</div>

</body>
</html>
