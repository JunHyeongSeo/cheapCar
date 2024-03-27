<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.semi.common.model.vo.PageInfo, java.util.ArrayList, com.kh.semi.car.model.vo.Car" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Car> carlist = (ArrayList<Car>)request.getAttribute("carlist");
	
	//System.out.println(carlist);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출관리</title>
<style>
	.sales
	.salesList>a{
		text-align : center;
		margin : auto;
	}
</style>
</head>
<body>
	<%@ include file="../../common/adminMain.jsp" %>
	
	<div class="outer" style="padding-bottom:50px; height:auto;">
		<div class="container">
			<div id="top1">
	                
	                
	            <!--  -->
	            <form class="form-inline" action="abc.do">
	                <div id="top11" style="display: flex;">
	                    <label for="carNum" style="margin: 0px 15px;">차 모델 검색 : </label>
	                    <input type="text" class="form-control" id="userId" placeholder="조회하실 차량의 모델명을 입력해주세요." name="userId" style="width: 300px;">
	                    
	                    <button type="submit" class="btn btn-primary" style="margin-left: 10px;">조회</button>
	                </div>
	            </form>
	            
	            
	            <form class="form-inline" action="abc.do">
	                <div id="top11" style="display: flex;">
	                    <label for="carNum" style="margin: 0px 15px;">기간 검색 : </label>
	                    <input type="text" class="form-control" id="userId" placeholder="조회하실 기간을 입력해주세요." name="userId" style="width: 300px;">
	                    
	                    <button type="submit" class="btn btn-primary" style="margin-left: 10px;">조회</button>
	                </div>
	            </form>
	            
	            <form class="form-inline" action="abc.do">
	                <div id="top11" style="display: flex;">
	                    <label for="carNum" style="margin: 0px 15px;">지점 검색 : </label>
	                    <!-- 얘는 뭔가 그 지점검색 누르면 아래에 모든 지점 뜨게끔 하고 그걸 누르면 아래에 지점별 목록 뜨게끔 하고 싶음 -->
	                    <input type="text" class="form-control" id="userId" placeholder="조회하실 기간을 입력해주세요." name="userId" style="width: 300px;">
	                    
	                    <button type="submit" class="btn btn-primary" style="margin-left: 10px;">조회</button>
	                </div>
	            </form>
	            
	            
	            
			</div>
			
			<h2 style="margin:20px 0px;" align="center">이번 달 매출내역</h2>   
			
			<div class="salesList" style="margin-bottom:20px;" align="right">		
				<a type="submit" class="btn btn-outline-info" href="#">모델별 매출 내역</a>
				<a type="submit" class="btn btn-outline-primary" href="#">기간별 매출 내역</a>
				<a type="submit" class="btn btn-outline-warning" href="#">지점별 매출 내역</a>
			</div>
			
			
			<table class="table" style="text-align:center">
				<thead>
					<tr>
						<th>예약번호</th>
						<th>회원아이디</th>
						<th>결재금액</th>
						<th>상세보기</th>
					</tr>
				</thead>
				<tbody>
				<% for(int i = 0; i < carlist.size() ; i++){ %>
					<tr>
						<td id="carreserNo<%=i%>"><%= carlist.get(i).getReservationNo()  %></td>
						<td><%= carlist.get(i).getMemberId()  %></td>
						<td>123</td>
						<td id="car<%=i%>"><button onclick="btn1(this);" type="button" class="btn btn-secondary btn1" data-toggle="modal" data-target="#reserdetail">상세보기</button></td>
					</tr>
					<% } %>
				</tbody>
			</table>
			
			
			<div id="reservationdetail2"></div>
			
			<script>

				function btn1(e){
					
					let selectResult = '';
					//console.log($(e).parent().siblings().first().text());
					// console.log(e.target);
					
					$.ajax({
						url : 'sales2',
						data: {
							 checkReservationNo :  $(e).parent().siblings().first().text()
							
						},
						success : function(result){
							
							console.log(result);
						}
					});
				}
			</script>
			<!-- 
			let resultStr = '';
							for(let i = 0; i < result.length; i++){
								
								const aa = $('#car' + i);
								console.log(aa);
								
								
							
								
								resultStr += '<tr>'
									  + '<td>' +'아이디 : '+ result[i].memberId + '</td>'
									  + '<td>' +'이름 : '+ result[i].memberName + '</td>'
									  + '<td>' +'모델명 :'+ result[i].modelName + '</td>'
									  + '<td>' +'대여날짜 : '+ result[i].startDate + '</td>'
									  + '<td>' +'반납날짜 : '+ result[i].endDate + '</td>'
									  
									  + '</tr>'
								
							};
							
							$('#reservationdetail').html(resultStr);
						
							
						}
			 -->






			
			
			
			
			<!-- <table class="table" style="text-align:center">
				<thead>
					<tr>
						<th>기간</th>
						<th>예약건수</th>
						<th>예약금액</th>
						<th>상세보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td><a type="submit" class="btn btn-secondary" href="#">상세보기</a></td>
					</tr>
				</tbody>
			</table>
			
			
			<table class="table" style="text-align:center">
				<thead>
					<tr>
						<th>지점</th>
						<th>예약건수</th>
						<th>예약금액</th>
						<th>상세보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td><a type="submit" class="btn btn-secondary" href="#">상세보기</a></td>
					</tr>
				</tbody>
			</table> -->
		</div>
			
			
			
			

			
			
			
			
			
			
		

		<div class="container" style="text-align:center; line-height:64px;">
			<h3 style="margin: 30px 0px;">상세내역</h3>
			<table class="table table-bordered">
			
			<thead>
			</thead>
			
				<tbody>
					<tr>
						<th>모델명</th>
						<th>연식</th>
						<td><button type="submit" class="btn btn-secondary">수정</button></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>user01</td>
						<td><button type="submit" class="btn btn-secondary">수정</button></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>1996-03-01</td>
						<td><button type="submit" class="btn btn-secondary">수정</button></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>010-1234-5678</td>
						<td><button type="submit" class="btn btn-secondary">수정</button></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>123@naver.com</td>
						<td><button type="submit" class="btn btn-secondary">수정</button></td>
					</tr>
				</tbody>

			</table>
		</div>
		
		
		
	</div>
	
	<!-- The Modal -->
		<div class="modal" id="reserdetail">
		  <div class="modal-dialog">
		    <div class="modal-content" style="width:1000px; color:white; font-weight:bold; background:silver;">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title" style="font-size : 36px; margin-top:30px; margin-bottom:30px;">회원 상세 정보</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body" style="text-align:center; line-height:64px;">
					<h3 style="margin: 30px 0px;">상세내역</h3>
					<table class="table table-bordered"  >
					
					<thead>
					</thead>
					
						<tbody>
							<tr>
								<th>모델명</th>
								<th>연식</th>
								<td><button type="submit" class="btn btn-secondary">수정</button></td>
							</tr>
							<tr>
								<th>아이디</th>
								<td>user01</td>
								<td><button type="submit" class="btn btn-secondary">수정</button></td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td>1996-03-01</td>
								<td><button type="submit" class="btn btn-secondary">수정</button></td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>010-1234-5678</td>
								<td><button type="submit" class="btn btn-secondary">수정</button></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>123@naver.com</td>
								<td><button type="submit" class="btn btn-secondary">수정</button></td>
							</tr>
						</tbody>
		
					</table>
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
		      </div>
		
		    </div>
		  </div>
		</div>

</body>
</html>