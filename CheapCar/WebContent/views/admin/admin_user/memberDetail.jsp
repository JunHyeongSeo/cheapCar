<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원상세보기</title>

	<style>
		.container{
			border: 1px solid red;
			display: flex;
			width: 80%;
			height: 30%;
			margin-top: 150px;
			text-align: center;
		}
	</style>

</head>
<body>

	<%@ include file="../../common/adminMain.jsp" %>
	
	<div class="container">       
			<table class="table table-bordered">
			
			<tbody>
				<tr>
					<th>이름</th>
					<td>서준형</td>
                    <td><button type="submit" class="btn btn-secondary">수정</button></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>user01</td>
                    <td><button type="submit" class="btn btn-secondary">수정</button></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>1996-03-01</td>
                    <td><button type="submit" class="btn btn-secondary">수정</button></td>
				</tr>   
				<tr>
					<th>연락처</th>
					<td>010-1234-5678</td>
                    <td><button type="submit" class="btn btn-secondary">수정</button></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>123@naver.com</td>
                    <td><button type="submit" class="btn btn-secondary">수정</button></td>
				</tr>
			</tbody>
			</table>
	</div>
	








</body>
</html>