<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.member.model.vo.Member, java.util.ArrayList, com.kh.semi.common.model.vo.PageInfo"%>
<%
    ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("memberList");
    PageInfo pi = (PageInfo)request.getAttribute("pageInfo");
    
    int currentPage = pi.getCurrentPage();
    int startPage = pi.getStartPage();
    int endPage = pi.getEndPage();
    int maxPage = pi.getMaxPage();
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원현황</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="../common/adminMain.jsp" %>
<div class="outer">
    <div id="top1">
        <form class="searchMem" action="">
            <div id="top11" style="display: flex;">
                <label for="userId" style="margin: 0px 15px;">회원 아이디 : </label>
                <input type="text" class="form-control" id="userId" placeholder="조회하실 회원 아이디를 입력해주세요." name="userId" style="width: 300px;">
                <button type="button" class="btn btn-primary" style="margin-left: 10px;" onclick="searchMember();">조회</button>
            </div>
        </form>
    </div>
    
    <div class="container">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>회원번호</th>
                    <th>이름</th>
                    <th>아이디</th>
                    <th>상세보기</th>
                </tr>
            </thead>
            <tbody id="memberTableBody">
            </tbody>
        </table>
    </div>

    <div class="paging-area">
        <% if(currentPage > 1) { %>
            <button class="btn btn-outline-danger" onclick="changePage(<%= currentPage - 1 %>);">이전</button>
        <% } %> 

        <% for(int i = startPage; i <= endPage; i++) { %>
            <% if(currentPage != i) {  %>
                <button class="btn btn-outline-danger" onclick="changePage(<%= i %>);"><%= i %></button>
            <% } else { %>
                <button disabled class="btn btn-danger"><%= i %></button>
            <% } %>
        <% } %>

        <% if(currentPage != maxPage) {%>    
            <button class="btn btn-outline-danger" onclick="changePage(<%= currentPage + 1 %>);">다음</button>
        <% } %>
    </div>
</div>

<script>
    $(document).ready(function() {
        // 페이지 로딩시 첫 페이지 회원 리스트 불러오기
        loadMemberList(<%= currentPage %>);
    });

    // 페이지 이동시 회원 리스트 불러오기
    function changePage(page) {
        loadMemberList(page);
    }

    // 회원 검색시 회원 리스트 불러오기
    function searchMember() {
        var userId = $('#userId').val();
        $.ajax({
            url: 'searchMember.do',
            type: 'GET',
            data: { userId: userId },
            success: function(response) {
                // 검색 결과를 테이블에 출력
                $('#memberTableBody').html(response);
            },
            error: function(xhr, status, error) {
                console.error(xhr.responseText);
            }
        });
    }

    // 회원 리스트 불러오는 함수
    function loadMemberList(page) {
        $.ajax({
            url: 'memberList.do',
            type: 'GET',
            data: { currentPage: page },
            success: function(response) {
                // 회원 리스트를 테이블에 출력
                $('#memberTableBody').html(response);
            },
            error: function(xhr, status, error) {
                console.error(xhr.responseText);
            }
        });
    }
</script>

</body>
</html>
