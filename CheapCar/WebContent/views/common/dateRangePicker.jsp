<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Date Picker</title>

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<style>
	#dateRange{
		width : 350px;
		text-align : center;
	}
</style>
</head>
<body>

	<span>대여 기간</span><br>
	<input id="dateRange"type="text" name="datetimes" readonly required/>

	<script>
	
	$('#dateRange').daterangepicker({
		"timePicker" : true,
		"timePickerIncrement": 60,
		"minDate" : moment().startOf('day'),
		"maxDate" : moment().add(1, 'month'),
	    "locale": {
	        "format": "YYYY-MM-DD HH:00 A",
	        "separator": " ~ ",
	        "applyLabel": "확인",
	        "cancelLabel": "취소",
	        "fromLabel": "From",
	        "toLabel": "To",
	        "customRangeLabel": "Custom",
	        "weekLabel": "W",
	        "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
	        "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
	    },
	    "startDate": new Date(),
	    "endDate": new Date(),
	    "drops": "auto"
	}, function (start, end, label) {
		
	    var startTime = start.toDate();
	    var endTime = end.toDate();
	    
	    var startHour = startTime.getTime();
	    var endHour = endTime.getTime();
	    
	    var startRent = start.format('YYYY-MM-DD HH:00 A');
	    var endRent = end.format('YYYY-MM-DD HH:00 A');
	    
	    
	    var hourDifference = (endHour - startHour) / (1000*60*60);

	    document.getElementById('startRent').value = startRent;
	    document.getElementById('endRent').value = endRent;
		document.getElementById('totalHour').value = hourDifference;
	    
	});
		
		
	</script>
</body>
</html>