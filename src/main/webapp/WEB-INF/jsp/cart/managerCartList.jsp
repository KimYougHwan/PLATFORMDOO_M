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
<body onload="loadBoard()">
<div class="container">
	<form class="form-horizontal" name="myForm" method="post" action="">
	<DIV class="table">
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
			<c:forEach var = "list" items="${list}">
				<tr>
					<td align="center" ><input type="checkbox" name="chkBox"  onclick="changeChkBox(this)" value = "${list.cartNumber}" ></td>
					<td align="center"><input type="hidden" name="chkBox2"  onclick="changeChkBox(this)" value = "${list.cartNumber}" >${list.cartNumber}</td>
					<td align="right" ><input type="hidden" name = "orderCnt" value = "" >${list.orderCnt}</td>
					<td align="right"><input type="hidden" name = "totalAmount" value = "" >${list.totalAmount}</td>
					<td align="center"><input type="hidden" name = "depositDate" value = "" >${list.depositDate}</td>
					<td><input type="hidden" name = "status" value = "${list.status}" >
					     D - ${list.dDay}
						<c:if test="${list.status==1}">(입금확인중)</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
		</TABLE>
	</DIV>

	<div align="right">
		<a type="button" class="btn btn-primary" onclick="selectDetailCart()">상세보기</a>
		<a type="button" class="btn btn-primary" onclick="update()">주문하기</a>
		<button type="submit" class="btn btn-primary">삭제</button>
	</div>
	<div>
	<ul class="pagination" id ="test" >
	   <li class="disabled" id="pre"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
	   <li><a href="#" ></a></li>
	   <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
	</ul>
	</div>
	</form>
</div>
</body>
</html>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function selectDetailCart(){
	var len = document.all.chkBox.length;
	var cartNumber = null;
	var status = null;
	var form=document.myForm; //폼 name

	//라디오박스 체크 여부 확인
	for(i = 0; i < len; i++){
		if(document.all.chkBox[i].checked==true)
		{
			//파라미터 담는다
			cartNumber = document.all.chkBox[i].value;
			status = document.all.status[i].value;
			
			alert(status);
			
		}
	}
	
	
	form.action="/cart/selectDetailCart.do?cartNumber="+cartNumber+"&status="+status;    
	//form.data.value = "asdfsadfasdfa";
    //form.method="post";
    form.submit();
	
}

//체크박스 1개만 선택
function changeChkBox(oid) {
	var obj = document.getElementsByName("chkBox");
	
	for(var i=0; i<obj.length; i++){
		if(obj[i] != oid){
            obj[i].checked = false;
        }
	}
}


</script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="assets/js/ie10-viewport-bug-workaround.js"></script>
