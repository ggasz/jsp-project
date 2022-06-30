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

<title>전체(진행)</title>
<!-- 메뉴 -->
	<%@ include file = "menu2.jsp" %>
	
	
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css"
 href="//cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">



<script>
    $(function(){
        $("#tablesort").dataTable({
        	 searching: false,
        	 info: false,
             scrollY:        "700px",
             scrollX:        true,
             scrollCollapse: true,
             fixedColumns:   {
                 left: 2
             }
        });
       
    });
</script>


</head>
<body>

<!-- 테이블 시작  -->

   <div style ="border-top : 1px solid; font-size : 11px; margin-top : 70px; " name="insert" >
				<table id="tablesort" class="table table-striped" style="text-align:center; white-space: nowrap; width : 100%; ">
				<thead>
					<tr>
						<th colspan='8' style="background-color:#DCE6F1; text-align:center;">구분</th>
						<th colspan='4' style="background-color:#DCE6F1; text-align:center;">훈련기간</th>
						<th style="background-color:#DCE6F1; text-align:center;">정원</th>
						<th colspan='2' style="background-color:#DCE6F1; text-align:center;">모집인원</th>
						<th colspan='2' style="background-color:#DCE6F1; text-align:center;">수료인원</th>
						<th colspan='2' style="background-color:#DCE6F1; text-align:center;">중도탈락</th>
						<th colspan='2' style="background-color:#DCE6F1; text-align:center;">조기취업</th>
						<th colspan='2' style="background-color:#DCE6F1; text-align:center;">수료취업</th>
						<th colspan='2' style="background-color:#DCE6F1; text-align:center;">수료미취업</th>
						<th colspan='3' style="background-color:#DCE6F1; text-align:center;">산정제외</th>
						<th style="background-color:#DCE6F1; text-align:center;">산정인원</th>
						<th colspan='2' style="background-color:#DCE6F1; text-align:center;">일반취업률</th>
						<th colspan='2' style="background-color:#DCE6F1; text-align:center;">취업률</th>
						<th colspan='2' style="background-color:#DCE6F1; text-align:center;">직종취업률</th>
						<th colspan='2' style="background-color:#DCE6F1; text-align:center;">고용보험가입</th>
						<th colspan='2' style="background-color:#DCE6F1; text-align:center;">수료고용보험</th>
						<th colspan='2' style="background-color:#DCE6F1; text-align:center;">자격증취득</th>
						<th colspan='2' style="background-color:#DCE6F1; text-align:center;">취업전담제</th>
						<th style="background-color:#DCE6F1; text-align:center;">취성패</th>
						<th style="background-color:#DCE6F1; text-align:center;">과정명</th>
						<th style="background-color:#DCE6F1; text-align:center;">과정구분</th>
						<th style="background-color:#DCE6F1; text-align:center;">과정구분</th>
					</tr>
					
					<tr>
						<th style="background-color:#DCE6F1; text-align:center; width:55px ">순번</th>
						<th style="background-color:#DCE6F1; text-align:center; ">소속
						<th style="background-color:#DCE6F1; text-align:center;">과정명</th>
						<th style="background-color:#DCE6F1; text-align:center;">회차</th>
						<th style="background-color:#DCE6F1; text-align:center;">담임</th>
						<th style="background-color:#DCE6F1; text-align:center;">직종</th>
						<th style="background-color:#DCE6F1; text-align:center;">소분류</th>
						<th style="background-color:#DCE6F1; text-align:center;">상태</th>
						<th style="background-color:#DCE6F1; text-align:center;">시작일</th>
						<th style="background-color:#DCE6F1; text-align:center;">종료일</th>
						<th style="background-color:#DCE6F1; text-align:center;">관리종료</th>
						<th style="background-color:#DCE6F1; text-align:center;">남은일수</th>
						<th style="background-color:#DCE6F1; text-align:center;">정원</th>
						<th style="background-color:#DCE6F1; text-align:center;">인원</th>
						<th style="background-color:#DCE6F1; text-align:center;">모집률</th>
						<th style="background-color:#DCE6F1; text-align:center;">수료인원</th>
						<th style="background-color:#DCE6F1; text-align:center;">수료률</th>
						<th style="background-color:#DCE6F1; text-align:center;">중도탈락</th>
						<th style="background-color:#DCE6F1; text-align:center;">중탈률</th>
						<th style="background-color:#DCE6F1; text-align:center;">조기취업</th>
						<th style="background-color:#DCE6F1; text-align:center;">이수취업</th>
						<th style="background-color:#DCE6F1; text-align:center;">수료취업</th>
						<th style="background-color:#DCE6F1; text-align:center;">수료취업률</th>
						<th style="background-color:#DCE6F1; text-align:center;">수료미취업</th>
						<th style="background-color:#DCE6F1; text-align:center;">수료미취업률</th>
						<th style="background-color:#DCE6F1; text-align:center;">수료전</th>
						<th style="background-color:#DCE6F1; text-align:center;">수료후</th>
						<th style="background-color:#DCE6F1; text-align:center;">재직자</th>
						<th style="background-color:#DCE6F1; text-align:center;">산정인원</th>
						<th style="background-color:#DCE6F1; text-align:center;">취업인원</th>
						<th style="background-color:#DCE6F1; text-align:center;">일반취업률</th>
						<th style="background-color:#DCE6F1; text-align:center;">평가기준</th>
						<th style="background-color:#DCE6F1; text-align:center;">평가기준취업률</th>
						<th style="background-color:#DCE6F1; text-align:center;">직종기준</th>
						<th style="background-color:#DCE6F1; text-align:center;">직종기준취업률</th>
						<th style="background-color:#DCE6F1; text-align:center;">고보가입</th>
						<th style="background-color:#DCE6F1; text-align:center;">가입률</th>
						<th style="background-color:#DCE6F1; text-align:center;">고보가입2</th>
						<th style="background-color:#DCE6F1; text-align:center;">가입률3</th>
						<th style="background-color:#DCE6F1; text-align:center;">자격증</th>
						<th style="background-color:#DCE6F1; text-align:center;">취득률</th>
						<th style="background-color:#DCE6F1; text-align:center;">전담인원</th>
						<th style="background-color:#DCE6F1; text-align:center;">전담률</th>
						<th style="background-color:#DCE6F1; text-align:center;">취성패조회</th>
						<th style="background-color:#DCE6F1; text-align:center;">과정명2</th>
						<th style="background-color:#DCE6F1; text-align:center;">수료과정</th>
						<th style="background-color:#DCE6F1; text-align:center;">종료과정</th>
					</tr>
				</thead>
				<tbody>
				
<!-- 정보계산 -->
				
			<%!
				DecimalFormat format = new DecimalFormat(".0");
				double aLb = 0;		//모집인원 -> 인원
				double aLbDiv = 0;	//모집인원 -> 모집률
				double co = 0;		//수료인원
				double coDiv = 0; 	//수료인원 -> 수료률
				double re1 = 0;		//중도탈락
				double reDiv1 = 0;	//중도탈락 -> 중탈률
				double re2 = 0;		//조기취업
				int re3 = 0;		//이수취업
				int re4 = 0;		//수료취업
				double reDiv2 = 0;	//수료취업 -> 수료취업률
				int re5 = 0;		//수료미취업
				double reDiv3 = 0;	//수료미취업 -> 수료미취업률
				int re6 = 0;		//산정제외 -> 수료전
				int re7 = 0;		//산정제외 ->	수료전
				int re8 = 0;		//산정제외 -> 수료전
				int re9 = 0; 		//산정제외 -> 수료후
				int re10 =0;		//산정제외 -> 재직자
				double re11 = 0;	//산정인원
				double re12 = 0;	//취업인원
				double reDiv4 = 0;	//일반취업률
				double re13 = 0;	//고보가입
				double reDiv5 = 0;	//고보가입률
				double re14 = 0;	//수료고보가입
				double reDiv6 = 0;	//수료고보가입률
				double re15 = 0;	//전담인원
				double reDiv7 = 0;	//전담률
				double cer = 0;		//자격취득
				double cerDiv = 0;	//자격증취득률
				double reDiv9 = 0;		//가중치취업률 %값
				double doubleAsse =0; //sum(asse)값
				List<SubjectDTO> list = new ArrayList<>();
			%>
			<%
				Date date = new Date();
				
				
				SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
				String strdate = simpleDate.format(date);
			
				Calendar cal = Calendar.getInstance();
				
				SubjectDAO subjectDao = SubjectDAO.getInstance();
				List<SubjectDTO> list = subjectDao.subjectList2();
				int a = 0;
					for(SubjectDTO b : list){
						a=a+1;
						SimpleDateFormat simpleDate2 = new SimpleDateFormat("yyyy-MM-dd");
						String pss = b.getS_manage();
						Date date2 = simpleDate2.parse(pss);
						long dm = (long)date.getTime();  //현재시간
						long dm2 = (long)date2.getTime(); // 관리종료
						long dm3 = (dm2-dm)/(1000*60*60*24)+1; // 계산
						
						String member = b.getS_member();
						int member2 = Integer.parseInt(member);
						MemberDAO memberDao = MemberDAO.getInstance();
						List<MemberJoin> list2 = memberDao.selectList(b.getS_id());
						
						String asse = memberDao.selectAsse(b.getS_id()).getAsse();
						if(asse == null){	//이거 없으면 값 없을때 null로 보임
							asse = "0";
						}
						if(asse != null){	// 이거 없으면 값 없을때 오류남
							doubleAsse = Double.parseDouble(asse);
						}
						aLb = 0;	//모집인원 -> 인원
						co = 0;		//수료인원
						re1 = 0;	//중도탈락
						reDiv1 = 0;	//중도탈락 -> 중탈률
						re2 = 0;	//조기취업
						re3 = 0;	//이수취업
						re4 = 0;	//수료취업
						re5 = 0;	//수료미취업
						re6 = 0;	//산정제외 -> 수료전
						re7 = 0;	//산정제외 -> 수료전
						re8 = 0;	//산정제외 -> 수료전 re6+re7
						re9 = 0;	//산정제외 -> 수료후
						re10 = 0;	//산정제외 -> 재직자
						re11 = 0;	//산정인원
						re12 = 0;	//취업인원
						re13 = 0;	//고보가입
						re14 = 0;	//수료고보가입
						re15 = 0;	//전담인원
						cer = 0;
						for (MemberJoin Lb : list2){
							aLb = aLb +1;	//모집인원 -> 인원
							if(Lb.getCo_comple().equals("O")){
								co = co+1;	//수료인원
							}
							if(Lb.getCo_result().equals("중도탈락")){
								re1 = re1+1;	//중도탈락
							}
							if(Lb.getCo_result().equals("조기취업")){
								re2 = re2+1;
							}
							if(Lb.getCo_result().equals("이수취업")){
								re3 = re3+1;
							}
							if(Lb.getCo_result().equals("수료취업")){
								re4 = re4+1;
							}
							if(Lb.getCo_result().equals("수료미취업")){
								re5 = re5+1;
							}
							if(Lb.getCo_certificate().equals("O")){
								cer = cer+1;
							}
							if(Lb.getC_except().equals("산정제외") && Lb.getCo_comple().equals("") && 
									Lb.getM_option1().equals("실업자일반")){
								re6 = re6+1;
							}
							if(Lb.getC_except().equals("산정제외") && Lb.getCo_comple().equals("") && 
									Lb.getM_option1().equals("근로자개인")){
								re7 = re7+1;
							}
							if(Lb.getC_except().equals("산정제외") && Lb.getCo_comple().equals("O") && 
									Lb.getM_option1().equals("실업자일반")){
								re9 = re9+1;
							}
							if(Lb.getC_except().equals("산정제외") && Lb.getCo_comple().equals("O") && 
									Lb.getM_option1().equals("근로자개인")){
								re10 = re10+1;
							}
							if(Lb.getCo_insurance().equals("예정") || Lb.getCo_insurance().equals("O")){
								re13 = re13+1;
							}
							if(	Lb.getCo_result().equals("수료취업") && Lb.getCo_insurance().equals("O") ||
								Lb.getCo_result().equals("수료취업") && Lb.getCo_insurance().equals("예정") ||
								Lb.getCo_result().equals("이수취업") && Lb.getCo_insurance().equals("O") ||
								Lb.getCo_result().equals("이수취업") && Lb.getCo_insurance().equals("예정")){
								re14 = re14+1;
							} 
							if(!Lb.getC_manager().equals("")){
								re15 = re15+1;
							}
						}
						
						aLbDiv = (aLb/member2)*100;
						coDiv = (co/aLb)*100;
						reDiv1 = (re1/aLb)*100;
						re8 = re7+re6;
						re1 = re1-re8;
						re11 = (int)co+re3-re9-re10;
						re12 = re3+re4;
						reDiv2 = (re4/re11)*100;
						reDiv3 = (re5/re11)*100;
						reDiv4 = (re12/re11)*100;
						cerDiv = (cer/a)*100;
						reDiv5 = (re13/(re2+re3+re4+re5))*100;
						reDiv6 = (re14/re11)*100;
						reDiv9 = (doubleAsse/re11)*100;
			%>
					<tr>
						<!-- 구분 -->
						<th style="text-align:center; "><%=a %></th>											<!-- 순번 -->
						<th style="text-align:center; "><%=b.getS_affiliation() %></th>							<!-- 소속 -->
						<th style="text-align:center;"><a href="select.so?s_id=<%=b.getS_id()%>"><%=b.getS_name() %><br><%=b.getS_code() %></a></th>			<!-- 과정명 -->
						<th style="text-align:center;"><%=b.getS_session() %></th>								<!-- 회차 -->
						<th style="text-align:center;"><%=b.getS_professor() %></th>							<!-- 담임 -->
						<th style="text-align:center;"><%=b.getS_profession() %></th>							<!-- 직종 -->
						<th style="text-align:center;"><%=b.getS_subject() %><br><%=b.getS_code2() %></th>		<!-- 소분류 및 코드 -->
						<th style="text-align:center;"><%=b.getS_condition() %></th>							<!-- 상태 -->
						<!-- 훈련기간 -->
						<th style="text-align:center;"><%=b.getS_start() %></th>								<!-- 시작일 -->
						<th style="text-align:center;"><%=b.getS_end() %></th>									<!-- 종료일 -->
						<th style="text-align:center;"><%=b.getS_manage()%></th>								<!-- 관리종료 -->
						<th style="text-align:center;"><%=dm3 %></th>											<!-- 남은일수 -->
						<!-- 정원 -->
						<th style="text-align:center;"><%=b.getS_member() %></th>								<!-- 정원 -->
						<!-- 모집인원 -->
						<th style="text-align:center;"><%=(int)aLb %></th>										<!-- 인원 -->
						<th style="text-align:center;"><%=format.format(aLbDiv) %>%</th>						<!-- 모집률 -->
						<!-- 수료인원 -->
						<th style="text-align:center;"><%=(int)co %></th>										<!-- 수료 -->
						<th style="text-align:center;"><%=format.format(coDiv) %>%</th>							<!-- 수료률 -->
						<!-- 중도탈락 -->
						<th style="text-align:center;"><%=(int)re1 %></th>										<!-- 중도탈락 -->
						<th style="text-align:center;"><%=format.format(reDiv1) %>%</th>						<!-- 중탈률 -->
						<!-- 조기취업 -->
						<th style="text-align:center;"><%=(int)re2 %></th>										<!-- 조기취업 -->
						<th style="text-align:center;"><%=(int)re3 %></th>										<!-- 이수취업 -->
						<!-- 수료취업 -->
						<th style="text-align:center;"><%=(int)re4 %></th>										<!-- 수료취업 -->
						<th style="text-align:center;"><%=format.format(reDiv2) %>%</th>						<!-- 수료취업률 -->
						<!-- 수료미취업 -->
						<th style="text-align:center;"><%=(int)re5 %></th>										<!-- 수료미취업 -->
						<th style="text-align:center;"><%=format.format(reDiv3) %>%</th>						<!-- 수료미취업률 -->
						<!-- 산정제외 -->
						<th style="text-align:center;"><%=re8 %></th>											<!-- 산정제외 -> 수료전 -->
						<th style="text-align:center;"><%=re9 %></th>											<!-- 산정제외 -> 수료후 -->
						<th style="text-align:center;"><%=re10 %></th>											<!-- 산정제외 -> 재직자 -->
						<!-- 산정인원 -->
						<th style="text-align:center;"><%=(int)re11 %></th>										<!-- 산정인원 -->
						<!-- 일반취업률 -->
						<th style="text-align:center;"><%=(int)re12 %></th>										<!-- 취업인원 -->
						<th style="text-align:center;"><%=format.format(reDiv4) %>%</th>						<!-- 일반취업률 -->
						<!-- 취업률 -->
						<th style="text-align:center;"><%=asse %></th>												<!-- 평가기준 -->
						<th style="text-align:center;"><%=format.format(reDiv9)%>%</th>											<!-- 평가기준취업률 -->
						<!-- 직종취업률 -->
						<th style="text-align:center;">직종기준</th>												<!-- 직종기준 -->
						<th style="text-align:center;">직종기준취업률</th>											<!-- 직종기준취업률 -->
						<!-- 고용보험가입 -->
						<th style="text-align:center;"><%=(int)re13 %></th>										<!-- 고보가입 -->
						<th style="text-align:center;"><%=format.format(reDiv5) %>%</th>						<!-- 고보가입률 -->
						<!-- 수료고보용보험 -->
						<th style="text-align:center;"><%=(int)re14 %></th>										<!-- 수료고보가입 -->
						<th style="text-align:center;"><%=format.format(reDiv6) %>%</th>						<!-- 수료고보가입률 -->
						<!-- 자격증취득 -->
						<th style="text-align:center;"><%=(int)cer %></th>										<!-- 자격증 -->
						<th style="text-align:center;"><%=format.format(cerDiv) %>%</th>						<!-- 자격증취득률 -->
						<!-- 취업전담제 -->
						<th style="text-align:center;"><%=(int)re15 %></th>												<!-- 전담인원 -->
						<th style="text-align:center;">전담률</th>												<!-- 전담률 -->
						<!-- 취성패 -->
						<th style="text-align:center;"><%=b.getS_option() %></th>								<!-- 취성패조회 -->
						<!-- 과정명 -->
						<th style="text-align:center;"><%=b.getS_name2() %></th>								<!-- 과정명2 -->
						<!-- 과정구분 -->
						<th style="text-align:center;">
						<select name ="m_option2" id = "m_option2Id">
									<option value = "0"> </option>
									<option value = "1">1</option>									
								</select>
						</th>												<!-- 수료과정 -->
						<th style="text-align:center;">
						<select name ="m_option2" id = "m_option2Id">
									<option value = ""> </option>
									<option value = "1">1</option>									
								</select>
						</th>												<!-- 종료과정 -->
					</tr>
				<%
					}
				%>		
				</tbody>	
			</table>
	</div>
</div>
</div>

</body>
</html>