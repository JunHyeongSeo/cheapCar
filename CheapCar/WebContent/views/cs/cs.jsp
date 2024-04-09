<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="java.util.ArrayList, com.kh.semi.cs.model.vo.Cs, com.kh.semi.common.model.vo.PageInfo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1대1 문의</title>

<link rel="stylesheet" href="resources/css/adminStyle.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">

</head>
<body>

	<jsp:include page="../common/menuBar.jsp"></jsp:include>
	
	<div class="outer" >
		<div class="row">
			<div class="col-lg-1">
		 	</div>
		 	
			<div class="col-lg-10">
				<div class="panel-body">
					<h2 class="page-header do-hyeon-regular" align="left">1대1 문의</h2>
					
					<c:if test="${ loginUser ne null and (loginUser.memberStatus eq 'A') }">
						<div id="write">
							<a href="${ path }/insertForm.cs" class="btn btn-info">글쓰기</a>
						</div> 
					</c:if>
					
				    <table class="table table-bordered table-hover" style="margin-top:30px; border-radius: 5px;">
				    	<tr style="background-color: #6caddf; margin-top: 0; height: 40px; color: white; opacity: 0.8">
				    		<th style="width: 8%; text-align:center">번호</th>
						 	<th style="width: 45%; text-align:center">제&nbsp;&nbsp;&nbsp;&nbsp;목</th>
						 	<th style="width: 10%; text-align:center">작성자</th>
						 	<th style="width: 10%; text-align:center">답변여부</th>
						 	<th style="width: 15%; text-align:center">작성일</th>
					  	</tr>
					  	
					  	<c:choose>
					  		<c:when test="${ empty list }">
					  			<tr>
						  			<th colspan="5"> 문의글이 존재하지 않습니다.</th>
					  			</tr>
					  		</c:when>
					  		<c:otherwise>
					  			<c:forEach var="i" items="${ list }">
					  				<tr class="cs_list">
										<th style="text-align:center">${ i.csNo }</th>
										<th>${ i.csTitle }</th>
										<th style="text-align:center">${ i.memberName }</th>
										<th style="text-align:center">${ i.replyYn }</th>
										<th style="text-align:center">${ i.createDate }</th>
									</tr>
					  			</c:forEach>
					  		</c:otherwise>
					  	</c:choose>
					  	
					  	
					  	
					  	
					  	
					</table>               
				</div>            
			</div>
		</div>
		
		<div class="paging-area" align="center" style="margin-top:12px">
			
			<c:if test="${ pi.currentPage > 1}">
				<button class="btn btn-outline-info" style="color:#6caddf" onclick="location.href='${ path }/list.cs?currentPage=${ (pi.currentPage - 1) }'">이전</button>
			</c:if>
			
			<c:forEach var="i" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:choose>
					<c:when test="${ pi.currentPage ne i }">
						<button class="btn btn-outline-info" style="color:#6caddf" onclick="location.href='${ path }/list.cs?currentPage=${ i }'">${ i }</button>
					</c:when>
					<c:otherwise>
						<button disabled class="btn btn-outline-info" style="color:#6caddf;">${ i }</button>
					</c:otherwise>
				</c:choose>	
			</c:forEach>
			
			<c:if test="${ pi.currentPage ne pi.maxPage and pi.currentPage lt pi.maxPage }">
				<button class="btn btn-outline-info" style="color:#6caddf" onclick="location.href='${ path }/list.cs?currentPage=${ pi.currentPage  + 1 }'">다음</button>
			</c:if>
			
	    </div>	
		
	</div>
	
	<script>
		$('.cs_list').click(function(){
			const csNo = $(this).children().eq(0).text();
			location.href = '${ path }/detail.cs?csNo=' + csNo;
		})
	</script>
		
	
</body>
</html>