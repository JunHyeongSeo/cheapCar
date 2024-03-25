<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <th>제목</th>
                    <th>답변여부</th>
                    <th>상세보기</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                    <td>1</td>
                    <td>user01</td>
                    <td>차가 이상해요</td>
                    <td>N</td>
                    <td><a type="submit" class="btn btn-secondary" href="#">상세보기</a></td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>user02</td>
                    <td>차가 이상해요2</td>
                    <td>Y</td>
                    <td>-</td>
                </tr>
              </tbody>
            </table>
          </div>
            
        <div id="abcd">
            <ul class="pagination">
                <li class="page-item"><a class="page-link" href="#"><</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">></a></li>
            </ul>
        </div>
        
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
	</div>

</body>
</html>