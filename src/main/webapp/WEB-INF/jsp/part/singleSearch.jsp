<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<!-- Bootstrap core CSS -->
<link href="/resources/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="bootstrap/dist/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery.min.js"></script>
</head>

<script>
	$(function() {

		$('#selectBtn').click(function() {
			if ($('#partsNumber').val().trim() == '') {
				alert("부품번호를 입력하세요");
				return false;
			}

			if ($('#quantity').val().trim() == '') {
				alert("수량을 입력하세요");
				return false;
			}

			$('#selectForm').submit();
		});

	});
</script>
<body>

	<div class="container">

		<h3>단품 부품 조회</h3>

		<form class="form-horizontal" role="form" id="selectForm"
			method="post" action='/part/findSingleSearch'>

			<div class="form-group">

				<div class="col-xs-5">
					<label for="brandCode" class="control-label">브랜드 </label> <select
						class="form-control" id="brandCode" name="brandCode">
						<option>M003</option>
					</select>
				</div>

				<div class="col-xs-5">
					<label for="category" class="control-label">카테고리 </label> <select
						class="form-control" id="category" name="category">
						<option>1</option>
					</select>

				</div>
			</div>

			<div class="form-group">
				<div class="col-md-5">
					<label for="partsNumber">부품번호</label> <input type="text"
						class="form-control" id="partsNumber" name="partsNumber"
						value="${partsNumber }">
				</div>
				<div class="col-md-5">
					<label for="quantity">수량</label> <input type="text"
						class="form-control" id="quantity" name="quantity"
						value="${quantity }">
				</div>
				<button type="button" class="btn btn-primary" id="selectBtn">
					조회</button>
			</div>




			<table class="table table-bordered">
				<tr class="info alt">
					<td>No</td>
					<td><input type="checkbox" id="checkAll" /></td>
					<td>브랜드</td>
					<td>카테고리</td>
					<td>부품번호</td>
					<td>부품명</td>
					<td>생가</td>
					<td>수량</td>
					<td>총액</td>
				</tr>
				<c:forEach items="${selectPart }" var="item">
					<tr>
						<td>${item.oid }</td>
						<td><input type="checkbox" /></td>
						<td>${item.brandCode }</td>
						<td>카테고리</td>
						<td>${item.partsNumber }</td>
						<td>${item.partsNameKo }(${item.partsNameEn })</td>
						<td>${item.price }</td>
						<td>${quantity }</td>
						<td>${item.price * quantity }원</td>
					</tr>
				</c:forEach>
			</table>

		</form>

		<label class="radio-inline"><input type="radio"
			name="optradio">조회함(2015-11-11)</label> <label class="radio-inline"><input
			type="radio" name="optradio">조회함(2015-11-12)</label>
		<button type="button" class="btn btn-primary">조회리스트에 추가</button>
	</div>
	<!-- /container -->
</body>

