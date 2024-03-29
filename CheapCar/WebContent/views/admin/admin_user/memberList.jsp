<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.member.model.vo.Member, java.util.ArrayList, com.kh.semi.common.model.vo.PageInfo"%>
<!DOCTYPE html>
<html>
<style>
	.container{
	   margin-top: 20px;
	}
	
	#top11{
		display: flex;
	}
	
	#middleTable{
	    width : 80%;
	    margin: auto;
	}
	
	.table{
	    margin-top: 20px;
	    text-align: center;
	}
	
	#top2{
	    float: right;
	}
	
	.form-inline{
	    display: flex;
	    align-items: center;
	    padding: 15px;
	}
	
	.pagination{
	    width: 100%;
	    margin: auto;
	}
	
	.mileage{
	    margin-top: 30px;
	}
</style>
<head>
<meta charset="UTF-8">
<title>회원현황</title>

</head>
<body>
	<%@ include file="../../common/adminMain.jsp" %>
	
    <div class="outer">
    
		<div id="top11" style="display: flex;">
			<label for="searchId" style="margin: 0px 15px;">회원 아이디 : </label>
			<input type="text" class="form-control" id="searchId" placeholder="조회하실 회원 아이디를 입력해주세요." name="searchId" style="width: 300px;">
			<button type="button" class="btn btn-primary" style="margin-left: 10px;" onclick="searchMem();">조회</button>
		</div>
		
		<div class="container">
			<h2>회원현황</h2> 
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>회원번호</th>
						<th>이름</th>
						<th>아이디</th>
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
	    			url : 'memberList.all', // 전체 리스트 가져오는 서블릿
	    			data : {currentPage : currentPage},
	    			success : function(list){
	    				let resultStr = '';
	    				
	    				for(let i in list){
	    					resultStr += '<tr>'
	        						   +'<td>' + list[i].memberNo + '</td>'
	        						   + '<td>' + list[i].memberName + '</td>'
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
			function searchMem(){
				
				//const url = new URL(location.href);
        		//const currentPage = url.searchParams.get("currentPage");
        		const currentPage = 1;
        		
				$.ajax({
					url : 'memberList.search',
					data : {
						searchId : document.getElementById('searchId').value,
						currentPage : 1
					},
					success : function(list){
						let resultStr = '';
						
						for(let i in list){
							resultStr += '<tr>'
									   + '<td>' + list[i].memberNo + '</td>'
	        						   + '<td>' + list[i].memberName + '</td>'
	        						   + '<td>' + list[i].memberId + '</td>'
	        						   + '<td><button type="button" class="btn btn-secondary" onclick="asmc();">상세보기</td>'
	        						   + '</tr>'
						}
        				document.getElementById('conBody').innerHTML = resultStr;
					}
				});
				
				
				$.ajax({
        			url : 'memberCount.search', // 페이징바 만들기 위해서 가져오는 서블릿
        			data : {
        				currentPage : 1,
        				searchId : document.getElementById('searchId').value
       				},
        			success : function(pi){
        				let resultStr = '';
        				
        				// 2페이지 이상 보고있으면 이전버튼을 만들겠다.
        				if(pi.currentPage > 1) {
        					resultStr  += '<button class="btn btn-outline-danger" onclick="cp(this);" value="'
        	       						 + (i-1)
        	       						 + '">이전</button>';
       			        }
        				
        				// 총 페이지에 대한 버튼을 만들겠다
       			        for(let i = pi.startPage; i <= pi.endPage; i++) {
       			        	// 현재페이지 말고 다른 페이지 보이는거 있을때, 그거 누르면 그 페이지로 이동할거다.
       			        	if(pi.currentPage != i){
       			        		resultStr += '<button class="btn btn-outline-danger" onclick="cp(this);" value="'
       			        					+ i
       			        					+ '">'
       			        				    + i
       			        				    + '</button>';
       			        	}
       			    	 	// 근데 현재페이지를 내가 보고있으면 버튼이 안눌리게끔 할거다.
       			        	else {
       			        		resultStr += '<button disabled class="btn btn-danger">'
       			        			        + i 
       			        			        + '</button>';
       			        	}
       			        }
       			        
        				// 맥스페이지가 안눌려있는 모든 상태라면 다음 버튼을 만들거다
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
				// 버튼 눌렀을 때 currentPage 를 바꿔서 ajax를 해당 currentPage로 이동해주는 ajax
				const currentPage = result.value;

				$.ajax({
					url : 'memberList.search',
					data : {
						searchId : document.getElementById('searchId').value,
						currentPage : currentPage
					},
					success : function(list){
						let resultStr = '';
						for(let i in list){
							resultStr += '<tr>'
									   + '<td>' + list[i].memberNo + '</td>'
	        						   + '<td>' + list[i].memberName + '</td>'
	        						   + '<td>' + list[i].memberId + '</td>'
	        						   + '<td><button type="button" class="btn btn-secondary" onclick="asmc();">상세보기</td>'
	        						   + '</tr>'
						}
        				document.getElementById('conBody').innerHTML = resultStr;
					}
				});
				
				$.ajax({
        			url : 'memberCount.search',
        			data : {
        				currentPage : currentPage,
        				searchId : document.getElementById('searchId').value
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