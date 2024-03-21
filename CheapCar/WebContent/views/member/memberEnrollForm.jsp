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
					<td><button type="button onclick="idCheck();">중복확인</button"></td>
					
					<script>
						function idCheck(){

							const $userId = $('#enroll-form input[name=userId]');

							$.ajax({
								url : 'idCheck.do',
								data : {checkId : $userId.val()},
								success : function(result){

									if(result == "NNN"){
										alert('이미 존재하거나 탈퇴한 회원의 아이디입니다.');
										
										$memberId.val('').focus();
									}
									else{
										$memberId.focus();
									}

								}


							});

						}

					</script>
					
					
					
					
					
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