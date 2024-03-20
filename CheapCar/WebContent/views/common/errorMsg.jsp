<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String errorMsg = (String)request.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류 페이지</title>
	<style>
	#errorMsg{
		color : red;
		margin-top : 80px;
		text-align : center;
		font-size : 33px;
		font-weight : bold;
		}
	</style>
	
</head>
<body>
	
	<%@ include file="menubar.jsp" %>
	
	<h1 id="errorMsg"><%= errorMsg %></h1>

</body>
</html>