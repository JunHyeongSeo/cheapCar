<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ 
	page import="java.util.ArrayList, 
				 com.kh.semi.car.model.vo.*,
				 com.kh.semi.common.model.vo.PageInfo" 
	
%>
<%
	ArrayList<Car> carList = (ArrayList<Car>)request.getAttribute("carList");
	ArrayList<Option> optionList = (ArrayList<Option>)request.getAttribute("optionList");
    PageInfo pi = (PageInfo)request.getAttribute("pageInfo");
%>

<%
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 렌트</title>
<style>
    
    div{
        border: 1px solid red;
    }

    .area{
        width : 100%;
        height : auto;
    }
    
    .area-option{
        width : 300px;
        height: auto;
        float :left;
        margin-left : 50px;
    }

    .area-list{
        width : 900px;
        height : auto;
        float : right;
        margin-right : 50px;
    }

    .car-list{
        width : 800px;
        height : 250px;
        margin : 35px;
        padding : 15px;
    }

    .car-img{
        width : 100%;
    }

    .list-size{
        width : 380px;
        height : 215px;
        float : left;
        margin : auto;
    }

    .area-board{
        width : 1400px;
        height : auto;
        margin : auto;
        padding-top : 50px;
        padding-bottom : 50px;
    }

    .car-info {
		padding-left : 10px;
    }
    
    td{
        width : 25%;
        margin : auto;
    }
    
    .option-table{
        margin : auto;
        text-align: center;

    }
    
    .option-form{
        text-align: right;
    }
    
    .pagination{
    	margin-left : 33%;
    }
    #option-input{
		width : 160px;
		
    }
    .option-check{
    	width : 100%;
    	margin-left : 3%;
    }
    .form-check-label{
    	margin-left : 3%;
    }
</style>
</head>
<body>
    
    <!-- 나중에 border빼고 수치 1200으로 조정-->
	
    <div>
        <%@ include file="../common/menuBar.jsp" %>
    </div>

    <div class="area">

        <h1 align="center">저렴하니카 차량 리스트</h1>

        <div class="area-board">
			
            <div class="area-option">
                
                <h2 align="center">옵션리스트</h2>

                <form action="#" class="option-form form-inline" >
                    
                    <div class="form-group">
                        <label for="sel1">제조사</label>
                        <select class="form-control" id="sel1">
                          <option>현대</option>
                          <option>기아</option>
                          <option>제네시스</option>
                          <option>르노삼성</option>
                          <option>포르쉐</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="sel1">차량 등급</label>
                        <select class="form-control" id="sel1">
                          <option>경차</option>
                          <option>준중형</option>
                          <option>중형</option>
                          <option>대형</option>
                          <option>SUV</option>
                        </select>
                    </div>
					
                    <div class="form-group">
                        <label for="sel1">사용 연료</label>
                        <select class="form-control" id="sel1">
                          <option>전기</option>
                          <option>하이브리드</option>
                          <option>가솔린</option>
                          <option>디젤</option>
                          <option>LPG</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="sel1">차종</label>
                        <select class="form-control" id="sel1">
                          <option>아반때</option>
                          <option>소나타</option>
                          <option>K3</option>
                          <option>GV80</option>
                          <option>QM3</option>
                          <option>카니발F</option>
                          <option>아이오닉5</option>
                          <option>모닝</option>
                          <option>카이엔</option>
                          <option>스포티지</option>
                          <option>스타렉스</option>
                        </select>
                    </div>  

                    <div class="form-group">
                        <label for="sel1">기타 옵션</label>
                        <select class="form-control" id="sel1">
                          <option>카시트</option>
                          <option>선루프</option>
                          <option>블랙박스</option>
                          <option>후방카메라</option>
                          <option value="">네비게이션</option>
                          <option value="">주차보조 시스템</option>
                        </select>
                    </div>

					<div>
						<input id="option-input"class="form-control mr-sm-2" type="text" placeholder="Search">
	    				<button class="btn btn-sm btn-success" type="submit">Search</button>
	    				<button class="btn btn-sm btn-secondary" type="reset">초기화</button>
					</div>
                </form>
            </div>

            <div class="area-list">
                <% if(carList.isEmpty()) { %>
                
                	등록된 게시글이 존재하지 않습니다. <br>
                	
                <% } else {%>
					
					<% for(Car c : carList) { %>
	                <div class="car-list">
	                    <div class="list-size">
	                    
	                        <img class="car-img img-thumbnail" src="https://image.kmib.co.kr/online_image/2023/0404/2023040416513996855_1680594700_0018125706.jpg" alt="차량i번">
	                    
	                    </div>
                    	<div class="list-size car-info">	
	                        <label><%= c.getModelName() %></label> <br>
	
	                        <span><%= c.getGradeName() %></span>
	                        <span><%= c.getBrandName() %></span>
	                        <span><%= c.getFuelName() %></span>
	                        <span><%= c.getYear() %></span> <br><br>

	        					<% for(Option o : optionList) { %>
	        						<% if(c.getManagementNo() == o.getManagementNo()) { %>
                               			<span> <%= o.getOptionName() %></span>
                               		<% } %>
	                            <% } %> 
							<br>
	                        <label>총 가격</label> : 
	                        <span>
	                        	<%= c.getGradePrice() + c.getModelPrice() + c.getYearPrice() %>
							</span> <br>
                            
                            <a class="btn btn-sm btn-primary"href="#">예약버튼</a>
	                    </div>
                    </div>
	                <% } %>
                <% } %>
                    
                    
                    <div align="center">
						<ul class="pagination" >
                            <% if(currentPage > 1) { %>
                                <li class="page-item">
                                    <a class="page-link" onclick="location.href='<%=contextPath%>/list.car?currentPage=<%= currentPage - 1 %>'">Previous</a>
                                </li>
                            <% } %>

							<% for(int i = startPage; i <= endPage; i++) { %>
							
								<% if(currentPage != i) { %>
									<li
									class="page-link"
									onclick="location.href='<%=contextPath%>/list.car?currentPage=<%=i%>'">
									<%=i%>
									</li>
								<% } else { %>
									<li
									class="page-link"><%=i%>
									</li>
								<% } %>
							
							<% } %>
                            
                             <% if(currentPage != maxPage) {%>
								<li class="page-item">
	                                <a class="page-link" onclick="location.href='<%=contextPath%>/list.car?currentPage=<%= currentPage + 1%>'">Next</a>
	                            </li>
                            <% } %>
						</ul>
					</div>
                </div>
                <br clear="both">
        </div>
    </div>

</body>
</html>