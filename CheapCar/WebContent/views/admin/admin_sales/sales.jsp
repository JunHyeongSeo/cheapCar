<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.semi.common.model.vo.PageInfo" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출관리</title>
<style>
	.sales
	.salesList>a{
		text-align : center;
		margin : auto;
	}
</style>
</head>
<body>
	<%@ include file="../../common/adminMain.jsp" %>
	
	<div class="outer">
		<div class="container">
			<div id="top1">
	                
	            <form class="form-inline" action="abc.do">
	                <div id="top11" style="display: flex;">
	                    <label for="carNum" style="margin: 0px 15px;">차 모델 검색 : </label>
	                    <input type="text" class="form-control" id="userId" placeholder="조회하실 차량의 모델명을 입력해주세요." name="userId" style="width: 300px;">
	                    
	                    <button type="submit" class="btn btn-primary" style="margin-left: 10px;">조회</button>
	                </div>
	            </form>
	            
	            
	            <form class="form-inline" action="abc.do">
	                <div id="top11" style="display: flex;">
	                    <label for="carNum" style="margin: 0px 15px;">기간 검색 : </label>
	                    <input type="text" class="form-control" id="userId" placeholder="조회하실 기간을 입력해주세요." name="userId" style="width: 300px;">
	                    
	                    <button type="submit" class="btn btn-primary" style="margin-left: 10px;">조회</button>
	                </div>
	            </form>
	            
	            <form class="form-inline" action="abc.do">
	                <div id="top11" style="display: flex;">
	                    <label for="carNum" style="margin: 0px 15px;">지점 검색 : </label>
	                    <!-- 얘는 뭔가 그 지점검색 누르면 아래에 모든 지점 뜨게끔 하고 그걸 누르면 아래에 지점별 목록 뜨게끔 하고 싶음 -->
	                    <input type="text" class="form-control" id="userId" placeholder="조회하실 기간을 입력해주세요." name="userId" style="width: 300px;">
	                    
	                    <button type="submit" class="btn btn-primary" style="margin-left: 10px;">조회</button>
	                </div>
	            </form>
			</div>
			<h2>매출내역</h2>   
			
			<div class="salesList">		
				<a type="submit" class="btn btn-secondary" href="#">모델별 매출 내역</a>
				<a type="submit" class="btn btn-secondary" href="#">기간별 매출 내역</a>
				<a type="submit" class="btn btn-secondary" href="#">지점별 매출 내역</a>
			</div>
			
			<table class="table">
				<thead>
					<tr>
						<th>모델</th>
						<th>예약건수</th>
						<th>예약금액</th>
						<th>상세보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>user01</td>
						<td>user02</td>
						<td><a type="submit" class="btn btn-secondary" href="#">상세보기</a></td>
					</tr>
					
				</tbody>
			</table>
			
			<table class="table">
				<thead>
					<tr>
						<th>기간</th>
						<th>예약건수</th>
						<th>예약금액</th>
						<th>상세보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>user01</td>
						<td>user02</td>
						<td><a type="submit" class="btn btn-secondary" href="#">상세보기</a></td>
					</tr>
					
				</tbody>
			</table>
			
			<table class="table">
				<thead>
					<tr>
						<th>지점</th>
						<th>예약건수</th>
						<th>예약금액</th>
						<th>상세보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>user01</td>
						<td>user02</td>
						<td><a type="submit" class="btn btn-secondary" href="#">상세보기</a></td>
					</tr>
					
				</tbody>
			</table>
		</div>
			
		

		<div class="container">
			<h3>상세내역</h3>
			<table class="table table-bordered">
			
			<thead>
				<tbody>
					<tr>
						<th>모델명</th>
						<th>연식</th>
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
			</thead>
			</table>
		</div>
	</div>

</body>
</html>