<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <!-- Bootstrap core CSS -->
    <link href="../resources/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="../resources/bootstrap/dist/js/bootstrap.js"></script>
</head>
<body>
<div class="container">
<br>
	<div class="row">
		<div class="col-md-1">주문일자</div>
		<div class="col-md-5"><input type="text"> ~ <input type="text"></div>
		<div class="col-md-1">주문번호</div>
		<div class="col-md-2"><input type="text"></div>
		<div class="col-md-3"><button class="btn btn-primary pull-right" type="submit">조회</button></div>
	</div>
	<table class="table table-bordered">
		<thead>
			<tr class="bg-primary">
				<td>No</td>
				<td>주문번호</td>
				<td>고객사</td>
				<td>브랜드명</td>
				<td>카테고리명</td>
				<td>부품코드</td>
				<td>부품명</td>
				<td>공급가액(개)</td>
				<td>주문수량</td>
				<td>공급가액(총)</td>
				<td>주문일</td>
				<td>마감일</td>
				<td>처리결과</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td>53782</td>
				<td>AA</td>
				<td>BBB</td>
				<td>CCCC</td>
				<td>D</td>
				<td>EF</td>
				<td>100</td>
				<td>30</td>
				<td>3000</td>
				<td>2016-3-02</td>
				<td>2016-3-09</td>
				<td></td>
			</tr>
		</tbody>
	</table>
</div>
</body>