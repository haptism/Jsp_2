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
	
	NoticeDAO noticeDAO = new NoticeDAO();
	ArrayList<NoticeDTO> ar = noticeDAO.selectList();
	
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
				<td>NUM</td><td>TITLE</td><td>WRITER</td><td>DATE</td><td>HIT</td>
			</tr>
		<% for(NoticeDTO noticeDTO: ar){ %>
			<tr>
				<td><%= noticeDTO.getNum() %> </td>
				<td class="select" id="<%= noticeDTO.getNum() %>" title="<%= noticeDTO.getNum() %>"><%= noticeDTO.getTitle() %></td>
				<td><%= noticeDTO.getWriter() %> </td>
				<td><%= noticeDTO.getReg_date() %> </td>
				<td><%= noticeDTO.getHit()%> </td>
				
			</tr>
			
		<%} %>
			
		</table>  	
  	</div>
  	<div>
  		<form id="frm" action="./noticeSelect.jsp">
  			<input type="hidden" id="n" name="num">
  		</form>
  	</div>
  	
  	<%if(memberDTO != null && memberDTO.getId().equals("admin")){ %>
  	<div class="row">
  		<a href="./noticeWrite.jsp" class="btn btn-primary">Write</a>
  	</div>
  	<%} %>
  
  </div>
  



 <%@ include file="../temp/footer.jsp" %>
   <script type="text/javascript">
  
	$('.select').click(function() {
		//var n=$(this).prev().text();
		var n = $(this).attr('title');
		$('#n').val(n);
		$('#frm').submit();
		//alert(n)
		//location.href="./noticeSelect.jsp?num="+n;
	});
	
  
  
  </script>
 
</body>
</html>