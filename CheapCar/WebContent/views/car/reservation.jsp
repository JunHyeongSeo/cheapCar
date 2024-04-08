<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList, 
				 java.util.List,
				 com.kh.semi.car.model.vo.*"  %>
<%
	Car car = (Car)request.getAttribute("car");
	List<Option> optionList = (ArrayList<Option>)request.getAttribute("optionList");
	String startDate = (String)request.getAttribute("startDate");
    String endDate = (String)request.getAttribute("endDate");
    int totalPrice = (int)request.getAttribute("totalPrice");
%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    .area-board{
        width : 1400px;
        height : 600px;
        margin : auto;
        padding-top : 50px;
        padding-bottom : 50px;
        text-align : center;
    }

    .car-image{
        width : 600px;
        height: auto;
        float :left;
        margin-left : 50px;
        padding : 10px;
    }
    
    .reserve-info{
        width : 600px;
        height : auto;
        float : right;
        margin-right : 50px;
        text-align: center;
        padding : 10px;
    }
    
    .image{
        width : 580px;
        height: auto;
    }

    .reserve-info > div{
        text-align: left;
        padding : 10px;
    }

</style>
</head>
<body>

	<%@ include file="../common/menuBar.jsp" %>
	
    <div class="area-board">
  			<div>
  				예약된 차량
  			</div>
            <div class="car-image">
                <img class="image" src="<%=contextPath%>/<%=car.getCarPhotoAddress()%>/<%=car.getChangeName()%>" alt="차량이미지">
            </div>
            <div class="reserve-info">
                <div class="reserve-detail">예약자 : <%= loginUser.getMemberName() %> </div>
                <div class="reserve-detail">차량 모델 : <%= car.getModelName() %> </div>
                <div class="reserve-detail">연식 : <%= car.getYear() %></div>
                <div class="reserve-detail">연료 : <%= car.getFuelName() %></div>
                <div class="reserve-detail">렌트 기간 : <%= startDate + '~' +  endDate %></div>
                <div class="reserve-detail">결제 금액 : <%= totalPrice %> 원</div>
            </div>
			<div>
				<a class="btn btn-primary" href="<%=contextPath%>/myPage">
				마이페이지 
				</a>
				<a class="btn btn-secondary" href="<%=contextPath%>">
				메인으로			
				</a>
			</div>
    </div>

</body>
</html>