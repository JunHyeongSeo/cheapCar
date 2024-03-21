<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    h2{
        padding-left: 20px;
        color: yellowgreen;
    }
    
    #introduce{
    	padding-left: 20px;
    	color : black;
    	border: 1px;
    }
    
    div > span{
    	color : blue;
    	
    }
    
    div{
    	font-size : 25px;
    }
    
    .area{
    	justify-content: space-between;
    	
    }
    
    .inline{
    	display : inline;
    }
    
    #mymodify{
    	float : right;
        margin-right : 20px;
    }
    
    
    
</style>

<body>

    <%@ include file="../common/menuBar.jsp" %>

		<h2>마이페이지</h2>

		<br clear = "both">

    <div class="area">
        <div class="inline" id="introduce">안녕하세요! <span> <%=loginUser.getMemberName()%></span>님 반갑습니다!!</div>
        <div class="inline" id="mymodify"><a href="<%=contextPath %>/update" >개인정보수정</a></div>
    </div>




</body>
</html>