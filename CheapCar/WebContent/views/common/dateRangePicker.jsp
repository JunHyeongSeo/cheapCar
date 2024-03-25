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
		<input id="dateRange"type="text" name="datetimes" readonly/>
	</form>

	<script>
		$(function() {
		  $('input[name="datetimes"]').daterangepicker({
		    timePicker: true,
		    "timePickerIncrement": 5,
		    startDate: moment().startOf('hour'),
		    endDate: moment().startOf('hour').add(32, 'hour'),
		    locale: {
		      format: 'M/DD hh:mm A',
		      "separator": " ~ ",
		        "applyLabel": "확인",
		        "cancelLabel": "취소",
		        "fromLabel": "From",
		        "toLabel": "To",
		        "customRangeLabel": "Custom",
		        "weekLabel": "W",
		      "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
		      "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
		    },
		    "startDate": new Date(),
		    "endDate": new Date(),
		    "drops": "auto"
		  });
		});
		
	</script>
</body>
</html>