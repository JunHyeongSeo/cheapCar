<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1대1 문의글 쓰기</title>

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
					<h2 class="page-header do-hyeon-regular" align="left">문의글 작성</h2>
				</div>
                
                <div class="content_outer">
                	<form action="${ path }/insert.cs" method="post" id="insert-form" enctype="multipart/form-data">
                		<input type="hidden" name="memberNo" value="${ loginUser.memberNo }">
	                    
	                    <div class="content_header">
	                        <div class="content_header2">
	                            <label class="form-title">제목 : </label>
	                            <input type="text" name="title">
	                        </div>
                  		</div>
                  		
                    	<div class="content_sub">
                        	<span class="content_sub1">작성자 : ${ loginUser.memberName }
                   		</div>
                   		
	                    <div class="content_body">
	                        <textarea name="content" class="form-control" rows="20" id="comment" style="resize: none;"></textarea>
	                    </div>
	                    
	                    <div class="content_add_img">
	                    	<span id="addInfo"><br>&lt;파일첨부&gt;</span><br><br>
                            <input type="file" name="upfile1" id="upfile">
                            <input type="file" name="upfile2" id="upfile">
                            <input type="file" name="upfile3" id="upfile">
                            <input type="file" name="upfile4" id="upfile">
					    </div>
	                    
	                    <div class="content_btn" align="center">
	                        <div align="center">
	                            <button type="submit" class="btn btn-sm btn-primary">등록하기</button>
	                            <button type="button" class="btn btn-sm btn-secondary" onclick="history.back()">뒤로가기</button>
	                            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	                        </div>
	                    </div>
					</form>
					
                </div>
			 </div>
		  </div>
	</div>
	   

	
		
	
</body>
</html>