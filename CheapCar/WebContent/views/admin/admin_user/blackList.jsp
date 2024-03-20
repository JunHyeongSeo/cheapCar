<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블랙리스트</title>
</head>
<body>
	<%@ include file="../../common/adminMain.jsp" %>
	
	<div class="outer">

		<div id="top1" style = "border : 1px solid green";>
				
			<form class="form-inline" action="abc.do">
				<div id="top11" style="display: flex;">
					<label for="userId" style="margin: 0px 15px;">회원 아이디 : </label>
					<input type="text" class="form-control" id="userId" placeholder="조회하실 회원 아이디를 입력해주세요." name="userId" style="width: 300px;">
					
					<button type="submit" class="btn btn-primary" style="margin-left: 10px;">조회</button>
				</div>
			</form>
		
		</div>

		<div class="container">
			<h2>블랙리스트 관리</h2>   
			<table class="table">
				<thead>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>제재사유</th>
					<th>상태</th>
					<th>제재날짜</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td>1</td>
					<td>user01</td>
					<td>부적절한 후기 등록</td>
					<td>C</td>
					<td>2024-01-01</td>
				</tr>
				<tr>
					<td>2</td>
					<td>user02</td>
					<td>부적절한 후기 등록</td>
					<td>B</td>
					<td>2024-01-02</td>
				</tr>
                <tr>
					<td>3</td>
					<td>user03</td>
					<td>부적절한 후기 등록</td>
					<td>B</td>
					<td>2024-01-03</td>
				</tr>
                <tr>
					<td>4</td>
					<td>user04</td>
					<td>부적절한 후기 등록</td>
					<td>B</td>
					<td>2024-01-04</td>
				</tr>
                <tr>
					<td>5</td>
					<td>user05</td>
					<td>부적절한 후기 등록</td>
					<td>B</td>
					<td>2024-01-05</td>
				</tr>
                <tr>
					<td>1</td>
					<td>user01</td>
					<td>부적절한 후기 등록</td>
					<td>C</td>
					<td>2024-01-01</td>
				</tr>
				<tr>
					<td>2</td>
					<td>user02</td>
					<td>부적절한 후기 등록</td>
					<td>B</td>
					<td>2024-01-02</td>
				</tr>
                <tr>
					<td>3</td>
					<td>user03</td>
					<td>부적절한 후기 등록</td>
					<td>B</td>
					<td>2024-01-03</td>
				</tr>
                <tr>
					<td>4</td>
					<td>user04</td>
					<td>부적절한 후기 등록</td>
					<td>B</td>
					<td>2024-01-04</td>
				</tr>
                <tr>
					<td>5</td>
					<td>user05</td>
					<td>부적절한 후기 등록</td>
					<td>B</td>
					<td>2024-01-05</td>
				</tr>
				</tbody>
			</table>
			</div>
			
		<div id="abcd">
			<ul class="pagination">
				<li class="page-item"><a class="page-link" href="#"><</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">></a></li>
			</ul>
		</div>
	</div>
	
    <br clear="both">
	
	
</body>
</html>