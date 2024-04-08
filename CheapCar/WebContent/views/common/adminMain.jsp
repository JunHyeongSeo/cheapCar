<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인페이지</title>
	
	<link rel="stylesheet" href="resources/css/adminStyle.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
   
</head>
<body>
	
	<c:set var="loginUser" value="${ sessionScope.loginUser }" />
	<c:set var="contextPath" value="${ sessionScope.contextPath }"/>
	
	<c:choose>
	
		<c:when test="${ loginUser.memberStatus eq 'A' }">
		
	    <div id="wrap">
	        
	        <h1><a href="${ contextPath }/adminMain">관리자 메인페이지</a></h1>
	        
	        <div class="login-area">
				<div id="login-area1"><a href="${ contextPath }/logout" class="btn btn-sm btn-primary">로그아웃</a></div>
				<div id="login-area2"><a href="${ contextPath }" class="btn btn-sm btn-secondary">&nbsp;&nbsp;사용자페이지&nbsp;&nbsp;</a></div>
	        </div>

	        <br clear="both">
	       
	        <ul id="navi">
				
				<li><a href="#" class="naviA">회원관리</a>
					<ul>
						<li><a href="${ contextPath }/memberList?currentPage=1">회원현황</a></li>
	                    <li><a href="${ contextPath }/blackList?currentPage=1">블랙리스트관리</a></li>
	                </ul>
	            </li>
	            
	            <li>
	            	<a href="${ contextPath }/manageCar?currentPage=1">차량관리</a>
            	</li>
            	
	            <li>
	            	<a href="${ contextPath }/list.cs?currentPage=1" class="naviA">고객센터</a>
            	</li>
            	
	            <li>
	            	<a href="${ contextPath }/sales" class="naviA">매출관리</a>
            	</li>
            	
	            <li>
	            	<a href="#" class="naviA">게시판관리</a>
	                <ul>
	                    <li>
	                    	<a href="${ contextPath }/list.notice?currentPage=1" target="_blank">공지사항게시판</a>
                    	</li>
	                    <li>
	                    	<a href="${ contextPath }/list.review?currentPage=1" target="_blank">후기게시판</a>
                    	</li>
	                    <li>
	                    	<a href="${ contextPath }/list.event?currentPage=1" target="_blank">이벤트게시판</a>
                    	</li>
	                </ul>
	            </li>
	        </ul>
	        
	    	<br clear="both">
	    	
	    </div>
    
    	</c:when>
	
    	<c:otherwise>
    		<h1>로그인 후 이용 가능합니다.</h1>
		</c:otherwise>
	</c:choose>
	
</body>
</html>