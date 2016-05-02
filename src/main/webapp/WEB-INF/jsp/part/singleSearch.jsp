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

    <div class="container">
    
<h3>단품 부품 조회</h3>

	<form class="form-horizontal" role="form">
	
	<div class="form-group">
		
		<div class="col-xs-5">
		<label for="sel1"  class="control-label">브랜드 </label>
			  <select class="form-control" id="sel1">
			    <option>1</option>
			    <option>2</option>
			    <option>3</option>
			    <option>4</option>
			  </select>
		</div>
	
		
	
		<div class="col-xs-5">
		<label for="sel2" class="control-label">카테고리 </label>
		  	<select class="form-control" id="sel2">
			    <option>1</option>
			    <option>2</option>
			    <option>3</option>
			    <option>4</option>
			</select>
		  
		</div>
	</div>
	
	<div class="form-group">
	    <div class="col-md-5" >
		  <label for="usr" >부품번호</label>
		  <input type="text" class="form-control" id="usr">
		</div>
		<div class="col-md-5">
		  <label for="pwd">수량</label>
		  <input type="text" class="form-control" id="pwd">
		</div>
		<button type="button" class="btn btn-primary" > 조회 </button>
	</div>
	
	</form>

	
      <table class="table table-bordered">
		<tr class="info alt">
			<td>No</td>
			<td><input type="checkbox" id="checkAll"/></td>
			<td>브랜드</td>
			<td>카테고리</td>
			<td>부품번호</td>
			<td>부품명</td>
			<td>생가</td>
			<td>수량</td>
			<td>총액</td>
		</tr>
		<tr>
			<td>1</td>
			<td><input type="checkbox" /></td>
			<td>샘숭</td>
			<td>테레비</td>
			<td>2313</td>
			<td>테레비2313</td>
			<td>1000</td>
			<td>2</td>
			<td>2000</td>
		</tr>
	  </table>

      
      <label class="radio-inline"><input type="radio" name="optradio">조회함(2015-11-11)</label>
	  <label class="radio-inline"><input type="radio" name="optradio">조회함(2015-11-12)</label>
	  <button type="button" class="btn btn-primary" > 조회리스트에 추가 </button>
    </div> <!-- /container -->


</body>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/jquery.min.js"><\/script>')</script>
<script src="bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<script src="assets/js/vendor/holder.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="assets/js/ie10-viewport-bug-workaround.js"></script>