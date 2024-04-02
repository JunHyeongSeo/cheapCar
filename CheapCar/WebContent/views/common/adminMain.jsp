<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.member.model.vo.Member"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인페이지</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <style>
    	
        /* adminMain 스타일 */
        .outer{
	       width: 1200px;
	       position: absolute;
	       top: 250px;
	       z-index: -1;
	       height: 1000px;
	       margin: auto;
        }
        
        #wrap{
            padding-top: 50px;
            width : 100%;
            margin: auto;
        }
       
        #wrap>h1>a{
        	text-align : center;
        	display: block;
            width: 100%;
            height: 100%;
            text-decoration: none;
            color: blue;
            font-weight: bold;
            font-size: 40px;
            line-height: 50px;
        }
        
		.login-area{
			width: 300px;
			height: 30px;
			float: right;
			margin: auto;
		}

        #login-area1{
            width: 50%;
            height: 100%;
            padding-right: 10px;
        }

        #login-area2{
            width: 50%;
            height: 100%;
        }

        .login-area > div{
            display: inline;
            width: 100%;
        }

        .login-area>div>a{
            text-decoration: none;
            color: black;
        }

        #navi{
            list-style: none;
            width: 50%;
            height: 100%;
            margin: auto;
            font-size: 22px;
        }

        #navi a{
            text-decoration: none;
            color: black;
            font-weight: 700;
            display: block; /* 인라인요소를 블럭요소로 바꿔줌 */
            width: 100%;
            height: 100%;
            line-height: 40px;
        }

        #navi>li{
            float: left;
            width: 20%;
            height: 100%;
            text-align: center;
        }

        #navi > li > ul{
            list-style: none;
            padding: 5px;
            /* 평소에는 안보이다가 마우스가 올라가는 순간 펼쳐지게 1 */
            display: none;
            z-index: 100;
        }

        #navi>li>a:hover+ul{
            /* 평소에는 안보이다가 마우스가 올라가는 순간 펼쳐지게 2 */
            display: block;
        }

        #navi>li>ul:hover{
            /* 평소에는 안보이다가 마우스가 올라가는 순간 펼쳐지게 3 */
            display: block;
        }
        
        .naviA:hover{
        	cursor : 
        }

        #navi a:hover{
            font-size: 18px;
            color: rgb(0, 26, 255);
            background-color: yellow;
        }

        #navi > li > ul a{
            font-size: 16px;
            background-color: black;
            color: white;
        }

        #navi > li > ul a:hover{
            font-size: 18px;
        }

        #main{
            border: 1px solid white;
            width: 20%;
            height: 10%;
            float: left;
        }
        
        .container{
		   	margin-top: 20px;
		}
		.paging-area{
			text-align : center;
			margin-top : 12px;
		}
		.pagin-area>button{
			margin : auto;
		}

        .naviA:hover{
            cursor: context-menu
        }
        
        #paging-area{
			text-align : center;
			margin-top : 12px;
		}
		
		.paging-area{
			text-align : center;
			margin-top : 12px;
		} 
	</style>
</head>

<body>
 
    <div id="wrap">
        <h1><a href="<%= contextPath %>/adminMain">관리자 메인페이지</a></h1>
        
        <div class="login-area">
			<div id="login-area1"><a href="<%= contextPath %>/logout" class="btn btn-sm btn-primary">로그아웃</a></div>
			<div id="login-area2"><a href="<%= contextPath %>" class="btn btn-sm btn-secondary">&nbsp;&nbsp;사용자페이지&nbsp;&nbsp;</a></div>
        </div>

        <br clear="both">
       
        <ul id="navi">
			<li><a href="#" class="naviA">회원관리</a>
				<ul>
					<li><a href="<%=contextPath%>/memberList?currentPage=1">회원현황</a></li>
                    <li><a href="<%=contextPath%>/reportList?currentPage=1">신고내역</a></li>
                    <li><a href="<%=contextPath%>/blackList?currentPage=1">블랙리스트관리</a></li>
                </ul>
            </li>
            
            <li><a href="<%=contextPath%>/manageCar?currentPage=1">차량관리</a></li>
            <li><a href="#" class="naviA">고객센터</a>
                <ul>
                    <li><a href="<%=contextPath%>/cs?currentPage=1">회원문의글조회</a></li>
                    <li><a href="#">FAQ관리</a></li>
                </ul>
            </li>
            <li><a href="#" class="naviA">매출관리</a>
                <ul>
                    <li><a href="<%=contextPath%>/sales">매출조회</a></li>
                    <li><a href="<%=contextPath%>/payList">회원결제조회</a></li>
                </ul>
            </li>

            <li><a href="#" class="naviA">게시판관리</a>
                <ul>
                    <li><a href="<%=contextPath%>/list.notice?currentPage=1" target="_blank">공지사항게시판</a></li>
                    <li><a href="<%= contextPath %>/list.review" target="_blank">후기게시판</a></li>
                    <li><a href="<%= contextPath %>/list.event" target="_blank">이벤트게시판</a></li>
                </ul>
            </li>
        </ul>
    	<br clear="both">
    </div>
    
</body>
</html>