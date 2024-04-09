<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.cs.model.vo.Cs"%>
<%@ page import="java.util.ArrayList, com.kh.semi.common.model.vo.BoardAttachment" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>

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
				<h2 class="page-header do-hyeon-regular" align="left">${ cs.csTitle }</h2>
				</div>
                <div class="content_outer">
                    <div class="content_header">
                        <div class="content_header2">${ cs.csTitle }</div>
                    </div>
                    <div class="content_sub">
                        <span class="content_sub1">작성일 : ${ cs.createDate }</span> &nbsp;/&nbsp;
                        <span class="content_sub1">작성자 : ${ cs.memberName }</span> &nbsp;/&nbsp;
                    </div>
                    <div class="content_body">${ cs.csContent }</div>
                    
                    <div class="form-group">
                    	<label>첨부파일</label>
                    	
                    	<c:choose>
                    		<c:when test="${ empty list }">
                    			<c:forEach var="i" items="${ list }">
                    				&nbsp;&nbsp;<span>첨부파일이 존재하지 않습니다.</span>
                    			</c:forEach>
                    		</c:when>
                    		<c:otherwise>
                    			<br><a download="${ ba.originName }" href="${ path }/${ ba.filePath }/${ ba.changeName }">${ ba.originName }</a> <br>
                    		</c:otherwise>
                    	</c:choose>
                    	
                    </div>
                    
                    <div class="content_btn" align="center">
                        <a href="${ path }/list.cs?currentPage=1" class="btn btn-sm btn-info">목&nbsp;록</a>
                    	
                    	<c:if test="${ loginUser ne null and loginUser.memberNo eq cs.memberNo }">
                    		<a href="${ path }/updateForm.cs?csNo=${ cs.csNo }" class="btn btn-sm btn-secondary">수&nbsp;정</a>
                    	</c:if>
                    	
                    	<c:if test="${ loginUser ne null and ((loginUser.memberNo eq cs.memberNo) or (loginUser.memberStatus eq 'A')) }">
                            <a href="${ path }/delete.cs?csNo=${ cs.csNo }" class="btn btn-sm btn-danger">삭&nbsp;제</a>
                    	</c:if>
                    	
                    </div>
                </div>
			 </div>
		  </div>
	</div>
	
</body>
</body>
</html>