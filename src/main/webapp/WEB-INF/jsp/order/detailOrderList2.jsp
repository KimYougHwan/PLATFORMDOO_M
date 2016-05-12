<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <!-- Bootstrap core CSS -->
    <link href="../resources/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="../resources/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/jquery/1/jquery.min.js"></script> 
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script> 
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/latest/css/bootstrap.css" /> 
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script> 
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" /> 
    
   	<script type="text/javascript">
    	
    	$(document).ready(function() {
    	 	
    	});
		
	</script>
</head>
<body>
<form name="pageForm" action="/order/detailOrderList.do">
<input type="hidden" id="pagenum" value="${nowpage}">
<input type="hidden" id="pagecount" value="${pagecount}">
</form>
<div class="container">
<br/>
<table class="table table-bordered">
	<thead>
		<tr class="bg-primary">
			<td>주문일련번호</td>
			<td>주문날짜</td>
			<td>상차예정일</td>
			<td>결제예정금액</td>
			<td>주문 물품금액</td>
			<td>단위</td>
			<td>연관주문번호</td>
			<td>완료여부</td>
		</tr>
	</thead>
	<tbody>
			<TR>
				<td>${partnum}</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</TR>
	</tbody>
</table>
<br/>
	<div class="row">
		<div class="col-md-5"></div>
		<div class="col-md-1"></div>
		<div class="col-md-1"></div>
		<div class="col-md-1"><button class="btn btn-primary pull-right" type="submit" id="excelList">엑셀다운</button></div>
		<div class="col-md-1"></div>
		<div class="col-md-1"></div>
		<div class="col-md-1"><form name="listchk" action="/order/detailOrderList.do">
								<input type="hidden" id="page" name="page" value="${page}">
								<input type="hidden" id="pagesum" name="pagesum" value="${pagesum}">
								<input type="hidden" id="chkdate" name="chkdate" value="${chkdate}">
								<button class="btn btn-primary pull-right" type="submit" id="closeback">닫기</button></form></div>
	</div>
<br/>
<table class="table table-bordered" id="detailTable">
	<thead>
		<tr class="bg-primary">
			<td>주문Seq</td>
			<td>주문(오더)번호</td>
			<td>공급번호</td>
			<td>부품명</td>
			<td>Brand</td>
			<td>주문수량</td>
			<td>단위</td>
			<td>가격</td>
			<td>주문금액</td>
			<td>공급Q'Ty</td>
			<td>공급금액</td>
			<td>차종코드</td>
			<td>MODEL NAME</td>
			<td>품목</td>
			<td>부피</td>
			<td>무게</td>
			<td>상세보기클릭</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="detailList2" items="${detailList2}">
			<TR>
				<td>${detailList2.oid}</td>
				<td>${detailList2.partsNumber}</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</TR>
		</c:forEach>
	</tbody>
</table>
</div> 	
</body>
