<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>    
<jsp:useBean id="memberDTO" class="com.iu.member.MemberDTO" />
<jsp:setProperty property="*" name="memberDTO"/>
<%
	MemberDAO memberDAO = new MemberDAO();
	session.setMaxInactiveInterval(interval)
	//체크박스의 값 확인
	String check = request.getParameter("remember");
	System.out.println(check);
	//쿠키 생성,
	if(check != null){
		Cookie c = new Cookie("check", memberDTO.getId());
		c.setMaxAge(60*60*24*7);
		response.addCookie(c);
	}else {
		Cookie c = new Cookie("check", "");
		response.addCookie(c);
	}
	
	memberDTO = memberDAO.memberLogin(memberDTO);
	
	if(memberDTO != null){
		session.setAttribute("member", memberDTO);
		response.sendRedirect("../index.jsp");	
		
	}else {
		request.setAttribute("message", "Login Fail");
		request.setAttribute("path", "./memberLogin.jsp");
		RequestDispatcher view = request.getRequestDispatcher("../common/test/result.jsp");
		view.forward(request, response);
		
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>