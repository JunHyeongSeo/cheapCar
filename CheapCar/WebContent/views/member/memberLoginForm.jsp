<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
    .login-area1{
    	
    	width : 280px;
    	height : 400px;
    	
      
		margin : auto;
	}
	.a{
		padding-top : 150px;
		width : 1200px;
		height : 600px;
		margin : auto;
	}

</style>
		
</head>
<body>
	
	<%@ include file="../common/menuBar.jsp" %>

	<br clear="both">
	
	<div class="a">
		<div class="login-area1">
		
		
		
		 	<form action="<%=contextPath %>/login" method="post">
		           <table>
		                <tr>
		                    <td>아이디</td>
		                    <td><input type="text" name="memberId" required></td>
		                </tr>
		                <tr>
		                    <td>비밀번호</td>
		                    <td><input type="password" name="memberPwd" required></td>
		                </tr>
		                <tr>
		                    <th colspan="2">
		                        <button style="" type="submit" class="btn btn-sm btn-primary">로그인</button>
		                        <!-- <button type="button" class="btn btn-sm btn-secondary" onclick="enrollPage();">회원가입</button> -->
		                    	<a href="#">아이디 찾기</a> /
		                    	<a href="#">비밀번호 찾기</a>
		                    </th>
		                </tr>
		           </table>
		        </form>
		</div>
		
		
		
		
		
		
	</div>
	

</body>
</html>