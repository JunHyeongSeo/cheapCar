<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 등록</title>
</head>
<body>
	<%@ include file="../../common/adminMain.jsp" %>
	
	<div class="container">
            <h2>차량등록</h2>   
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
              <% if(list.isEmpty()) { %>
              	<tr>
              		<td colspan="5">등록되어있는 차량이 없습니다.</td>
              	</tr>
              <% } else { %>
              	<% for(Car c : list) { %>
              		<tr>
              			<td><%= c.getManagementNo() %></td>
              			<td><%= c.getModelName() %></td>
              			<td><%= c.getCarNo() %></td>
              			<td><%= c.getStatus() %></td>
              			<td><a type="submit" class="btn btn-secondary" href="#">상세보기</a></td>
              		</tr>
              	<% } %>
              <% } %>
              </tbody>
            </table>
          </div>
            
        
	</div>








</body>
</html>