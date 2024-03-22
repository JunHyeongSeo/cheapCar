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
			
		  	<form action="<%=contextPath%>/delete.me" method="post">
		  	
			  <div class="form-group">
			    <label for="userPwd" style="font-siae:12px; color:red">탈퇴를 원하신다면 비밀번호를 입력해주세요:</label>
			    <input type="password" name="userPwd" class="form-control" placeholder="비밀번호를 입력해주세요" id="deletePwd" required>
			  </div>
			 
			  
			  <button type="submit" class="btn btn-danger" onclick="return deleteMember();">회원탈퇴</button>
			  
			  <input type="hidden" value="<%=loginUser.getMemberNo() %>" name="userNo">
			  
			  <script>
			  	function deleteMember(){
			  		
			  		const value = prompt('탈퇴를 원하신다면 "어쩌고저쩌고"를 정확히 입력해주세요.');
			  		
			  		if(value === '어쩌고어쩌고'){
			  			return true;
			  		} 
			  		else{
			  			return true;
			  		}
			  		
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
			
		  	<form action="<%=contextPath%>/updatePwd" method="post">
		  	
			  <div class="form-group">
			    <label for="userPwd">현재 비밀번호:</label>
			    <input type="password" name="userPwd" class="form-control" placeholder="비밀번호를 입력해주세요" id="memberPwd" required>
			  </div>
			  
			  <div class="form-group">
			    <label for="changePwd">변경할 비밀번호:</label>
			    <input type="password" name="changePwd" class="form-control" placeholder="변경할 비밀번호를 입력해수세요." id="changePwd" required>
			  </div>
			  
			  <div class="form-group">
			    <label for="checkPwd">변경할 비밀번호 확인:</label>
			    <input type="password" class="form-control" placeholder="다시 한 번 입력해주세요" id="checkPwd" required>
			  </div>
			  
			  <button type="submit" class="btn btn-primary" onclick="return validatePwd();">비밀번호 변경</button>
			  
			  <input type="hidden" value="<%=loginUser.getMemberNo() %>" name="memberNo">
			  
			  <script>
			  	function validatePwd(){
			  		
			  		
			  		
			  		
			  		if($('#changePwd').val() != $('#checkPwd').val()){
			  			alert('비밀번호를 동일하게 입력해주세요!');
			  			$('#checkPwd').focus().val('');
			  			return false;
			  		}
			  		
			  		return true;
			  		
			  	}
			  
			  
			  </script>
	    	 </form>
	    	</div>
	    	 
		</div>
	  </div>
	</div>
	
	
	


</body>
</html>