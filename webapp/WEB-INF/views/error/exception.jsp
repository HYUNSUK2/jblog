<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jblog.css">
</head>
<body>
	<div class="center-content error-page">
		<h1 class="logo"><a href="${pageContext.request.contextPath}">jblog</a></h1>
		<img src="${pageContext.request.contextPath}/assets/images/exception.png" />
		<p class="error-msg">
			죄송합니다.<br>
			서비스에 일시적인 장애가 발생했습니다.<br>
			잠시 후, 다시 시도해 주세요.
		</p>
	</div>
</body>
</html>