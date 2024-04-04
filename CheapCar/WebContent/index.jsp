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
                <!-- <div class="swiper-slide" onclick="aba();"><img src="views/common/공지사항 더미1.png"></div>
                <div class="swiper-slide"><img src="views/common/공지사항 더미2.png"></div>
                <div class="swiper-slide"><img src="views/common/공지사항 더미3.png"></div>
                <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2016/05/27/08/51/mobile-phone-1419275__480.jpg"></div>
                <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2015/09/01/09/32/alphabet-916673__480.jpg"></div>
            	 -->
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

        window.onload = function(){

            $.ajax({
        	url : 'event.event',
        	success : function(result){
        		//console.log(result);
				
        		let resultStr = '';
				for(let i = 0; i < result.length; i++){
					console.log(result);
					resultStr += '<div class="swiper-slide"><img src="' + result[i].titleImg +'">'
					 +  '<input type="hidden" name="eventNo" value="' + result[i].eventNo +'"></div>'
				
				}
				
				$('.swiper-wrapper').html(resultStr);
        		
        	},
            async : false
        	
            });
            
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

            $.ajax({
                url : 'popular.car',
                success : function(result){

                    console.log(result);
                    let resultStr = '';
    				for(let i = 0; i < 3; i++){
    					
    					resultStr 
    					  += '<div class="col-xs-12 col-sm-4">'
	    					 + '<div class="card">'
	    					   + '<a class="img-card" href="http://localhost:7777/CheapCar/selectedCarList.do?currentPage=1">'
	    					     + '<div class="card-content">'
	    					       + '<img style="width : 100%; height : 100%" src="' + result[i].carPhotoAddress +'">'
	    					       + '<input type="hidden" name="popularcar" value="' + result[i].modelName + '">'
	    					     + '</div>'
	    					   + '</a>'
	    					   + '<div class="card-content">'
	    					     + '<h4 calss=cardtitle>'
	    					       + '<a href="#">' + result[i].modelName + '</a>'
	    					     + '</h4>'
	    					   + '</div>'
	    					 +'</div>'
    					+ '</div>'
    				}
    				
    				$('#cacaca').html(resultStr);


                }
            });
            
            
      		 
          
            
        	
            
            
        };  
        
        $(function(){ // 메인 화면에 이벤트 게시판 

            $('.swiper-slide').click(function(){
            	
                const eventNo = $(this).children().eq(1).val();
                console.log(eventNo);
                location.href = '<%= contextPath %>/detail.event?eventNo=' + eventNo 
            })
        });

       
    
        
        
    </script>
    
 
    
    <hr>
    <!--<input type="hidden" onclick="location.href='<%=contextPath%>'/event.event"></input>-->

    <style>
        .container-fostrap {
            display: table-cell;
            padding: 1em;
            text-align: center;
            vertical-align: middle;
            }
            .fostrap-logo {
            width: 100px;
            margin-bottom:15px
            }
            h1.heading {
            color: #fff;
            font-size: 1.15em;
            font-weight: 900;
            margin: 0 0 0.5em;
            color: #505050;
            }
            @media (min-width: 450px) {
            h1.heading {
                font-size: 3.55em;
            }
            }
            @media (min-width: 760px) {
            h1.heading {
                font-size: 3.05em;
            }
            }
            @media (min-width: 900px) {
            h1.heading {
                font-size: 3.25em;
                margin: 0 0 0.3em;
            }
            } 
            .card {
            display: block; 
                margin-bottom: 20px;
                line-height: 1.42857143;
                background-color: #fff;
                border-radius: 2px;
                box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12); 
                transition: box-shadow .25s; 
            }
            .card:hover {
            box-shadow: 0 8px 17px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
            }
            .img-card {
            width: 100%;
            height:200px;
            border-top-left-radius:2px;
            border-top-right-radius:2px;
            display:block;
                overflow: hidden;
            }
            .img-card img{
            width: 100%;
            height: 200px;
            object-fit:cover; 
            transition: all .25s ease;
            } 
            .card-content {
            padding:15px;
            text-align:left;
            }
            .card-title {
            margin-top:0px;
            font-weight: 700;
            font-size: 1.65em;
            }
            .card-title a {
            color: #000;
            text-decoration: none !important;
            }
            .card-read-more {
            border-top: 1px solid #D4D4D4;
            }
            .card-read-more a {
            text-decoration: none !important;
            padding:10px;
            font-weight:600;
            text-transform: uppercase
            }
    </style>

   


    <div id="bottom-content" style="width : 1000px; height : 800px;margin:auto;">

        <h2 style="font-size:38px; font-weight: 800; margin-top:50px; margin-bottom:60px;" align="center">현재 인기있는 차종~</h2>

        <div class="container">
            <div id="cacaca" class="row">
            
            
            
               
                
                
                
                <!-- 
                 <div class="col-xs-12 col-sm-4">
                    <div class="card">
                        <a class="img-card" href="http://localhost:7777/CheapCar/selectedCarList.do?currentPage=1">
                        <img src="https://file.carisyou.com/upload/2018/01/15/EDITOR_201801151245046750.jpg" />
                      </a>
                        <div class="card-content">
                            <h4 class="card-title">
                                <a href="http://localhost:7777/CheapCar/selectedCarList.do?currentPage=1"> 더 옛날 소나타~
                              </a>
                            </h4>
                            <p class="">
                                더 옛날 소나타도 빌려야지~
                            </p>
                        </div>
                        <div class="card-read-more">
                            <a href="http://localhost:7777/CheapCar/selectedCarList.do?currentPage=1" class="btn btn-link btn-block">
                                지금 빌리러 가기~
                            </a>
                        </div>
                    </div>
                </div>
                
                 -->
                <!--
                
                
                
                
                <div class="col-xs-12 col-sm-4">
                    <div class="card">
                        <a class="img-card" href="http://localhost:7777/CheapCar/selectedCarList.do?currentPage=1">
                        <img src="https://4.bp.blogspot.com/-TDIJ17DfCco/Vtneyc-0t4I/AAAAAAAABmk/aa4AjmCvRck/s1600/cover.jpg" />
                      </a>
                        <div class="card-content">
                            <h4 class="card-title">
                                <a href="http://localhost:7777/CheapCar/selectedCarList.do?currentPage=1">무슨차야 이건~
                              </a>
                            </h4>
                            <p class="">
                                이건 아직 안넣었따~
                            </p>
                        </div>
                        <div class="card-read-more">
                            <a href="http://localhost:7777/CheapCar/selectedCarList.do?currentPage=1" class="btn btn-link btn-block">
                                몰라~
                            </a>
                        </div>
                    </div>
                    
                    
                </div> -->
            </div>
        </div>
    </div>

    <!-- <div>
        <div>


        </div>
    </div> -->





    <div style="margin-top:200px;"></div>

    
	
</body>
</html>