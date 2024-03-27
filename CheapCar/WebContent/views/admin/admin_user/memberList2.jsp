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
				<tbody>
					<!-- 여기다가 윈도우 온로드 memberListController -->
					
					
					
					<!-- 나온거에서 컬럼 안에 상세보기 누르면 asmc 하고 container2에 추가 -->
					
					
				</tbody>
			</table>
		</div>
		
		<div class="container2">
			
		
		</div>
		
		<div class="paging-area">
		
		</div>
		<!-- 
		<div class="container">
	   		<table class="table table-bordered">
				<tbody>
					<tr>
						<th>제목</th>
						<td>차가 이상해요</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>어쩌구저쩌구</td>
					</tr>
					<tr>
						<th>답변</th>
						<td>어저꾸저쩌구</td>
					</tr>
				</tbody>
			</table>
		</div>
		 -->
		
	</div>
		
	
</body>
</html>