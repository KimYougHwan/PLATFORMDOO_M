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
   		$('#someDate').daterangepicker();
	 	$('#dateList').click(function(){
	 		var listdate=$('#someDate').val();
	 		alert(listdate);
	 		$.ajax({
   	            url : "/order/backOrderListAjax.do",
   	            type: "get",
   	         	data : {"listDate" : listdate },
   	         	//dataType : 'json',
   	            timeout:10000,
   	         	success:function(data){
   	         		
   	         		var listdata = JSON.stringify(data);
   	         		var listmain = JSON.parse(listdata);
					var html="";
   	         		for(var i = 0 ; i < listmain.length ; i++) {
   	         			html += '<tr>';
   	         			html += '<td></td>' ;
   	         			html += '<td>' + listmain[i].cartnumber + '</td>' ;
   	         			html += '<td></td>' ;
	         			html += '<td>' + listmain[i].partsnumber + '</td>' ;
	         			html += '<td>' + listmain[i].partnameko + '</td>' ;
	         			html += '<td>' + listmain[i].brandcode + '</td>' ;
	         			html += '<td>' + listmain[i].ordercnt + '</td>' ;
	         			html += '<td>' + listmain[i].unitoid + '</td>' ;
	         			html += '<td></td>' ;
	         			html += '<td>' + listmain[i].ordersum + '</td>' ;
	         			html += '<td>' + listmain[i].provideqty + '</td>' ;
   	         			html += '<td>' + listmain[i].providesum + '</td>' ;
   	         			html += '<td></td>' ;
         				html += '<td></td>' ;
         				html += '</tr>'
   	          		} 
   	         	
   	         		$('#baclisttable > tbody').html(html);
   	         		   	         		
   	            },
   	         	error:function(request,status,error){
   	          		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
   	         	}
   	        });
	 	});
	});
</script>
</head>
<body>
<div class="container">
<br/>
	<div class="row">
		<div class="col-md-5"><input id="someDate" type="text" readonly="readonly"></div>
		<div class="col-md-1"><button class="btn btn-primary pull-right" type="submit" id="dateList">기간설정 재 조회</button></div>
		<div class="col-md-1"></div>
		<div class="col-md-1"></div>
		<div class="col-md-1"></div>
		<div class="col-md-1"><button class="btn btn-primary pull-right" type="submit" id="excelList">엑셀다운</button></div>
		<div class="col-md-1"></div>
		<div class="col-md-1"><form name="backpage" action="/order/detailOrderList.do">
								<input type="hidden" id="page" name="page" value="${page}">
								<input type="hidden" id="pagesum" name="pagesum" value="${pagesum}">
								<input type="hidden" id="chkdate" name="chkdate" value="${chkdate}">
		<button class="btn btn-primary pull-right" type="submit" id="backList">뒤로가기</form>	</button></div>
	</div>
<br/>
<br/>
<table class="table table-bordered" id="baclisttable">
	<thead>
		<tr class="bg-primary">
			<td>선적 Seq</td>
			<td>주문(오더)번호</td>
			<td>주문(오더)Seq</td>
			<td>공급번호</td>
			<td>부품명</td>
			<td>Brand</td>
			<td>주문수량</td>
			<td>단위</td>
			<td>가격</td>
			<td>주문금액</td>
			<td>공급Q'TY</td>
			<td>공급금액</td>
			<td>백오더수량</td>
			<td>백오더 합계급액</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="backorderlist" items="${backorderlist}">
			<TR>
				<td></td>
				<td>${backorderlist.cartnumber}</td>
				<td></td>
				<td>${backorderlist.partsnumber}</td>
				<td>${backorderlist.partnameko}</td>
				<td>${backorderlist.brandcode}</td>
				<td>${backorderlist.ordercnt}</td>
				<td>${backorderlist.unitoid}</td>
				<td></td>
				<td>${backorderlist.ordersum}</td>
				<td>${backorderlist.provideqty}</td>
				<td>${backorderlist.providesum}</td>
				<td></td>
				<td></td>
			</TR>
		</c:forEach>
	</tbody>
</table>

</div> 	
</body>
 