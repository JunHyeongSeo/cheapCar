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
		
		<form id="mypage-form" method="post" action="${ path }/update.me">
		
			<table align="center">
				<tr>
					<td>* 아이디</td>
					<td><input type="text" readonly maxlength="12" required id="memberId" name="memberId" value="${ sessionScope.loginUser.memberId }"></td>
					<td></td>
				</tr>
				<tr>
					<td>* 이름</td>
					<td><input type="text" maxlength="5" required id="memberName" name="memberName" value="${ sessionScope.loginUser.memberName }"></td>
					<td></td>
				</tr>
				<tr>
					<td>* 생년월일</td>
					<td><input type="text" placeholder="-포함해서 입력해주세요." id="birthday" name="birthday" value="${ sessionScope.loginUser.birthday }"></td>
					<td></td>
				</tr>
				<tr>
					<td>* 휴대번호</td>
					<td><input type="text" id="phone" name="phone" value="${ sessionScope.loginUser.phone }"></td>
					<td></td>
				</tr>
				<tr>
					<td>* 이메일</td>
					<td><input type="email" id="email" name="email" value="${ sessionScope.loginUser.email }"></td>
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
	
	<script>

		var memberIdCheck = /^[a-zA-Z0-9]{4,15}$/;
		var memberPwdCheck = /^[a-zA-Z0-9]{4,15}$/;
		var memberNameCheck = /^[가-힣]{2,6}$/;
		var birthdayCheck = /^(19[0-9]{2}|20[0-9]{2})-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
		//  regExp = /^\d{2}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])-[1-4]\d{6}$/;
		var phoneCheck = /^01[0179]-[0-9]{4}-[0-9]{4}$/;
		//var ddffeeffbb = /^[어쩌라고]$/; --;;
		var emailCheck = /^[a-zA-Z0-9]{2,20}@[a-z]{2,5}.[a-z]{3}$/;
	
		$('#memberId').blur(function(){
						
			var idvalue = $('#memberId').val();

			if(!memberIdCheck.test(idvalue)){
				alert('아이디를 제대로 입력해주세요');
				$('#memberId').val("");
			} 
		});

		$('#memberName').blur(function(){

			var namevalue = $('#memberName').val();

			if(!memberNameCheck.test(namevalue)){
				alert('이름은 한글 2~6글자입니다. 다시입력해주세요.');
				$('#memberName').val("");
			}
		});

		$('#birthday').blur(function(){

			var birthdayvalue = $('#birthday').val();

			if(!birthdayCheck.test(birthdayvalue)){
				alert('생년월일을 다시입력해주세요.');
				$('#birthday').val('');
			}
		});

		$('#phone').blur(function(){

			var phonevalue = $('#phone').val();

			if(!phoneCheck.test(phonevalue)){
				alert('전화번호를 다시입력해주세요');
				$('#phone').val('');
			}
		});

		$('#email').blur(function(){

			var emailvalue = $('#email').val();

			if(!emailCheck.test(emailvalue)){
				alert('이메일을 다시입력해주세요.');
				$('#email').val('');
			}
		});
	
	
	</script>
	
	
	
	
		<!-- 회원 탈퇴 모달 -->
	<div class="modal" id="deleteForm">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">회원 탈퇴</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- 현재 비밀번호, 변경할 비밀번호, 변경할 비밀번호 재입력 -->
	      <div class="modal-body">
			
		  	<form action="${ path }/delete" method="post">
		  	
			  <div class="form-group">
			    <label for="memberPwd" style="font-siae:12px; color:red">탈퇴를 원하신다면 비밀번호를 입력해주세요:</label>
			    <input type="password" name="memberPwd" class="form-control" placeholder="비밀번호를 입력해주세요" id="deletePwd" required>
			  </div>
			 
			  
			  <button type="submit" class="btn btn-danger" onclick="return deleteMember();">회원탈퇴</button>
			  
			  <input type="hidden" value="${ sessionScope.loginUser.memberNo }" name="memberNo">
			  
			  <script>
			  	function deleteMember(){
			  		
			  		const value = prompt('탈퇴를 원하신다면 "삭제"를 정확히 입력해주세요.');
			  		
			  		if(value === '삭제'){
			  			return true;
			  		} 
			  		else{
			  			return false;
			  		}
			  		
			  		
			  		//if($('#changePwd').val() != $('#checkPwd').val()){
			  		//	alert('비밀번호를 동일하게 입력해주세요!');
			  		//	$('#checkPwd').focus().val('');
			  		//	return false;
			  		//}
			  		
			  		//return true;
			  		
			  		
			  		
			  	}
			  
			  
			  </script>
	    	 </form>
	    	</div>
	    	 
		</div>
	  </div>
	</div>
	
	
	
	
	<!-- 비밀번호 변경 모달 -->
	<div class="modal" id="updatePwd">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">비밀번호 변경</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- 현재 비밀번호, 변경할 비밀번호, 변경할 비밀번호 재입력 -->
	      <div class="modal-body">
			
		  	<form action="${ path }/updatePwd" method="post">
		  	
			  <div class="form-group">
			    <label for="memberPwd">현재 비밀번호:</label>
			    <input type="password" id="memberPwd" name="memberPwd" class="form-control" placeholder="비밀번호를 입력해주세요" id="memberPwd" required>
			  </div>
			  
			  <div class="form-group">
			    <label for="changePwd">변경할 비밀번호:</label>
			    <input type="password" id="changePwd" name="changePwd" class="form-control" placeholder="변경할 비밀번호를 입력해수세요." id="changePwd" required>
			  </div>
			  
			  <div class="form-group">
			    <label for="checkPwd">변경할 비밀번호 확인:</label>
			    <input type="password" class="form-control" placeholder="다시 한 번 입력해주세요" id="checkPwd" required>
			  </div>
			  
			  <button type="submit" id="checkchangPwd" class="btn btn-primary" onclick="return validatePwd();">비밀번호 변경</button>
			  
			  <input type="hidden" value="${ sessionScope.loginUser.memberNo }" name="memberNo">
			  
			  <script>
			  	function validatePwd(){

					
			  		
			  		
			  		if($('#changePwd').val() != $('#checkPwd').val()){
			  			alert('비밀번호를 동일하게 입력해주세요!');
			  			$('#checkPwd').focus().val('');
			  			return false;
			  		}
			  		return true;

			  	}


				$(function(){
					var memberPwdCheck = /^[a-zA-Z0-9]{4,15}$/;

					$('#memberPwd').blur(function(){
						
					

						var pwdvalue = $('#memberPwd').val();

						if(!memberPwdCheck.test(pwdvalue)){
							alert('비밀번호를 제대로 입력해주세요.');
							$('#memberPwd').val("");
							return false
						}
						return true;
					});

					$('#changePwd').blur(function(){

						var chpwdvalue = $('#changePwd').val();

						if(!memberPwdCheck.test(chpwdvalue)){
							alert('비밀번호를 제대로 입력해주세요.');
							$('#changePwd').val("");
							return false
						}
						return true;
					});
					
			

					
				});


					
				
				
			  </script>
	    	 </form>
	    	</div>
	    	 
		</div>
	  </div>
	</div>
	
	
	


</body>
</html>