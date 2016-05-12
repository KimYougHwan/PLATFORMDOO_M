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
	<form class="form-horizontal" id ="frm" action="/board/qAndAboardDelete" >
	
	<DIV class="table">
		<TABLE class="table table-striped">
			<THEAD>
				<TR class="bg-primary">
					<TH>No</TH>
					<TH><input type="checkbox" id="" onclick="allChk()"/></TH>
					<TH>제목</TH>
					<TH>내용</TH>
					<TH>작성자</TH>
					<TH>작성일자</TH>
				</TR>
			</THEAD>
			<TBODY id="board"></TBODY>
		</TABLE>
	</DIV>

	<div align="right">
		<a type="button" class="btn btn-primary" href="qAndAboardWrite.do">글쓰기</a>
		<a type="button" class="btn btn-primary" onclick="update()">수정</a>
		<a type="button" class="btn btn-primary" onclick="deleteList()">삭제</a>
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
<SCRIPT> 
	//폼 onload() 페이지number, 리스트 따로 불러옴
	function loadBoard(){
		//페에지번호
		pageCall();
		boardList();
	}
	function pageCall(pNum){
		var pNum;
		
		//페이지 출력은 1부터 시작
		if(pNum==null){
			pNum=1;
		}
		$.ajax({
			type : "get",
			 url : "/board/qAndAboardListPaging.do?boardType=qna&pNum="+pNum,
			 //dataType : "json",
			 data : "",
			 async: false,
			 timeout:100000,
			 success : function(result){
				 var list = JSON.stringify(result);
				 var listCnt = JSON.parse(list);
				 page ="";
				 //첫페이지가 1인 경우 > 버튼 비활성화
				 var temp = Number(listCnt[0]);
				 if(temp == 1){
					 page += "<li class='disabled'>"
				 }else{
					 pNum = Number(listCnt[0])-10;	//이전페이지
					 page += "<li class='abled' onclick='pageCall("+pNum+")'>"
				 }
				 page+="<a href='#''><span class='glyphicon glyphicon-chevron-left'></span></a></li>";
				 for(var i = 0 ; i < listCnt.length - 1 ; i++) {
				 	page += "<li id = 'pageNum' onclick='pageNum("+listCnt[i]+")' value="+listCnt[i]+"><a>"+listCnt[i]+"</a></li>";
				 }
				 pNum = Number(listCnt[9])+1;	//다음 페이지
				 //다음 페이지 유무 확인, 10개까지 출력하고  11번째가 존재하면 > 버튼 활성화
				 temp = listCnt[10];
				 if(temp == null){
					 page += "<li class='disabled'>";
				 }else{
					 page += "<li class='abled' onclick='pageCall("+pNum+")'>";
				 }
				 page += "<a href='#'><span class='glyphicon glyphicon-chevron-right'></span></a></li>";
				 $("#test").html(page);
			 },error:function(request,status,error){
	          		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	         	}
		});
	}
	
	function boardList(pageNum){
		
		var page = pageNum;
		
		if(page==null){
			page=0;
		}
		/*if(page==9999){
			var len = document.all.pageNum.length;
			alert(document.all.pageNum[9].value);
			page = 10;
		}*/
		
		$.ajax({
			type : "get",
			 url : "/board/qAndAboardListController.do?pageNum="+page,
			 //dataType : "json",
			 data : "",
			 timeout:100000,
			 success : function(result){
				 
				var listdata = JSON.stringify(result);			
				var boardList = JSON.parse(listdata);
				var boardTable = "";
				if(boardList.length == null){
					html= "<tr><td>게시글이 없습니다</tr></td>";
				}else{
					for(var i = 0; i < boardList.length; i++){
						boardTable += "<tr>";
						boardTable += "<td>"+boardList[i].oid+"</td>";
						boardTable += "<Td><input type='checkbox' name='oid' value="+boardList[i].oid+"></Td>";
						boardTable += "<td>"+boardList[i].title+"</td>";
						boardTable += "<td>"+boardList[i].comm+"</td>";
						boardTable += "<td>"+boardList[i].createUser+"</td>";
						boardTable += "<td>"+boardList[i].createDate+"</td>";
						boardTable += "</tr>";
					}
					//<Td><input type="checkbox" name="oid" value ="${boardList.oid}"/></Td>
				}
				$("#board").html(boardTable);
			 },error:function(request,status,error){
	          		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	         	}
		});
	}
	//0페이지부터 시작
	function pageNum(pageNum){
		var pNum = pageNum - 1;
		boardList(pNum);
	}
	//수정버튼 click
	function update(){
		var len = document.all.oid.length;
		var num = null;
		var cnt = 0;
		//라디오박스 체크 여부 확인
		for(i = 0; i < len; i++){
			if(document.all.oid[i].checked==true)
			{
				//글번호를 num에 저장
				num = document.all.oid[i].value;
				cnt++;
			}
		}
		//라디오 박스 1개 체크시 수정가능 수정가능
		if(cnt == 1){
			location.href='qAndAboardUpdate.do?oid='+num;
		}else{
			alert("게시글 1개를 선택 해 주세요");
		}
	}
	
	//전체 채크
	function allChk(){
		var len = document.all.oid.length;
		//전체 체크
		for(i = 0; i < len; i++){
			document.all.oid[i].checked=true;
		}
	}
	
	function deleteList(){
		var len = document.all.oid.length;
		var num = null;
		var cnt = 0;
		//라디오박스 체크 여부 확인
		for(i = 0; i < len; i++){
			if(document.all.oid[i].checked==true)
			{
				cnt++;
			}
		}
		if(cnt > 0){
			var test = document.getElementById("frm").submit();
		}
	}
	
	
</script>

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="assets/js/ie10-viewport-bug-workaround.js"></script>
