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
		                    	<a data-toggle="modal" data-target="#findPwd" href="findPwd();">비밀번호 찾기</a>
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
			  <label for="memberName">이름</label>
			  <input type="text" name="memberName" class="form-control" placeholder="이름을 입력해주세요" id="imemberName" required>
			</div>
			
			<div class="form-group">
			  <label for="memberName">생년월일</label>
			  <input type="text" name="birthday" class="form-control" placeholder="-포함해서 입력해주세요." id="ibirthday" required>
			</div>
			
			<div class="form-group">
			  <label for="memberName">전화번호</label>
			  <input type="text" name="phone" class="form-control" placeholder="-포함해서 입력해주세요." id="iphone" required>
			</div>

			<div class="form-group">
			  <label id="idid"></label>
			</div>
			
			
			<button type="button" class="btn btn-primary" onclick="checkId();">확인</button>
			
			
			<script>
			
				function checkId(){
				
					$.ajax({
						url : 'findId',
						data : 
						{
							checkName : $('#imemberName').val(),
							//$memberName.val(),
							checkBirthday : $('#ibirthday').val(),
							//$birthday.val(),
							checkPhone : $('#iphone').val()
							//$phone.val()
							//뭐지????????? 평일에도하고 주말에도 한다 근데 주말에 힘듬???
						},
						success : function(result){
							if(result == 'null'){ // 아이디 없는거
								alert('아이디를 찾을 수 없습니다');
							} else{  // 아이디 있는거
								//$('#idid').html('아이디 : ' + result);
								alert('아이디 : ' + result)
							}
	
						}
	
					});
				}
			</script>
		   </form>
		  </div>
		   
	  </div>
	</div>
  </div>
  
  
  
  
  
  
  
  


<!-- 비밀번호 찾기 모달 -->
<div class="modal" id="findPwd">
	<div class="modal-dialog">
	  <div class="modal-content">
  
		<!-- Modal Header -->
		<div class="modal-header">
		  <h4 class="modal-title">비밀번호 찾기</h4>
		  <button type="button" class="close" data-dismiss="modal">&times;</button>
		</div>
  
		<!-- 찾을실 분의 이름, 생년월일, -->
		<div class="modal-body">
		  
			<form method="post">
			
			<div class="form-group">
			  <label for="memberId">아이디</label>
			  <input type="text" name="memberId" class="form-control" placeholder="아이디를 입력해주세요" id="pmemberId" required>
			</div>
			
			<div class="form-group">
			  <label for="memberName">이름</label>
			  <input type="text" name="memberName" class="form-control" placeholder="이름을 입력해주세요" id="pmemberName" required>
			</div>
			
			<div class="form-group">
			  <label for="memberName">생년월일</label>
			  <input type="text" name="birthday" class="form-control" placeholder="-포함해서 입력해주세요." id="pbirthday" required>
			</div>
			
			<div class="form-group">
			  <label for="memberName">전화번호</label>
			  <input type="text" name="phone" class="form-control" placeholder="-포함해서 입력해주세요." id="pphone" required>
			</div>

			<div class="form-group">
			  <label id="pwdpwd"></label>
			</div>
			
			
			
			<button type="button" class="btn btn-primary" onclick="checkPwd();">확인</button>
			
			
			
			<script>
			
				function checkPwd(){
				
					$.ajax({
						url : 'findPwd',
						data : 
						{
							checkId : $('#pmemberId').val(),
							
							checkName : $('#pmemberName').val(),
							//$memberName.val(),
							checkBirthday : $('#pbirthday').val(),
							//$birthday.val(),
							checkPhone : $('#pphone').val()
							//$phone.val()
						},
						success : function(result){
							if(result == 'null'){ // 비밀번호 없는거
								alert('비밀번호를 찾을 수 없습니다');
							} else{  // 아이디 있는거
								//$('#idid').html('비밀번호 : ' + result);
								alert('비밀번호 : ' + result);
							}
	
						}
	
					});
				}
			</script>
		   </form>
		  </div>







	

</body>
</html>