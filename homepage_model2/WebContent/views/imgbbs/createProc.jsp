<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function ilist(){
	var url = "list.do";
	
	location.href=url;
}
</script>
</head> 
<body>
<div id="w">
<DIV class="title"><h3>등록 처리</h3></DIV>

<DIV class="content">
<c:choose>
	<c:when test="${flag }">
		이미지를 등록 했습니다.
	</c:when>
	<c:otherwise>
		이미지 등록에 실패했습니다.
	</c:otherwise>
</c:choose>

</DIV>
  
  <DIV class='bottom'>
    <input type='button' value='계속등록' class="button" onclick="location.href='./create.do'">
    <input type='button' value='목록' class="button" onclick="ilist()">
  </DIV>
</div>
</body>
</html> 