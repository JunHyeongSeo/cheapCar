<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">



<style>
	.outer{
		width: 1200px;
		height: auto;
		border: 2px solid #188fbf;
		margin: auto;
		padding-bottom: 30px;
	}
	.page-header{
		padding-top: 60px;
		font-size: 40px;
		font-weight: bold;

	}
	#title{
		background-color: aquamarine;
		font-size: large;
		font-weight: bolder;
	}
	#write{
		text-align: right;
		padding-right: 0%;
		margin-bottom: 2px;
	}
	.search-area{
		text-align: center;
		margin-top: 10px;
	}
	.do-hyeon-regular {
		font-family: "Do Hyeon", sans-serif;
		font-weight: 500px;
		font-style: normal;
		font-size: 80px;
		color: #6caddf;
	}
	#searchWord{
		border: 2px solid #6caddf;
		border-radius: 5px;
	}
	.table{
		font-size: 18px;
	}

</style>
</head>
<body>

	<%@ include file="../common/menuBar.jsp" %>
	
	<div class="outer" >
		<div class="row">
		  <div class="col-lg-1">
		  </div>
			 <div class="col-lg-10">
				<div class="panel-body">
				<h2 class="page-header do-hyeon-regular" align="center">이&nbsp;벤&nbsp;트
				</h2>

				<div id="write">
					<a href="" class="btn btn-info">글쓰기</a>
				</div>  


				   <table class="table table-bordered table-hover" style="margin:40px;">
				   
					  <tr style="background-color: #6caddf; margin-top: 0; height: 40px; color: white; opacity: 0.8">
						 <th style="width: 8%; text-align:center">번호</th>
						 <th style="width: 45%; text-align:center">제&nbsp;&nbsp;&nbsp;&nbsp;목</th>
						 <th style="width: 10%; text-align:center">작성자</th>
						 <th style="width: 15%; text-align:center">작성일</th>
						 <th style="width: 8%; text-align:center">조회수</th>
					  </tr>
					  <tr >
						<th style="text-align:center">1</th>
						<th>제목 1</th>
						<th style="text-align:center">관리자</th>
						<th style="text-align:center">2024-03-19</th>
						<th style="text-align:center">1</th>
					 </tr>
					 <tr >
						<th style="text-align:center">2</th>
						<th>제목 2</th>
						<th style="text-align:center">관리자</th>
						<th style="text-align:center">2024-03-19</th>
						<th style="text-align:center">5</th>
					 </tr>
					  
					  
				   </table>               
				</div>            
			 </div>
		  </div>

		<div class="paging-area" align="center" style="margin-top:12px">
			<button class="btn btn-outline-info" style="color:#6caddf">이전</button>
			<button class="btn btn-outline-info" style="color:#6caddf">1</button>
			<button class="btn btn-outline-info" style="color:#6caddf">다음</button>
		   
	    </div>			  
		
		<div class="search-area">
			<form>
				<input type="text" id="searchWord" name="searchWord" placeholder="검색" >
				<button type="submit" value="" id="" class="btn-info" style="background-color: #6caddf">검색</button>
			</form>
		</div>
		

		  
		

		  
		
	   
	   
	</div>
	   
	
		
	
</body>
</html>