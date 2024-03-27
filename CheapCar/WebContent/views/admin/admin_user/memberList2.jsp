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
    
    	<div id="top1">
    		<form class="searchMem" action="">
    			<div id="top11" style="display: flex;">
    				<label for="userId" style="margin: 0px 15px;">회원 아이디 : </label>
                    <input type="text" class="form-control" id="userId" placeholder="조회하실 회원 아이디를 입력해주세요." name="userId" style="width: 300px;">
                    <button type="button" class="btn btn-primary" style="margin-left: 10px;" onclick="asmcs();" >조회</button>
                </div>
            </form>
        </div>
		
		<div class="container1">
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
					<!-- 여기다가 윈도우 온로드 memberListController -->
					
					<!-- 나온거에서 컬럼 안에 상세보기 누르면 asmc 하고 container2에 추가 -->
				</tbody>
			</table>
		</div>
		
		<div id="paging-area">
		
		</div>
		
		<div class="container2">
			
		
		</div>
		
		<script>
		
			// 1. 실행되면 전체 리스트 나오는 ajax
        	window.onload = function(){
				
        		const url = new URL(location.href);
        		const currentPage = url.searchParams.get("currentPage");
        		
        		$.ajax({
        			url : 'memberList.do', // 전체 리스트 가져오는 서블릿
        			data : {num : currentPage},
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
        		
        		// 2. 실행되면 전체 리스트에 대한 페이징바가 나오는 ajax
        		$.ajax({
        			url : 'memberCount.do', // 페이징바 만들기 위해서 가져오는 서블릿
        			data : {num : currentPage},
        			success : function(pi){
        				let resultStr1 = '';
        				
        				if(pi.currentPage > 1) {
        	       			resultStr1  += '<button class="btn btn-outline-danger" onclick="location.href='
        	       					   + "'<%=contextPath%>/memberList?currentPage="
        	       					   + (pi.currentPage - 1)
        	       					   + "'"
        	       					   + '"'
        	       					   + '>'
        	       					   + '이전</button>';
       			        }
        				
       			        for(let i = pi.startPage; i <= pi.endPage; i++) {
       			        	if(pi.currentPage != i){
       			        		resultStr1 += '<button class="btn btn-outline-danger" onclick="location.href='
       			        				  + "'<%=contextPath%>/memberList?currentPage="
       			        				  + i
       			        				  + "'"
         	       					   	  + '"'
       			        				  + '>'
       			        				  + i
       			        				  + '</button>';
       			        	}
       			        	else {
       			        		resultStr1 += '<button disabled class="btn btn-danger">'
       			        			      + i 
       			        			      + '</button>';
       			        	}
       			        }
       			        
       			        if(pi.currentPage != pi.maxPage){
       			        	resultStr1 += '<button class="btn btn-outline-danger" onclick="location.href='
			       					  + "'<%=contextPath%>/memberList?currentPage="
			       					  + pi.currentPage + 1
			       					  + "'"
			       					  + '"'
			       					  + '>'
			       					  + '다음</button>';
       			        }
	       			    document.getElementById('paging-area').innerHTML = resultStr1;
        			}
        		});	
        	}
        	</script>
		
		
		
		
	</div>
		
	
</body>
</html>