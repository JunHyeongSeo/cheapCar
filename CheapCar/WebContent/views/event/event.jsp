<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.semi.event.model.vo.EventBoard, com.kh.semi.common.model.vo.PageInfo" %>    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 게시판</title>
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
		padding-bottom: 30px;
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
	.search_write{
		margin-top: 10px;
		display: inline;
		text-align: right;
		margin-right: 0px;
	}
	.do-hyeon-regular {  /* 타이틀 글꼴 */ 
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
	#event_list{
		display:flex;
		flex-direction: row;
		gap: 2%;
		flex-wrap: wrap;
		margin-top: 30px;
		overflow: hidden;
		list-style-type: none;
	}
	#event_list > li{
		width: 300px;
		height: 400px;
		
		text-decoration: none;
	}
	.event_1:hover{
		cursor: pointer;
		opacity: 0.8;
	}
	.img-area{
		width: 100%;
		height: 55%;
		border: 4px solid #6caddf;
		border-top-left-radius: 20px;
		border-top-right-radius: 20px;
	}
	.text-area{
		width: 100%;
		height: 35%;
		border: 4px solid #6caddf;
		border-bottom-left-radius: 20px;
		border-bottom-right-radius: 20px;
		color: whitesmoke;
		background-color: #6caddf;
		font-size: 20px;
	}
	#titleImg{
		height: 100%;
		width: 100%;
		border-top-left-radius: 16px;
		border-top-right-radius: 16px;
	}
	#NoMsg{
		font-family: "Do Hyeon", sans-serif;
		font-size: 20px;
		color: #6caddf;
		text-align: center;
	}


</style>
</head>
<body>

	<jsp:include page="../common/menuBar.jsp"></jsp:include>
	
	<div class="outer" >
		<div class="row">
		  <div class="col-lg-1">
		  </div>
			 <div class="col-lg-10">
				<div class="panel-body">
				<h2 class="page-header do-hyeon-regular" align="left">이&nbsp;벤&nbsp;트
				</h2>

				<div class="search_write">
					<form>
						<input type="text" id="searchWord" name="searchWord" placeholder="검색" >
						<button type="submit" value="" id="" class="btn-info" style="background-color: #6caddf">검색</button>
						<c:if test="${loginUser != null and loginUser.memberStatus =='A'}">
						<a href="${ path }/insertForm.event" class="btn btn-info" id="write" style="height: 32px;">글쓰기</a>
						</c:if>
					</form>
				</div>  
				<div class="event_content">
					<ul id="event_list" >
						<c:choose>
						<c:if test="${ empty list }">
							<li id="NoMsg"> 리스트가 존재하지 않습니다. <li>
						</c:if>
						<c:otherwise>
							<% for(EventBoard eb: list) { %>
							<li>
								<div class="img-area event_1 content">
								 <input type="hidden" name="eventNo" value="<%= eb.getEventNo()%>"/>
								 <img src="<%= eb.getTitleImg() %>" id="titleImg"/>
								</div>
								<div class="text-area event_1 content" >
								<input type="hidden" name="eventNo" value="<%= eb.getEventNo()%>"/>
								 <span> <%= eb.getEventTitle() %> </span><br><br>
								 <span style="font-size: 15px;">조회수 :  <%= eb.getCount() %></span>
								</div>
							  </a>
							</li>
							</c:otherwise>
						</c:choose>
						
					</ul>
            
			 </div>
		  </div>

		<div class="paging-area" align="center" style="margin-top:12px">
			<% if(currentPage > 1) { %>	
	        <button class="btn btn-outline-info" style="color:#6caddf"
		     		onclick="location.href='<%=contextPath%>/list.event?currentPage=<%=currentPage - 1%>'">이전</button>
            <% } %>
	     	<% for(int i = startPage; i <= endPage; i++){%>
	     		<% if(currentPage != i){ %>
		     		<button class="btn btn-outline-info" style="color:#6caddf"
		     		onclick="location.href='<%=contextPath%>/list.event?currentPage=<%=i%>'"><%= i %></button>
		     	<% } else { %>
		     		<button disabled class="btn btn-outline-info" style="color:#6caddf;"><%= i %></button>
		     	<% } %>	
		     	
			<% } %>
			
			<% if(currentPage != maxPage){ %>	
			<button class="btn btn-outline-info" style="color:#6caddf"
	     		onclick="location.href='<%=contextPath%>/list.event?currentPage=<%=currentPage + 1%>'">다음</button>
	     	<%} %>
		   
	    </div>			  			  
	</div>
	   
	<script>
		$(function(){

			$('.content').click(function(){

				const eventNo = $(this).children().eq(0).val(); 

				location.href = '<%= contextPath %>/detail.event?eventNo=' + eventNo
			})


		})
	</script>
		
	
</body>
</html>