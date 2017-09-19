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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function(){
	$( "#join-form" ).submit( function(){
		//1. 이름 체크
		if( $( "#name" ).val() == "" ) {
			messageBox( "입력폼", "이름은 필수 입력 항목입니다.", function(){
				$( "#name" ).focus();
			});				
			return false;
		}
		
		//2-1. 아이디가 비어있는 지 체크
		if( $( "#id" ).val() == "" ) {
			messageBox( "입력폼", "아이디는 필수 입력 항목입니다.", function(){
				$( "#id" ).focus();
			});				
			return false;
		}
		
		//2-2. 아이디 중복 체크 유무
		if( $( "#img-checkid" ).is( ":visible" ) == false ){
			messageBox( "입력폼", "아이디 중복 체크를 해야 합니다.");			
			return false;
		}
		
		//3. 비밀번호 체크
		if( $("#password").val() == "" ) {
			messageBox( "입력폼", "비밀번호는 필수 입력 항목입니다.", function(){
				$( "#password" ).focus();
			});			
			return false;
		}
		
		//4. 약관동의
		if( $( "#agree-prov" ).is( ":checked" ) == false ) {
			messageBox( "입력폼", "약관 동의를 해야 합니다.");			
			return false;
		}
		
		return true;
	});
	
	$( "#id" ).change( function(){
		$("#img-checkid").hide();
		$("#btn-checkid").show();			
	});
	
	$("#btn-checkid").click( function(){
		var id = $( "#id" ).val();
		
		if( id == "" ) {
			return;
		}
		
		$.ajax({
			url:"${pageContext.request.contextPath }/api/user/checkid?id=" + id,
			type: "get",
			dataType: "json",
			data: "",
			success: function( response ) {
				console.log( response );
				
				// 통신 에러(서버 에러)
				if( response.result == "fail" ) {
					console.log( response.message );
					return;
				}

				// 사용중인 아이디인 경우,
				if( response.data == "exist" ) {
					messageBox( "입력폼", "이미 존재하는 이메일입니다. 다른 이메일을 사용해 주세요.", function(){
						$("#id").val("").focus();
					});						
					return;
				}
				
				// 사용중이 아닌 아이디인 경우,
				$("#img-checkid").show();
				$("#btn-checkid").hide();
			},
			error: function( jqXHR, status, e ) {
				console.error( status + ":" + e );
			}
		});
	});
});

var messageBox = function( title, message, callback ){
	$( "#dialog-message" ).attr( "title", title );
	$( "#dialog-message p" ).text( message );
	$( "#dialog-message" ).dialog({
		modal: true,
		buttons: {
			Ok: function() {
				$( this ).dialog( "close" );
			}
		},
		close: callback || function(){}
	});
}
</script>
</head>
<body>
	<div class="center-content">
		<c:import url="/WEB-INF/views/includes/header-main.jsp" />
		<form:form
			modelAttribute="userVo"
			class="join-form"
			id="join-form"
			method="post"
			action="${pageContext.request.contextPath}/user/join">
			<label class="block-label" for="name">이름</label>
			<form:input path="name" />
			<p class="form-error">
				<form:errors path="name" />
			</p>
			
			<label class="block-label" for="id">아이디</label>
			<form:input path="id" /> 
			<input id="btn-checkid" type="button" value="id 중복체크">
			<img id="img-checkid" style="display: none;" src="${pageContext.request.contextPath}/assets/images/check.png">
			<p class="form-error">
				<form:errors path="id" />
			</p>

			<label class="block-label" for="password">비밀번호</label>
			<form:password path="password" />
			<p class="form-error">
				<form:errors path="password" />
			</p>

			<fieldset>
				<legend>약관동의</legend>
				<input id="agree-prov" type="checkbox" name="agreeProv" value="y">
				<label class="l-float">서비스 약관에 동의합니다.</label>
			</fieldset>

			<input type="submit" value="가입하기">

		</form:form>
	</div>
	<div id="dialog-message" title="" style="display:none">
  		<p></p>
	</div>
</body>
</html>
