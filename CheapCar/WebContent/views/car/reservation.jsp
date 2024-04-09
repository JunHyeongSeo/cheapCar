<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

	<jsp:include page="../common/menuBar.jsp"/>
	
    <div class="area-board">
  			<div>
  				예약된 차량
  			</div>
            <div class="car-image">
                <img class="image" src="${path}/${car.carPhotoAddress}/${car.changeName}" alt="차량이미지">
            </div>
            <div class="reserve-info">
                <div class="reserve-detail">예약자 : ${loginUser.memberName} </div>
                <div class="reserve-detail">차량 모델 : ${car.modelName} </div>
                <div class="reserve-detail">연식 : ${car.year}</div>
                <div class="reserve-detail">연료 : ${car.fuelName}</div>
                <div class="reserve-detail">렌트 기간 : ${startDate} ~ ${endDate}</div>
                <div class="reserve-detail">결제 금액 : ${totalPrice} 원</div>
            </div>
			<div>
				<a class="btn btn-primary" href="${path}/myPage">
				마이페이지 
				</a>
				<a class="btn btn-secondary" href="${path}">
				메인으로			
				</a>
			</div>
    </div>

</body>
</html>