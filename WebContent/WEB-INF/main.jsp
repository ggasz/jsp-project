<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<meta name='viewport' content="width=device-width",initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>메인 겸 과목 리스트</title>
</head>
<body>
	<%@ include file ="menu2.jsp" %>		
	
	<div style="width:auto" class = "container">
		<div style="width: 1000px; margin: auto;">
		<div style="text-align:center;">
			<input type = "text" style="text-align:center; margin-bottom: 20px" placeholder="검색창" >
			<button type="submit" class="btn btn-info">검색</button>
		</div>
			<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
				<tr>
					<th style="background-color:#eeeeee; text-align:center;">과목이름</th>
					<th style="background-color:#eeeeee; text-align:center;">과목코드</th>
					<th style="background-color:#eeeeee; text-align:center;">훈련시작</th>
					<th style="background-color:#eeeeee; text-align:center;">훈련종료</th>
					<th style="background-color:#eeeeee; text-align:center;">관리</th>
					<th style="background-color:#eeeeee; text-align:center;">담당교수</th>					
				</tr>
				<tr>
					<th style="background-color:#FFFFFF; text-align:center;">컴퓨터응용기계설계가공(CAD/CAM)</th>
					<th style="background-color:#FFFFFF; text-align:center;">(AIG20190000253037)</th>
					<th style="background-color:#FFFFFF; text-align:center;">2020-07-24</th>
					<th style="background-color:#FFFFFF; text-align:center;">2021-01-15</th>
					<th style="background-color:#FFFFFF; text-align:center;">2021-08-07</th>
					<th style="background-color:#FFFFFF; text-align:center;">장세동</th>
				</tr>								
				</table>
				<a href ="#" class="btn btn-primary pull-right">과목추가</a>	
			</div>
		</div>	 			
	
	
	 <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
     <script src="js/bootstrap.min.js"></script> -->
</body>
</html>