<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ 
	page import="java.util.ArrayList, 
	java.util.List,
	com.kh.semi.car.model.vo.*,
	com.kh.semi.common.model.vo.PageInfo" 
%>

<%
	Car car = (Car)request.getAttribute("car");
	List<Option> optionList = (ArrayList<Option>)request.getAttribute("optionList");
	int hours = (int)request.getAttribute("hours");
	String startDate = (String)request.getAttribute("startDate");
    String endDate = (String)request.getAttribute("endDate");
%>

<%
	int carPrice = 0;
	int optionPrice = 0;
	int hourPrice = 0;
	int totalPrice = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 예약 페이지</title>

<style>

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
       
	<jsp:include page="../common/menuBar.jsp" />

    <div class="area-board">

	<c:choose>
		<c:when test="${loginUser eq null}">
			<script>
				alert('렌트 예약은 회원만 가능합니다.');
				location.href = '${path}/loginPage';
			</script>
		</c:when>
		<c:otherwise>
	
	
	        <div class="car-image"> 
	            <img class="image" src="${path}/${car.carPhotoAddress}/${car.changeName}" alt="대표이미지">
	        </div>
	        
	        <div class="car-info"> 차량 상세 정보
	        	
	            <div> ${car.modelName} </div>
	            <div> ${car.gradeName} </div>
	            <div> ${car.brandName} </div>
	            <div> ${car.year}년 식 </div>
	            <div> ${car.fuelName} </div>
	            
	            	<c:set var="carPrice" value="${car.gradePrice + car.modelPrice + car.yearPrice}"/>
	            	
	            <div class="car-info-detail"> 옵션 리스트 : 
		            <c:forEach var="o" items="${requestScope.optionList}">
		            
		                <span>${o.optionName}</span>
		                
	            		${optionPrice += o.optionPrice}
	            
	      			</c:forEach>
	            </div>
	            
	            	<c:set var="hourPrice" value="${carPrice + optionPrice}"/>
	            	<c:set var="totalPrice" value="${hourPrice + (10000 * hours)}"/>
	            	
	            <div>
	            
		        		시간당 가격 : ${hourPrice}원 <br>
	                                	총 가격 : ${totalPrice}원 <br>
	            </div>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
	               	결제하기
	            </button>
	
	            <div class="modal fade" id="myModal">
	                <div class="modal-dialog">
	                    <div class="modal-content">
	
	                        <form method="post" action="${path}/reservation.do?managementNo=${car.managementNo}&totalPrice=<%=totalPrice%>&startDate=${startDate}&endDate=${endDate}">
	                            <div class="modal-header">
	                                <h4 class="modal-title">CheepCar 결제 페이지</h4>
	                                <button type="button" class="close" data-dismiss="modal">&times;</button>
	                            </div>
	                            
	                            <div class="modal-body">
	                            	<input type="hidden" name="memberNo" value="${loginUser.memberNo}"/>
						                                사용자 이름 : ${loginUser.memberName} <br>
						                                대여 모델 : ${car.modelName} <br>
						                                차량 연식 : ${car.year} <br>
						                                사용 연료 : ${car.fuelName} <br>
						                                대여 기간 : ${startDate} ~ ${endDate} <br>
						                                총 가격 : ${totalPrice}원
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
    	</div>
	        
	    </c:otherwise>
    </c:choose>     
        </div>



</body>
</html>