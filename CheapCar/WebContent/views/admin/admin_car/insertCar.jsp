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
                 	 <option value="-">-----------</option>
	                 <option value="현대">현대</option>
	                 <option value="기아">기아</option>
	                 <option value="제네시스">제네시스</option>
	                 <option value="르노삼성">르노삼성</option>
	                 <option value="포르쉐">포르쉐</option>
                  </select>
                </td>
              </tr>
              <tr>
                <th>모델명</th>
                <td>
                  <select name="modelName">
                  	<option value="-">-----------</option>
                    <option value="현대">아반때</option>
                    <option value="기아">소나타</option>
                    <option value="제네시스">K3</option>
                    <option value="르노삼성">GV80</option>
                    <option value="포르쉐">QM3</option>
                  </select>
                </td>
              </tr>
              <tr>
                <th>크기선택</th>
                <td>
                  <select name="gradeName">
                  	<option value="-">-----------</option>
                    <option value="경차">경차</option>
                    <option value="준중형">준중형</option>
                    <option value="중형">중형</option>
                    <option value="대형">대형</option>
                    <option value="SUV">SUV</option>
                  </select>
                </td>
              </tr>
              <tr>
                <th>연료</th>
                <td>
                  <select name="fuelName">
                  	<option value="-">-----------</option>
                    <option value="경차">전기</option>
                    <option value="준중형">하이브리드</option>
                    <option value="중형">가솔린</option>
                    <option value="대형">디젤</option>
                    <option value="SUV">LPG</option>
                  </select>
                </td>
              </tr>
              <tr>
                <th>연식</th>
                <td>
                  <select name="year">
					<option value="-">-----------</option>
                    <option value="2019">2019</option>
                    <option value="2020">2020</option>
                    <option value="2021">2021</option>
                    <option value="2022">2022</option>
                    <option value="2023">2023</option>
                  </select>
                </td>
              </tr>
              <tr>
                <th>차량위치</th>
                <td>
                  <select name="locationName">
                  	<option value="-">-----------</option>
                    <option value="구리점">구리점</option>
                    <option value="강남점">강남점</option> 
                    <option value="종로점">종로점</option>
                    <option value="일산점">일산점</option>
                    <option value="강북점">강북점</option>
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
				
				}
			});
		}
		
		function insertCar(){
			
			const brandName = document.getElementByName('brandName').innerHTML.value;
			const modelName = document.getElementByName('modelName').innerHTML.value;
			const gradeName = document.getElementByName('gradeName').innerHTML.value;
			const fuelName = document.getElementByName('fuelName').innerHTML.value;
			const year = document.getElementByName('year').innerHTML.value;
			const locationName = document.getElementByName('locationName').innerHTML.value;
			
			
			let arr = [brandName, modelName, gradeName, fuelName, year, locationName];
			
			if(arr.indexOf('-') == -1){
                return true;
            }
            else{
                return false;
            }
			
			console.log(arr.indexOf('-'));
		}
		
		
		
	</script>






</body>
</html>