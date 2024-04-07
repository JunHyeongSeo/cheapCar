<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량관리</title>
<style>
	.container{
		margin-top : 15px;
	}

</style>

</head>
<body>
	<%@ include file="../../common/adminMain.jsp" %>
	
	<div class="outer">
	
		<div id="top11" style="display: flex;">
			<label for="searchCar" style="margin: 0px 15px;">차량 번호 : </label>
			<input type="text" class="form-control" id="searchCar" placeholder="조회하실 차량 번호를 입력해주세요." name="searchCar" style="width: 300px;">
			<button type="button" class="btn btn-primary" style="margin-left: 10px;" onclick="searchCarList();">조회</button>
		</div>

        <div class="container1">
            <h2>차량현황</h2> 
			<table class="table table-bordered">
            	<thead>
            		<tr>
            			<th>관리번호</th>
						<th>차량번호</th>
						<th>모델명</th>
						<th>차량종류</th>
						<th>상세보기</th>
					</tr>
				</thead>
				<tbody id="conBody">
              
				</tbody>
			</table>
		</div>
            
        <div id="paging-area">
        	
        </div>
        
        <div id="container2">  
        	<table class="table table-bordered">
				<tbody id="conBody2">
              
				</tbody>
			</table>
		</div>
		
		<script>
		
			window.onload = function(){
				
	    		const url = new URL(location.href);
	    		const currentPage = url.searchParams.get("currentPage");
	    		
				// 1. 실행되면 전체 리스트 나오는 ajax
	    		$.ajax({
	    			url : 'carList.all', // 전체 리스트 가져오는 서블릿
	    			data : {currentPage : currentPage},
	    			success : function(list){
	    				let resultStr = '';
	    				for(let i in list){
	        				resultStr += '<tr>'
	        						   + '<td>' + list[i].managementNo + '</td>'
	        						   + '<td>' + list[i].carNo + '</td>'
	        						   + '<td>' + list[i].modelName + '</td>'
	        						   + '<td>' + list[i].gradeName + '</td>'
	        						   + '<td><button type="button" class="btn btn-secondary" onclick="carDetail(this.id)" id="' + list[i].managementNo + '" value = "' + list[i].managementNo + '">상세보기</td>'
	        						   + '</tr>'
	    				}
	    				document.getElementById('conBody').innerHTML = resultStr;
	    			}
	    		});
			
				// 2. 실행되면 전체 리스트에 대한 페이징바가 나오는 ajax
	    		$.ajax({
	    			url : 'carCount.all', // 페이징바 만들기 위해서 가져오는 서블릿
	    			data : {currentPage : currentPage},
	    			success : function(pi){
	    				let resultStr = '';
	    				
	    				if(pi.currentPage > 1) {
	    	       			resultStr  += '<button class="btn btn-outline-danger" onclick="location.href='
	    	       					   + "'<%=contextPath%>/manageCar?currentPage="
	    	       					   + (pi.currentPage - 1)
	    	       					   + "'"
	    	       					   + '"'
	    	       					   + '>'
	    	       					   + '이전</button>';
	   			        }
	    				
	   			        for(let i = pi.startPage; i <= pi.endPage; i++) {
	   			        	if(pi.currentPage != i){
	   			        		resultStr += '<button class="btn btn-outline-danger" onclick="location.href='
	   			        				  + "'<%=contextPath%>/manageCar?currentPage="
	   			        				  + i
	   			        				  + "'"
	     	       					   	  + '"'
	   			        				  + '>'
	   			        				  + i
	   			        				  + '</button>';
	   			        	}
	   			        	else {
	   			        		resultStr += '<button disabled class="btn btn-danger">'
	   			        			      + i 
	   			        			      + '</button>';
	   			        	}
	   			        }
	   			        
	   			        if(pi.currentPage != pi.maxPage){
	   			        	resultStr += '<button class="btn btn-outline-danger" onclick="location.href='
			       					  + "'<%=contextPath%>/manageCar?currentPage="
			       					  + (pi.currentPage + 1)
			       					  + "'"
			       					  + '"'
			       					  + '>'
			       					  + '다음</button>';
	   			        }
	       			    document.getElementById('paging-area').innerHTML = resultStr;
	    			}
				});	
			}
			
			// 3. 조회 누르면 포함된 값 보여주는 ajax
			function searchCarList(){
				
				const currentPage = 1;
				
				$.ajax({
					url : 'carList.search',
					data : {
						searchCar : document.getElementById('searchCar').value,
						currentPage : 1
					},
					success : function(list){
						let resultStr = '';
						
						for(let i in list){
							resultStr += '<tr>'
									   + '<td>' + list[i].managementNo + '</td>'
		      						   + '<td>' + list[i].carNo + '</td>'
		      						   + '<td>' + list[i].modelName + '</td>'
		      						   + '<td>' + list[i].gradeName + '</td>'
	        						   + '<td><button type="button" class="btn btn-secondary" onclick="carDetail(this.id)" id="' + list[i].managementNo + '" value = "' + list[i].managementNo + '">상세보기</td>'
	        						   + '</tr>'
						}
        				document.getElementById('conBody').innerHTML = resultStr;
        				document.getElementById('conBody2').innerHTML = '';
					}
				});
				
				$.ajax({
        			url : 'carCount.search', // 페이징바 만들기 위해서 가져오는 서블릿
        			data : {
        				currentPage : currentPage,
        				searchCar : document.getElementById('searchCar').value
       				},
        			success : function(pi){
        				let resultStr = '';
        				
        				if(pi.currentPage > 1) {
        	       			resultStr  += '<button class="btn btn-outline-danger" onclick="cp(this);" value="'
        	       						+ (i-1)
        	       						+ '">이전</button>';
       			        }
        				
       			        for(let i = pi.startPage; i <= pi.endPage; i++) {
       			        	if(pi.currentPage != i){
       			        		resultStr += '<button class="btn btn-outline-danger" onclick="cp(this);" value="'
       			        					+ i
       			        					+ '">'
       			        				    + i
       			        				    + '</button>';
       			        	}
       			        	else {
       			        		resultStr += '<button disabled class="btn btn-danger">'
       			        			      + i 
       			        			      + '</button>';
       			        	}
       			        }
       			        
       			        if(pi.currentPage != pi.maxPage){
       			        	resultStr += '<button class="btn btn-outline-danger" onclick="cp(this);" value="'
       			        				+ (pi.currentPage + 1)
       			        				+ '">다음</button>';
       			        }
	       			    document.getElementById('paging-area').innerHTML = resultStr;
        			}
        		});
			}
			
			function cp(result){
				const currentPage = result.value;
				
				$.ajax({
					url : 'carList.search',
					data : {
						searchCar : document.getElementById('searchCar').value,
						currentPage : currentPage
					},
					success : function(list){
						console.log(list);
						let resultStr = '';
						
						for(let i in list){
							resultStr += '<tr>'
									   + '<td>' + list[i].managementNo + '</td>'
		      						   + '<td>' + list[i].carNo + '</td>'
		      						   + '<td>' + list[i].modelName + '</td>'
		      						   + '<td>' + list[i].gradeName + '</td>'
	        						   + '<td><button type="button" class="btn btn-secondary" onclick="carDetail(this.id)" id="' + list[i].managementNo + '" value = "' + list[i].managementNo + '">상세보기</td>'
	        						   + '</tr>'
						}
        				document.getElementById('conBody').innerHTML = resultStr;
					}
				});
				
				$.ajax({
        			url : 'carCount.search',
        			data : {
        				currentPage : currentPage,
        				searchCar : document.getElementById('searchCar').value
       				},
        			success : function(pi){
        				let resultStr = '';
        				
        				if(pi.currentPage > 1) {
        	       			resultStr  += '<button class="btn btn-outline-danger" onclick="cp(this);" value="'
        	       						+ (pi.currentPage - 1)
        	       						+ '">이전</button>';
       			        }
        				
       			        for(let i = pi.startPage; i <= pi.endPage; i++) {
       			        	if(pi.currentPage != i){
       			        		resultStr += '<button class="btn btn-outline-danger" onclick="cp(this);" value="'
       			        					+ i
       			        					+ '">'
       			        				    + i
       			        				    + '</button>';
       			        	}
       			        	else {
       			        		resultStr += '<button disabled class="btn btn-danger">'
       			        			      + i 
       			        			      + '</button>';
       			        	}
       			        }
       			        
       			        if(pi.currentPage != pi.maxPage){
       			        	resultStr += '<button class="btn btn-outline-danger" onclick="cp(this);" value="'
       			        				+ (pi.currentPage + 1)
       			        				+ '">다음</button>';
       			        }
	       			    document.getElementById('paging-area').innerHTML = resultStr;
        			}
        		});
			}
				
			// 4. 상세보기 버튼 누르면 추가 ajax
			
			function carDetail(result){
				
				$.ajax({
					url : "carDetail.do",
					data : {
						managementNo : document.getElementById(result).value
					},
					success : function(c){
						let resultStr = '';
						console.log(c);
						resultStr += "<tr>"
								   + "<td>차량 관리번호</td>"
								   + "<td><input type='text' disabled value='" + c.managementNo + "' name='" + c.managementNo + "'></td>"
								   + "</tr>"
								   + "<tr>"
								   + "<td>차량번호</td>"
								   + "<td><input type='text' disabled value='" + c.carNo + "' name='" + c.carNo + "'></td>"
								   + "</tr>"
								   + "<tr>"
								   + "<td>브랜드</td>"
								   + "<td><input type='text' value='" + c.brandName + "' name='" + c.brandName + "'></td>"
								   + "</tr>"
								   + "<td>모델명</td>"
								   + "<td><input type='text' value='" + c.modelName + "' name='" + c.modelName + "'></td>"
								   + "</tr>"
								   + "<tr>"
								   + "<td>연식</td>"
								   + "<td><input type='text' value='" + c.year + "' name='" + c.year + "'></td>"
								   + "</tr>"
								   + "<tr>"
								   + "<td>등급</td>"
								   + "<td><input type='text' value='" + c.gradeName + "' name='" + c.gradeName + "'></td>"
								   + "</tr>"
								   + "<tr>"
								   + "<td>차량 위치</td>"
								   + "<td><input type='text' value='" + c.locationName + "' name='" + c.locationName + "'></td>"
								   + "</tr>"
								   + "<tr>"
								   + "<td>차량 상태</td>"
								   + "<td><input type='text' value='" + c.status + "' name='" + c.status + "'></td>"
								   + "</tr>"
								   
						document.getElementById('conBody2').innerHTML = resultStr;
					}
				});
			}	
		
		</script>
	</div>
	
	
</body>
</html>