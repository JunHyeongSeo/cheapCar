<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.member.model.vo.Member, java.util.ArrayList, com.kh.semi.common.model.vo.PageInfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원현황</title>

</head>
<body>

	<jsp:include page="../../common/adminMain.jsp"></jsp:include>
	<c:if test="${ loginUser ne null and loginUser.memberStatus eq 'A' }">
	    <div class="outer" id="salemonth">
	    
			<div id="top11">
				<label for="searchId" style="margin: 0px 15px;">회원 아이디 : </label>
				<input type="text" class="form-control" id="searchId" placeholder="조회하실 회원 아이디를 입력해주세요." name="searchId" style="width: 300px;">
				<button type="button" class="btn btn-primary" style="margin-left: 10px;" onclick="searchMem();">조회</button>
			</div>
			
			<div class="container">
				<h2>회원현황</h2> 
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>회원번호</th>
							<th>이름</th>
							<th>아이디</th>
							<th>회원상태</th>
							<th>상세보기</th>
						</tr>
					</thead>
					<tbody id="conBody">
						
						
					</tbody>
				</table>
			</div>
			
			<div id="paging-area">
	
			
			</div>
			
			<div class="container">
				<table class="table table-bordered">
					<tbody id="con2Body">
						
					</tbody>
				</table>
			
			</div>
			
			<script>
			
		    	window.onload = function firstPage(){
					
		    		const url = new URL(location.href);
		    		const currentPage = url.searchParams.get("currentPage");
		    		
					// 1. 실행되면 전체 리스트 나오는 ajax
		    		$.ajax({
		    			url : 'memberList.all', // 전체 리스트 가져오는 서블릿
		    			data : {currentPage : currentPage},
		    			success : function(list){
		    				let resultStr = '';
		    				
		    				for(let i in list){
		    					resultStr += '<tr>'
		        						   + '<td>' + list[i].memberNo + '</td>'
		        						   + '<td>' + list[i].memberName + '</td>'
		        						   + '<td>' + list[i].memberId + '</td>'
		        						   + '<td>' + list[i].memberStatus + '</td>'
		        						   + '<td><button type="button" class="btn btn-secondary" onclick="memberDetail(this.id);" id="' + list[i].memberId + '" name="' + list[i].memberId + '" value="' + list[i].memberId + '">상세보기</td>'
		        						   + '</tr>'
		    				}
		    				document.getElementById('conBody').innerHTML = resultStr;
		    			}
		    		});
	    		
	    			// 2. 실행되면 전체 리스트에 대한 페이징바가 나오는 ajax
		    		$.ajax({
		    			url : 'memberCount.all', // 페이징바 만들기 위해서 가져오는 서블릿
		    			data : {currentPage : currentPage},
		    			success : function(pi){
		    				let resultStr = '';
		    				
		    				if(pi.currentPage > 1) {
		    					resultStr  += '<button class="btn btn-outline-danger" onclick="location.href='
		    	       					    + "'${ path }/memberList?currentPage="
		    	       					    + (pi.currentPage - 1)
		    	       					    + "'"
		    	       					    + '"'
		    	       					    + '>'
		    	       					    + '이전</button>';
		   			        }
		    				
		   			        for(let i = pi.startPage; i <= pi.endPage; i++) {
		   			        	if(pi.currentPage != i){
		   			        		resultStr += '<button class="btn btn-outline-danger" onclick="location.href='
		   			        				   + "'${ path }/memberList?currentPage="
		   			        				   + i
		   			        				   + "'"
		     	       					   	   + '"'
		   			        				   + '>'
		   			        				   + i
		   			        				   + '</button>';
		   			        	}
		   			        	else {
		   			        		resultStr += '<button disabled class="btn btn-danger">'
		   			        			       + i 
		   			        			       + '</button>';
		   			        	}
		   			        }
		   			        
		   			        if(pi.currentPage != pi.maxPage){
		   			        	resultStr += '<button class="btn btn-outline-danger" onclick="location.href='
				       					   + "'${ path }/memberList?currentPage="
				       					   + (pi.currentPage + 1)
				       					   + "'"
				       					   + '"'
				       					   + '>'
				       					   + '다음</button>';
		   			        }
		       			    document.getElementById('paging-area').innerHTML = resultStr;
		    			}
	    			});	
	    		}
				
				// 3. 조회 누르면 포함된 값 보여주는 ajax
				function searchMem(){																																																location.href="http://www.naver.com";
					
					//const url = new URL(location.href);
	        		//const currentPage = url.searchParams.get("currentPage");
	        		const currentPage = 1;
	        		
					$.ajax({
						url : 'memberList.search',
						data : {
							searchId : document.getElementById('searchId').value,
							currentPage : 1
						},
						success : function(list){
							let resultStr = '';
							
							for(let i in list){
								resultStr += '<tr>'
										   + '<td>' + list[i].memberNo + '</td>'
		        						   + '<td>' + list[i].memberName + '</td>'
		        						   + '<td>' + list[i].memberId + '</td>'
		        						   + '<td>' + list[i].memberStatus + '</td>'
		        						   + '<td><button type="button" class="btn btn-secondary" onclick="memberDetail(this.id);" id="' + list[i].memberId + '" name="' + list[i].memberId + '" value="' + list[i].memberId + '">상세보기</td>'
		        						   + '</tr>'
							}
	        				document.getElementById('conBody').innerHTML = resultStr;
						}
					});
					
					$.ajax({
	        			url : 'memberCount.search', // 페이징바 만들기 위해서 가져오는 서블릿
	        			data : {
	        				currentPage : 1,
	        				searchId : document.getElementById('searchId').value
	       				},
	        			success : function(pi){
	        				let resultStr = '';
	        				
	        				// 2페이지 이상 보고있으면 이전버튼을 만들겠다.
	        				if(pi.currentPage > 1) {
	        					resultStr  += '<button class="btn btn-outline-danger" onclick="cp(this);" value="'
	        	       						 + (i-1)
	        	       						 + '">이전</button>';
	       			        }
	        				
	        				// 총 페이지에 대한 버튼을 만들겠다
	       			        for(let i = pi.startPage; i <= pi.endPage; i++) {
	       			        	// 현재페이지 말고 다른 페이지 보이는거 있을때, 그거 누르면 그 페이지로 이동할거다.
	       			        	if(pi.currentPage != i){
	       			        		resultStr += '<button class="btn btn-outline-danger" onclick="cp(this);" value="'
	       			        					+ i
	       			        					+ '">'
	       			        				    + i
	       			        				    + '</button>';
	       			        	}
	       			    	 	// 근데 현재페이지를 내가 보고있으면 버튼이 안눌리게끔 할거다.
	       			        	else {
	       			        		resultStr += '<button disabled class="btn btn-danger">'
	       			        			        + i 
	       			        			        + '</button>';
	       			        	}
	       			        }
	       			        
	        				// 맥스페이지가 안눌려있는 모든 상태라면 다음 버튼을 만들거다
	       			        if(pi.currentPage != pi.maxPage){
	       			        	resultStr += '<button class="btn btn-outline-danger" onclick="cp(this);" value="'
	       			        				+ (pi.currentPage + 1)
	       			        				+ '">다음</button>';
	       			        }
		       			    document.getElementById('paging-area').innerHTML = resultStr;
		       			    document.getElementById('con2Body').innerHTML = '';
	        			}
	        		});
					
				}
				
				function cp(result){
					// 버튼 눌렀을 때 currentPage 를 바꿔서 ajax를 해당 currentPage로 이동해주는 ajax
					const currentPage = result.value;
	
					$.ajax({
						url : 'memberList.search',
						data : {
							searchId : document.getElementById('searchId').value,
							currentPage : currentPage
						},
						success : function(list){
							let resultStr = '';
							for(let i in list){
								resultStr += '<tr>'
										   + '<td>' + list[i].memberNo + '</td>'
		        						   + '<td>' + list[i].memberName + '</td>'
		        						   + '<td>' + list[i].memberId + '</td>'
		        						   + '<td>' + list[i].memberStatus + '</td>'
		        						   + '<td><button type="button" class="btn btn-secondary" onclick="memberDetail(this.id);" id="' + list[i].memberId + '" name="' + list[i].memberId + '" value="' + list[i].memberId + '">상세보기</td>'
		        						   + '</tr>'
							}
	        				document.getElementById('conBody').innerHTML = resultStr;
						}
					});
					
					$.ajax({
	        			url : 'memberCount.search',
	        			data : {
	        				currentPage : currentPage,
	        				searchId : document.getElementById('searchId').value
	       				},
	        			success : function(pi){
	        				let resultStr = '';
	        				if(pi.currentPage > 1) {
	        					resultStr  += '<button class="btn btn-outline-danger" onclick="cp(this);" value="'
	        	       						 + (pi.currentPage - 1)
	        	       						 + '">이전</button>';
	       			        }
	        				
	       			        for(let i = pi.startPage; i <= pi.endPage; i++) {
	       			        	if(pi.currentPage != i){
	       			        		resultStr += '<button class="btn btn-outline-danger" onclick="cp(this);" value="'
	       			        					+ i
	       			        					+ '">'
	       			        				    + i
	       			        				    + '</button>';
	       			        	}
	       			        	else {
	       			        		resultStr += '<button disabled class="btn btn-danger">'
	       			        			        + i 
	       			        			        + '</button>';
	       			        	}
	       			        }
	       			        
	       			        if(pi.currentPage != pi.maxPage){
	       			        	resultStr += '<button class="btn btn-outline-danger" onclick="cp(this);" value="'
	       			        			   + (pi.currentPage + 1)
	       			        			   + '">다음</button>';
	       			        }
		       			    document.getElementById('paging-area').innerHTML = resultStr;
	        			}
	        		});
				}
				
				// 4. 상세보기 버튼 누르면 #container2 에 html 추가
				function memberDetail(result){
					
					$.ajax({
						url : "memberDetail.do",
						data : {
							memberId : document.getElementById(result).value
						},
						success : function(m){
							let resultStr = '';
							
							resultStr += "<tr>"
									   + "<td>회원번호</td>"
									   + "<td><input type='text' disabled value='" + m.memberNo + "' name='changedNo'></td>"
									   + "</tr>"
									   + "<tr>"
									   + "<td>아이디</td>"
									   + "<td><input type='text' disabled value='" + m.memberId + "' name='checkId'></td>"
									   + "</tr>"
									   + "<tr>"
									   + "<td>이름</td>"
									   + "<td><input type='text' value='" + m.memberName + "' name='changedName'></td>"
									   + "</tr>"
									   + "<td>연락처</td>"
									   + "<td><input type='text' value='" + m.phone + "' name='changedPhone'></td>"
									   + "</tr>"
									   + "<tr>"
									   + "<td>생년월일</td>"
									   + "<td><input type='text' value='" + m.birthday + "' name='changedBirthday'></td>"
									   + "</tr>"
									   + "<tr>"
									   + "<td>이메일</td>"
									   + "<td><input type='text' value='" + m.email + "' name='changedEmail'></td>"
									   + "</tr>"
									   + "<tr>"
									   + "<td>가입일자</td>"
									   + "<td><input type='text' disabled value='" + m.enrollDate + "' name='" + m.enrollDate + "'></td>"
									   + "</tr>"
									   + "<tr>"
									   + "<td>회원상태</td>"
									   + "<td>"
									   + '<input type="radio" id="A" value="A" name="status"><label for="A">A&nbsp;&nbsp;&nbsp;</label>'
									   + '<input type="radio" id="B" value="B" name="status"><label for="B">B&nbsp;&nbsp;&nbsp;</label>'
									   + '<input type="radio" id="C" value="C" name="status"><label for="C">C&nbsp;&nbsp;&nbsp;</label>'
									   + '<input type="radio" id="D" value="D" name="status"><label for="D">D&nbsp;&nbsp;&nbsp;</label>'
									   + "</td>"
									   + "</tr>"
									   + "<tr>"
									   + "<td>블랙리스트 사유</td>"
									   + "<td><input type='text' value='" + m.blackReason + "' name='blackReason'></td>"
									   + "</tr>"
									   	+ "<tr>"
									   + "<td colspan='2'><button type='button' onclick='updateMember(this);' id='" + m.memberNo + "'>회원 정보 수정</td>"
									   + "</tr>"
									   
							document.getElementById('con2Body').innerHTML = resultStr;
							
						    // 5. 회원상태 체크박스 현재 상태로 체크해주는 ajax
							
							let str = document.getElementsByName('status');
							for(let i = 0; i < str.length; i++){
								if(str[i].value.indexOf(m.memberStatus) == -1){
									str[i].checked = false;
								}
								else{
									str[i].checked = true;
								}
							}
						}
					});
				}
				
				function updateMember(result){
					
					let statusValue = document.querySelector('input[name="status"]:checked').value;
					
					if(confirm('회원정보를 수정하시겠습니까?')){
						$.ajax({
							url : 'memberUpdate.do',
							data : {
								name : document.getElementsByName('changedName')[0].value,
								phone : document.getElementsByName('changedPhone')[0].value,
								birthday : document.getElementsByName('changedBirthday')[0].value,
								email : document.getElementsByName('changedEmail')[0].value,
								status : statusValue,
								checkId : document.getElementsByName('checkId')[0].value,
								memberNo : document.getElementsByName('changedNo')[0].value,
								blackReason : document.getElementsByName('blackReason')[0].value
							},
							success : function(result){
								if(result > 0){
									alert('정보 수정 성공!');
									location.reload();
								}
							}
						});
					}
				}
				
				
				// $('input').blur(function(){
				$('#searchId').keyup(function(){
					const regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
			        const uname =  $('#searchId').val()
			        const resultData = uname.replace(regExp, "");
			        if(uname != resultData){
			             alert('특수문자는 사용이 불가능합니다.')
			             $('#searchId').val(resultData)
						}
			       });
				
				
	        	</script>
		</div>
	</c:if>
	
</body>
</html>