<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.semi.car.model.vo.Car, com.kh.semi.member.model.vo.Member"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

	<c:if test="${ not empty alertMsg }">
		<script>
			alert('${alertMsg}');
			<c:remove var="alertMsg" scope="session"/>
		</script>
	</c:if>
	
    <div id="wrap">
    
    	<c:set var ="path" value="${pageContext.request.contextPath }" scope="session"/>
    	
    	<h1><marquee style="color:orangered;">세미프로젝트 하시느라 다들 고생 많으셨습니다. 남은 기간도 화이팅하세요!!!</marquee></h1>
        <div id="logo">
	        <a href="${ path }">
				<img src="views/common/차빌려조로고.gif" alt="차빌려조로고" width="250" height="250">
			</a>
		</div>
		
       	<div class="login-area">
       	
       	<c:choose>
       		<c:when test="${ empty sessionScope.loginUser }">
       		
	    		<form action="" method="post">
			    	<div>
			    		<a class="btn btn-outline-info" href="${ path }/loginPage" >로그인</a>
			            <a class="btn btn-outline-warning" href="${ path }/enrollPage">회원가입</a>
			        </div>
				</form>
			</c:when>
			
			<c:otherwise>
			<div id="user-info">
				<span>${ sessionScope.loginUser.memberName }</span>님 환영합니다~~!! <br><br>
			    <div>
			    	<a href="${ path }/myPage" class="btn btn-sm btn-primary">마이페이지</a>
					<a href="${ path }/logout" class="btn btn-sm btn-secondary">로그아웃</a>
					<c:if test="${ sessionScope.loginUser.memberStatus eq 'A' }">
					<a href="${ path }/adminMain" class="btn btn-sm btn-warning">관리자페이지</a>
					</c:if>
					
			   </div>
			</div>
			</c:otherwise>

   		 </c:choose>
		</div>

	</div>
	
	
	
	<br clear="both">
	
	<div class="nav-area" align="center">
		<div class="menu"><a href="${ path }/dateAndLocation.do">차량렌트</a></div>
		<div class="menu"><a href="${ path }/list.event?currentPage=1">이벤트</a></div>
		<div class="menu"><a href="${ path }/list.notice?currentPage=1">공지사항</a></div>
		<div class="menu"><a href="${ path }/list.review?currentPage=1">후기</a></div>
		<div class="menu"><a href="${ path }/list.cs?currentPage=1">고객센터</a></div>
	</div>
	
</body>
</html>