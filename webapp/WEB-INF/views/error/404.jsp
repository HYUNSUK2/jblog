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
		<img src="${pageContext.request.contextPath}/assets/images/404.png" />
		<p class="error-msg">
			죄송합니다.<br>
			요청하신 페이지를 찾을 수 없습니다.
		</p>
	</div>
</body>
</html>