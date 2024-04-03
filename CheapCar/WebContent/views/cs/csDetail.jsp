<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.cs.model.vo.Cs"%>
<%
	Cs cs = (Cs)request.getAttribute("cs");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
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
	
    .content_outer{
        width: 90%;
        height: 1000px;
        margin-top: 50px;
        float: right;
    }
    
    .content_outer>div{
        width: 100%;
        font-family: "Do Hyeon", sans-serif;
    }
    
    .content_header{
        width: 100%;
        height: 80px;
        float: left;
    }
    
    .content_header>div{
        height: 100%;
        float: left;
        border-bottom: 4px solid #b1d6f3;
    }
    
    .content_header1{
        width: 10%;
        
        float: left;
        text-align: center;
        font-size: 30px;
        padding-top: 15px;
        font-weight: bold;
    }
    
    .content_header2{
        width: 90%;
        
        float: left;
        text-align: left;
        padding-left: 20px;
        font-size: 40px;
        padding-top: 10px;
    }
    
    .content_sub{
        text-align: right;
        padding-right: 30px;
        
    }
    
    .content_sub1{
        opacity: 0.8;
    }
    
    .content_body{
        height: 700px;
        padding-left: 50px;
        padding-top: 50px;
        border-bottom: 2px solid #b1d6f3;
        font-size: 25px;
    }

    .page-header{
		padding-top: 20px;
		font-size: 40px;
		font-weight: bold;
		border-bottom: 8px solid #b1d6f3;
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
				<h2 class="page-header do-hyeon-regular" align="left"><%= cs.getCsTitle() %></h2>
				</div>
                
                <div class="content_outer">
                    <div class="content_header">
                        <div class="content_header2"><%= cs.getCsTitle() %></div>
                    </div>
                    <div class="content_sub">
                        <span class="content_sub1">작성일 : <%= cs.getCreateDate() %></span> &nbsp;/&nbsp;
                        <span class="content_sub1">작성자 : <%= cs.getMemberName() %></span> &nbsp;/&nbsp;
                    </div>
                    <div class="content_body"><%= cs.getCsContent() %></div>
                    
                    <div class="form-group">
                    	<label>첨부파일</label>
			           <% if(at != null) { %>
			           	<!-- /jsp/resources/board_upfiles/changeName -->
			           	<a download="<%= at.getOriginName() %>" href="<%= contextPath %>/<%=at.getFilePath() %>/<%= at.getChangeName() %>"><%= at.getOriginName() %></a>
			           	
			           <% } else { %>
			          	 &nbsp;&nbsp;<span>첨부파일이 존재하지 않습니다.</span>
			           <% } %>
                    </div>
                    
                    
                    
                    
                    <div class="content_btn" align="center">
                        <a href="<%=contextPath%>/list.cs?currentPage=1" class="btn btn-sm btn-info">목&nbsp;록</a>
                    
                    	<% if(loginUser != null && loginUser.getMemberNo() == cs.getMemberNo()) { %>
                    		<a href="#" class="btn btn-sm btn-secondary">수&nbsp;정</a>
                            <a href="#" class="btn btn-sm btn-danger">삭&nbsp;제</a>
                    	<% } %>
                    	<% if(loginUser != null && loginUser.getMemberStatus().equals("A")) { %>
                    		<a href="#" class="btn btn-sm btn-primary">답&nbsp;변</a>
                    		<a href="#" class="btn btn-sm btn-danger">삭&nbsp;제</a>
                    	<% } %>
                    </div>
                </div>
			 </div>
		  </div>
	</div>
	
</body>
</body>
</html>