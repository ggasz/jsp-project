<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<%@ page import = "subject.*" %>
<%@ page import="java.io.PrintWriter"  %>
<jsp:useBean id="subject" class="subject.SubjectDTO" scope="page"/>
<jsp:setProperty name="subject" property="s_name" />
<jsp:setProperty name="subject" property="s_code" />
<jsp:setProperty name="subject" property="s_start" />
<jsp:setProperty name="subject" property="s_end" />
<jsp:setProperty name="subject" property="s_manage" />
<jsp:setProperty name="subject" property="s_professor" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과정추가</title>
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
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}else{
		if(subject.getS_name() == null || subject.getS_code() == null || subject.getS_start() == null || subject.getS_end() == null
			|| subject.getS_manage() == null || subject.getS_professor() == null){
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')"); 
			script.println("history.back()");
			script.println("</script>");	
		}else{
			SbujectDAO subjectDAO = new SubjectDAO();
			int result = subjectDAO.insert(subject.getS_name(),subject.getS_code(),subject.getS_start(),subject.getS_end(),subject.getS_manage(),subject.getS_professor());
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('수강인원 입력에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
		else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'home.do'"); /* 수정필요 */
			script.println("</script>");
		}
	}
	%>
</body>
</html>