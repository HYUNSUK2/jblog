<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JBlog</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jblog.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.9.0.js"></script>
</head>
<body>
	<div class="center-content">
		<c:import url="/WEB-INF/views/includes/header-main.jsp" />
		<form:form
			modelAttribute="userLoginDto" 
			method="post"
			action="${pageContext.request.contextPath}/user/auth"
			class="login-form">
      		<label>아이디</label>
      		<form:input path="id" />
			<p class="form-error">
				<form:errors path="id" />
			</p>      		
      		
      		<label>패스워드</label>
      		<form:password path="password" />
			<p class="form-error">
				<form:errors path="password" />
			</p>
			
			<input type="hidden" name="redirectURL" value="${redirectURL }">       		
      		<input type="submit" value="로그인">
		</form:form>
	</div>
</body>
</html>
