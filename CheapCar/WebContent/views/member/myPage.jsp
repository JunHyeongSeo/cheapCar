<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  




</head>
<style>
    #myh2{
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
    
    
    #all{
    	position : relateve;
    	width : 100%;
    	
    }
    
    
    .table{
    	width : 100%;
    }
    
    .container1{
    	padding-top: 30px;
    	margin-left : 30px;
    	width : 96%;
    }
    
    #aa2{
    	width : 100%;
    }
 
	.container2{
		margin-left : 30px;
		position: absolute;
		float : left;
		width : 48%;
	}
	
    .container3{
    	margin-left : 50%;
		position: absolute;
    	float : left;
    	width : 48%;
    } 
	
    
    
    #con23{
		padding-top: 30px;
    	float : left;
    }
    
    div{
		align : center;
    }
    
    
</style>

<body>

    <%@ include file="../common/menuBar.jsp" %>
    
    
    <div id="all"> 

		<h2 id="myh2">마이페이지</h2>

		<br clear = "both">

    <div class="area">
        <div class="inline" id="introduce">안녕하세요! <span> <%=loginUser.getMemberName()%></span>님 반갑습니다!!</div>
        <div class="inline" id="mymodify"><a href="<%=contextPath %>/update" >개인정보수정</a></div>
    </div>
    
	    


	<div class="container1" >
		<h4>예약내역</h4>
	  	<table class="table" id="aa" >
	    	<thead class="thead-dark">
	      		<tr>
		        	<th>차량번호</th>
		        	<th>차종</th>
	        		<th>대여장소</th>
					<th>예약일자</th>
					<th>반납일자</th>
	      	</tr>
		    </thead>
		    <tbody>
		    	<tr>
			        <td>1</td>
			        <td>2</td>
		        	<td>3</td>
		        	<td>4</td>
		        	<td>5</td>
		      	</tr>
		      	<tr>
			        <td>1</td>
			        <td>2</td>
		        	<td>3</td>
		        	<td>4</td>
		        	<td>5</td>
		      	</tr>
		      	<tr>
			        <td>1</td>
			        <td>2</td>
		        	<td>3</td>
		        	<td>4</td>
		        	<td>5</td>
		      	</tr>
		   </tbody>
	  </table>
  </div>

  <div id="con23">
  
  <div class="container2">
		<h4>예약내역</h4>
	  	<table class="table" id="aa">
	    	<thead class="thead-dark">
	      		<tr>
		        	<th>Firstname</th>
		        	<th>안녕하세요</th>
	        	<th>Email</th>
	      	</tr>
		    </thead>
		    <tbody>
		    	<tr>
			        <td>안녕하세요</td>
			        <td>Doe</td>
		        	<td>john@example.com</td>
		      	</tr>
		      	<tr>
			        <td>Mary</td>
			        <td>Moe</td>
			        <td>mary@example.com</td>
		      	</tr>
		      	<tr>
			        <td>July</td>
			        <td>Dooley</td>
			        <td>july@example.com</td>
		      	</tr>
		   </tbody>
	  </table>
  </div>
  
  <div class="container3">
		<h4>예약내역</h4>
	  	<table class="table" id="aa">
	    	<thead class="thead-dark">
	      		<tr>
		        	<th>Firstname</th>
		        	<th>안녕하세요</th>
	        	<th>Email</th>
	      	</tr>
		    </thead>
		    <tbody>
		    	<tr>
			        <td>안녕하세요</td>
			        <td>Doe</td>
		        	<td>john@example.com</td>
		      	</tr>
		      	<tr>
			        <td>Mary</td>
			        <td>Moe</td>
			        <td>mary@example.com</td>
		      	</tr>
		      	<tr>
			        <td>July</td>
			        <td>Dooley</td>
			        <td>july@example.com</td>
		      	</tr>
		   </tbody>
	  </table>
  </div>

  </div>
  
  




</div>






</body>
    
    
    
    
    
    
    
    




</body>
</html>