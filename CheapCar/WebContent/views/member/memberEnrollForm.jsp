<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
		#enroll-form input{
			margin : 8px;
		}
	</style>
<body>

	<%@ include file="../common/menuBar.jsp" %>
	
	<div class="outer">
		<br>
		<h2 align="center">회원가입</h2>
		
		<form id="enroll-form" method="post" action="<%=contextPath%>/insert">
		
			<table align="center">
				<tr>
					<td>* 아이디</td>
					<td><input type="text" maxlength="30" required name="memberId"></td>
					<td><button type="button">중복확인</button></td>
					<!-- 중복확인 나중에 AJAX배우고 다음주..? -->
				</tr>
				<tr>
					<td>* 비밀번호</td>
					<td><input type="password" maxlength="30" required name="memberPwd"></td>
					<td></td>
				</tr>
				<tr>
					<td>* 비밀번호확인</td>
					<td><input type="password" maxlength="30" required></td>
					<td></td>
				</tr>
				<tr>
					<td>* 이름</td>
					<td><input type="text" maxlength="30" required name="memberName"></td>
					<td></td>
				</tr>
				<tr>
					<td>* 생년월일</td>
					<td><input type="text" placeholder="-포함해서 입력해주세요." required name="birthday"></td>
					<td></td>
				</tr>
				<tr>
					<td>* 전화번호</td>
					<td><input type="text" placeholder="-포함해서 입력해주세요." required name="phone"></td>
					<td></td>
				</tr>
				<tr>
					<td>* 이메일</td>
					<td><input type="email" required name="email"></td>
					<td></td>
				</tr>
				
				
			</table>

			<br><br>

			<div align="center">
				<button type="reset">취소</button>
				<button type="submit">회원가입</button>
			</div>

			<br><br>
		
		
		</form>
		
		
	</div>

</body>
</html>