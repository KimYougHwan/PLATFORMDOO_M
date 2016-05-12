<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<!-- Bootstrap core CSS -->
<link href="/resources/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/bootstrap/dist/js/bootstrap.min.js"></script>
</head>
<script>
var page = 0;
var cnt = 0;

	$(function() {
		closeWindowByMask(); //로딩아이콘 가리개
		
		if('${message}' != ""){ //알림 멧세지
			alert('${message}');	
		}
		
		$('#uploadBtn').click(function() { //엑셀업로드
			if ($('#excelFile').val().trim() == '') {
				alert("엑셀 파일을 선택하세요.");
				return false;
			}

			page = 0;
			wrapWindowByMask();
			$("#selectForm").attr("action", "/part/excelUpload");
			$('#selectForm').submit();
		});
	
		$(window).scroll(function() { //스크롤 페이징
			if ($(window).scrollTop() == $(document).height()- $(window).height()) {
				lastPostFunc();
			}
		});
		
		$("#checkAll").click(function(){ //전체체크
			if($("#checkAll").prop("checked")) {
				$("input[type=checkbox]").prop("checked",true);
			} else {
				$("input[type=checkbox]").prop("checked",false);
			}
		})

		
	});

	function openLayer(){
		
		$.ajax({
			url : '/part/searchLayer',
			data: { page : page},
			dataType : 'html',
			success : function(data) {
				$('#layerContents').html(data);
				$('#layerBtn').click();
			}
		});
	}


	function lastPostFunc() { //스크롤 페이징
		page = page + 1;
		
		var html = "";
		
		$.ajax({
			url : '/part/getMoreExcelUploadList',
			data: { page : page},
			dataType : 'json',
			success : function(data) {

				$.each(data, function(i, item) {
			    	
			    	var oid = item.oid;
					var brandCode = item.brandCode;
					var partsNumber = item.partsNumber;
					var partsNameEn = item.partsNameEn;
					var partsNameKo = item.partsNameKo;
					var price = item.price;
					var quantity = item.quantity;

					html += "<tr id='tr" + oid + "'>";
					html += "<td>" + oid + "</td>";
					html += "<td><input type='checkbox' id='" + oid + "' name='checkBox' value='" + oid + "' /></td>";
					html += "<td>" + brandCode + "</td>";
					html += "<td>카테고리</td>";
					html += "<td>" + partsNumber + "</td>";
					html += "<td>" + partsNameKo +"(" + partsNameEn + ")" + "</td>";
					html += "<td>" + price + "</td>";
					html += "<td>" + quantity + "</td>";
					html += "<td>" + (price*quantity) + "원</td>";
					html += "</tr>";
					
				});
				$("#contents").append(html);
			}
		});
		
		
	};
	
	function wrapWindowByMask() { //로딩중 보이기
        //화면의 높이와 너비를 구한다.
        var maskHeight = $(document).height();  
//      var maskWidth = $(document).width();
        var maskWidth = window.document.body.clientWidth;
         
        var mask = "<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'></div>";
        var loadingImg = '';
         
        loadingImg += "<div id='loadingImg' style='position:absolute; left:50%; top:40%; display:none; z-index:10000;'>";
        loadingImg += " <img src='/resources/viewLoading.gif'/>"; 
        loadingImg += "</div>";   
     
        //화면에 레이어 추가 
        $('body')
            .append(mask)
            .append(loadingImg)
           
        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
        $('#mask').css({
                'width' : maskWidth
                , 'height': maskHeight
                , 'opacity' : '0.3'
        });  
     
        //마스크 표시
        $('#mask').show();    
     
        //로딩중 이미지 표시
        $('#loadingImg').show();
    }
	
	function closeWindowByMask() { //로딩중 가리기
        $('#mask, #loadingImg').hide();
        $('#mask, #loadingImg').remove();   
    }
	
	function deleteRow() { //로우삭제
		
		$('input:checkbox[name="checkBox"]').each(function() {

		      if(this.checked){//checked 처리된 항목의 값
					$("#tr"+this.id).remove();
		      }

		 });
	}
	
	function excelDown() { //엑셀다운
		var checkList = "";
	
		$('input:checkbox[name="checkBox"]').each(function() {
			  
		      if(this.checked){//checked 처리된 항목의 값
		    	  checkList += this.id+",";
		      }

		});
		
		if(checkList.length == 0){
			alert("체크된 항목이 없습니다.");
			return false;
		}else{
			
			$("#selectForm").attr("action", "/part/excelDownload");
			$("#checkList").val( checkList.substr(0,checkList.length - 1) );
			$("#selectForm").submit();
			
		}
	}
	

	
</script>

<body>

	<div class="container" id="container">

		<form class="form-horizontal" enctype="multipart/form-data"	role="form" method="post" id="selectForm">
			<input type="hidden" name="checkList"  id="checkList" />
			<div class="form-group">
				<div class="col-xs-5">
					<input type="file" class="form-control" id="excelFile"	name="excelFile">
				</div>
				<button type="button" class="btn btn-primary" id="uploadBtn">조회</button>
			</div>

			<button type="button" class="btn btn-primary pull-right">조회목록저장</button>
			<button type="button" class="btn btn-primary pull-right">장바구니담기</button>
			<button type="button" class="btn btn-primary pull-right" onclick="excelDown()">엑셀다운</button>
			<button type="button" class="btn btn-primary pull-right" onclick="deleteRow()">선택삭제</button>

		</form>
		<table class="table table-bordered" id="contents">
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
			<c:forEach items="${selectPart }" var="item" varStatus="status">
				<tr id="tr${item.oid }">
					<td>${item.oid }</td>
					<td><input type="checkbox" id="${item.oid }" name="checkBox" value="${item.oid }" /></td>
					<td>${item.brandCode }</td>
					<td>카테고리</td>
					<td onclick="openLayer()">${item.partsNumber }</td>
					<td onclick="openLayer()">${item.partsNameKo }(${item.partsNameEn })</td>
					<td>${item.price }</td>
					<td>${item.quantity }</td>
					<td>${item.price * item.quantity }원</td>
				</tr>
			</c:forEach>

		</table>

		<table class="table table-bordered">
			<tr>
				<td colspan="9" align="right">총액 서머리금액</td>
			</tr>
		</table>

	</div>
	<!-- /container -->
	
	<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" id="layerBtn" style="display:none"></button>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body" id="layerContents">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

</body>
