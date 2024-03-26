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
		                    	<a data-toggle="modal" data-target="#findId" href="findId();">아이디 찾기</a> /
		                    	<a href="<%= contextPath%>/findPwd">비밀번호 찾기</a>
		                    </th>
		                </tr>
		           </table>
		        </form>
		</div>
		
		
	</div>




<!-- 아이디 찾기 모달 -->
<div class="modal" id="findId">
	<div class="modal-dialog">
	  <div class="modal-content">
  
		<!-- Modal Header -->
		<div class="modal-header">
		  <h4 class="modal-title">아이디 찾기</h4>
		  <button type="button" class="close" data-dismiss="modal">&times;</button>
		</div>
  
		<!-- 찾을실 분의 이름, 생년월일, -->
		<div class="modal-body">
		  
			<form method="post">
			
			<div class="form-group">
			  <label for="memberPwd">이름</label>
			  <input type="text" name="memberName" class="form-control" placeholder="이름을 입력해주세요" id="memberName" required>
			</div>
			
			<div class="form-group">
			  <label for="changePwd">생년월일</label>
			  <input type="text" name="birthday" class="form-control" placeholder="-포함해서 입력해주세요." id="birthday" required>
			</div>
			
			<div class="form-group">
			  <label for="checkPwd">전화번호</label>
			  <input type="text" name="phone" class="form-control" placeholder="-포함해서 입력해주세요." id="phon" required>
			</div>
			
			
			<div class="form-group">
			  <label id="id">전화번호</label>
			</div>
			
			
			
			<button type="submit" class="btn btn-primary">확인</button>
			
			
			
			<script>
				$.ajax({
					url : 'findId',
					data : 
					{
						checkName : $memberName.val(),
						checkBirthday : $birthday.val(),
						checkPhone : $phone.val()
					},
					success : function(result){
						if(result != null){// 있는거
							
						}
						

					}


				});
			
			
			</script>
		   </form>
		  </div>
		   
	  </div>
	</div>
  </div>









	

</body>
</html>