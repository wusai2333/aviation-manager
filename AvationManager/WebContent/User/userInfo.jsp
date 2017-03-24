<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="model.*" %>
	<%@page import="control.MyControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
body {
	font-size: 17px;
	color: #fff;
	background-color: #ff6666;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息管理</title>
</head>
<body>
 
      <%
      	 String username = (String) session.getAttribute("username");
         if(username!=null){
        	User user = MyControls.queryUserByUsername(MyControls.encodingStr(username));
         	out.print("用户名:"+user.name);
         	out.print("<br/>");
         	out.print("姓名: "+user.username);
         	out.print("<br/>");
         	out.print("身份证:"+user.cardId);
         }
      %>

</body>
</html>