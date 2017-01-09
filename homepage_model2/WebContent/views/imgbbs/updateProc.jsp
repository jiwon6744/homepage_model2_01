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
  url += "?col=${col}";
  url += "&word=${word}";
  url += "&nowPage=${nowPage}";
  
  location.href = url;
}
function incheck(){ //f는 그냥 변수 그냥 다른걸로 써도됨
  if(flag==false){
    alert("내용만 변경할 수 없습니다.");
    f.content.focus()
  }
}

</script>
</head> 
<!-- *********************************************** -->
<body>
<div id="w"> 
<DIV class="title"><h3>처리 결과</h3></DIV>
  <DIV class="content">
  <c:choose>
  	<c:when test="${not pflag}">
  		패스워드가 일치하지 않습니다.
  	</c:when>
  	<c:when test="${flag }">
  		글수정을 성공했습니다.
  	</c:when>
  	<c:otherwise>
  		글수정을 실패 했습니다.
  	</c:otherwise>
  </c:choose>
  </DIV>
  <c:choose>
  	<c:when test="${not pflag }">
	  <DIV class='bottom'>
	    <input type='button' value='다시시도' class="button" onclick="history.back()"> 
	    <input type='button' value='목록' class="button" onclick="ilist()">
	  </DIV>
  	</c:when>
  	<c:otherwise>
	  <DIV class='bottom'>
	    <input type='button' value='다시등록' class="button" onclick="location.href='create.do'"> 
	    <input type='button' value='목록' class="button" onclick="ilist()">
	  </DIV>
  	</c:otherwise>
  </c:choose>
</div>
 
</body>
<!-- *********************************************** -->
</html> 