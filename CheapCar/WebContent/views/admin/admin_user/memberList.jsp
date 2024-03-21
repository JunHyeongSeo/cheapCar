<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.member.model.vo.Member, java.util.ArrayList, com.kh.semi.common.model.vo.PageInfo"%>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("memberList");
	PageInfo pi = (PageInfo)request.getAttribute("pageInfo");
	
	// 페이징바 만들 때 필요한 변수 미리 세팅
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%> 

<!DOCTYPE html>
<html>
<style>
	.container{
	   margin-top: 20px;
	}
	
	#middleTable{
	    width : 80%;
	    margin: auto;
	}
	
	.table{
	    margin-top: 20px;
	    text-align: center;
	}
	
	#top2{
	    float: right;
	}
	
	.form-inline{
	    display: flex;
	    align-items: center;
	    padding: 15px;
	}
	
	.pagination{
	    width: 100%;
	    margin: auto;
	}
	
	.mileage{
	    margin-top: 30px;
	}
       
</style>
<head>
<meta charset="UTF-8">
<title>회원현황</title>

</head>
<body>
	<%@ include file="../../common/adminMain.jsp" %>
	
    <div class="outer">
        <div id="top1">
                
            <form class="form-inline" action="abc.do">
                <div id="top11" style="display: flex;">
                    <label for="userId" style="margin: 0px 15px;">회원 아이디 : </label>
                    <input type="text" class="form-control" id="userId" placeholder="조회하실 회원 아이디를 입력해주세요." name="userId" style="width: 300px;">
                    
                    <button type="submit" class="btn btn-primary" style="margin-left: 10px;">조회</button>
                </div>
            </form>
        </div>
		
		<div class="container">
            <h2>회원현황</h2>   
            <table class="table">
              <thead>
                <tr>
                    <th>회원번호</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>이메일</th>
                    <th>가입날짜</th>
                    <th>마일리지</th>
                    <th>상세보기</th>
                </tr>
              </thead>
              <tbody>
              
                <% if(list.isEmpty()) { %>
                 	<tr>
                 		<td colspan="7">등록되어있는 회원이 존재하지 않습니다.</td>
                 	</tr>
                <% } else { %>
                   	<% for(Member m : list) { %>
	                    <tr style="color: orangered;" class="board" id="<%= m.getMemberNo() %>">
	                    	<td><%= m.getMemberNo() %></td>
	                        <td><%= m.getMemberId() %></td>
	                        <td><%= m.getMemberName() %></td>
	                        <td><%= m.getEmail() %></td>
	                        <td><%= m.getEnrollDate() %></td>
	                        <td><%= m.getMileage() %></td>
	                        <td><a type="submit" class="btn btn-secondary" href="#">상세보기</a></td>
	                    </tr>
                   	<% } %>
                <% } %>
              </tbody>
            </table>
		</div>
            
        <div class="paging-area" align="center" style="margin-top:12px">
        
        	<% if(currentPage > 1) { %>
        
	       	<button class="btn btn-outline-danger" onclick="location.href='<%=contextPath%>/memberList?currentPage=<%= currentPage - 1 %>'">이전</button>
	        <% } %>
	        	<% for(int i = startPage; i <= endPage; i++) { %>
	            
	            	<% if(currentPage != i) {  %>
			            <button class="btn btn-outline-danger" onclick="location.href='<%=contextPath%>/memberList?currentPage=<%=i%>'"><%= i %></button>
	            	<% } else { %>
	            		<button disabled class="btn btn-danger"><%= i %></button>
	            	<% } %>
	            <% } %>
	        <% if(currentPage != maxPage) {%>    
			<button class="btn btn-outline-danger" onclick="location.href='<%=contextPath%>/memberList?currentPage=<%= currentPage + 1 %>'">다음</button>
			<% } %>
        </div>
	</div>
	
</body>
</html>