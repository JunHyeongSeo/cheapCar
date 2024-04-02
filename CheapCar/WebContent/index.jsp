<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.semi.event.model.vo.EventBoard, com.kh.semi.common.model.vo.PageInfo" %>     
<%
	ArrayList<EventBoard> list = (ArrayList<EventBoard>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>메인화면</title>

<meta charset="utf-8">
    <title>ROYAL CARS - Car Rental HTML Template</title>

 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <!-- swiper.js 라이브러리추가 -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

    <style>
    /* 이미지 영역 사이즈 조절 */
    .swiper {
        width: 800px;
        height: 500px;
    }

    /* 이미지 사이즈 조절 */
    .swiper-slide>img {
        width : 100%;
        height : 100%;
    }

    /* 화살표 버튼색 변경 (기본색은 파란색) */
    div[class^=swiper-button] {
        color : white;
        /* display : none; */ /* 아니면 안보이게 숨기기도 가능 */
    }
    
     .swiper-slide:hover{
            font-size: 21px;
            background-color: lightslategray;
            cursor: pointer;
        }
    
    </style>
    
</head>
<body>
	
	<% com.kh.semi.common.JDBCTemplate.getConnection(); %>
	<%@ include file="views/common/menuBar.jsp" %>
	

	<!-- 
        * 참고 링크
        https://iridescent-zeal.tistory.com/150
    -->
    <div id="content_1">
        <!-- Slider main container -->
        <div class="swiper">
            <!-- Additional required wrapper -->
            <div class="swiper-wrapper">
                <!-- Slides -->
                <div class="swiper-slide" onclick="aba();"><img src="views/common/공지사항 더미1.png"></div>
                <div class="swiper-slide"><img src="views/common/공지사항 더미2.png"></div>
                <div class="swiper-slide"><img src="views/common/공지사항 더미3.png"></div>
                <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2016/05/27/08/51/mobile-phone-1419275__480.jpg"></div>
                <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2015/09/01/09/32/alphabet-916673__480.jpg"></div>
            </div>
        
            <!-- If we need pagination -->
            <div class="swiper-pagination"></div>
        
            <!-- If we need navigation buttons -->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        
            <!-- If we need scrollbar -->
            <div class="swiper-scrollbar"></div>
        </div>
    </div>

    <script>
        // 슬라이더 동작 정의
        const swiper = new Swiper('.swiper', {
            autoplay : {
                delay : 5000 // 5초마다 이미지 변경
            },
            loop : true, //반복 재생 여부
            slidesPerView : 1, // 이전, 이후 사진 미리보기 갯수
            pagination: { // 페이징 버튼 클릭 시 이미지 이동 가능
                el: '.swiper-pagination',
                clickable: true
            },
            navigation: { // 화살표 버튼 클릭 시 이미지 이동 가능
                prevEl: '.swiper-button-prev',
                nextEl: '.swiper-button-next'
            }
        }); 

        function aba(){
            alert('12121212');
        };
        
        
        window.onload = function(){
            
            $.ajax({
        	url : 'event.event',
        	success : function(result){
        		console.log(result);
        	}
        	
        	
            });

        };  

      
        
    </script>
    
    
    <!--<input type="hidden" onclick="location.href='<%=contextPath%>'/event.event"></input>-->
	
</body>
</html>