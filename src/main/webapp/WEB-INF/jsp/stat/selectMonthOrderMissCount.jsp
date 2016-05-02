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
    
<h3>월별 미처리 수량</h3>

	<form class="form-horizontal" role="form">
	
	<div class="form-inline">
		<label for="sel1"  class="control-label">해당년도 </label>
		<div class="form-group">
			<div class="col-xs-3">
				  <select class="form-control" id="sel1">
				    <option>2016</option>
				    <option>2015</option>
				    <option>2014</option>
				    <option>2013</option>
				  </select>
			</div>
		</div>

		<label for="usr" >부품번호</label>	
		<div class="form-group">
		    <div class="col-md-1" >
			  <input type="text" class="form-control" id="usr">
			</div>
		</div>
		<button type="button" class="btn btn-primary" > 조회 </button>
		<button type="button" class="btn btn-primary" > 엑셀다운 </button>
	</div>
	</form>

	
      <table class="table table-bordered">
		<tr class="success alt">
			<td></td>
			<td>1</td>
			<td>2</td>
			<td>3</td>
			<td>4</td>
			<td>5</td>
			<td>6</td>
			<td>7</td>
			<td>8</td>
			<td>9</td>
			<td>10</td>
			<td>11</td>
			<td>12</td>
		</tr>
		<tr>
			<td>품목명</td>
			<td>5개</td>
			<td>8개</td>
			<td>0개</td>
			<td>0개</td>
			<td>0개</td>
			<td>3개</td>
			<td>0개</td>
			<td>0개</td>
			<td>0개</td>
			<td>10개</td>
			<td>0개</td>
			<td>2개</td>
		</tr>
	  </table>

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