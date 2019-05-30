<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@page import="com.iu.point.PointDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="oracle.jdbc.driver.DBConversion"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	
	NoticeDAO noticeDAO = new NoticeDAO();
	NoticeDTO noticeDTO = noticeDAO.selectOne(num);
			
%>    
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
 
 <%@ include file="../temp/css_meta.jsp" %>

  <style type="text/css">
  	.main {
  		min-height: 800px;
  	}
  
  </style>	

</head>
<body>
  <%@ include file="../temp/header_nav.jsp" %>	
  
  <div class="container main">
  	<div class="row">
  		<h1>Notice List</h1>
  	</div>
  	
  	<!-- table -->
  	<div class="row">
		<table class="table table-hover">
			<tr>
				<td>NUM</td><td>TITLE</td><td>CONTENTS</td> <td>WRITER</td><td>DATE</td><td>HIT</td>
			</tr>
		
			<tr>
				<td><%= noticeDTO.getNum() %> </td>
				<td><%= noticeDTO.getTitle() %></td>
				<td><%= noticeDTO.getContents() %> </td>
				<td><%= noticeDTO.getWriter() %> </td>
				<td><%= noticeDTO.getReg_date() %> </td>
				<td><%= noticeDTO.getHit()%> </td>
				
			</tr>
			
	
			
		</table>  	
  	</div>
  	
  	<%if(memberDTO != null && memberDTO.getId().equals("admin")){ %>
  	<div class="row">
  		<a href="./noticeUpdateCheck.jsp?num=<%=noticeDTO.getNum()%>" class="btn btn-primary">Update</a>
  		<a href="./noticeDelete.jsp?num=<%=noticeDTO.getNum()%>" " class="btn btn-primary">Delete</a>
  	</div>
  	<%} %>
  
  </div>
  



 <%@ include file="../temp/footer.jsp" %>
</body>
</html>