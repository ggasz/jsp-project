<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@page import="subject.*" %>
<%@page import="member.*" %>
<%@page import="company.*" %>
<%@page import="consequence.*" %>
<link rel="stylesheet" href="css/bootstrap.css">
<title>전체(진행)</title>
<style>
th{
	border: 1px solid;
}
</style>
</head>
<body>

<!-- 메뉴 -->
	<%@ include file = "WEB-INF/menu2.jsp" %>
	
<div style = " width : 3500px; margin-top : 70px;">
<div style = "position : sticky; left : 0px;">	
	
<!-- 테이블 시작  -->

			<div style ="border-top : 1px solid; font-size: 11px;">
				<table class="table table-striped" style="text-align:center;">
					<tr>
						<th colspan='8' style="/* position : sticky; left : 0; */ background-color:#DCE6F1; text-align:center;">구분</th>
						<th colspan='4' style="/* position : sticky; left : 425.5px; */ background-color:#DCE6F1; text-align:center;">훈련기간</th>
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
					
<!-- 2번째  -->
		
					<tr>
						<th style="background-color:#DCE6F1; text-align:center; width:55px ">순번</th>
						<th style="background-color:#DCE6F1; text-align:center; ">소속</th>
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
					
<!-- 정보입력  -->
					<tr>
						<th style="text-align:center; ">순번</th>
						<th style="text-align:center; ">소속</th>
						<th style="text-align:center;">과정명</th>
						<th style="text-align:center;">회차</th>
						<th style="text-align:center;">담임</th>
						<th style="text-align:center;">직종</th>
						<th style="text-align:center;">소분류</th>
						<th style="text-align:center;">상태</th>
						<th style="text-align:center;">시작일</th>
						<th style="text-align:center;">종료일</th>
						<th style="text-align:center;">관리종료</th>
						<th style="text-align:center;">남은일수</th>
						<th style="text-align:center;">정원</th>
						<th style="text-align:center;">인원</th>
						<th style="text-align:center;">모집률</th>
						<th style="text-align:center;">수료인원</th>
						<th style="text-align:center;">수료률</th>
						<th style="text-align:center;">중도탈락</th>
						<th style="text-align:center;">중탈률</th>
						<th style="text-align:center;">조기취업</th>
						<th style="text-align:center;">이수취업</th>
						<th style="text-align:center;">수료취업</th>
						<th style="text-align:center;">수료취업률</th>
						<th style="text-align:center;">수료미취업</th>
						<th style="text-align:center;">수료미취업률</th>
						<th style="text-align:center;">수료전</th>
						<th style="text-align:center;">수료후</th>
						<th style="text-align:center;">재직자</th>
						<th style="text-align:center;">산정인원</th>
						<th style="text-align:center;">취업인원</th>
						<th style="text-align:center;">일반취업률</th>
						<th style="text-align:center;">평가기준</th>
						<th style="text-align:center;">평가기준취업률</th>
						<th style="text-align:center;">직종기준</th>
						<th style="text-align:center;">직종기준취업률</th>
						<th style="text-align:center;">고보가입</th>
						<th style="text-align:center;">가입률</th>
						<th style="text-align:center;">고보가입2</th>
						<th style="text-align:center;">가입률3</th>
						<th style="text-align:center;">자격증</th>
						<th style="text-align:center;">취득률</th>
						<th style="text-align:center;">전담인원</th>
						<th style="text-align:center;">전담률</th>
						<th style="text-align:center;">취성패조회</th>
						<th style="text-align:center;">과정명2</th>
						<th style="text-align:center;">수료과정</th>
						<th style="text-align:center;">종료과정</th>
					</tr>			
				</table>
			</div>
</div>
</div>
</body>
</html>