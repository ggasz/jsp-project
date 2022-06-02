<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.PrintWriter" %>
<%@ page import = "subject.*" %>
<%@ page import = "java.util.*" %>
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
	<%
		int pageNumber = 1;			//기본 페이지
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>	
	<div style="width:auto" class = "container">
		<div style="width: 1000px; margin: auto;">					
		<div style="text-align:center;">
			<form method="post" name="search" action="search.so">
				<table class="pull-right" style="margin-bottom: 20px">
						<tr>
							<td><select class="form-control" name="searchField">								
									<option value="s_name" selected>과정명</option>
									<option value="s_code">과정코드</option>
									<option value="s_professor">담당교수</option>								
							</select></td>
							<td><input type="text" class="form-control"
								placeholder="검색" name="searchText" maxlength="100"></td>
							<td><input type="submit" class="btn btn-info" value = "검색"></td>
							<a href ="insert.so" class="btn btn-primary pull-left">과정등록</a>	
						</tr>
	
					</table>
				</form>
		</div>
			<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
				<tr>
					<th style="background-color:#eeeeee; text-align:center;">번호</th>
					<th style="background-color:#eeeeee; text-align:center;">과정명</th>
					<th style="background-color:#eeeeee; text-align:center;">과정코드</th>
					<th style="background-color:#eeeeee; text-align:center;">과정시작</th>
					<th style="background-color:#eeeeee; text-align:center;">과정종료</th>
					<th style="background-color:#eeeeee; text-align:center;">관리</th>
					<th style="background-color:#eeeeee; text-align:center;">담당교수</th>					
				</tr>
				<%
					SubjectDAO subjectDao = SubjectDAO.getInstance();
					List<SubjectDTO> list = subjectDao.subjectList(); 
					/* List<SubjectDTO> list = subjectDao.getList(pageNumber); // 페이징 처리  */
				int a = 0;
					for(SubjectDTO b : list){
						a=a+1;					
				%>
				<tr>
					<td><%=a %></td> 
					<th style="background-color:#FFFFFF; text-align:center;"><a href="select.so?s_id=<%=b.getS_id()%>"><%=b.getS_name() %></a></th>  <!-- 수정필요  -->
					<th style="background-color:#FFFFFF; text-align:center;"><%=b.getS_code() %></th>
					<th style="background-color:#FFFFFF; text-align:center;"><%=b.getS_start() %></th>
					<th style="background-color:#FFFFFF; text-align:center;"><%=b.getS_end() %></th>
					<th style="background-color:#FFFFFF; text-align:center;"><%=b.getS_manage() %></th>
					<th style="background-color:#FFFFFF; text-align:center;"><%=b.getS_professor() %></th>
				<%
						
					}
				%>								
				</table>
					<div class=container style="text-align: center">
						<%
							if (pageNumber != 1) {//이전페이지로
						%>
						<a href="home.do?pageNumber=<%=pageNumber - 1%>">◀ 이전</a>
						<%
							}
						%>
						<%
							int n = (int) (subjectDao.getCount() / 10 + 1);
							for (int i = 1; i <= n; i++) {
						%>
						<a href="home.do?pageNumber=<%=i%>">|<%=i%>|
						</a>
						<%
							}
						%>
						<%
							if(subjectDao.nextPage(pageNumber + 1)) {//다음페이지가 존재하는ㄱ ㅏ
						%>
						<a href="home.do?pageNumber=<%=pageNumber + 1%>">다음 ▶</a>
						<%
							}
						%>				
				</div>				
			</div>
		</div>
	
	 <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js">
     <script src="js/bootstrap.min.js"></script> -->
</body>
</html>