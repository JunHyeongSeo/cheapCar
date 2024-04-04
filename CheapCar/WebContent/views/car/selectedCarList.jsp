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
    int hours = (int)request.getAttribute("hours");
    String locations = (String)request.getAttribute("locations");
    String startDate = (String)request.getAttribute("startDate");
    String endDate = (String)request.getAttribute("endDate");
%>

<%
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
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
<title>차량 렌트</title>
<style>
    
    div{
        border : 1px solid red;
    }

    .area{
        width : 100%;
        height : auto;
    }
    
    .area-option{
        width : 350px;
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
        height : 220px;
        margin : auto;
        padding : 15px;
    }

    .car-img{
        width : 100%;
    }

    .list-size{
        width : 380px;
        height : 190px;
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
		padding : 10px;
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
    	margin-left : 45%;
    	margin-right : 45%;
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
    
    .form-group{
    	align : center;
    }
	
	select > option{
		width: 150px;
		height: 50px;
	}

    .detail-option{
        width : 100%;
        text-align : center;
        padding : 5px;
    }
    .option-list{
    	font-size : 12px;
    }
</style>
</head>
<body>
	
    <div>
        <%@ include file="../common/menuBar.jsp" %>
    </div>

    <div class="area">

        <h1 align="center">저렴하니카 차량 리스트</h1>

        <div class="area-board">
			
            <div class="area-option">
                
                <h2 align="center">세부 검색</h2>

                <form method="get" action="<%=contextPath%>/selectOptionAndCarList.do" class="option-form form-inline form-location" >
			
					<input type="hidden" name="currentPage" value="<%= 1 %>" />
					<input type="hidden" name="hours" value="<%=hours %>" />
					<input type="hidden" name="locations" value="<%=locations %>" />
					<input type="hidden" name="startDate" value="<%=startDate %>" />
					<input type="hidden" name="endDate" value="<%=endDate %>" />

                    <div class="detail-option">
                        <label>제조사</label>
                        <select onchange="chooseBrand(this);" name="brand"class="form-control">
                            <option value="현대">현대</option>
                            <option value="기아">기아</option>
                            <option value="제네시스">제네시스</option>
                            <option value="르노삼성">르노삼성</option>
                            <option value="포르쉐">포르쉐</option>
                        </select>
                    </div>
                    
                    <div class="detail-option">
                        <label>차종</label>
                        <select id="modelOption" name="model"class="form-control">
	                        <option value=''>차종을 선택해주세요</option>
							<option value='아반때'>아반때</option>
							<option value='소나타'>소나타</option>
							<option value='아이오닉5'>아이오닉5</option>
							<option value='스타렉스'>스타렉스</option>
                        </select>
                    </div>  
                    
                    <div class="detail-option">
                        <label>차량 등급 </label>
                        <select id="gradeOption" name="grade" class="form-control">
                        	<option value="">등급을 선택해주세요</option>
                            <option value="준중형">준중형</option>
                            <option value="중형">중형</option>
                            <option value="대형">대형</option>
                        </select>
                    </div>

                    <div class="detail-option">
                        <label>사용 연료 </label>
                        <select id="fuelOption" name="fuel" class="form-control">
                            <option value="">연료를 선택해주세요</option>
                            <option value="LPG">LPG</option>
                            <option value="디젤">디젤</option>
                            <option value="가솔린">가솔린</option>
                        </select>
                    </div>

                    <div class="detail-option">
                        	옵션 리스트
                    </div>

					<div class="detail-option">

                         <input type="checkbox" class="form-check-input" name="options" value="블랙박스">블랙박스

                         <input type="checkbox" class="form-check-input" name="options" value="네비게이션">네비게이션
                         
                         <input type="checkbox" class="form-check-input" name="options" value="후방카메라">후방카메라
                         
                    </div>
                    
					<div class="detail-option">
						
	    				<button class="btn btn-primary" type="submit">검색</button>
	    				<button class="btn btn-secondary" type="reset">리셋</button>
					
					</div>
                </form>
            </div>


	<script>
	
		function chooseBrand(brand){
			
			var selectBrand = $(brand).val();
			
			if(selectBrand == "현대"){
				
				const modelHyundai = document.getElementById('modelOption');
				
				modelHyundai.innerHTML = "<option value=''>차종을 선택해주세요</option>";
				modelHyundai.innerHTML += "<option value='아반때'>아반때</option>";
				modelHyundai.innerHTML += "<option value='소나타'>소나타</option>";
				modelHyundai.innerHTML += "<option value='아이오닉5'>아이오닉5</option>";
				modelHyundai.innerHTML += "<option value='스타렉스'>스타렉스</option>";
				
				const gradeHyundai = document.getElementById('gradeOption');
				
				gradeHyundai.innerHTML = "<option value=''>등급을 선택해주세요</option>";
				gradeHyundai.innerHTML += "<option value='준중형'>준중형</option>";
				gradeHyundai.innerHTML += "<option value='중형'>중형</option>";
				gradeHyundai.innerHTML += "<option value='대형'>대형</option>";
				
				const fuelHyundai = document.getElementById('fuelOption');
				
				fuelHyundai.innerHTML = "<option value=''>연료를 선택해주세요</option>";
				fuelHyundai.innerHTML += "<option value='LPG'>LPG</option>";
				fuelHyundai.innerHTML += "<option value='디젤'>디젤</option>";
				fuelHyundai.innerHTML += "<option value='가솔린'>가솔린</option>";
				
			} else if(selectBrand == "기아"){
				
				const modelKia = document.getElementById('modelOption');
				
				modelKia.innerHTML = "<option value=''>차종을 선택해주세요</option>";
				modelKia.innerHTML += "<option value='K3'>K3</option>";
				modelKia.innerHTML += "<option value='카니발'>카니발</option>";
				modelKia.innerHTML += "<option value='모닝'>모닝</option>";
				modelKia.innerHTML += "<option value='스포티지'>스포티지</option>";
				
				const gradeKia = document.getElementById('gradeOption');
				
				gradeKia.innerHTML = "<option value=''>등급을 선택해주세요</option>";
				gradeKia.innerHTML += "<option value='소형'>소형</option>";
				gradeKia.innerHTML += "<option value='준중형'>준중형</option>";
				gradeKia.innerHTML += "<option value='중형'>중형</option>";
				gradeKia.innerHTML += "<option value='대형'>대형</option>";
				
				const fuelKia = document.getElementById('fuelOption');
				
				fuelKia.innerHTML = "<option value=''>연료를 선택해주세요</option>";
				fuelKia.innerHTML += "<option value='LPG'>LPG</option>";
				fuelKia.innerHTML += "<option value='디젤'>디젤</option>";
				fuelKia.innerHTML += "<option value='가솔린'>가솔린</option>";
			
			} else if(selectBrand == "제네시스"){
				
				const modelGenesis = document.getElementById('modelOption');

				modelGenesis.innerHTML = "<option value=''>차종을 선택해주세요</option>";
				modelGenesis.innerHTML += "<option value='GV80'>GV80</option>";
				
				const gradeGenesis = document.getElementById('gradeOption');
				
				gradeGenesis.innerHTML = "<option value=''>등급을 선택해주세요</option>";
				gradeGenesis.innerHTML += "<option value='대형'>대형</option>";

				const fuelGenesis = document.getElementById('fuelOption');
				
				fuelGenesis.innerHTML = "<option value=''>연료를 선택해주세요</option>";
				fuelGenesis.innerHTML += "<option value='디젤'>디젤</option>";
				fuelGenesis.innerHTML += "<option value='가솔린'>가솔린</option>";
				
			} else if(selectBrand == "르노삼성"){
				
				const modelRnoSamsung = document.getElementById('modelOption');
				
				modelRnoSamsung.innerHTML = "<option value=''>차종을 선택해주세요</option>";
				modelRnoSamsung.innerHTML += "<option value='QM3'>QM3</option>";
				
				const gradeRnoSamsung = document.getElementById('gradeOption');
				
				gradeRnoSamsung.innerHTML = "<option value=''>등급을 선택해주세요</option>";
				gradeRnoSamsung.innerHTML += "<option value='소형'>소형</option>";

				const fuelRnoSamsung = document.getElementById('fuelOption');
				
				fuelRnoSamsung.innerHTML = "<option value=''>연료를 선택해주세요</option>";
				fuelRnoSamsung.innerHTML += "<option value='디젤'>디젤</option>";
				
			} else {
				
				const modelPorsche = document.getElementById('modelOption');
				
				modelPorsche.innerHTML = "<option value=''>차종을 선택해주세요</option>";
				modelPorsche.innerHTML += "<option value='카이엔'>카이엔</option>";
				
				const gradePorsche = document.getElementById('gradeOption');

				gradePorsche.innerHTML = "<option value=''>등급을 선택해주세요</option>";
				gradePorsche.innerHTML += "<option value='대형'>대형</option>";
				
				const fuelPorsche = document.getElementById('fuelOption');
				
				fuelPorsche.innerHTML = "<option value=''>연료를 선택해주세요</option>";
				fuelPorsche.innerHTML += "<option value='가솔린'>가솔린</option>";
				
			}
			
		}
		
	</script>


            <div id="main-select" class="area-list">
            
                <% if(carList.isEmpty()) { %>
                
                	등록된 게시글이 존재하지 않습니다. <br>
                	
                <% } else {%>
					
					<% for(Car c : carList) { %>
	                <div class="car-list">
	                
	                    <div class="list-size">
	                    
	                        <img width="100%" class="car-img img-thumbnail" src="<%=contextPath%>/<%=c.getCarPhotoAddress()%>/<%=c.getChangeName()%>" alt="차량사진">
	                    
	                    </div>
	                    
                    	<div class="list-size car-info">	
                            
	                        <label><%= c.getModelName() %></label> <br>
	                        <span><%= c.getGradeName() %></span>
	                        <span><%= c.getBrandName() %></span>
	                        <span><%= c.getFuelName() %></span>
	                        <span><%= c.getYear() %></span> <br><br>

	                        	<%carPrice = c.getGradePrice() + c.getModelPrice() + c.getYearPrice(); %>

	        					<% for(Option o : optionList) { %>
	        						<% if(c.getManagementNo() == o.getManagementNo()) { %>
                               			<span class="option-list"> <%= o.getOptionName() %></span>
                               			<% optionPrice += o.getOptionPrice(); %>
                               		<% } %>
	                            <% } %> 
							<br>
							
	                        <label>시간당 가격</label> : 
	                        <span>
	                        	<%= totalPrice = carPrice + optionPrice %>
							</span> <br>
                            
                            <a class="btn btn-sm btn-primary"href="<%=contextPath%>/listDetail.do?carNo=<%=c.getManagementNo()%>&startDate=<%=startDate%>&endDate=<%=endDate%>&hours=<%=hours%>">예약버튼</a>
                            <% optionPrice = 0; %>
	                    </div>
                    </div>
	                <% } %>
                <% } %>
                
                    <div>
                    
						<ul class="pagination" >
                            <% if(currentPage > 1) { %>
                                <li class="page-item">
                                    <a class="page-link" onclick="location.href='<%=contextPath%>/selectedCarList.do?currentPage=<%= currentPage - 1 %>&hours=<%=hours%>&locations=<%=locations%>&startDate=<%=startDate%>&endDate=<%=endDate%>'"><%="<"%></a>
                                </li>
                            <% } %>

							<% for(int i = startPage; i <= endPage; i++) { %>
							
								<% if(currentPage != i) { %>
									<li
									class="page-link"
									onclick="location.href='<%=contextPath%>/selectedCarList.do?currentPage=<%=i%>&hours=<%=hours%>&locations=<%=locations%>&startDate=<%=startDate%>&endDate=<%=endDate%>'">
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
	                                <a class="page-link" onclick="location.href='<%=contextPath%>/selectedCarList.do?currentPage=<%= currentPage + 1%>&hours=<%=hours%>&locations=<%=locations%>&startDate=<%=startDate%>&endDate=<%=endDate%>'"><%=">"%></a>
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