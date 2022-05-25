<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "member.*" %>
<%@ page import="java.io.PrintWriter"  %>
<% request.setCharacterEncoding("UTF-8");%>
<%-- <jsp:useBean id="member" class="member.MemberDTO" scope="page"/>
<jsp:setProperty name="member" property="m_name" />
<jsp:setProperty name="member" property="m_birth" />
<jsp:setProperty name="member" property="m_number" />
<jsp:setProperty name="member" property="m_area" />
<jsp:setProperty name="member" property="m_age1" />
<jsp:setProperty name="member" property="m_age2" />
<jsp:setProperty name="member" property="m_sex" />
<jsp:setProperty name="member" property="m_option1" />
<jsp:setProperty name="member" property="m_option2" />
<jsp:setProperty name="member" property="m_option3" /> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인원추가</title>
</head>
<body>
	<%
	 String userID = null;
	if(session.getAttribute("u_email") != null){
		userID = (String) session.getAttribute("u_email");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href='login.do'");
		script.println("</script>");
	}else{
		if(request.getParameter("m_name")== null || request.getParameter("m_name").equals("") || request.getParameter("m_birth")== null  || request.getParameter("m_birth").equals("") || request.getAttribute("m_number")== null || request.getParameter("m_number").equals("") 
				||  request.getAttribute("m_area")== null || request.getParameter("m_area").equals("") || request.getParameter("m_age1")== null  || request.getParameter("m_age1").equals("") || request.getAttribute("m_sex")== null || request.getParameter("m_sex").equals("")
				|| request.getAttribute("m_option1")== null || request.getParameter("m_option1").equals("") || request.getAttribute("m_option2")== null || request.getParameter("m_option2").equals("") || request.getAttribute("m_option3")== null || request.getParameter("m_option3").equals("")
				|| request.getAttribute("m_note")== null || request.getParameter("m_note").equals("")
		|| request.getParameter("co_result")== null || request.getParameter("co_result").equals("") || request.getParameter("co_attend")== null  || request.getParameter("co_attend").equals("") || request.getAttribute("co_comple")== null || request.getParameter("co_comple").equals("") 
		||  request.getAttribute("co_employ")== null || request.getParameter("co_employ").equals("") || request.getParameter("co_same")== null  || request.getParameter("co_same").equals("") || request.getAttribute("co_insurance")== null || request.getParameter("co_insurance").equals("")
		|| request.getAttribute("co_option1")== null || request.getParameter("co_option1").equals("") || request.getAttribute("co_option2")== null || request.getParameter("co_option2").equals("") || request.getAttribute("co_option3")== null || request.getParameter("co_option3").equals("")
		|| request.getAttribute("co_option4")== null || request.getParameter("co_option4").equals("") || request.getAttribute("co_option5")== null || request.getParameter("co_option5").equals("") || request.getAttribute("co_option6")== null || request.getParameter("co_option6").equals("")
		|| request.getAttribute("co_asse")== null || request.getParameter("co_asse").equals("") || request.getAttribute("co_porf")== null || request.getParameter("co_porf").equals("") || request.getAttribute("co_certificate")== null || request.getParameter("co_certificate").equals("")
			|| request.getParameter("c_start")== null || request.getParameter("c_start").equals("") || request.getParameter("c_maintain")== null  || request.getParameter("c_maintain").equals("") || request.getAttribute("c_end")== null || request.getParameter("c_end").equals("") 
			|| request.getAttribute("c_name")== null || request.getParameter("c_name").equals("") || request.getParameter("c_address")== null  || request.getParameter("c_address").equals("") || request.getAttribute("c_number")== null || request.getParameter("c_number").equals("")
			|| request.getAttribute("c_manager")== null || request.getParameter("c_manager").equals("") || request.getAttribute("c_except")== null || request.getParameter("c_except").equals("")			
				){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력 완료')");
				script.println("location.href = 'insert2.do'");
				script.println("</script>");
				
			}
				
		
		}
	
		
	%>


</body>
</html>