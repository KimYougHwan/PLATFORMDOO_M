<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <!-- Bootstrap core CSS -->
    <link href="../resources/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="../resources/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
    	 	//$('#partdetailmain').hide();
    	 	$('#searchList').click(function(){
    	 		var nameparam="";
    	 		$(":checkbox[name='layercheck']:checked").each(function(pi,po){
    	 			if(nameparam == ""){
    	 				nameparam = "'"+po.value+"'";
    	 			}else{
    	 				nameparam += ",'"+po.value+"'";
    	 			}
    	 		});
    	 		
    	 		if(nameparam == ""){
    	 			alert("값이 없습니다.");
    	 			return;
    	 			
    	 		}
    	 		
    	 		$.ajax({
       	            url : "/order/partdetailmain.do",
       	            type: "get",
       	         	data : { "layercheck" : nameparam },
       	         	//dataType : 'json',
       	            timeout:10000,
       	         	success:function(data){
       	         		var listdata = JSON.stringify(data);
       	         		var listmain = JSON.parse(listdata);
    					var html="";
       	         		for(var i = 0 ; i < listmain.length ; i++) {
       	         			var j=i+1;
       	         			html += '<tr>'
       	         			html += '<td>' + j + '</td>' ;
       	         			html += '<td><input type="checkbox" name="layercheck" value="'+listmain[i].partsNumber+'"></td>' ;
       	         			html += '<td></td>' ;
       	         			html += '<td></td>' ;
   	         				html += '<td>' + listmain[i].partsNumber + '</td>' ;
       	         			html += '<td>' + listmain[i].partsNameKo + '</td>' ;
       	         			html += '<td></td>' ;
    	         			html += '<td></td>' ;
    	         			html += '<td></td>' ;
       	         			html += '<td></td>' ;
       	         			html += '<td></td>' ;
       	         			html += '</tr>'
       	          		} 
       	         		$('#partdetailmain > tbody').html(html);
       	         		   	         		
       	            },
       	         	error:function(request,status,error){
       	          		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       	         	}
       	        });
    	 		
    	 	});
    	 	if(${pagecount} > 10){
    	 		$('li').eq(1).addClass("active");
    	 	}else{
    	 		$('li').eq(0).addClass("active");
    	 	}
    	 	
    	});
    	
    	function pageclick(num, now){
    		var test="";
    		var pagenum=$('#pagenum').val();
    		var pixs=0;
    		if(now == "beforepage"){
    			pixs=Number(pagenum)-200;
    			$('#pagenum').val(pixs);
    		}else{
    			pixs=Number(pagenum)+200;
    			$('#pagenum').val(pixs);
    		}
    		
    		var html="";
    		var nowcount=($('#pagenum').val()/200)*10;
    		if($('#pagecount').val() > nowcount+10){
    			if(pixs < 200){
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
   			var pagenum=$('#pagenum').val();
   			pageajax(num, pagenum);
   		}
    	
    	function pageajax(num, pagenum){
    		$.ajax({
   	            url : "/order/selectDetailAjax.do",
   	            type: "get",
   	         	data : { "page" : num , "pagesum" : pagenum },
   	         	//dataType : 'json',
   	            timeout:10000,
   	         	success:function(data){
   	         		
   	         		var listdata = JSON.stringify(data);			
					var listmain = JSON.parse(listdata);
   	 				var html="";
   	         		for(var i = 0 ; i < listmain.length ; i++) {

   	         			html += '<tr>'
   	         			html += '<td>' + listmain[i].oid + '</td>' ;
   	         			html += '<td><input type="checkbox" name="layercheck" value="'+listmain[i].partsNumber+'"></td>' ;
   	         			html += '<td></td>' ;
   	         			html += '<td>' + listmain[i].partsNumber + '</td>' ;
   	         			html += '<td>' + listmain[i].partsNameKo + '</td>' ;
   	         			/* html += '<td></td>' ;
	         			html += '<td></td>' ;
	         			html += '<td></td>' ;
   	         			html += '<td></td>' ;
   	         			html += '<td></td>' ;
         				html += '<td></td>' ;
         				html += '<td></td>' ;
	         			html += '<td></td>' ;
	         			html += '<td></td>' ;
	         			html += '<td></td>' ;
	         			html += '<td></td>' ;
   	         			html += '<td></td>' ; */
   	         			html += '</tr>'
   	          		} 
   	         		$('#layerPopList > tbody').html(html);
   	         		   	         		
   	            },
   	         	error:function(request,status,error){
   	          		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
   	         	}
   	        });
    	}
    	
	</script>
</head>
<body>
<form name="pageForm">
<input type="hidden" id="pagenum" value="${nowpage}">
<input type="hidden" id="pagecount" value="${pagecount}">
</form>
<div class="modal" id="layerpop" >
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">부품번호 검색</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
<table class="table table-bordered" id="layerPopList">
	<thead>
		<tr class="bg-primary">
			<td>No</td>
			<td>전체선택 <br><input type="checkbox"></td>
			<td>업체코드</td>
			<td>공급번호</td>
			<td>부품명</td><!-- 
			<td>브랜드</td>
			<td>주문수량</td>
			<td>단위</td>
			<td>가격</td>
			<td>AMOUNT</td>
			<td>CLASS</td>
			<td>LEP</td>
			<td>차종코드</td>
			<td>모델명</td>
			<td>품목</td>
			<td>부피</td>
			<td>무게</td> -->
		</tr>
	</thead>
	<tbody>
		<c:forEach var="partsList" items="${partsList}">
			<TR>
				<td>${partsList.oid}</td>
				<td><input type="checkbox" name="layercheck" value="${partsList.partsNumber}"></td>
				<td></td>
				<td>${partsList.partsNumber}</td>
				<td>${partsList.partsNameKo}</td>
				<!-- <td></td>
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
				<td></td> -->
			</TR>
		</c:forEach>
	</tbody>
</table>
	<div class="row" align="center">
		<ul class="pagination pagination" id="pagemain">
			<c:if test="${pagecount > 10}">
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
            </c:if>
        </ul>
    </div>            	
      </div>
      <!-- Footer -->
      <div class="modal-footer">
      
        <button type="button" class="btn btn-default" data-dismiss="modal" id="closebtn">닫기</button>
        
      </div>
    </div>
  </div>
</div>
<div class="container">
<br/>
	<div class="row">
		<div class="col-md-1">브랜드</div>
		<div class="col-md-2"><select>
								<option value="">전체</option>
								<c:forEach var="brandList" items="${brandList}">
									<option value="${brandList.code}">${brandList.codeNm}</option>
								</c:forEach>
							  </select></div>
		<div class="col-md-3"></div>
		<div class="col-md-2">카테고리</div>
		<div class="col-md-2"><select>
								<option value="">전체</option>
								<c:forEach var="categoryList" items="${categoryList}">
									<option value="${categoryList.code}">${categoryList.codeNm}</option>
								</c:forEach>
							  </select></div>
	</div>
	<p>
	<div class="row">
		<div class="col-md-1">부품번호</div>
		<div class="col-md-2"><input type="text" id="partsnum"></div>
		<div class="col-md-3"></div>
		<div class="col-md-2">수량</div>
		<div class="col-md-2"><input type="text"></div>
		<div class="col-md-2"><button class="btn btn-primary pull-right" type="submit" id="searchList">조회</button></div>
	</div>
<br/>
<br/>
<table class="table table-bordered" id="partdetailmain">
	<thead>
		<tr class="bg-primary">
			<td>No</td>
			<td><input type="checkbox"></td>
			<td>브랜드</td>
			<td>카테고리</td>
			<td>부품번호</td>
			<td>부품명</td>
			<td>생가</td>
			<td>주문수량</td>
			<td>확인수량</td>
			<td>주문총액</td>
			<td>확인총액</td>
		</tr>
	</thead>
	<tbody>
		<!-- <tr>
			<td>1</td>
			<td><input type="checkbox"> </td>
			<td>AA</td>
			<td>12</td>
			<td>152</td>
			<td>BB</td>
			<td>2500</td>
			<td>50</td>
			<td>25</td>
			<td>125000</td>
			<td>62500</td>
		</tr> -->
	</tbody>
</table>
<br/>
<div class="row">
	<div class="col-md-4 col-md-offset-4 bg-info">주문 총액 서머리금액 실적 총액 서머리금액</div>
</div>
<br/>
	<button class="btn btn-primary pull-right" type="submit">엑셀다운</button>
<br/>
<br/>
<table class="table table-bordered">
	<thead>
		<tr class="bg-primary">
			<td>No</td>
			<td><input type="checkbox"></td>
			<td>브랜드</td>
			<td>부품번호</td>
			<td>부품명</td>
			<td>생가</td>
			<td>마진율</td>
			<td>판매가</td>
			<td>주문수량</td>
			<td>실적</td>
			<td>주문총액</td>
			<td>실적총액</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>1</td>
			<td><input type="checkbox"> </td>
			<td>AA</td>
			<td>152</td>
			<td>BB</td>
			<td>2500</td>
			<td>20</td>
			<td>3000</td>
			<td>50</td>
			<td>25</td>
			<td>150000</td>
			<td>75000</td>
		</tr>
	</tbody>
</table>
<br/>

</div> 	
</body>
