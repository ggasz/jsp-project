<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ page import ="java.io.PrintWriter" %>
<%@page import="subject.*" %>
<%@page import="member.*" %>
<%@page import="company.*" %>
<%@page import="consequence.*" %>
<%@page import="java.util.*" %>
<meta name='viewport' content="width=device-width",initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>팀별실적</title>
 <%@ include file = "WEB-INF/menu2.jsp"%>
</head>
<body>

<!-- 첫번째 테이블  -->
	<div style ="font-size: 11px; margin-top: 50px; width:1000px;" name="insert" >
		<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th>팀별</th>
					<th>모집정원</th>
					<th>모집인원</th>
					<th>수료인원</th>
					<th>중탈인원</th>
					<th>일반취업</th>
					<th>최종수료</th>
					<th>가중치취업</th>
				</tr>
				
				<tr>
					<th>교무1팀</th>
					<th>420</th>
					<th>#</th>
					<th>#</th>
					<th>#</th>
					<th>#</th>
					<th>#</th>
					<th>#</th>
				</tr>
				
				<tr>
					<th>교무2팀</th>
					<th>470</th>
					<th>#</th>
					<th>#</th>
					<th>#</th>
					<th>#</th>
					<th>#</th>
					<th>#</th>
				</tr>
				
				<tr>
					<th>교무3팀</th>
					<th>470</th>
					<th>#</th>
					<th>#</th>
					<th>#</th>
					<th>#</th>
					<th>#</th>
					<th>#</th>
				</tr>
				
				<tr>
					<th>전체현황</th>
					<th>1271</th>
					<th>#</th>
					<th>#</th>
					<th>#</th>
					<th>#</th>
					<th>#</th>
					<th>#</th>
				</tr>
			</thead>
		</table>
	</div>
	
<!-- 2번쨰 테이블  -->

	<div style ="font-size: 11px; margin-top: 50px; width:1000px;" name="insert" >
			<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th>팀별</th>
						<th>정원비중</th>
						<th>모집률</th>
						<th>수료율</th>
						<th>중탈률</th>
						<th>일반취업률</th>
						<th>수료자비중</th>
						<th>가중치취업률</th>
					</tr>
					
					<tr>
						<th>교무1팀</th>
						<th>420</th>
						<th>#</th>
						<th>#</th>
						<th>#</th>
						<th>#</th>
						<th>#</th>
						<th>#</th>
					</tr>
					
					<tr>
						<th>교무2팀</th>
						<th>470</th>
						<th>#</th>
						<th>#</th>
						<th>#</th>
						<th>#</th>
						<th>#</th>
						<th>#</th>
					</tr>
					
					<tr>
						<th>교무3팀</th>
						<th>470</th>
						<th>#</th>
						<th>#</th>
						<th>#</th>
						<th>#</th>
						<th>#</th>
						<th>#</th>
					</tr>
					
					<tr>
						<th>전체현황</th>
						<th>1271</th>
						<th>#</th>
						<th>#</th>
						<th>#</th>
						<th>#</th>
						<th>#</th>
						<th>#</th>
					</tr>
				</thead>
			</table>
		</div>
		
		
		
<!-- 3번째 테이블  -->



	<div style ="font-size: 11px; margin-top: 50px; width:1000px;" name="insert" >
			<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th rowspan = "2" style=" text-align: center;">구분</th>
						<th rowspan = "2" colspan = "2" style="text-align: center;">직종</th>
						<th rowspan = "2" style="text-align: center;">2022년 적용<br>전국평균 취업률</th>
						<th colspan = "5">2021년 종료과정 中 관리기간 종료과정 (25개/51개 과정)</th>
						
					</tr>
					
					<tr>						
						<th>종료과정수/미종료과정수</th>
						<th>수료인원</th>
						<th>취업인원</th>
						<th>취업률</th>
						<th>평균대비</th>
					</tr>
					
			<%
					SubjectDAO subjectDao = SubjectDAO.getInstance();
					List<SubjectDTO> list = subjectDao.subjectList2();
					for(SubjectDTO b : list){
					
					MemberDAO memberDao = MemberDAO.getInstance();
					List<MemberJoin> list2 = memberDao.selectList(b.getS_id());
				
			%>
				<tr>
				<th style="text-align:center; "><%=b.getS_affiliation() %></th>
				<th style="text-align:center;"><%=b.getS_profession() %></th>
				<th>#</th>
				<th>#</th>
				<th>#</th>
				<th>#</th>
				<th>#</th>
				<th>#</th>
				<th>#</th>
				
				</tr>
			<%
					}
			%>	
					
					<%-- <tr>
						<th ><%= %></th>
						<th>150102</th>
						<th>기계설계</th>
						<th>75.8</th>
						<th>#</th>
						<th>#</th>
						<th>#</th>
						<th>#</th>
						<th>#</th>
					</tr>
					
					<tr>
						<th>1팀</th>
						<th>150502</th>
						<th>냉동건조</th>
						<th>72.8</th>
						<th>#</th>
						<th>#</th>
						<th>#</th>
						<th>#</th>
						<th>#</th>
					</tr>
					
					<tr>
						<th>1팀</th>
						<th>160105</th>
						<th>용접</th>
						<th>75.3</th>
						<th>#</th>
						<th>#</th>
						<th>#</th>
						<th>#</th>
						<th>#</th>
					</tr>		
					
					<tr>
						<th>1팀</th>
						<th>160105</th>
						<th>전기공사</th>
						<th>71.9</th>
						<th>#</th>
						<th>#</th>
						<th>#</th>
						<th>#</th>
						<th>#</th>
					</tr> --%>
				</thead>
			</table>
		</div>
</body>
</html>