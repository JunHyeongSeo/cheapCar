<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 등록</title>
<style>
  th{
    text-align: center;
  }

  .insbut{
    display: block;
    margin: auto;

  }
</style>




</head>
<body>
	<%@ include file="../../common/adminMain.jsp" %>
	
	<div class="outer">
    <div class="container">
      <h2>차량등록</h2> 
      <form action="insertCar.do" method="get">
      
        <table class="table">
            <tbody>
              <tr>
                <th>차량번호</th>
                <td><input type="text" name="carNo"></td>
              </tr>
              <tr>
                <th>제조사</th>
                <td>
                  <select name="brandName">
                 	 <option class="brandName" value="-">-----------</option>
	                 <option class="brandName" value="현대">현대</option>
	                 <option class="brandName" value="기아">기아</option>
	                 <option class="brandName" value="제네시스">제네시스</option>
	                 <option class="brandName" value="르노삼성">르노삼성</option>
	                 <option class="brandName" value="포르쉐">포르쉐</option>
                  </select>
                </td>
              </tr>
              <tr>
                <th>모델명</th>
                <td>
                  <select name="modelName">
                  	<option class="modelName" value="-">-----------</option>
                    <option class="modelName" value="현대">아반때</option>
                    <option class="modelName" value="기아">소나타</option>
                    <option class="modelName" value="제네시스">K3</option>
                    <option class="modelName" value="르노삼성">GV80</option>
                    <option class="modelName" value="포르쉐">QM3</option>
                  </select>
                </td>
              </tr>
              <tr>
                <th>크기선택</th>
                <td>
                  <select name="gradeName">
                  	<option class="gradeName" value="-">-----------</option>
                    <option class="gradeName" value="경차">경차</option>
                    <option class="gradeName" value="준중형">준중형</option>
                    <option class="gradeName" value="중형">중형</option>
                    <option class="gradeName" value="대형">대형</option>
                    <option class="gradeName" value="SUV">SUV</option>
                  </select>
                </td>
              </tr>
              <tr>
                <th>연료</th>
                <td>
                  <select name="fuelName">
                  	<option class="fuelName" value="-">-----------</option>
                    <option class="fuelName" value="경차">전기</option>
                    <option class="fuelName" value="준중형">하이브리드</option>
                    <option class="fuelName" value="중형">가솔린</option>
                    <option class="fuelName" value="대형">디젤</option>
                    <option class="fuelName" value="SUV">LPG</option>
                  </select>
                </td>
              </tr>
              <tr>
                <th>연식</th>
                <td>
                  <select name="year">
					<option class="year" value="-">-----------</option>
                    <option class="year" value="2019">2019</option>
                    <option class="year" value="2020">2020</option>
                    <option class="year" value="2021">2021</option>
                    <option class="year" value="2022">2022</option>
                    <option class="year" value="2023">2023</option>
                  </select>
                </td>
              </tr>
              <tr>
                <th>차량위치</th>
                <td>
                  <select name="locationName">
                  	<option class="locationName" value="-">-----------</option>
                    <option class="locationName" value="구리점">구리점</option>
                    <option class="locationName" value="강남점">강남점</option> 
                    <option class="locationName" value="종로점">종로점</option>
                    <option class="locationName" value="일산점">일산점</option>
                    <option class="locationName" value="강북점">강북점</option>
                  </select>
              </td>
              </tr>
            </tbody>
          </table>
          <button type="submit" class="insbut" onclick="return insertCar();">등록</button>
        </form>
      </div>
	</div>

	<script>
		function selectCar(){

			$.ajax({
				url : 'insertCar.do',
				data : {boardNo : $('#input3').val()},
				
				
			});
		}
		
		function insertCar(){
			
			const brandName = document.getElementByClass('brandName').value;
			const modelName = document.getElementByClass('modelName').value;
			const gradeName = document.getElementByClass('gradeName').value;
			const fuelName = document.getElementByClass('fuelName').value;
			const year = document.getElementByClass('year').value;
			const locationName = document.getElementByClass('locationName').value;
			
			let arr = [brandName, modelName, gradeName, fuelName, year, locationName];
			
			if(arr.indexOf('-') == -1){
                return true;
            }
            else{
                return false;
            }
			
			console.log(arr.indexOf('-') == -1);
		}
		
		
		
	</script>






</body>
</html>