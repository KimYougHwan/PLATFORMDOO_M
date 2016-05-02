<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div class="container col-sm-7">
		<form id = "test">
			<div class="alert alert-warning" id = "ttt" style="display:none" >
				<strong>라디오 버튼을 선택 해 주세요!</strong><br />
			</div>
			<div class="radio">
			  <label><input type="radio" name="optradio" id ="a" value="1">일련번호 : 부품갯수 :  충금액 : D-1</label>
			</div>
			<div class="radio">
			  <label><input type="radio" name="optradio" id ="a" value="2">일련번호 : 부품갯수 :  충금액 : D-10(입금확인중)</label>
			</div>
			<div class="radio">
			  <label><input type="radio" name="optradio" id ="a" value="3">일련번호 : 부품갯수 :  충금액 : D-1</label>
			</div>
			<div class="radio">
			  <label><input type="radio" name="optradio" id ="a" value="4">일련번호 : 부품갯수 :  충금액 : D-1</label>
			</div>
			<div align="right" >
				<a target="_self" class="btn btn-info" id = "detailCart" onclick="test('optradio','selectDetailCart.do')">상세보기</a>
				<a target="_self" class="btn btn-info" id = "order" onclick="test('optradio','selectDetailCart2.do')">주문하기</a>
				<a target="_self" class="btn btn-info" id = "delete" onclick="test('optradio','managerCartList.do')">삭제</a>
			</div>
		</form>
	</div>
</body>
</html>


<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="assets/js/ie10-viewport-bug-workaround.js"></script>
<script>
	function test(obj,addr){
		//라디오 버튼, 컨트롤러 주소 받음
		var rObj = document.all(obj);
		var chk = null;
		//라디오버튼에서 checked(true)
		for(i = 0; i < rObj.length; i++){
			chk = rObj[i].checked;
			if(chk){
				//파라미터로 받은 주소값으로 이동
				location.href = addr;
				break;
			}
		}
		if(!chk){  //성택된 라디오 버튼이 없을경우 alert 띄움
			document.getElementById("ttt").style.display="block";
		}
	}
	
</script>

