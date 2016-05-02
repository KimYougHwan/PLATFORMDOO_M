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
		<div class="col-md-1">브랜드</div>
		<div class="col-md-2"><select><option>선택</option></select></div>
		<div class="col-md-8"><button class="btn btn-primary pull-right" type="submit">조회</button></div>
		<div class="col-md-1"><button class="btn btn-primary pull-right" type="submit">저장</button></div>
	</div>
	<p>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-2"><input type="text"></div>
		<div class="col-md-8">%</div>
		<div class="col-md-1"><button class="btn btn-primary pull-right" type="submit">일괄적용</button></div>
	</div>
	<table class="table table-bordered">
		<thead>
			<tr class="bg-primary">
				<td>품목명</td>
				<td>마진율(%)</td>
				<td>품목명</td>
				<td>마진율(%)</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>test</td>
				<td>20</td>
				<td>test2</td>
				<td>40</td>
			</tr>
		</tbody>
	</table>
</div>
</body>
