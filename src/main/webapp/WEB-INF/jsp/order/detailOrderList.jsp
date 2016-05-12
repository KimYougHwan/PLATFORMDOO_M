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
    	 	$('#partsnum').click(function(){
    	 		$('#layerpop').show();
    	 	});
    	 	$('.close').click(function(){
    	 		$('#layerpop').hide();
    	 	});
    	 	$('#closebtn').click(function(){
    	 		$('#layerpop').hide();
    	 	});
    	 	
    	 	if(${pagecount} > 10){
    	 		$('li').eq(1).addClass("active");
    	 	}else{
    	 		$('li').eq(0).addClass("active");
    	 	}
    	 	$('#someDate').daterangepicker();
    	 	$('#dateList').click(function(){
    	 		$('#chkdate').val($('#someDate').val());
    	 	});
    	 	$('#backorderList').click(function(){
    	 		$('#backpagesum').val($('#pagenum').val());
    	 		$('#backchkdate').val($('#chkdate').val());
    	 	});
    	 	runpage('${pagea}','${nowpage}');
    	});
    	
		function detailnumattr(partsnum){
    		
			$('#ppage').val($('#backpage').val());
			$('#ppagesum').val($('#pagenum').val());
			$('#pchkdate').val($('#chkdate').val());
			$('#partnum').val(partsnum);
			
			document.partnumForm.submit() ;
    		
    	}
    	
    	function runpage(num, now){
    		var test="";
    		var pagenum=$('#pagenum').val();
    		var pixs=now;
    		$('#pagenum').val(pixs);
    		var html="";
    		var nowcount=($('#pagenum').val()/100)*10;
    		if($('#pagecount').val() > nowcount+10){
    			if(pixs < 100){
    				html += '<li class="disabled"><a href="javascript:pageclick(\''+pixs+'\',"beforepage");"><span class="glyphicon glyphicon-chevron-left"></span></a></li>';
    			}else{
    				html += '<li><a href="javascript:pageclick(\''+pixs+'\',\'beforepage\');"><span class="glyphicon glyphicon-chevron-left"></span></a></li>';
    			}
    			for(var i=1; i<11; i++){
    				var chk=i+nowcount;
    				html += '<li><a href="javascript:pagenumclick(\''+i+'\');"><span class="glyphicon">'+chk+'</span></a></li>';
    			}
    			html += '<li><a href="javascript:pageclick(\''+pixs+'\',\'afterpage\');"><span class="glyphicon glyphicon-chevron-right"></span></a></li>';
    		}else{
    			html += '<li><a href="javascript:pageclick(\''+pixs+'\',\'beforepage\');"><span class="glyphicon glyphicon-chevron-left"></span></a></li>';
    			for(var i=1; i<$('#pagecount').val()-nowcount; i++){
    				var chk=i+nowcount;
    				html += '<li><a href="javascript:pagenumclick(\''+i+'\');"><span class="glyphicon">'+chk+'</span></a></li>';
    			}
    			html += '<li class="disabled"><a href="javascript:pageclick(\''+pixs+'\',\'afterpage\');"><span class="glyphicon glyphicon-chevron-right"></span></a></li>';
    		}
    		$('#pagemain').html(html);
    		$('li').eq(num).addClass("active"); 
    		
	 	}
    	
    	function pageclick(num, now){
    		var test="";
    		var pagenum=$('#pagenum').val();
    		var pixs=0;
    		if(now == "beforepage"){
    			pixs=Number(pagenum)-100;
    			$('#pagenum').val(pixs);
    		}else{
    			pixs=Number(pagenum)+100;
    			$('#pagenum').val(pixs);
    		}
    		
    		var html="";
    		var nowcount=($('#pagenum').val()/100)*10;
    		if($('#pagecount').val() > nowcount+10){
    			if(pixs < 100){
    				html += '<li class="disabled"><a href="javascript:pageclick(\''+pixs+'\',"beforepage");"><span class="glyphicon glyphicon-chevron-left"></span></a></li>';
    			}else{
    				html += '<li><a href="javascript:pageclick(\''+pixs+'\',\'beforepage\');"><span class="glyphicon glyphicon-chevron-left"></span></a></li>';
    			}
    			for(var i=1; i<11; i++){
    				var chk=i+nowcount;
    				html += '<li><a href="javascript:pagenumclick(\''+i+'\');"><span class="glyphicon">'+chk+'</span></a></li>';
    			}
    			html += '<li><a href="javascript:pageclick(\''+pixs+'\',\'afterpage\');"><span class="glyphicon glyphicon-chevron-right"></span></a></li>';
    		}else{
    			html += '<li><a href="javascript:pageclick(\''+pixs+'\',\'beforepage\');"><span class="glyphicon glyphicon-chevron-left"></span></a></li>';
    			for(var i=1; i<$('#pagecount').val()-nowcount; i++){
    				var chk=i+nowcount;
    				html += '<li><a href="javascript:pagenumclick(\''+i+'\');"><span class="glyphicon">'+chk+'</span></a></li>';
    			}
    			html += '<li class="disabled"><a href="javascript:pageclick(\''+pixs+'\',\'afterpage\');"><span class="glyphicon glyphicon-chevron-right"></span></a></li>';
    		}
    		$('#pagemain').html(html);
    		pageajax(1, pixs);
    		$('li').eq(1).addClass("active"); 
    		
	 	}
    	
    	function pagenumclick(num){
    		$('li').removeClass('active');
   			$('li').eq(num).addClass("active"); 
   			$('#backpage').val(num);
   			var pagenum=$('#pagenum').val();
   			pageajax(num, pagenum);
   		}
    	
    	function pageajax(num, pagenum){
    		
    		var listdate=$('#chkdate').val();
    			
    		$.ajax({
   	            url : "/order/detailListAjax.do",
   	            type: "get",
   	         	data : { "page" : num , "pagesum" : pagenum , "listDate" : listdate },
   	         	//dataType : 'json',
   	            timeout:10000,
   	         	success:function(data){
   	         		
   	         		var listdata = JSON.stringify(data);
   	         		var listmain = JSON.parse(listdata);
					var html="";
   	         		for(var i = 0 ; i < listmain.length ; i++) {
   	         			html += '<tr>';
   	         			html += '<td>' + listmain[i].oid + '</td>' ;
   	         			html += '<td><a href="javascript:detailnumattr(\''+listmain[i].partsNumber+'\');">' + listmain[i].partsNumber + '</a></td>' ;
   	         			//html += '<td>' + listmain[i].partsNumber + '</td>' ;
   	         			html += '<td></td>' ;
	         			html += '<td></td>' ;
	         			html += '<td></td>' ;
   	         			html += '<td></td>' ;
   	         			html += '<td></td>' ;
         				html += '<td></td>' ;
         				html += '</tr>'
   	          		} 
   	         		$('#detailTable > tbody').html(html);
   	         		   	         		
   	            },
   	         	error:function(request,status,error){
   	          		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
   	         	}
   	        });
    	}
	</script>
</head>
<body>
<form name="pageForm" action="/order/detailOrderList.do">
<input type="hidden" id="pagenum" value="${nowpage}">
<input type="hidden" id="pagecount" value="${pagecount}">
</form>
<form name="partnumForm" action="/order/detailOrderList2.do">
<input type="hidden" id="ppage" name="ppage" value="">
<input type="hidden" id="ppagesum" name="ppagesum" value="">
<input type="hidden" id="pchkdate" name="pchkdate" value="">
<input type="hidden" id="partnum" name="partnum" value="">
</form>
<div class="container">
<br/>
	<div class="row">
		<div class="col-md-5"><input id="someDate" type="text" readonly="readonly"></div>
		<div class="col-md-1"><form name="listchk" action="/order/detailOrderList.do">
								<input type="hidden" id="page" name="page" value="1">
								<input type="hidden" id="pagesum" name="pagesum" value="0">
								<input type="hidden" id="chkdate" name="chkdate" value="N">
		<button class="btn btn-primary pull-right" type="submit" id="dateList">기간설정 재 조회</button></form></div>
		<div class="col-md-1"></div>
		<div class="col-md-1"><button class="btn btn-primary pull-right" type="submit" id="excelList">엑셀다운</button></div>
		<div class="col-md-1"></div>
		<div class="col-md-1"><form name="backlist" action="/order/backOrderList.do">
								<input type="hidden" id="backpage" name="backpage" value="1">
								<input type="hidden" id="backpagesum" name="backpagesum" value="0">
								<input type="hidden" id="backchkdate" name="backchkdate" value="N">
								<button class="btn btn-primary pull-right" type="submit" id="backorderList">백오더리스트 조회</button></form></div>
		<div class="col-md-1"></div>
		<div class="col-md-1"><button class="btn btn-primary pull-right" type="submit" id="inputList">선적정보 입력하기</button></div>
	</div>
<br/>
<br/>
<table class="table table-bordered" id="detailTable">
	<thead>
		<tr class="bg-primary">
			<td>No</td>
			<td>주문번호</td>
			<td>주문일</td>
			<td>결제예정액</td>
			<td>주문 물품대금</td>
			<td>실 물품대금</td>
			<td>결재액</td>
			<td>완료여부</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="detailList" items="${detailList}">
			<TR>
				<td>${detailList.oid}</td>
				<td><a href="javascript:detailnumattr('${detailList.partsNumber}');">${detailList.partsNumber}</a></td>
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
<div class="row" align="center">
		<ul class="pagination pagination" id="pagemain">
			<%-- <c:if test="${pagecount > 10}">
			<li class="disabled"><a href="javascript:pageclick('${pageui}','beforepage');"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
			<c:forEach var="pageui" begin="1" step="1" end="10">
			<li><a href="javascript:pagenumclick('${pageui}');"><span class="glyphicon"><c:out value="${pageui}" /></span></a></li>
            </c:forEach>
            <li><a href="javascript:pageclick('${pageui}','afterpage');"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
            </c:if>
            <c:if test="${pagecount < 10}">
			<c:forEach var="pageui" begin="1" step="1" end="${pagecount}" >
			<li><a href="javascript:pagenumclick('${pageui}');"><span class="glyphicon"><c:out value="${pageui}" /></span></a></li>
            </c:forEach>
            </c:if> --%>
        </ul>
    </div>
</div> 	
</body>
