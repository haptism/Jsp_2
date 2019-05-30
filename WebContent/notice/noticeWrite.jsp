<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<%@ include file="../temp/css_meta.jsp" %>
</head>
<body>
<%@ include file="../temp/header_nav.jsp" %>
<div class="container">
	<div class="row">
	<form action="./noticeWriteProcess.jsp" method="post">
    <div class="form-group">
      <label for="name">Title:</label>
      <input type="text" class="form-control" id="title" placeholder="Enter Title" name="title">
    </div>
    <div class="form-group">
      <label for="writer">Writer:</label>
      <input type="text" class="form-control" id="writer" readonly="readonly" value="<%= memberDTO.getId() %>" name="writer">
    </div>
    <div class="form-group">
      <label for="contents">Contents:</label>
      <textarea  class="form-control" rows="5" cols="" name="contents" ></textarea>
    </div>
    
    
    <button type="submit" class="btn btn-danger">Write</button>
  </form>	
</div>
	

</div>


<%@ include file="../temp/footer.jsp" %>
</body>
</html>