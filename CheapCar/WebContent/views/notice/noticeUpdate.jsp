<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.semi.notice.model.vo.Notice" %>    
<%
	Notice notice = (Notice)request.getAttribute("notice");
%>


    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>

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
        font-family: "Do Hyeon", sans-serif;
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
        height: auto;
        padding-left: 50px;
        padding-top: 50px;
        border-bottom: 2px solid #b1d6f3;
        font-size: 30px;
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
    #comment{
        font-size: 25px;
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
				<h2 class="page-header do-hyeon-regular" align="left">공지사항</h2>
				</div>
                
                <div class="content_outer">
                    <form action="<%=contextPath%>/update.notice" method="post" id="insert-form">
                     <input type="hidden" name="memberNo" value="<%= loginUser.getMemberNo() %>" />
                     <input type="hidden" name="memberName" value="<%= loginUser.getMemberName() %>" />
                    <div class="content_header">
                        <div class="content_header2">
                            <label class="form-title">제목 : </label>
                            <input type="text" name="title" >                            
                        </div>
                    </div>
                    <div class="content_sub">
                        <span class="content_sub1">작성자 : <%= loginUser.getMemberName() %>
                    </div>
                    <div class="content_body">
                        <textarea name="content" class="form-control" rows="20" id="comment" style="resize: none;"></textarea>
                    </div>
                    
                    <div class="content_btn" align="center">
                        <div align="center">
                            <button type="submit" class="btn btn-sm btn-primary">등록하기</button>
                            <button type="button" class="btn btn-sm btn-secondary" onclick="history.back()">뒤로가기</button>
                            
                        </div>
                           
                    </div>
                    </form>
                </div>
			 </div>
		  </div>

	</div>
		
	

</body>
</html>