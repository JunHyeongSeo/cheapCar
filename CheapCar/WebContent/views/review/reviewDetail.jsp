<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.semi.review.model.vo.ReviewPhoto, com.kh.semi.review.model.vo.ReviewBoard, com.kh.semi.review.model.vo.Reply" %>    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 상세보기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


<style>
	.outer{
		width: 1200px;
		height: auto;
		margin: auto;
		padding-bottom: 50px;
		
		
	}

	
    .content_outer{
        width: 90%;
        height: auto;
        margin-top: 50px;
        float: right;
    }
    .content_outer>div{
        width: 100%;
        font-family: "Do Hyeon", sans-serif;
    }
    .content_header{
        width: 100%;
        height: 80px;
        float: left;
    }
    .content_header>div{
        height: 100%;
        float: left;
        border-bottom: 4px solid #b1d6f3;
    }
    .content_header1{
        width: 10%;
        float: left;
        text-align: center;
        font-size: 30px;
        padding-top: 15px;
        font-weight: bold;
    }
    .content_header2{
        width: 90%;
        float: left;
        text-align: left;
        padding-left: 20px;
        font-size: 40px;
        padding-top: 10px;
        text-align: center;
        border-bottom: 4px solid #b1d6f3;
    }
    .content_sub{
        text-align: right;
        padding-right: 30px;
        
        
    }
    .content_sub1{
        opacity: 0.8;
    }
    .content_body{
        height: auto;
        padding-left: 50px;
        padding-top: 50px;
        border-bottom: 2px solid #b1d6f3;
        font-size: 20px;
        
    }
    .page-header{
		padding-top: 20px;
		font-size: 40px;
		font-weight: bold;
		border-bottom: 8px solid #b1d6f3;
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
    
	.do-hyeon-regular {  /* 이벤트 글꼴 */ 
		font-family: "Do Hyeon", sans-serif;
		font-weight: 300px;
		font-style: normal;
		font-size: 60px;
		color: #6caddf;
	}
    .content_btn{
        padding-top: 20px;
    	padding-bottom: 100px;
    }
    #replyList{
        width: 100%;
		font-family: "Do Hyeon", sans-serif;
		font-weight: 10%;
		font-style: normal;
		font-size: 15px;        

    }
    

</style>
</head>
<body>

	<jsp:include page="../common/menuBar.jsp"></jsp:include>
	
<div class="outer">
	<div class="row">
	<div class="col-lg-1">
		  </div>
			 <div class="col-lg-10">
				<div class="panel-body">
				<h2 class="page-header do-hyeon-regular" align="left">리&nbsp;&nbsp;뷰</h2>
				</div> 
                    <div class="content_outer"> 
                        <div class="content_header"> 
                            
                        <div class="content_header2"> ${ rBoard.reviewTitle } </div>
                        </div>
                        <div class="content_sub">
	                        <span class="content_sub1">작성일 : ${ rBoard.createDate }</span> &nbsp;/&nbsp;
	                        <span class="content_sub1">작성자 : ${ rBoard.reviewWriter }</span> &nbsp;/&nbsp;
	                        <span class="content_sub1">조회수 : ${ rBoard.count }</span>
                    </div>
                    <div class="content_body"> 
	                    <c:if test="${ list != null }">			
	                        <div class="img-area">
	                        	<c:forEach var="r" items="${ list }">
	                             	<img width="100%" src="${ path }/${ r.photoPath }/${ r.photoCname }" />
	                             	<input type="hidden" name="titleImg" value="${ r.photoCname }"/>
	                            </c:forEach>
	                        </div>
	                     </c:if>
                        <div class="text-area">
                        	${rBoard.reviewContent}
                        </div>
                    </div>
                    <div class="reply" id="replyList"> 
                        <table class="table table-bordered table-hover" style="margin-top:30px; border-radius: 10px;">
				   			<thead>
                            <tr style="background-color: #6caddf; margin-top: 0; height: 40px; color: white; opacity: 0.8">
                               <th style="width: 8%; text-align:center">번&nbsp;호</th>
                               <th style="width: 45%; text-align:center">내&nbsp;&nbsp;용</th>
                               <th style="width: 10%; text-align:center">작성자</th>
                               <th style="width: 15%; text-align:center">작성일</th>
                            </tr>
                            </thead>
                            <tbody>
                            
                            </tbody>
                            
                         </table>    
                    </div>
             		
                    <div class="input-group mb-3">
                       <c:choose> 
                       	  <c:when test="${ loginUser != null }"> 
                            <input type="text" class="form-control" id="replyContent" maxlength="300" placeholder="댓글 작성 시 상대방에게 불쾌감을 주는 언어사용은 가급적 지양해주시기 바랍니다. / 최대 300자 ">
                            <div class="input-group-append">
                                <button class="btn btn-info" onclick="insertReply();">등록</button>
                            </div>
                       	  </c:when>
                          <c:otherwise>    
                            <input type="text" readonly class="form-control" placeholder="로그인 후 댓글작성 가능합니다.">
                          </c:otherwise>
                      </c:choose> 
                            
                    </div>
                    <div class="content_btn" align="center"> 
                        <a href="${ path }/list.review?currentPage=1" class="btn btn-sm btn-info">목&nbsp;록</a>
                        <c:if test="${ loginUser != null and loginUser.memberId == rBoard.reviewWriter or loginUser.memberStatus == 'A' }">                      
                        	<a href="${ path }/updateForm.review?reviewNo=${ rBoard.reviewNo }" class="btn btn-sm btn-secondary">수&nbsp;정</a>
                        	<a href="${ path }/delete.review?reviewNo=${ rBoard.reviewNo }" class="btn btn-sm btn-danger">삭&nbsp;제</a>
                        </c:if>
                    </div>                       

                </div>
				</div>            
			 </div> 
		 </div>

<script>

		function selectReplyList(){
			   $.ajax({
				   url : 'replyList.review',
				   data : {
					   rNo : ${ rBoard.reviewNo}
				   },
				   success : function(result){
			            let resultStr = '';
			            for(let i in result){
		
			                resultStr += '<tr>'
			                		   + '<td align="center">' + result[i].commentNo + '</td>'	
			                           + '<td>' + result[i].commentContent + '</td>'
			                           + '<td align="center">' + result[i].commentWriter + '</td>'
			                           + '<td align="center">' + result[i].createDate + '</td>'
			                           + '</tr>'
			            };
			            $('#replyList tbody').html(resultStr);
			          },
			          error : function(e){
			            console.log(e);
			          }
			        })
		} 

		
		$(function(){
		    selectReplyList();
		  });
		

		 
       function insertReply(){
    	   
    	   const num = 0;
    	   
    	   if(loginUser == null){
    		   num = 0;
    	   } else{
    		   num = ${ loginUser.memberNo };
    	   }
    	   
    	   
           $.ajax({
               url : 'replyInsert.review',
               type : 'post',
               data : {
                   content : $('#replyContent').val(),
                   reviewNo : ${ rBoard.reviewNo },
                   memberNo : num
               },
               success : function(result){
               	console.log(result);
               	if(result == '댓글성공'){
               	  $('#replyContent').val('');
               	  selectReplyList();
               	};
               }
            });
        }

       
       
	        
       



</script>



		
</body>
</html>