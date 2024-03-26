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
		width : 300px;
		text-align : center;
	}
</style>
</head>
<body>

	<form>
		<span>대여 기간</span>
		<input id="dateRange"type="text" name="datetimes" readonly/>
	</form>

	<script>
	
	$('#dateRange').daterangepicker({
		"timePicker" : true,
		"timePickerIncrement": 10,
	    "locale": {
	        "format": "YYYY-MM-DD-HH:m",
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
	    console.log(start.format('YYYY-MM-DD-HH:MI') + ' to ' + end.format('YYYY-MM-DD-HH:MM'));
	});
		
		
	</script>
</body>
</html>