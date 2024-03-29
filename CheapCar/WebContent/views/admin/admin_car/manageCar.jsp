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
			<a class="btn btn-info" href="<%=contextPath %>/insertCar">차량등록</a>
		</div>

        <div class="container1">
            <h2>차량현황</h2> 
			<table class="table table-bordered">
            	<thead>
            		<tr>
            			<th>관리번호</th>
						<th>차종</th>
						<th>차량번호</th>
						<th>모델명</th>
						<th>상세보기</th>
					</tr>
				</thead>
				<tbody id="conBody">
              
				</tbody>
			</table>
		</div>
            
        <div id="paging-area">
        	
        </div>
        
        <div class="container2">  
        	
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
	        						   + '<td>' + list[i].carNo + '</td>'
	        						   + '<td>' + list[i].carNo + '</td>'
	        						   + '<td>' + list[i].carNo + '</td>'
	        						   + '<td>' + list[i].carNo + '</td>'
	        						   + '<td><button type="button" class="btn btn-secondary" onclick="">상세보기</td>'
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
									   + '<td>' + list[i].carNo + '</td>'
	        						   + '<td>' + list[i].carNo + '</td>'
	        						   + '<td>' + list[i].carNo + '</td>'
	        						   + '<td>' + list[i].carNo + '</td>'
	        						   + '<td><button type="button" class="btn btn-secondary" onclick="">상세보기</td>'
	        						   + '</tr>'
						}
        				document.getElementById('conBody').innerHTML = resultStr;
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
						let resultStr = '';
						
						for(let i in list){
							resultStr += '<tr>'
									   + '<td>' + list[i].carNo + '</td>'
	        						   + '<td>' + list[i].carNo + '</td>'
	        						   + '<td>' + list[i].carNo + '</td>'
	        						   + '<td>' + list[i].carNo + '</td>'
	        						   + '<td><button type="button" class="btn btn-secondary" onclick="asmc();">상세보기</td>'
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
		</script>
	</div>
	
	
</body>
</html>