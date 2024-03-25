<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ 
	page import="java.util.ArrayList, 
	java.util.List,
	com.kh.semi.car.model.vo.*,
	com.kh.semi.common.model.vo.PageInfo" 
%>
<%
	Car car = (Car)request.getAttribute("car");
	List<Option> optionList = (ArrayList<Option>)request.getAttribute("optionList");
%>

<%
	int carPrice = 0;
	int optionPrice = 0;
	int totalPrice = 0;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 예약 페이지</title>

<style>
    div{
        border: 1px solid red;
    }

    .area-board{
        width : 1400px;
        height : auto;
        margin : auto;
        padding-top : 50px;
        padding-bottom : 50px;
    }

    .car-image{
        width : 600px;
        height: auto;
        float :left;
        margin-left : 50px;
        padding : 10px;
    }

    .car-info{
        width : 600px;
        height : auto;
        float : right;
        margin-right : 50px;
        text-align: center;
    }

    .image{
        width : 580px;
        height: auto;
    }

    .car-info > div{
        text-align: right;
    }
    
</style>
</head>
<body>
    <div>
        <%@ include file="../common/menuBar.jsp" %>
    </div>

    <div class="area-board">

        <div class="car-image"> 
            <img class="image" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fpost.phinf.naver.net%2FMjAyMzEyMjZfMjI4%2FMDAxNzAzNTc4NDIxNzM0.uTcxc4cFKOcNWG2Nc7Me-BpdXCV-s8vaWFYVcQOzDSQg.vfvPPCebjKLB0RGojjK6uRpMuPXX4gVZVvxvZhTua68g.JPEG%2FIm1KxuoEiMndVQdXGhKBl3wBDjbM.jpg&type=sc960_832" alt="대표이미지">
        </div>
        <div class="car-info"> 차량 상세 정보

            
            <div> <%= car.getModelName()%> </div>
            <div> <%= car.getGradeName()%> </div>
            <div> <%= car.getBrandName()%></div>
            <div> <%= car.getYear()%>년 식</div>
            <div> <%= car.getFuelName()%></div>
            
            	<% carPrice = car.getGradePrice()+ car.getModelPrice() + car.getYearPrice(); %>
            	
            <div class="car-info-detail"> 옵션 리스트 : 
            
            	<% for(Option o : optionList) { %>
	                
	                <span><%= o.getOptionName() %></span>
            		<% optionPrice += o.getOptionPrice(); %>
            
            	<% } %>
      
            </div>
            
            	<% totalPrice = carPrice + optionPrice; %>
            	
			<div>      	
	        		총 가격 : <%=totalPrice%>
	        		<br>
	            <a class="btn btn-primary "href="#">결제버튼</a>
	            <a class="btn btn-secondary" href="#">취소버튼</a>
	        </div>	  
	        
        </div>

        <br clear="both">
        
            
    </div>


</body>
</html>