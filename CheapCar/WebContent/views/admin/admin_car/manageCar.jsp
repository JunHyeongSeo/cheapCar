<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.semi.car.model.vo.Car, com.kh.semi.common.model.vo.PageInfo" %>
<%
	ArrayList<Car> list = (ArrayList<Car>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량관리</title>
<style>
	.container{
		margin-top : 15px;
	}

</style>

</head>
<body>
	<%@ include file="../../common/adminMain.jsp" %>
	
	<div class="outer">
        <div id="top1">
                
            <form class="form-inline" action="abc.do">
                <div id="top11" style="display: flex;">
                    <label for="carNum" style="margin: 0px 15px;">차량 번호 : </label>
                    <input type="text" class="form-control" id="userId" placeholder="조회하실 차량 번호를 입력해주세요." name="userId" style="width: 300px;">
                    
                    <button type="submit" class="btn btn-primary" style="margin-left: 10px;">조회</button>
                </div>
            </form>
		</div>

        <div class="container">
            <h2>차량현황</h2>   
            <table class="table">
              <thead>
                <tr>
                    <th>번호</th>
                    <th>차종</th>
                    <th>차량번호</th>
                    <th>예약상태</th>
                    <th>상세보기</th>
                </tr>
              </thead>
              <tbody>
                
                <tr>
                    <td>1</td>
                    <td>아반떼</td>
                    <td>02하1234</td>
                    <td>Y</td>
                    <td><a type="submit" class="btn btn-secondary" href="#">상세보기</a></td>
                </tr>
              </tbody>
            </table>
          </div>
            
        <div class="paging-area">
            
            <% if(currentPage) %>
            <button class="btn btn-outline-danger" onclick="location.href='<%=contextPath%>/memberList?currentPage=<%= currentPage - 1 %>'">이전</button>
            <button class="btn btn-outline-danger" onclick="location.href='<%=contextPath%>/memberList?currentPage=<%=i%>'"><%= i %></button>
            <button disabled class="btn btn-danger"><%= i %></button>
            
            
        </div>
        
        <div class="container">       
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th>차량번호</th>
						<td>02하 1234</td>
					</tr>
					<tr>
						<th>차량정보</th>
						<td>2024 뉴 소나타 하이브리드</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>010-1234-5678</td>
					</tr>
					<tr>
						<th>대여날짜</th>
						<td>user01</td>
					</tr>
					<tr>
						<th>반납날짜</th>
						<td>1996-03-01</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	
</body>
</html>