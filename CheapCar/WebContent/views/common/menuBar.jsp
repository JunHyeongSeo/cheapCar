<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.semi.car.model.vo.Car, com.kh.semi.member.model.vo.Member"%> 

<%
	Member loginUser = (Member)session.getAttribute("loginUser");

	String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>저렴하니CAR</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
	<style>
		.login-area{
			float : right;
			padding-right : 50px;
		}

        .menu{
            width: 150px;
            height: 50px;
            display: table-cell;
        }
        
        #wrap{
            padding-top: 50px;
        }
        
        .nav-area{
        	padding-top : 20px;
        	padding-bottom : 5px;
        	z-index : 100;
        	position : absoulute;
        	
        }
        
		#logo{
			width:200px;
			height:200px;
			margin: auto;
        }
        
        .menu>a{
            display: block;
            width: 100%;
            height: 100%;
            text-decoration: none;
            color: black;
            font-weight: bold;
            font-size: 20px;
            line-height: 50px;
        }

        .menu>a:hover{
            font-size: 21px;
            background-color: lightslategray;
            cursor: pointer;
        }

        .cs{
        	display: none;
        }
        
        .menu5>a:hover+ul{
        	display: block;
        }
        
        .cs:hover{
        	display : block;
        	
        }
        
        .menu55{
        	list-style: none;
        	padding : 0px;
        	margin : 0px;        	
        }
        
        .menu55>a{
        	text-decoration : none;
        	color : black;
        	margin : auto;
        }

        .login-area a{
        	text-decoration-line: none;
        }
		
        

	</style>
</head>
<body>

	<script>
		const msg = '<%= alertMsg %>';
		
		if(msg != 'null'){
			alert(msg);
			<% session.removeAttribute("alertMsg"); %>
		}
	</script>
	
    <div id="wrap">
    
    	<h1><marquee style="color:orangered;">세미프로젝트 하시느라 다들 고생 많으셨습니다. 남은 기간도 화이팅하세요!!!</marquee></h1>
        <div id="logo">
	        <a href="<%= contextPath%>">
				<img src="views/common/차빌려조로고.gif" alt="차빌려조로고" width="250" height="250">
			</a>
		</div>
		
       	<div class="login-area">
       		<% if(loginUser == null) { %>
	    	<form action="" method="post">
		    	<div>
		    		<a class="btn btn-outline-info" href="<%=contextPath%>/loginPage" >로그인</a>
		            <a class="btn btn-outline-warning" href="<%=contextPath%>/enrollPage">회원가입</a>
		        </div>
			</form>
			<% } else { %>
			<div id="user-info">
				<span>${ loginUser.memberName }</span>님 환영합니다~~!! <br><br>
			    <div>
			    	<a href="<%= contextPath %>/myPage" class="btn btn-sm btn-primary">마이페이지</a>
					<!-- <a href="/jsp/logout">로그아웃</a>-->
					<a href="<%= contextPath %>/logout" class="btn btn-sm btn-secondary">로그아웃</a>
					<% if(loginUser.getMemberStatus().equals("A")) { %>
					<a href="<%= contextPath %>/adminMain" class="btn btn-sm btn-warning">관리자페이지</a>
					<% } %>
			   </div>
			</div>
			<% } %>
		</div>
	</div>
	
	<br clear="both">
	
	<div class="nav-area" align="center">
		<div class="menu"><a href="<%= contextPath %>/dateAndLocation.do">차량렌트</a></div>
		<div class="menu"><a href="<%= contextPath %>/list.event?currentPage=1">이벤트</a></div>
		<div class="menu"><a href="<%= contextPath %>/list.notice?currentPage=1">공지사항</a></div>
		<div class="menu"><a href="<%= contextPath %>/list.review?currentPage=1">후기</a></div>
		<div class="menu"><a href="<%= contextPath %>/list.cs?currentPage=1">고객센터</a></div>
	</div>
	
</body>
</html>