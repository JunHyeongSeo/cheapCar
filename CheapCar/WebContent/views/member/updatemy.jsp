<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.pp{
		padding-top : 50px;
	}
	
</style>

<body>

	<%@ include file="../common/menuBar.jsp" %>

	<div class="pp">
		
		<form id="mypage-form" method="post" action="<%=contextPath%>/update.me">
		
			<table align="center">
				<tr>
					<td>* 아이디</td>
					<td><input type="text" readonly maxlength="12" required name="memberId" value="<%=loginUser.getMemberId()%>"></td>
					<td></td>
				</tr>
				<tr>
					<td>* 이름</td>
					<td><input type="text" maxlength="5" required name="memberName" value="<%=loginUser.getMemberName()%>"></td>
					<td></td>
				</tr>
				<tr>
					<td>* 생년월일</td>
					<td><input type="text" placeholder="-포함해서 입력해주세요." name="birthday" value="<%=loginUser.getBirthday()%>"></td>
					<td></td>
				</tr>
				<tr>
					<td>* 휴대번호</td>
					<td><input type="text" name="phone" value="<%=loginUser.getPhone()%>"></td>
					<td></td>
				</tr>
				<tr>
					<td>* 이메일</td>
					<td><input type="email" name="email" value="<%=loginUser.getEmail()%>"></td>
					<td></td>
				</tr>
				
			</table>
			
			

			<br><br>

			<div align="center">
                <button type="submit" class="btn btn-sm btn-info">정보수정</button>
				<button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#updatePwd">비밀번호수정</button>
                <button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteForm">회원탈퇴</button>
				
			</div>

			<br><br>
		
		</form>
	</div>


</body>
</html>