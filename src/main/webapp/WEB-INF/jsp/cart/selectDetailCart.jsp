<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<TABLE class="table table-striped" border="1">
			<THEAD>
				<TR class="bg-primary">
					<td align="center">선택</Td>
					<td align="center">장바구니 일련번호</td>
					<td align="center">부품갯수</td>
					<td align="center">총금액</td>
					<td align="center">입금확인 만료일</td>
					<td align="center">입금마감</td>
				</TR>
			</THEAD>
			<tbody>
				<tr>
					<td align="center" ></td>
					<td align="center">${cart.cartNumber}</td>
					<td align="center">${cart.orderCnt}</td>
					<td align="center">${cart.totalAmount}</td>
					<td align="cart">${cart.depositDate}</td>
					<td align="cart">D-${cart.dDay}<c:if test="${cart.status==1}">(입금확인중)</c:if></td>
				</tr>
		  </tbody>
		  </TABLE>
	</div><br/>
	<div class="container">
		<div align="center" >
			<button type="button" class="btn btn-primary">장바구니목록</button>
			<button type="button" class="btn btn-primary">선택삭제</button>
			<button type="button" class="btn btn-primary">엑셀다운</button>
			<button type="button" class="btn btn-primary">저장</button>
			<button type="button" class="btn btn-primary">주문하기</button>
		</div><br />
		<div class="table">
			<TABLE class="table table-striped" border="1" >
				<THEAD>
					<TR class="bg-primary" valign="top" >
						<td align="center">No</td>
						<td align="center">전체선택<br /> <input type="checkbox" id="allChk" /></td>
						<td align="center">공급번호(PartNo)-Supplied No</td>
						<td>부품명(Part name)</td>
						<td>Brand</td>
						<td>주문수량</td>
						<td>단위</td>
						<td>평균가격</td>
						<td>주문금액(amount)</td>
						<td>공급업체수</td>
						<td>차종코드 MODEL CODE</td>
						<td>MODEL_NAME</td>
						<td>ITEM(품목)</td>
						<td>부피CBM</td>
						<td>무게WEIGHT</td>
					</TR>
				</THEAD>
				<TBODY>
				
				<c:forEach var = "i" begin = "0" end="${list.size()-1}">
					<TR>
						<td align="center">${i+1}</td>
						<td align="center"><input type="checkbox" id="" /></td>
						<td align="center">${list[i].partsNumber}</td>
						<td>${list[i].partsNameEn}</td>
						<td>${list[i].brandCode}</td>
						<td>${list[i].orderCnt}</td>
						<td>${list[i].unitOid}</td>
						<td>${list[i].price}</td>
						<td>${list[i].totalAmount}</td>
						<td></td>
						<td>${list[i].modelCode}</td>
						<td></td>
						<td>${list[i].itemCode}</td>
						<td>${list[i].bulk}</td>
						<td>${list[i].weight}</td>
					</TR>
				</c:forEach>
				</TBODY>
			</TABLE>
		</div>
	</div>
</body>
</html>




<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="assets/js/ie10-viewport-bug-workaround.js"></script>