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
        height : 600px;
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
        padding : 10px;
    }

    .image{
        width : 580px;
        height: auto;
    }

    .car-info > div{
        text-align: right;
        padding : 10px;
    }

    .modal-area{
        text-align: left;
    }

    .modal-area > div{
        padding-top: 10px;
    }
    

</style>
</head>
<body>
       
    <%@ include file="../common/menuBar.jsp" %>

    <div class="area-board">

	<% if(loginUser == null) { %>
		<script>
			alert('렌트 예약은 회원만 가능합니다.');
			location.href = '<%=contextPath%>/loginPage';
		</script>
	<% } else { %>


        <div class="car-image"> 
            <img class="image" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fpost.phinf.naver.net%2FMjAyMzEyMjZfMjI4%2FMDAxNzAzNTc4NDIxNzM0.uTcxc4cFKOcNWG2Nc7Me-BpdXCV-s8vaWFYVcQOzDSQg.vfvPPCebjKLB0RGojjK6uRpMuPXX4gVZVvxvZhTua68g.JPEG%2FIm1KxuoEiMndVQdXGhKBl3wBDjbM.jpg&type=sc960_832" alt="대표이미지">
        </div>
        
        <div class="car-info"> 차량 상세 정보
        	
            <div> <%= car.getModelName()%> </div>
            <div> <%= car.getGradeName()%> </div>
            <div> <%= car.getBrandName()%> </div>
            <div> <%= car.getYear()%>년 식 </div>
            <div> <%= car.getFuelName()%> </div>
            
            	<% carPrice = car.getGradePrice()+ car.getModelPrice() + car.getYearPrice(); %>
            	
            <div class="car-info-detail"> 옵션 리스트 : 
            
            	<% for(Option o : optionList) { %>
	                
	                <span><%= o.getOptionName() %></span>
            		<% optionPrice += o.getOptionPrice(); %>
            
            	<% } %>
      
            </div>
            
            	<% totalPrice = carPrice + optionPrice; %>
            	
            <div>
	        	시간당 가격 : <%=totalPrice%>원 <br>
                총 가격 : ? <br>
            </div>
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                결제하기
            </button>

            <div class="modal fade" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <form method="post" action="<%=contextPath%>/reservation.do">
                            <div class="modal-header">
                                <h4 class="modal-title">CheepCar 결제 페이지</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            
                            <div class="modal-body">
                                사용자 이름 : <%=loginUser.getMemberName()%> <br>
                                대여 모델 : <%=car.getModelName()%> <br>
                                차량 연식 : <%=car.getYear()%> <br>
                                사용 연료 : <%=car.getFuelName()%> <br>
                                총 가격 : <%= totalPrice%>
                            </div>
                            
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">결제</button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                            </div>
                        </form>
                        
                    </div>
                </div>
            </div>

        <br clear="both">
        
    <% } %>        
        </div>

    </div>


</body>
</html>