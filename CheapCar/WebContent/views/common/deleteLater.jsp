<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉬는공간</title>
</head>

<style>
	.song>iframe{
		margin-top : 15px;
		margin-bottom : 15px;
	}
	
	.a{
		align : center;
	}

</style>


<body>

	<%@ include file="menuBar.jsp" %>
	
	<div>
		<h1 style="color: orangered;"><marquee>오늘 하루도 고생 많으셨습니다~~~</marquee></h1>
		
		<div class="song">
			<div class='a'>
			<iframe width="550" height="325" src="https://www.youtube.com/embed/ATK7gAaZTOM" title="(여자)아이들((G)I-DLE) - &#39;나는 아픈 건 딱 질색이니까(Fate)&#39; LIVE CLIP" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
			</div>
		</div>
	
	</div>

</body>
</html>