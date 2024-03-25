<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.semi.cs.model.vo.Cs, com.kh.semi.common.model.vo.PageInfo" %>
<%
	ArrayList<Cs> list = (ArrayList<Cs>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원문의글 조회</title>
</head>
<body>
	<%@ include file="../../common/adminMain.jsp" %>
	<div class="outer">
        <div id="top1">
                
            <form class="form-inline" action="abc.do">
                <div id="top11" style="display: flex;">
                    <label for="carNum" style="margin: 0px 15px;">회원 아이디 : </label>
                    <input type="text" class="form-control" id="userId" placeholder="조회하실 회원 아이디를 입력해주세요." name="userId" style="width: 300px;">
                    
                    <button type="submit" class="btn btn-primary" style="margin-left: 10px;">조회</button>
                </div>
            </form>
		</div>

        <div class="container">
            <h2>문의내역</h2>   
            <table class="table">
              <thead>
                <tr>
                    <th>제목</th>
                    <th>아이디</th>
                    <th>내용</th>
                    <th>답변여부</th>
                    <th>상세보기</th>
                </tr>
              </thead>
              <tbody>
	              <% if(list.isEmpty()) { %>
	              		<tr>
	              			<td colspan="5">등록된 문의내역이 없습니다.....</td>
	              		<tr>
	              <% } else { %>
	              	<% for(Cs cs : list) { %>
			       		<tr>
			       			<td><%= cs.getCsTitle() %></td>
			       			<td><%= cs.getMemberId() %></td>
			       			<td><%= cs.getCsContent() %></td>
			       			<td><%= cs.getReplyYn() %></td>
			       			<td><a type="submit" class="btn btn-secondary" href="#">상세보기</a></td>
			       		</tr>
		       		<% } %>
	              <% } %>
              </tbody>
            </table>
          </div>
            
        <div class="paging-area">
            <% if(pi.getCurrentPage() > 1) { %>
            	<button class="btn btn-outline-danger" onclick="location.href='<%=contextPath%>/selectCsList?currentPage=<%= pi.getCurrentPage() - 1 %>'">이전</button>
            <% } %>
			
			<% for(int i = pi.getStartPage(); i <= pi.getEndPage(); i++) { %>
            	
            	<% if(pi.getCurrentPage() != i) { %>
            		<button class="btn btn-outline-danger" onclick="location.href='<%=contextPath%>/selectCsList?currentPage=<%=i%>'"><%= i %></button>
				<% } else { %>
					<button disabled class="btn btn-danger"><%= i %></button>
				<% } %>
				            	
            <% } %>
            
            <% if(pi.getCurrentPage() < pi.getMaxPage()) { %>
            	<button class="btn btn-outline-danger" onclick="location.href='<%=contextPath%>/selectCsList?currentPage=<%= pi.getCurrentPage() + 1 %>'">다음</button>
            <% } %>
        </div>
        
        
        
        <div class="container">       
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th>제목</th>
						<td>차가 이상해요</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>어쩌구저쩌구</td>
					</tr>
					<tr>
						<th>답변</th>
						<td>어저꾸저쩌구</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>