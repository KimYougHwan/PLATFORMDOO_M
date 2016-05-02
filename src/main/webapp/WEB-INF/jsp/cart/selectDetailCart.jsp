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

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="/resources/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/resources/assets/js/ie-emulation-modes-warning.js"></script>
</head>
<body>
	<div class="container">
		<label class="container">일련번호 : 부품갯수 :  총금액 : D-1 주문 상세보기  <a target="_self" class="btn btn-primary pull-right" href="selectDetailCart2.do">주문하기</a> </label>
	</div>
	<div class="container">
		<div align="right" >
			<!--<button type="button" class="btn btn-info pull-right">글쓰기</button> -->
			<button type="button" class="btn btn-primary">장바구니목록</button>
			<button type="button" class="btn btn-primary">선택삭제</button>
			<button type="button" class="btn btn-primary">엑셀다운</button>
			<button type="button" class="btn btn-primary">저장</button>
		</div><br />
		<div class="table">
			<TABLE class="table table-striped">
				<THEAD>
					<TR class="bg-primary">
						<TH>No</TH>
						<TH><input type="checkbox" id="" /></TH>
						<TH>브랜드</TH>
						<TH>카테고리</TH>
						<TH>부품번호</TH>
						<TH>부품명</TH>
						<TH>생가</TH>
						<TH>수량</TH>
						<TH>총액</TH>
					</TR>
				</THEAD>
				<TBODY>
					<TR>
						<Td>1</Td>
						<Td><input type="checkbox" id="" /></Td>
						<Td>브랜드</Td>
						<td>카테고리</td>
						<Td>부품번호</Td>
						<Td>부품명</Td>
						<Td>생가</Td>
						<Td>수량</Td>
						<Td>총액</Td>
					</TR>
				</TBODY>
			</TABLE>
		</div>
		<div align="right">
			<h2 class="btn-info">총액 서머리금액</h2>
		</div>
	</div>
	<br />
	<div class="container">
		<div align="right" >
			<button type="button" class="btn btn-primary">선택저장</button>
			<button type="button" class="btn btn-primary">엑셀다운</button>
			<button type="button" class="btn btn-primary">저장</button>
		</div><br />
		<div class="table">
			<TABLE class="table table-striped">
				<THEAD>
					<TR class="bg-primary">
						<TH>No</TH>
						<TH><input type="checkbox" id="" /></TH>
						<TH>브랜드</TH>
						<TH>부품번호</TH>
						<TH>부품명</TH>
						<TH>생가</TH>
						<TH>마진율</TH>
						<TH>판매가</TH>
						<TH>수량</TH>
						<TH>총액</TH>
					</TR>
				</THEAD>
				<TBODY>
					<TR>
						<Td>1</Td>
						<Td><input type="checkbox" id="" /></Td>
						<Td>브랜드</Td>
						<Td>부품번호</Td>
						<Td>부품명</Td>
						<Td>생가</Td>
						<Td>마진율</Td>
						<Td>판매가</Td>
						<Td>수량</Td>
						<Td>총액</Td>
					</TR>
				</TBODY>
			</TABLE>
		</div>
		<div align="right">
			<h2 class="btn-info">수량 총 개수 : 총액 서머리 금액</h2>
		</div>
	</div>
</body>
</html>




<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="assets/js/ie10-viewport-bug-workaround.js"></script>