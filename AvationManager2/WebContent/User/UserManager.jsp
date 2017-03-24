<%@page import="control.MyControls"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
body {
	background-color: #FF6666;
}

p {
	background-color: #FF6666
}

h1 {
	background-color: #FF6666
}

ul {
	margin: 0;
}

li {
	list-style: none;
}

a {
	font-size: 18px;
	color: #fff;
	margin-top: 10px;
	text-decoration: none;
}
</style>
<link rel="stylesheet" href="../css/login.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>票务管理</title>
</head>
<body>

	<div id="container">

		<ul>

			<li><a href="airline_query.jsp" target="_blank">航班时刻查询</a></li>
			<li><a href="ticket_query.jsp" target="_blank">票务信息查询</a></li>
			<li><a href="book_tickets.jsp" target="_blank">订票</a></li>
			<li><a href="return_ticket.jsp" target="_blank">退票</a></li>
			<li><a href="userInfo.jsp" target="_blank">个人信息管理</a></li>
			<li><a href="userLogin.jsp">退出登录</a></li>
		</ul>
		<%
		%>
		<script type="text/javascript">
		  var container = document.getElementById("container");
		  var tag = container.getElementsByTagName("a");
		  for(var i=0;i<tag.length;i++){
			  tag[i].onclick = function(){
				  for(var j =0;j<tag.length;j++){
					  if(tag[j]==this){
						 this.style.color='red'; 
					  }else{
						  tag[j].style.color='';
					  }
				  }
				 
				  
				  
			  }
			  
		  }
		</script>

	</div>



</body>
</html>