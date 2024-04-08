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
	//PageInfo pi = (PageInfo)request.getAttribute("pageInfo");
	int hours = (int)request.getAttribute("hours");
	String locations = (String)request.getAttribute("locations");
	String startDate = (String)request.getAttribute("startDate");
	String endDate = (String)request.getAttribute("endDate");
%>

<%
	/*
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	*/
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
    
    .form-control{
    	text-align : center;
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
                        <label>차종</label>
                        <select onchange="chooseModel(this)" name="model" class="form-control">
	                        <option value='-'>차종을 선택해주세요</option>
							<option value='K3'>K3</option>
							<option value='모닝'>모닝</option>
							<option value='QM3'>QM3</option>
							<option value='카이엔'>카이엔</option>
							<option value='아반떼'>아반떼</option>
							<option value='소나타'>소나타</option>
							<option value='카니발'>카니발</option>
							<option value='GV80'>GV80</option>
							<option value='스타렉스'>스타렉스</option>
							<option value='스포티지'>스포티지</option>
							<option value='아이오닉5'>아이오닉5</option>
                        </select>
                    </div>  
                    
                    <div class="detail-option">
                        <label>차량 등급 </label>
                        <select id="gradeOption" name="grade" class="form-control">
                        	<option value="">등급을 선택해주세요</option>
                        </select>
                    </div>

                    <div class="detail-option">
                        <label>사용 연료 </label>
                        <select id="fuelOption" name="fuel" class="form-control" >
                            <option value="">연료를 선택해주세요</option>
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
	
			function chooseModel(model){
						
				const selectModel = $(model).val();
				
				console.log(selectModel);
				
				if(selectModel == "K3"){
	
					const gradeK3 = document.getElementById('gradeOption');
					
					gradeK3.innerHTML = "<option value='준중형'>준중형</option>";
					
					const fuelK3 = document.getElementById('fuelOption');
	
					fuelK3.innerHTML = "<option value='가솔린'>가솔린</option>";
					
				} else if(selectModel == "모닝"){
					
					const gradeMorning = document.getElementById('gradeOption');
					
					gradeMorning.innerHTML = "<option value='소형'>소형</option>";
					
					const fuelMorning = document.getElementById('fuelOption');
	
					fuelMorning.innerHTML = "<option value='가솔린'>가솔린</option>";
				
				} else if(selectModel == "QM3"){
					
					const gradeQM3 = document.getElementById('gradeOption');
					
					gradeQM3.innerHTML = "<option value='소형'>소형</option>";
	
					const fuelQM3 = document.getElementById('fuelOption');
					
					fuelQM3.innerHTML = "<option value='디젤'>디젤</option>";
					
				} else if(selectModel == "카이엔"){
					
					const gradeCayenne = document.getElementById('gradeOption');
					
					gradeCayenne.innerHTML = "<option value='대형'>대형</option>";
	
					const fuelCayenne = document.getElementById('fuelOption');
					
					fuelCayenne.innerHTML = "<option value='디젤'>가솔린</option>";
					
				} else if(selectModel == "아반떼"){
					
					const gradeAvante = document.getElementById('gradeOption');
	
					gradeAvante.innerHTML = "<option value='준중형'>준중형</option>";
					
					const fuelAvante = document.getElementById('fuelOption');
					
					fuelAvante.innerHTML = "<option value='LPG'>LPG</option>";
					fuelAvante.innerHTML += "<option value='가솔린'>가솔린</option>";
					
				} else if(selectModel == "소나타"){
					
					const gradeSonata = document.getElementById('gradeOption');
	
					gradeSonata.innerHTML = "<option value='중형'>중형</option>";
					
					const fuelSonata = document.getElementById('fuelOption');
					
					fuelSonata.innerHTML = "<option value='LPG'>LPG</option>";
					fuelSonata.innerHTML += "<option value='가솔린'>가솔린</option>";
					
				} else if(selectModel == "카니발"){
					
					const gradeCarnival = document.getElementById('gradeOption');
	
					gradeCarnival.innerHTML = "<option value='대형'>대형</option>";
					
					const fuelCarnival = document.getElementById('fuelOption');
					
					fuelCarnival.innerHTML = "<option value='가솔린'>가솔린</option>";
					fuelCarnival.innerHTML += "<option value='디젤'>디젤</option>";
					
				} else if(selectModel == "GV80"){
					
					const gradeGV80 = document.getElementById('gradeOption');
	
					gradeGV80.innerHTML = "<option value='중형'>중형</option>";
					
					const fuelGV80 = document.getElementById('fuelOption');
					
					fuelGV80.innerHTML = "<option value='가솔린'>가솔린</option>";
					fuelGV80.innerHTML += "<option value='디젤'>디젤</option>";
					
				} else if(selectModel == "스타렉스"){
					
					const gradeStarrex = document.getElementById('gradeOption');
	
					gradeStarrex.innerHTML = "<option value='대형'>대형</option>";
					
					const fuelStarrex = document.getElementById('fuelOption');
					
					fuelStarrex.innerHTML = "<option value='디젤'>디젤</option>";
					fuelStarrex.innerHTML += "<option value='LPG'>LPG</option>";
					
				} else if(selectModel == "스포티지"){
					
					const gradeSportege = document.getElementById('gradeOption');
	
					gradeSportege.innerHTML = "<option value='준중형'>준중형</option>";
					
					const fuelSportege = document.getElementById('fuelOption');
					
					fuelSportege.innerHTML = "<option value='디젤'>디젤</option>";
					fuelSportege.innerHTML += "<option value='가솔린'>가솔린</option>";
					fuelSportege.innerHTML += "<option value='LPG'>LPG</option>";
					
				} else if(selectModel == "아이오닉5"){
					
					const gradeIonic5 = document.getElementById('gradeOption');
	
					gradeIonic5.innerHTML = "<option value='준중형'>준중형</option>";
					
					const fuelIonic5 = document.getElementById('fuelOption');
					
					fuelIonic5.innerHTML = "<option value='전기'>전기</option>";
					
				} else {
					
					const gradeNone = document.getElementById('gradeOption');
	
					gradeNone.innerHTML = "<option value='-'>등급을 선택해주세요</option>";
					
					const fuelNone = document.getElementById('fuelOption');
					
					fuelNone.innerHTML = "<option value='-'>연료를 선택해주세요</option>";
					
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
              
            </div>
            
            <br clear="both">
        </div>
    </div>

</body>
</html>