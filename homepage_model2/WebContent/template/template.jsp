<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body leftmargin="0" topmargin="0">
	<jsp:include page="./top.jsp"></jsp:include>
	<jsp:include page="${CONTENT_PAGE }" flush="false" />
</body>
</html>

