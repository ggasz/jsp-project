<%@page import="subject.SubjectDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.PrintWriter" %>
<!-- 인원정보  -->
<%@ page import ="member.*" %>
<!-- 업체현황  -->
<%@ page import ="company.*" %>
<!-- 인원결과  -->
<%@ page import ="consequence.*" %>
<%@	page import ="note.*" %>
<%@ page import = "java.util.List" %>
<%@page import="java.text.DecimalFormat"%>
<%@ page import= "java.sql.*" %>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<meta name='viewport' content="width=device-width",initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>수강인원 목록</title>
<style type = "text/css">
	a,a:hover{
		color:#000000;
		text-decoration:none;
	}
	td{
		border: 1px; solid #ddddddd;
	}
</style>
</head>
<body>

	<%!
 						DecimalFormat format = new DecimalFormat(".0");
 						double a = 0;			//모집인원
 						double c = 0;			//수료인원
 						double re1 = 0;			//중도탈락
 						double re2 = 0;			//조기취업
 						int re3 = 0;			//이수취업
 						int re4 = 0;			//수료취업
 						int re5 = 0;			//수료미취업
 						int re6 = 0;			//산정제외-수료후
 						int re7 = 0;			//산정제외-재직자
 						int re8 = 0;			//산정제외-수료전
 						double re9 = 0;			//산정인원
 						int re10 = 0;			//고보가입
 						int re11 = 0;			//수료고보
 						int re12 = 0;			//수료취업+이수취업
 						double cer = 0;			//자격취득
 						double aDiv = 0;		//모집인원 %값
 						double cDiv = 0;		//수료인원 %값
 						double reDiv1 = 0;		//중도탈락 %값
 						double reDiv2 = 0;		//조기취업 %값
 						double reDiv3 = 0;		//이수취업 %값
 						double reDiv4 = 0;		//수료취업 %값
 						double reDiv5 = 0;		//수료미취업 %값
 						double reDiv6 = 0;		//고보가입 %값
 						double reDiv7 = 0;		//수료고보 %값
 						double reDiv8 = 0;		//일반취업률 %값
 						double cerDiv = 0;		//자격취득 %값
 						double reDiv9 = 0;		//가중치취업률 %값
 						double doubleAsse = 0;	//sum(asse)값
 						
 					%>
	
	<%@ include file = "menu2.jsp" %>
	
<div style = "width : 3500px; margin-top : 70px;">
<div style = "position : sticky; left : 0px; width : 1920px;">
<!-- 과목정보 -->
	<div>
		<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
			<tr>
				<th colspan='2'>${suSelectOne.s_id}</th>
				<th colspan='16' style="text-align:center;"><a href="update.so?s_id=${suSelectOne.s_id}">${suSelectOne.s_name}${suSelectOne.s_code}</a></th>
			</tr>
			<tr>
				<th colspan='20'>　</th>
			</tr>
			<tr>
				<th rowspan='2'>훈련과정</th>
				<th>:</th>
				<th colspan='6' >${suSelectOne.s_name}<br>${suSelectOne.s_code}</th>
				<th style="text-align: center;">훈련기간 : ${suSelectOne.s_start} ~ ${suSelectOne.s_end}</th>
				<th>관리: ${suSelectOne.s_manage}</th>
				<th>담당교수 : ${suSelectOne.s_professor}</th>
			</tr>			
		</table>
	</div>
<!-- 인원total정보 -->	
		<div style="width:auto" class = "container">
			<div style="width: auto;">
				<table class="table table-striped" style="border: 1px solid #dddddd">
					<tr>
						<th style="background-color:#eeeeee; text-align:center;">정원</th>
						<th style="background-color:#eeeeee; text-align:center;">모집인원</th>
						<th style="background-color:#eeeeee; text-align:center;">수료인원</th>
						<th style="background-color:#eeeeee; text-align:center;">중도탈락</th>
						<th style="background-color:#eeeeee; text-align:center;">조기취업</th>
						<th style="background-color:#eeeeee; text-align:center;">이수취업</th>
						<th style="background-color:#eeeeee; text-align:center;">수료취업</th>
						<th style="background-color:#eeeeee; text-align:center;">수료미취업</th>
						<th colspan='3' style="background-color:#eeeeee; text-align:center;">산정제외</th> <!-- colspan3  -->
						<th style="background-color:#eeeeee; text-align:center;">산정인원</th>
						<th colspan='4' style="background-color:#eeeeee; text-align:center;">취업률</th> <!-- colspan4 -->
						<th style="background-color:#eeeeee; text-align:center;">고보가입</th>
						<th style="background-color:#eeeeee; text-align:center;">수료고보</th>
						<th style="background-color:#eeeeee; text-align:center;">자격취득</th>
					</tr>
					
					<%					
						int sId = (int)request.getAttribute("id");
 					 	String at = (String)request.getAttribute("member");
 					 	int att = Integer.parseInt(at);
						
						MemberDAO memberDao = MemberDAO.getInstance();
						List<MemberJoin> list = memberDao.selectList(sId);
						
						String asse = memberDao.selectAsse(sId).getAsse();
						if(asse == null){	//이거 없으면 값 없을때 null로 보임
							asse = "0";
						}
						if(asse != null){	// 이거 없으면 값 없을때 오류남
							doubleAsse = Double.parseDouble(asse);
						}
						
						NoteDAO noteDao = NoteDAO.getInstance(); 
						
						a = 0;
						c = 0;
						re1 = 0;
						re2 = 0;
						re3 = 0;
						re4 = 0;
						re5 = 0;
						re6 = 0;
						re7 = 0;
						re8 = 0;
						re9 = 0;
						re10 = 0;
						re11 = 0;
						re12 = 0;
						cer = 0;
						aDiv = 0;
						cDiv = 0;
						
	
							for(MemberJoin b : list){
								a =a+1;
								if(b.getCo_comple().equals("O")){
									c = c+1;
								}
								if(b.getCo_result().equals("중도탈락")){
									re1 = re1+1;
								}
								if(b.getCo_result().equals("조기취업")){
									re2 = re2+1;
								}
								if(b.getCo_result().equals("이수취업")){
									re3 = re3+1;
								}
								if(b.getCo_result().equals("수료취업")){
									re4 = re4+1;
								}
								if(b.getCo_result().equals("수료미취업")){
									re5 = re5+1;
								}
								if(b.getCo_certificate().equals("O")){
									cer = cer+1;
								}
								if(b.getC_except().equals("산정제외") && b.getCo_comple().equals("O") && 
										b.getM_option1().equals("실업자일반")){
									re6 = re6+1;
								}
								if(/* b.getC_except().equals("산정제외") &&  */b.getCo_comple().equals("O") && 
										b.getM_option1().equals("근로자개인")){
									re7 = re7+1;
								}
								if(b.getCo_insurance().equals("예정") || b.getCo_insurance().equals("O")){
									re10 = re10+1;
								}
								if(	b.getCo_result().equals("수료취업") && b.getCo_insurance().equals("O") ||
									b.getCo_result().equals("수료취업") && b.getCo_insurance().equals("예정") ||
									b.getCo_result().equals("이수취업") && b.getCo_insurance().equals("O") ||
									b.getCo_result().equals("이수취업") && b.getCo_insurance().equals("예정")){
									re11 = re11+1;
								} 
								re8 = re7+re6;								
								re9 = c+re3-re6-re7;
							}
							aDiv = (a/att)*100;
							cDiv = (c/a)*100;
							re12 = re3 + re4;
							reDiv1 = (re1/a)*100; 
							reDiv2 = (re2/a)*100;
							cerDiv = (cer/a)*100;
							reDiv3 = (re3/re9)*100;
							reDiv4 = (re4/re9)*100;
							reDiv5 = (re5/re9)*100;
							reDiv6 = (re10/(re2+re3+re4+re5))*100;
							reDiv7 = (re11/re9)*100;
							reDiv8 = (re3+re4)/re9*100;
							reDiv9 = (doubleAsse/re9)*100;
						%>
					
					<tr>
						<td rowspan='2' valign="middle" align="center">${suSelectOne.s_member}명</td>
						<td style="background-color:#E5FFCC; text-align:center;"><%=(int)a %>명</td>
						<td style="background-color:#E5FFCC; text-align:center;"><%=(int)c %>명</td>
						<td style="background-color:#FFFFFF; text-align:center;"><%=(int)re1 %>명</td>
						<td style="background-color:#FFFFFF; text-align:center;"><%=(int)re2 %>명</td>
						<td style="background-color:#FFFFFF; text-align:center;"><%=re3 %>명</td> 
						<td style="background-color:#FFFFFF; text-align:center;"><%=re4 %>명</td>
						<td style="background-color:#FFFFFF; text-align:center;"><%=re5 %>명</td>
						<td style="background-color:#eeeeee; text-align:center;">수료전</td>
						<td style="background-color:#eeeeee; text-align:center;">수료후</td>
						<td style="background-color:#eeeeee; text-align:center;">재직자</td>
						<td rowspan='2' style="background-color:#E5FFCC; text-align:center;"><%=(int)re9%>명</td>
						<td style="background-color:#eeeeee; text-align:center;">목표취업률</td>
						<td style="background-color:#eeeeee; text-align:center;">평가기준</td>
						<td style="background-color:#FFCCCC; text-align:center;"><%=asse %>명</td>
						<td style="background-color:#FFCCCC; text-align:center;"><%=format.format(reDiv9)%>%</td>
						<td style="background-color:#FFFFFF; text-align:center;"><%=re10 %>명</td>
						<td style="background-color:#FFFFFF; text-align:center;"><%=re11 %>명</td>
						<td style="background-color:#FFFFFF; text-align:center;"><%=(int)cer %>명</td>				
					</tr>
					<tr>
						<td style="background-color:#E5FFCC; text-align:center;"><%=format.format(aDiv) %>%</td>
						<td style="background-color:#E5FFCC; text-align:center;"><%=format.format(cDiv) %>%</td>
						<td style="background-color:#FFFFFF; text-align:center;"><%=format.format(reDiv1) %>%</td>
						<td style="background-color:#FFFFFF; text-align:center;"><%=format.format(reDiv2) %>%</td>
						<td style="background-color:#FFFFFF; text-align:center;"><%=format.format(reDiv3) %>%</td>
						<td style="background-color:#FFFFFF; text-align:center;"><%=format.format(reDiv4) %>%</td>
						<td style="background-color:#FFFFFF; text-align:center;"><%=format.format(reDiv5) %>%</td>
						<td style="background-color:#FFFFFF; text-align:center;"><%=re8 %>명</td> 
						<td style="background-color:#FFFFFF; text-align:center;"><%=re6 %>명</td> 
						<td style="background-color:#FFFFFF; text-align:center;"><%=re7 %>명</td>
						<td style="background-color:#FFFFFF; text-align:center;">${suSelectOne.s_empoyee}%</td>
						<td style="background-color:#eeeeee; text-align:center;">일반취업률</td>
						<td style="background-color:#FFFFFF; text-align:center;"><%=re12 %>명</td>
						<td style="background-color:#FFFFFF; text-align:center;"><%=format.format(reDiv8) %>%</td>
						<td style="background-color:#FFFFFF; text-align:center;"><%=format.format(reDiv6) %>%</td>
						<td style="background-color:#FFFFFF; text-align:center;"><%=format.format(reDiv7) %>%</td>
						<td style="background-color:#FFFFFF; text-align:center;"><%=format.format(cerDiv) %>%</td>
					</tr>				
				</table>
			</div>	
		</div>
	</div>
</div>	
	
<!-- 인원리스트  -->
	<div style= "width : 3480px;white-space: nowrap; margin-left : 15px;"> 
		<div class = "row" >
			<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<!-- 기본정보 -->
						<th style="position : sticky; left : 0; background-color:#eeeeee; text-align:center; width : 48px;">번호</th>
						<th style="position : sticky; left : 48px;background-color:#eeeeee; text-align:center;">성명</th>
						<th style="background-color:#eeeeee; text-align:center;">생년월일</th>
						<th style="background-color:#eeeeee; text-align:center;">전화번호</th>
						<th style="background-color:#eeeeee; text-align:center;">지역</th>
						<th style="background-color:#eeeeee; text-align:center;">나이</th>
						<th style="background-color:#eeeeee; text-align:center;">성별</th>
						<th style="background-color:#eeeeee; text-align:center;">유형</th>
						<th style="background-color:#eeeeee; text-align:center;">구분</th>
						<!-- <th style="background-color:#eeeeee; text-align:center;">비고</th> -->

						<!-- 수강인원결과  -->
						<th style="background-color:#eeeeee; text-align:center;">결과</th>
						<th style="background-color:#eeeeee; text-align:center;">출석률</th>
						<th style="background-color:#eeeeee; text-align:center;">수료</th>
						<th style="background-color:#eeeeee; text-align:center;">취업</th>
						<th style="background-color:#eeeeee; text-align:center;">동일</th>
						<th style="background-color:#eeeeee; text-align:center;">고보</th>
						<!-- <th style="background-color:#eeeeee; text-align:center;">직종가중치</th>
						<th style="background-color:#eeeeee; text-align:center;">취업가중치</th>
						<th style="background-color:#eeeeee; text-align:center;">직종가중치</th>
						<th style="background-color:#eeeeee; text-align:center;">취업가중치</th>
						<th style="background-color:#eeeeee; text-align:center;">직종가중치</th>
						<th style="background-color:#eeeeee; text-align:center;">취업가중치</th> -->
						<th style="background-color:#eeeeee; text-align:center;">평가기준</th>
						<th style="background-color:#eeeeee; text-align:center;">직종기준</th>
						<th style="background-color:#eeeeee; text-align:center;">자격증</th>
						<!-- 업체현황  -->
						<th style="background-color:#eeeeee; text-align:center;">입사일</th>
						<th style="background-color:#eeeeee; text-align:center;">고용유지기간</th>
						<th style="background-color:#eeeeee; text-align:center;">퇴사여부</th>
						<th style="background-color:#eeeeee; text-align:center;">업체명</th>
						<th style="background-color:#eeeeee; text-align:center;">주소</th>
						<th style="background-color:#eeeeee; text-align:center;">전화번호</th>
						<th style="background-color:#eeeeee; text-align:center;">취업전담제</th>
						<th style="background-color:#eeeeee; text-align:center;">산정제외</th>	
						<th style="background-color:#eeeeee; text-align:center;">비고</th>	
											
						
						
					</tr>
 				</thead>
 					
 						<%
 						a = 0;
						for(MemberJoin b : list){	//과목별 학생 리스트
							a =a+1;
							int on = b.getM_id();
							String one = null;
							if(noteDao.selectNewList(on) == null){	// 비고
								one = "";
							}else{
								one = noteDao.selectNewList(on).getN_note();
							}
					%>
					
				<tbody>
					<tr> 

						<td style="position : sticky; left : 0; background-color : #eeeeee;  width : 48px;"><%=(int)a %></td> 
						<td style="position : sticky; left : 48px; background-color : #eeeeee;;"><a href="update.do?m_id=<%=b.getM_id()%>"><%=b.getM_name()%></a></td>
						<td><%=b.getM_birth()%></td>
						<td><%=b.getM_number()%></td>
						<td><%=b.getM_area()%></td>
						<td><%=b.getM_age1()%></td>
						<td><%=b.getM_sex()%></td>
						<td><%=b.getM_option1()%></td>
						<td><%=b.getM_option2()%></td>				
						<%-- <td><%=b.getM_note()%></td> --%>
						<!-- 수강인원결과  -->						
						<td><%=b.getCo_result()%></td>
						<td><%=b.getCo_attend()%></td>
						<td><%=b.getCo_comple()%></td>
						<td><%=b.getCo_employ()%></td>
						<td><%=b.getCo_same()%></td>
						<td><%=b.getCo_insurance()%></td>
						<%-- <td><%=b.getCo_option1()%></td>
						<td><%=b.getCo_option2()%></td>
						<td><%=b.getCo_option3()%></td>
						<td><%=b.getCo_option4()%></td>
						<td><%=b.getCo_option5()%></td>
						<td><%=b.getCo_option6()%></td>		 --%>				
						<td><%=b.getCo_asse()%></td>
						<td><%=b.getCo_porf()%></td>
						<td><%=b.getCo_certificate()%></td>
						<!-- 업체현황  -->
						<td><%=b.getC_start()%></td>
						<td><%=b.getC_maintain()%></td>
						<td><%=b.getC_end()%></td>
						<td><%=b.getC_name()%></td>
						<td><%=b.getC_address()%></td>
						<td><%=b.getC_number()%></td>
						<td><%=b.getC_manager()%></td>
						<td><%=b.getC_except()%></td>
						<!-- 비고 -->
						<td><%=one %></td>

					</tr>									
			</tbody>	

			<%	
				}
					
			%>			
			</table>
			
			<a href ="add.so?s_id=${suSelectOne.s_id}" class="btn btn-primary pull-right">수강인원 추가</a> <!-- 수강인원추가버튼부분 -->
		</div>
	</div>
<script>
	
</script>
</body>
</html>