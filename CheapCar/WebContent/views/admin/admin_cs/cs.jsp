<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.semi.cs.model.vo.Cs, com.kh.semi.common.model.vo.PageInfo" %>
<%
	ArrayList<Cs> list = (ArrayList<Cs>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원문의글 조회</title>
</head>
<body>
	<%@ include file="../../common/adminMain.jsp" %>
	
	<div class="outer">
        <div id="top1">
                
            <form class="form-inline" action="abc.do">
                <div id="top11" style="display: flex;">
                    <label for="carNum" style="margin: 0px 15px;">회원 아이디 : </label>
                    <input type="text" class="form-control" id="userId" placeholder="조회하실 회원 아이디를 입력해주세요." name="userId" style="width: 300px;">
                    
                    <button type="submit" class="btn btn-primary" style="margin-left: 10px;">조회</button>
                </div>
            </form>
		</div>

        <div class="container">
        	<h2>문의내역</h2>
        	<table class="table">
        		<thead>
	                <tr>
	                    <th>제목</th>
	                    <th>아이디</th>
	                    <th>내용</th>
	                    <th>답변여부</th>
	                    <th>상세보기</th>
	                </tr>
                </thead>
                <tbody>
	             	
				</tbody>
			</table>
		</div>
            
		<div class="paging-area">
	    	
		</div>
	   
		<div class="container">
	   		<table class="table table-bordered">
				<tbody>
					
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>