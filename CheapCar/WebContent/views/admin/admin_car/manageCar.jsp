<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.semi.car.model.vo.Car, com.kh.semi.common.model.vo.PageInfo" %>
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
        <div id="top1">
                
            <form class="form-inline" action="abc.do">
                <div id="top11" style="display: flex;">
                    <label for="searchCarNo" style="margin: 0px 15px;">차량 번호 : </label>
                    <input type="text" class="form-control" id="searchCarNo" placeholder="조회하실 차량 번호를 입력해주세요." name="searchCarNo" style="width: 300px;">
                    
                    <button type="button" class="btn btn-primary" style="margin-left: 10px;" onclick="a();">조회</button>
                    <a class="btn btn-info" href="<%=contextPath %>/insertCar">차량등록</a>
                </div>
            </form>
		</div>

        <div class="container1">
        
            <h2>차량현황</h2> 
            <table class="table table-bordered">
              <thead>
                <tr>
                    <th>번호</th>
                    <th>차종</th>
                    <th>차량번호</th>
                    <th>예약상태</th>
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
	    				console.log(list);
	    				for(let i in list){
	        				resultStr += '<tr>'
	        						   + '<td>' + list[i].managementNo + '</td>'
	        						   + '<td>' + list[i].memberName + '</td>'
	        						   + '<td>' + list[i].memberId + '</td>'
	        						   + '<td>' + list[i].memberId + '</td>'
	        						   + '<td>' + list[i].memberId + '</td>'
	        						   + '<td><button type="button" class="btn btn-secondary" onclick="asmc();">상세보기</td>'
	        						   + '</tr>'
	    				}
	    				document.getElementById('conBody').innerHTML = resultStr;
	    			}
	    		});
			
				// 2. 실행되면 전체 리스트에 대한 페이징바가 나오는 ajax
	    		$.ajax({
	    			url : 'memberCount.all', // 페이징바 만들기 위해서 가져오는 서블릿
	    			data : {currentPage : currentPage},
	    			success : function(pi){
	    				let resultStr = '';
	    				
	    				if(pi.currentPage > 1) {
	    	       			resultStr  += '<button class="btn btn-outline-danger" onclick="location.href='
	    	       					   + "'<%=contextPath%>/memberList?currentPage="
	    	       					   + (pi.currentPage - 1)
	    	       					   + "'"
	    	       					   + '"'
	    	       					   + '>'
	    	       					   + '이전</button>';
	   			        }
	    				
	   			        for(let i = pi.startPage; i <= pi.endPage; i++) {
	   			        	if(pi.currentPage != i){
	   			        		resultStr += '<button class="btn btn-outline-danger" onclick="location.href='
	   			        				  + "'<%=contextPath%>/memberList?currentPage="
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
			       					  + "'<%=contextPath%>/memberList?currentPage="
			       					  + pi.currentPage + 1
			       					  + "'"
			       					  + '"'
			       					  + '>'
			       					  + '다음</button>';
	   			        }
	       			    document.getElementById('paging-area').innerHTML = resultStr;
	    			}
				});	
			}
		
		</script>
		
		
		
	</div>
	
	
</body>
</html>