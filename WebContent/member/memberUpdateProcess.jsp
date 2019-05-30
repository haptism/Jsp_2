<%@page import="com.iu.member.MemberDAO"%>
<%@page import="com.iu.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	/* MemberDTO memberDTO = new MemberDTO();
	memberDTO.setId(request.getParameter("id")); */
%>   
<jsp:useBean id="memberDTO" class="com.iu.member.MemberDTO" />
<jsp:setProperty property="*" name="memberDTO"/>
 <%
 	MemberDAO memberDAO = new MemberDAO();
 	int result = memberDAO.memberUpdate(memberDTO);
 	
 	if(result>0){
 		response.sendRedirect("./memberMyPage.jsp");
 		session.setAttribute("member", memberDTO);
 		/* MemberDTO m = (MemberDTO)session.getAttribute("member");
 		m.setId(memberDTO.getId()); */
 		
 		
 	}else {
 		request.setAttribute("message", "Update Fail");
 		request.setAttribute("path", "./memberMyPage.jsp");
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
	<h1>Update process</h1>
</body>
</html>