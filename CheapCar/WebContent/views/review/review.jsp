<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기</title>
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
		margin: auto;
		padding-bottom: 30px;
	}
	.page-header{
		padding-top: 20px;
		font-size: 40px;
		font-weight: bold;
		border-bottom: 6px solid #6caddf;
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
	.search_write{
		margin-top: 10px;
		display: inline;
		text-align: center;
		margin-right: 0px;
	}
	.do-hyeon-regular {  /* 타이틀 글꼴 */ 
		font-family: "Do Hyeon", sans-serif;
		font-weight: 300px;
		font-style: normal;
		font-size: 60px;
		color: #6caddf;
	}
	#searchWord{
		border: 2px solid #6caddf;
		border-radius: 5px;
	}
	.table{
		font-size: 18px;
	}
	#review_list{
		display:flex;
		gap: 10%;
		flex-wrap: wrap;
		margin-top: 30px;
		overflow: hidden;
		list-style-type: none;
	}
	#review_list > li{
		width: 400px;
		height: 450px;
		text-decoration: none;
	}
	.img-area{
		width: 100%;
		height: 55%;
		border: 4px solid #6caddf;
		border-top-left-radius: 20px;
		border-top-right-radius: 20px;
	}
	.text-area{
		width: 100%;
		height: 35%;
		border: 4px solid #6caddf;
		border-bottom-left-radius: 20px;
		border-bottom-right-radius: 20px;
		color: whitesmoke;
		background-color: #6caddf;
		font-size: 20px;
	}
    .review_1:hover{
        cursor: pointer;
        opacity: 0.8;
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
				<h2 class="page-header do-hyeon-regular" align="left">리&nbsp;&nbsp;뷰
				</h2>
				<div class="review_content">
					<ul id="review_list">
						<li>
							<a href="" alt="">
								<div class="img-area review_1 content">1</div>
								<div class="text-area review_1 content">
									후기 1
								</div>
							</a>
						</li>
						<li>
							<a href="" alt="">
								<div class="img-area review_1">1</div>
								<div class="text-area review_1">
									후기 2
								</div>
							</a>
						</li>
						<li>
							<a href="" alt="">
								<div class="img-area review_1">1</div>
								<div class="text-area review_1">
									후기 3
								</div>
							</a>
						</li>
						<li>
							<a href="" alt="">
								<div class="img-area review_1">1</div>
								<div class="text-area review_1">
									이벤트 44
								</div>
							</a>
						</li>

						
					</ul>
				</div>

				
				


				</div>            
			 </div>
		  </div>

        <div class="search_write">
            <form>
                <input type="text" id="searchWord" name="searchWord" placeholder="검색" >
                <button type="submit" value="" id="" class="btn-info" style="background-color: #6caddf">검색</button>
                <a href="" class="btn btn-info" id="write" style="height: 32px;">글쓰기</a>
            </form>
        </div>            


		<div class="paging-area" align="center" style="margin-top:12px">
			<button class="btn btn-outline-info" style="color:#6caddf">이전</button>
			<button class="btn btn-outline-info" style="color:#6caddf">1</button>
			<button class="btn btn-outline-info" style="color:#6caddf">다음</button>
	    </div>			  
	</div>
	
	<script>
		$(function(){

			$('.content').click(function(){

				const reviewNo = $(this).children().eq(0).val(); 

				location.href = '<%= contextPath %>/detail.review?reviewNo=' + reviewNo
			})


		})
	</script>	
	
	
	
	
	   
	
		
	
</body>
</html>