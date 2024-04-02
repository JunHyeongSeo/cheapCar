<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
</head>
<style>
		#enroll-form input{
			margin : 8px;
		}
	</style>
<body>

	<%@ include file="../common/menuBar.jsp" %>

	<section class="vh-100" style="background-color: #eee;">
		<div class="container h-100">
		  <div class="row d-flex justify-content-center align-items-center h-100">
			<div class="col-lg-12 col-xl-11">
			  <div class="card text-black" style="border-radius: 25px;">
				<div class="card-body p-md-5">
				  <div class="row justify-content-center">
					<div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
	  
					  <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4" style="font-weight: 800;">회원가입 하라고 짜샤 ~~~</p>
	  
					  <form class="mx-1 mx-md-4">
	  
						<div class="d-flex flex-row align-items-center mb-4">
						  <i class="fas fa-user fa-lg me-3 fa-fw"></i>
						  <div class="form-outline flex-fill mb-0">
							<input type="text" id="form3Example1c" class="form-control" />
							<label class="form-label" for="form3Example1c">이름이 뭐냐고 짜샤~~~</label>
						  </div>
						</div>
	  
						<div class="d-flex flex-row align-items-center mb-4">
						  <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
						  <div class="form-outline flex-fill mb-0">
							<input type="email" id="form3Example3c" class="form-control" />
							<label class="form-label" for="form3Example3c">아이디 짜샤~~</label>
						  </div>
						</div>
	  
						<div class="d-flex flex-row align-items-center mb-4">
						  <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
						  <div class="form-outline flex-fill mb-0">
							<input type="password" id="form3Example4c" class="form-control" />
							<label class="form-label" for="form3Example4c">비밀번호 짜샤~~~</label>
						  </div>
						</div>
	  
						<div class="d-flex flex-row align-items-center mb-4">
						  <i class="fas fa-key fa-lg me-3 fa-fw"></i>
						  <div class="form-outline flex-fill mb-0">
							<input type="password" id="form3Example4cd" class="form-control" />
							<label class="form-label" for="form3Example4cd">비밀번호 또 써 짜샤~~~</label>
						  </div>
						</div>
	  
						<div class="form-check d-flex justify-content-center mb-5">
						  <label class="form-check-label" for="form2Example3" style="font-size:12px; color : lightcoral;">
							가입해라 짜샤 ~~~
						  </label>
						</div>
	  
						<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
						  <button type="button" class="btn btn-danger btn-lg">가입요청</button>
						</div>
	  
					  </form>
	  
					</div>
					<div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
					  <img src="https://skygame24.com/UploadFiles/20200702025400%eb%93%9c%eb%a6%ac%ed%94%84%ed%8a%b8.gif"
						class="img-fluid" width="100%" alt="칸세이 드리프트~">
	  
					</div>
				  </div>
				</div>
			  </div>
			</div>
		  </div>
		</div>
	  </section>


	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
	<div class="outer">
		<br>
		<h2 align="center">회원가입</h2>
		
		<form id="enroll-form" method="post" action="<%=contextPath%>/insert">
		
			<table align="center">
				<tr>
					<td>* 아이디</td>
					<td><input type="text" id="memberId" maxlength="15" required name="memberId" placeholder="4~15글자 사이로 입력"></td>
					<td><button type="button" onclick="idCheck();">중복확인</button></td>
				</tr>	
					
		<script>
			function idCheck(){

				const $memberId = $('#enroll-form input[name=memberId]');

				$.ajax({
					url : 'idCheck.do',
					data : {checkId : $memberId.val()},
					success : function(result){
						//console.log(result);
							
						if(result == 'NNN'){
							alert('이미 존재하거나 탈퇴한 회원의 아이디입니다.');
							
							$memberId.val('').focus();
						}
						else{
							
							if(confirm('사용 가능합니다 사용하시겠습니까?')){
								
								$memberId.attr('readonly', true);
								
								$('#enroll-form button[type=submit]').removeAttr('disabled');
								
							} else{
								$memberId.focus();
							}
						}
					}
				});
			}

		</script>
		
				<tr>
					<td>* 비밀번호</td>
					<td><input type="password" id="memberPwd" maxlength="15" required name="memberPwd" placeholder="4~15글자 사이로 입력"></td>
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
				<button id="submit" type="submit" disabled>회원가입</button>
			</div>
			
			<script>
				$(function(){
					
					$('#submit').click(function(){
						
						const RegExp = /^[a-zA-Z0-9]{4,15}$/;

						
						const idvalue = $('#memberId').val();

						const pwdvalue = $('#memberPwd').val();



						if(!RegExp.test(idvalue)){
							alert('아이디를 제대로 입력해주세요');
							idvalue = "";
		                    idvalue.focus();
							//return false
						} 
						else{
							return true
						}
						
						

						if(!RegExp.test(pwdvalue)){
							alert('비밀번호를 제대로 입력해주세요')
							//return false
						} else(idvalue == pwdvalue){
							alert('아이디와 비밀번호는 같을 수 없습니다.')
							return false
						} return true
						
						
						//console.log(idvalue);
						
					
					
					});
				
				});
				
				
				
				
				
			

			</script>
			
			

			<br><br>
		
		
		</form>
		
		
	</div>

</body>
</html>