<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
  
    <!-- Bootstrap core CSS -->
    <link href="/resources/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	
    <!-- Custom styles for this template -->
    <link href="/resources/css/signin.css" rel="stylesheet">

	<link href="/resources/css/signin.css" rel="stylesheet">
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="/resources/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/resources/assets/js/ie-emulation-modes-warning.js"></script>
    <script src="/resources/bootstrap/dist/js/bootstrap-datepicker.js"></script>
    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css'>
    
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<link rel="stylesheet" href="/resources/demos/style.css">
    
</head>

<body>
    <div class="container">
	    <form class="form-horizontal" enctype="" role="form">
			<div class="form-inline">
				<label for="">주문일자</label>
		        <input type="date" class="form-control" id="fromDate" onchange="dateTest()" />
		        <label for="">~</label>
		        <input type="date" class="form-control" id="toDate" onchange="dateTest()"/>


		        <label for="fromDate">브랜드 </label>
		        <select class="form-control" id="">
				    <option>1</option>
				    <option>2</option>
				    <option>3</option>
				    <option>4</option>
				</select>
		        <button type="button" class="btn btn-primary" > 조회 </button>
		        <button type="button" class="btn btn-primary" > 엑셀다운 </button>
			</div>	
		</form>		
		<DIV class="table">
			<TABLE class="table table-striped">
				<THEAD>
					<TR class="bg-primary">
						<TH>기간</TH>
						<TH>브랜드</TH>
						<TH>주문금액</TH>
						<TH>실 매출금액</TH>
						<TH>처리금액</TH>
					</TR>
				</THEAD>
				<TBODY>
					<TR>
						<Td>1</Td>
						<Td>1</Td>
						<Td>2016.02.29</Td>
						<Td>101,000,000</Td>
						<Td>101,000,000</Td>
					</TR>
				</TBODY>
			</TABLE> 
		</DIV>
	</div>
	
</body>

<script>

	$(document).ready(function() {
		//주문 시작일
		$("#fromDate").datepicker({
			dateFormat : "yy-mm-dd"
		});
		//주문종료일
		$("#toDate").datepicker({
			dateFormat : "yy-mm-dd"
		});
		
		//6개월전 일자
		var frDate = new Date();
		frDate.setMonth(frDate.getMonth()-6); 
		$('#fromDate').val($.datepicker.formatDate($.datepicker.ATOM, frDate));
		
		//오늘일자
		$('#toDate').val($.datepicker.formatDate($.datepicker.ATOM, new Date()));
		
		
	});

	function dateTest(){
		var frDate = new  Date($("#fromDate").datepicker("getDate"));
		var toDate = new  Date($("#toDate").datepicker("getDate"));
		if (toDate - frDate < 0){
		      alert("끝 날짜가 시작날짜보다 이전일수 없습니다"); 
		      return false;
		}
	}
		
		
</script>

