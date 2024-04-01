<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.semi.cs.model.vo.Cs, com.kh.semi.common.model.vo.PageInfo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원문의글 조회</title>
</head>
<body>
	<%@ include file="../../common/adminMain.jsp" %>
	
	<div class="outer">
        <div id="top11" style="display: flex;">
            <label for="searchId" style="margin:0px 15px;">회원 아이디 : </label>
            <input type="text" id="searchId" class="form-control" placeholder="조회하실 아이디를 입력해주세요" name="searchId" style="width:300px;">
            <button class="btn btn-primary" style="margin-left: 10px" onclick="searchCs();">조회</button>
        </div>

        <div class="container">
            <h2>회원 문의글 조회</h2>
            <table class="table table-bordered">
	            <thead>
	                <tr>
	                    <th>문의번호</th>
	                    <th>문의제목</th>
	                    <th>작성자</th>
	                    <th>작성유무</th>
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
			<table class="table table-bordered">
	            <thead>
	                <tr>
	                    <th>문의번호</th>
	                    <th>문의제목</th>
	                    <th>작성자</th>
	                    <th>작성유무</th>
	                    <th>상세보기</th>
	                </tr>
	            </thead>
	            <tbody id="conBody">
	
	            </tbody>
            </table>
		
		</div>
		
		<script>
			window.onload = function(){
				
				const url = new URL(location.href);
				const currentPage = url.searchParams.get("currentPage");
				
				// 1. 실행되면 전체 리스트 나오는 ajax
				$.ajax({
					url : 'csList.all',
					data : {
						currentPage : currentPage
					},
					success : function(list){
						let resultStr = '';

	    				console.log(list);
						for(let i in list){
							resultStr += '<tr>'
									   + '<td>' + list[i].csNo + '</td>'
									   + '<td>' + list[i].csTitle + '</td>'
									   + '<td>' + list[i].memberName + '</td>'
									   + '<td>' + list[i].replyYn + '</td>'
									   + '<td><button type="button" class="btn btn-secondary" onclick="asmc();">상세보기</td>'
									   + '</tr>'
						}
						document.getElementById('conBody').innerHTML = resultStr;
					}
				});
				
				// 2. 실행되면 전체 리스트에 대한 페이징바가 나오는 ajax
				$.ajax({
					url : 'csCount.all',
					data : {
						currentPage : currentPage
					},
					success : function(pi){
						let resultStr = '';
						
						if(pi.currentPage > 1) {
	    	       			resultStr  += '<button class="btn btn-outline-danger" onclick="location.href='
	    	       					   + "'<%=contextPath%>/cs?currentPage="
	    	       					   + (pi.currentPage - 1)
	    	       					   + "'"
	    	       					   + '"'
	    	       					   + '>'
	    	       					   + '이전</button>';
	   			        }
	    				
	   			        for(let i = pi.startPage; i <= pi.endPage; i++) {
	   			        	if(pi.currentPage != i){
	   			        		resultStr += '<button class="btn btn-outline-danger" onclick="location.href='
	   			        				  + "'<%=contextPath%>/cs?currentPage="
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
			       					  + "'<%=contextPath%>/cs?currentPage="
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
			function searchCs(result){
				
				const current = 1;
				
				$.ajax({
					url : 'csList.search',
					data : {
						searchId : document.getElementById('searchId').value,
						currentPage : 1		
					},
					success : function(list){
						let resultStr = '';
						for(let i in list){
							resultStr += '<tr>'
									   + '<td>' + list[i].csNo + '</td>'
									   + '<td>' + list[i].csTitle + '</td>'
									   + '<td>' + list[i].memberName + '</td>'
									   + '<td>' + list[i].replyYn + '</td>'
									   + '<td><button type="button" class="btn btn-secondary" onclick="asmc();">상세보기</td>'
									   + '</tr>'
						}
						document.getElementById('conBody').innerHTML = resultStr;
					}
				});
				
				$.ajax({
					url : 'csCount.search',
					data : {
						currentPage : 1,
						searchId : document.getElementById('searchId').value
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
				
				function cp(result){
					
					const currentPage = result.value;
					
					$.ajax({
						url : 'csList.search',
						data : {
							searchId : document.getElementById('searchId').value,
							currentPage : currentPage
						},
						success : function(list){
							let resultStr = '';
							for(let i in list){
								resultStr += '<tr>'
										   + '<td>' + list[i].csNo + '</td>'
										   + '<td>' + list[i].csTitle + '</td>'
										   + '<td>' + list[i].memberName + '</td>'
										   + '<td>' + list[i].replyYn + '</td>'
										   + '<td><button type="button" class="btn btn-secondary" onclick="asmc();">상세보기</td>'
										   + '</tr>'
							}
	        				document.getElementById('conBody').innerHTML = resultStr;
						}
					});
					
					$.ajax({
	        			url : 'csCount.search',
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
			}
		</script>
		
		
		


    </div>

</body>
</html>