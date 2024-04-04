<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="java.util.ArrayList, com.kh.semi.cs.model.vo.Cs, com.kh.semi.common.model.vo.PageInfo" %>    
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Cs> list = (ArrayList<Cs>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();	
	int endPage = pi.getEndPage();
	int listCount = pi.getListCount();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1대1 문의</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">

<style>
	.outer{
		width: 1200px;
		height: auto;
		margin: auto;
		padding-bottom: 50px;
	}
	.page-header{
		padding-top: 20px;
		font-size: 40px;
		font-weight: bold;
		border-bottom: 6px solid #6caddf;
	}
	
	#title{
		background-color: aquamarine;
		font-size: large;
		font-weight: bolder;
	}
	#write{
		text-align: right;
		padding-right: 0%;
		margin-bottom: 2px;
	}
	.search-area{
		text-align: center;
		margin-top: 10px;
	}
    
	.do-hyeon-regular {  /* 공지사항 글꼴 */ 
		font-family: "Do Hyeon", sans-serif;
		font-weight: 300px;
		font-style: normal;
		font-size: 60px;
		color: #6caddf;
	}
	#searchWord{
		border: 2px solid #6caddf;
		border-radius: 5px;
	}
	.table{
		font-size: 18px;
	}

</style>
</head>
<body>

	<%@ include file="../common/menuBar.jsp" %>
	
	<div class="outer" >
		<div class="row">
			<div class="col-lg-1">
		 	</div>
			<div class="col-lg-10">
				<div class="panel-body">
					<h2 class="page-header do-hyeon-regular" align="left">1대1 문의</h2>

					<% if(loginUser != null && (loginUser.getMemberStatus().equals("A") || loginUser.getMemberStatus().equals("C"))) { %>
						<div id="write">
							<a href="<%= contextPath %>/insertForm.cs" class="btn btn-info">글쓰기</a>
						</div> 
				    <% } %>
				    
				    <table class="table table-bordered table-hover" style="margin-top:30px; border-radius: 5px;">
				    	<tr style="background-color: #6caddf; margin-top: 0; height: 40px; color: white; opacity: 0.8">
				    		<th style="width: 8%; text-align:center">번호</th>
						 	<th style="width: 45%; text-align:center">제&nbsp;&nbsp;&nbsp;&nbsp;목</th>
						 	<th style="width: 10%; text-align:center">작성자</th>
						 	<th style="width: 10%; text-align:center">답변여부</th>
						 	<th style="width: 15%; text-align:center">작성일</th>
					  	</tr>
				  	<% if(list.isEmpty()) { %>
					  	<tr>
					  		<th colspan="5"> 문의글이 존재하지 않습니다.</th>
				  		</tr>
					<% } else {%>
						<% for(Cs c : list) { %>
							<tr class="cs_list">
								<th style="text-align:center"><%= c.getCsNo() %></th>
								<th><%= c.getCsTitle() %></th>
								<th style="text-align:center"><%= c.getMemberName() %></th>
								<th style="text-align:center"><%= c.getReplyYn() %></th>
								<th style="text-align:center"><%= c.getCreateDate() %></th>
							</tr>
						<% } %>
				  	<% } %>
					</table>               
				</div>            
			</div>
		</div>
		
		<div class="paging-area" align="center" style="margin-top:12px">
			
			<% if(currentPage > 1 && listCount != 0) { %>
				<button class="btn btn-outline-info" style="color:#6caddf" onclick="location.href='<%=contextPath%>/list.cs?currentPage=<%= currentPage - 1 %>'">이전</button>
			<% } %>
			
			<% for(int i = startPage; i <= endPage; i++) { %>
				<% if(currentPage != i) { %>
					<button class="btn btn-outline-info" style="color:#6caddf" onclick="location.href='<%=contextPath %>/list.cs?currentPage=<%= i %>'"><%= i %></button>
				<% } else { %>
					<button disabled class="btn btn-outline-info" style="color:#6caddf;"><%= i %></button>
				<% } %>
			<% } %>
			
			<% if(currentPage != maxPage && currentPage < maxPage) { %>
				<button class="btn btn-outline-info" style="color:#6caddf" onclick="location.href='<%=contextPath%>/list.cs?currentPage=<%= currentPage + 1 %>'">다음</button>
			<% } %>
	    </div>	
		
		<div class="search-area">
			<form>
				<input type="text" id="searchWord" name="searchWord" placeholder="검색" >
				<button type="submit" value="" id="" class="btn-info" style="background-color: #6caddf">검색</button>
			</form>
		</div>
	</div>
	
	<script>
		$('.cs_list').click(function(){
			const csNo = $(this).children().eq(0).text();
			location.href = '<%=contextPath%>/detail.cs?csNo=' + csNo;
		})
	</script>
		
	
</body>
</html>