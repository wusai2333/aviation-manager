<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.*"%>
<%@page import="control.MyControls"%>
<%@page import="model.DbUtils"%>
<%@page import="model.AirScheduled"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
div#header {
	font-size: 19px;
	color: #339999;
	position: relative;
	top: 0px;
	left: 50%;
}
div#menu {
	height: 400px;
	background-color: #66CC99;
	width: 160px;
	float: left;
	margin-bottom: 30px;
}

div#content {
	background-color: #fff;
	height: 1500px;
	margin: 0 auto;
	width: 100%;
	position: relative;
	top: 0px;
	left: 150px;
}

h1 {
	margin-bottom: 0;
}

h2 {
	margin-bottom: 0;
	font-size: 14px;
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
	text-decoration: none;
}

div#btn_bg {
	background-color: #FFCC99;
	height: 40px;
	width: 100%;
	vertical-align: middle;
}

button {
	font-size: 18px;
	background-color: #CC3399;
	height: 35px;
	width: 100px;
	margin-top: 3px;
	color: #fff;
	float: left;
	border: 1px solid #CC3399;
	float: left
}

.form_btn {
	font-size: 18px;
	background-color: #CC3399;
	height: 35px;
	width: 120px;
	margin-top: 3px;
	color: #ff6666;
	float: left;
	border: 1px solid #CC3399;
	float: left
}

div#head {
	background-color: #fff;
	height: 40px;
	padding: 0;
	margin: 0 auto;
	width: 100%;
	position: relative;
	top: 0px;
	left: 150px;
}
/* tr {
	font-size: 15px;
	background-color: #FF6666;
	height: 35px;
	width: 700px;
	color: #fff;
	text-align: center;
	margin-top: 30px;
	border: 1px solid #CC3399;
	float: left
}  */
table {
	border-collapse: collapse;
	border: 1px solid #fff;
	margin-top: 30px;
	margin-left: 20px;
}

tr {
	border: 1px solid #fff;
	margin-left: 20px;
}

td {
	border: 1px solid #fff;
	color: #fff;
	font-size:14px;
	margin-left: 20px;
}

div#tb {
	margin-left: 200px;
	margin-top:100px
}
</style>
<link rel="stylesheet" href="../css/adminManager.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员操作与管理</title>
</head>
<body>

	<div id="menu">
		<ul>
			<li><a href="adminManager.jsp">航班信息管理</a>
				<ul>
					<li><a href="adminManager.jsp" style="color: #FF6666;">查询所有航班</a></li>
					<li><a href="addAirlLine.jsp"target="_blank">添加航班</a></li>
					<li><a href="updateAirLine.jsp" target="_blank">修改航班信息</a></li>
					<li><a href="deleteAirLine.jsp" target="_blank">删除航班信息</a></li>
				</ul></li>
			<li><a href="ticket_price.jsp" target="_blank">票价管理</a></li>
			<li><a href="receiver_book_ticket.jsp" target="_blank">接受订票</a></li>
			<li><a href="return_ticket.jsp" target="_blank">退票</a></li>
			<li><a href="book_ticket_count.jsp" target="_blank">订票统计</a></li>
			<li><a href="login.jsp">退出登录</a></li>
		</ul>
	</div>
	<script type="text/javascript">
		var menu = document.getElementById('menu');
		var as = menu.getElementsByTagName('a');
		for(var i= 0 ;i<as.length; i++){
			as[i].onclick=function(){
				 for(var j = 0;j<as.length;j++){
					 if(as[j] == this) {
			                this.style.color = 'red';
			            } else {
			                as[j].style.color = '';
			            }
				 }
			}
		}
	</script>
	<div id="tb">
		<table>
			<tr>
				<td width="120px">航班号</td>
				<td width="130px">航班时间</td>
				<td width="160px">起始点</td>
				<td width="160px">降落点</td>
				<td width="140px">航空公司</td>
				<td width="140px">起飞时间</td>
				<td width="110px">航班票价</td>
			</tr>
			<%
				List<AirScheduled> allAirs = MyControls.getAllAirInfo();
				for(int i=0;i<allAirs.size();i++){
					out.print("<tr>");
					out.print("<td width='120px'>"+allAirs.get(i).getBrandNum());
					out.print("<td width='130px'>"+allAirs.get(i).getTimes());
					out.print("<td width='160px'>"+allAirs.get(i).getStart_point());
					out.print("<td width='160px'>"+allAirs.get(i).getEnd_point());
					out.print("<td width='140px'>"+allAirs.get(i).getAirline());
					out.print("<td width='140px'>"+allAirs.get(i).landTime);
					out.print("<td width='110px'>"+allAirs.get(i).price);
					out.print("</tr>");
				}
				 response.setIntHeader("Refresh", 5);
			%>
		</table>

	</div>



</body>
</html>