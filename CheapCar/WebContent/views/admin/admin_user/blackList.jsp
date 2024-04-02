<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.semi.member.model.vo.Member, java.util.ArrayList, com.kh.semi.common.model.vo.PageInfo" %>
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
	
	.paging-area{
		align : center;
		margin-top : 12px;
	} 
</style>
<head>
<meta charset="UTF-8">
<title>블랙리스토 관리</title>

</head>
<body>
	<%@ include file="../../common/adminMain.jsp" %>
	
    <div class="outer">
    	<div id="top11" style="display: flex;">
			<label for="searchId" style="margin: 0px 15px;">회원 아이디 : </label>
			<input type="text" class="form-control" id="searchId" placeholder="조회하실 회원 아이디를 입력해주세요." name="searchId" style="width: 300px;">
			<button type="button" class="btn btn-primary" style="margin-left: 10px;" onclick="searchBlack(this);">조회</button>
		</div>
		
		<div class="container">
			<h2>블랙리스트</h2> 
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
        	<table class="table table-bordered">
            	
	              <tbody id="conBody2">
	              	
	              </tbody>        
			</table>
		
		</div>
		
		<script>
		
			// 1. 실행되면 전체 리스트 나오는 ajax
	    	window.onload = function(){
				
	    		const url = new URL(location.href);
	    		const currentPage = url.searchParams.get("currentPage");
	    		
	    		$.ajax({
	    			url : 'blackList.all',
	    			data : {currentPage : currentPage},
	    			success : function(list){
	    				let resultStr = '';
	    				for(let i in list){
	        				resultStr += '<tr>'
	        						   + '<td>' + list[i].memberNo + '</td>'
	        						   + '<td>' + list[i].memberName + '</td>'
	        						   + '<td>' + list[i].memberId + '</td>'
	        						   + '<td><button type="button" class="btn btn-secondary" onclick="blackDetail(this.id);" id="' + list[i].memberId + '" name="' + list[i].memberId + '" value="' + list[i].memberId + '">상세보기</td>'
	        						   + '</tr>'
	    				}
	    				document.getElementById('conBody').innerHTML = resultStr;
	    			}
	    		});
	    		
	    		// 2. 실행되면 전체 리스트에 대한 페이징바가 나오는 ajax
	    		$.ajax({
	    			url : 'blackCount.all',
	    			data : {currentPage : currentPage},
	    			success : function(pi){
	    				let resultStr = '';
	    				if(pi.currentPage > 1) {
	    	       			resultStr += '<button class="btn btn-outline-danger" onclick="location.href='
	    	       					   + "'<%=contextPath%>/blackList?currentPage="
	    	       					   + (pi.currentPage - 1)
	    	       					   + "'"
	    	       					   + '"'
	    	       					   + '>'
	    	       					   + '이전</button>';
	   			        }
	    				
	   			        for(let i = pi.startPage; i <= pi.endPage; i++) {
	   			        	if(pi.currentPage != i){
	   			        		resultStr += '<button class="btn btn-outline-danger" onclick="location.href='
	   			        		 		   + "'<%=contextPath%>/blackList?currentPage="
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
			       					   + "'<%=contextPath%>/blackList?currentPage="
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
			function searchBlack(result){
				
				const currentPage = 1;
				
				$.ajax({
					url : 'blackList.search',
					data : {
						currentPage : 1,
						searchId : document.getElementById('searchId').value
					},
					success : function(list){
						let resultStr = '';
						for(let i in list){
							resultStr += '<tr>'
									   + '<td>' + list[i].memberNo + '</td>'
	        						   + '<td>' + list[i].memberName + '</td>'
	        						   + '<td>' + list[i].memberId + '</td>'
	        						   + '<td><button type="button" class="btn btn-secondary" onclick="blackDetail(this.id);" id="' + list[i].memberId + '" name="' + list[i].memberId + '" value="' + list[i].memberId + '">상세보기</td>'
	        						   + '</tr>'
						}
						
        				document.getElementById('conBody').innerHTML = resultStr;
        				document.getElementById('conBody2').innerHTML = '';
					}
				});
				
				$.ajax({
        			url : 'blackCount.search',
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
			}
			
			function cp(result){
				
				const currentPage = result.value;
				
				$.ajax({
					url : 'blackList.search',
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
		     						   + '<td><button type="button" class="btn btn-secondary" onclick="blackDetail(this.id);" id="' + list[i].memberId + '" name="' + list[i].memberId + '" value="' + list[i].memberId + '">상세보기</td>'
		     						   + '</tr>'
						}
						document.getElementById('conBody').innerHTML = resultStr;
					}
				});
				
				$.ajax({
					url : 'blackCount.search',
					data : {
						currentPage : currentPage,
						searchId : document.getElementById('searchId').value
					},
					success : function(pi){
						let resultStr = '';
						
						if(pi.currentPage > 1){
							resultStr  += '<button class="btn btn-outline-danger" onclick="cp(this);" value="'
			       						+ (pi.currentPage - 1)
			       						+ '">이전</button>';
						}
						
						for(let i = pi.startPage; i <= pi.endPage; i++){
							
							if(pi.currentPage != i){
								resultStr += '<button class="btn btn-outline-danger" onclick="cp(this);" value="'
				        					+ i
				        					+ '">'
				        				    + i
				        				    + '</button>';
							}
							else{
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
				
			// 4. 상세보기 버튼 누르면 #container2 에 html 추가
			
			function blackDetail(result){
				$.ajax({
					url : "blackDetail.do",
					data : {
						memberId : document.getElementById(result).value
					},
					success : function(m){
						let resultStr = '';
						console.log(m);
						resultStr += '<tr>'
								   + '<td>회원번호</td>'
								   + '<td>' + m.memberNo + '</td>'
		 						   + '</tr>'
		 						   + '<tr>'
		 						   + '<td>이름</td>'
								   + '<td>' + m.memberName + '</td>'
		 						   + '</tr>'
		 						   + '<tr>'
		 						   + '<td>제재 사유</td>'
								   + '<td>' + m.blackReason + '</td>'
								   + '</tr>'
								   + '<tr>'
								   + '<td>제재 일자</td>'
		 						   + '<td>' + m.blackDate + '</td>'
		 						   + '</tr>'
		 						   + '<tr>'
								   + '<td>블랙리스트해제</td>'
		 						   + '<td><button class="btn btn-outline-danger" type="button" onclick="deleteBlack(this)" id="' + m.memberNo + '" name="' + m.memberNo + '">해제</td>'
		 						   + '</tr>'
		 						   
					document.getElementById('conBody2').innerHTML = resultStr;
					}
				});
			}
			
			function deleteBlack(result){
				
				if(confirm('블랙리스트를 해제하시겠습니까?')){
					$.ajax({
						url : 'deleteBlack.do',
						data : {
							memberNo : result.id
						},
						success : function(result){
							if(result > 0){
								alert('블랙리스트 정보가 수정되었습니다.');
							} else{
								alert('수정에 문제가 발생하였습니다.');
							}
						}
					});
				}
				else{
					alert('수정이 취소되었습니다.')
				}
			}
       	</script>
	</div>
	
</body>
</html>