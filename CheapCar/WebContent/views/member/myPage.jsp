<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.semi.car.model.vo.Car" %>
<%
	ArrayList<Car> carlist = (ArrayList<Car>)request.getAttribute("list");
%>
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
	        <div class="inline" id="introduce">안녕하세요! <span><%=loginUser.getMemberName()%></span>님 반갑습니다!!</div>
	        <div class="inline" id="mymodify"><a href="<%=contextPath %>/update" >개인정보수정</a></div>
	    </div>
	    
		   
		<% if(carlist.isEmpty()) { %>
		
		<div class="container1" >
			<form method="get" action="<%=contextPath%>/reservation.my">
				<h4>예약내역</h4>
			  	<table class="table" id="aa">
			    	<thead class="thead-dark">
			      		<tr>
				        	<th>차량번호</th>
				        	<th>모델명</th>
			        		<th>대여장소</th>
							<th>예약일자</th>
							<th>반납일자</th>
			      	</tr>
				    </thead>
				    <tbody>
				    	
				    	<tr>
					        <td colspan="4">예약내역이 존재하지 않습니다</td>
					        <td></td>
				        	<td></td>
				        	<td></td>
				      	</tr>
				   	</tbody>
			  	</table>
		  	</form>
	  	</div>

	  <div id="con23">
	  
		  <div class="container2">
				<h4>마일리지</h4>
			  	<table class="table" id="aa">
			    	<thead class="thead-dark">
			      		<tr>
				        	<th>적립날짜</th>
				        	<th>마일리지</th>
			      		</tr>
				    </thead>
				    <tbody>
				    	<tr>
					        <td colspan="2">마일리지가 존재하지 않습니다.</td>
					        <td></td>
				      	</tr>
				   </tbody>
			  </table>
		  </div>
		  
		  <div class="container3">
				<h4>나의 문의내역</h4>
			  	<table class="table" id="aa">
			    	<thead class="thead-dark">
			      		<tr>
				        	<th>문의 번호</th>
				        	<th>제목</th>
			        		<th>문의 일자</th>
			        		<th>문의 답변 여부</th>
			      		</tr>
				    </thead>
				    <tbody>
				    	<tr>
					        <td colspan="4">나의 문의내역이 없습니다.</td>
					        <td>복붙은 아주 선수야 선수</td>
				        	<td></td>
				        	<td></td>
				      	</tr>
				   </tbody>
			  	</table>
		  	</div>
	
	  	</div>
		
		
			
		<% } else { %>
		
	
	
		<div class="container1" >
			<form method="get" action="<%=contextPath%>/reservation.my">
				<h4>예약내역</h4>
			  	<table class="table" id="aa">
			    	<thead class="thead-dark">
			      		<tr>
				        	<th>차량번호</th>
				        	<th>모델명</th>
			        		<th>대여장소</th>
							<th>예약일자</th>
							<th>반납일자</th>
			      	</tr>
				    </thead>
				    <tbody>
				    	<% for(Car car : carlist) { %>
				    	<tr>
					        <td><%= car.getCarNo() %></td>
					        <td><%= car.getModelName() %></td>
				        	<td><%= car.getLocationName() %></td>
				        	<td><%= car.getStartDate()%></td>
				        	<td><%= car.getEndDate() %></td>
				      	</tr>
				      	<% } %>
				   </tbody>
			  </table>
		  </form>
	  </div>
	  
	
	  <div id="con23">
	  
		  <div class="container2">
				<h4>마일리지</h4>
			  	<table class="table" id="aa">
			    	<thead class="thead-dark">
			      		<tr>
				        	<th>적립날짜</th>
				        	<th>마일리지</th>
			      		</tr>
				    </thead>
				    <tbody>
				    <% for(Car car : carlist) { %>
				    	<tr>
					        <td><%= car.getMileageDate() %></td>
					        <td><%= car.getMileage() %></td>
				      	</tr>
				    <% } %>
				   </tbody>
			  </table>
		  </div>
		  
		  <div class="container3">
				<h4>나의 문의내역</h4>
			  	<table class="table" id="aa">
			    	<thead class="thead-dark">
			      		<tr>
				        	<th>문의 번호</th>
				        	<th>제목</th>
			        		<th>문의 일자</th>
			        		<th>문의 답변 여부</th>
			      		</tr>
				    </thead>
				    <tbody>
				    <% for(Car car : carlist) { %>
				    	<tr>
					        <td><%= car.getCsNo()%></td>
					        <td><%= car.getCsTitle()%></td>
				        	<td><%= car.getCreateDate() %></td>
				        	<td><%= car.getReplyYn() %></td>
				      	</tr>
				      	<% } %>
				   </tbody>
			  	</table>
		  	</div>
	
	  	</div>
	  
	  
		<% } %>


	</div>






</body>
    
    
    
    
    
    
    
    




</body>
</html>