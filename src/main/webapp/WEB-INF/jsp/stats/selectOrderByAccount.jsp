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
<link href="/resources/bootstrap/dist/css/bootstrap-datepicker.css" rel='stylesheet prefetch'>
    
</head>

<body>
    <div class="container">
	    <form class="form-horizontal" enctype="" role="form">
			<div class="form-inline">
				<label for="">주문일자</label>
		        <input type="date"  class="form-control" id=""/>
		        <label for="">~</label>
		        <input type="date" class="form-control" id="toDate"/>
		        <label for="fromDate">주문번호</label>
		        <input type="date" id="" class="form-control"/>
		        
		        <button type="button" class="btn btn-primary" > 조회 </button>
		        <button type="button" class="btn btn-primary" > 엑셀다운 </button>
		    </div>
		</form>
		<DIV class="table">
			<TABLE class="table table-striped">
				<THEAD>
					<TR class="bg-primary">
						<TH>No</TH>
						<TH>주문번호</TH>
						<TH>주문일</TH>
						<TH>주문금액</TH>
						<TH>처리금액</TH>
						<TH>마감일</TH>
						<TH>처리결과</TH>
					</TR>
				</THEAD>
				<TBODY>
					<TR>
						<Td>1</Td>
						<Td>1</Td>
						<Td>2016.02.29</Td>
						<Td>101,000,000</Td>
						<Td>101,000,000</Td>
						<Td>2016.02.19</Td>
						<Td>Yes</Td>
					</TR>
				</TBODY>
			</TABLE> 
		</DIV>
		
	</div>
</body>



<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js'></script>


