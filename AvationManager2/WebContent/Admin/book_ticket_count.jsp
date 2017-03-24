<%@page import="control.MyControls"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="model.*"%>
<jsp:useBean id="book" class="model.BookTicket" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="book" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
table {
	border-collapse: collapse;
	border: 1px solid #fff;
	margin-top: 30px;
	margin-left: 20px;
}

body {
	background-color: #ff6666;
}

tr {
	border: 1px solid #fff;
	margin-left: 20px;
}

td {
	border: 1px solid #fff;
	color: #fff;
	font-size: 14px;
	margin-left: 20px;
}

div#tb {
	margin-left: 290px;
	margin-top: 100px
}

.inputStyle {
	height: 25px;
	color: #000;
	margin-left: 10px;
	font-size: 15px;
	background-color: #FFFFFF;
}

.btngray {
	background-color: #339999;
	width: 160px;
	font-size: 16px;
	color: #fff;
	height: 30px;
	margin-left: 55px;
	text-align: center;
	vertical-align: middle;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border: 1px solid #339999;
}

div#book {
	height: 400px;
	width: 260px;
	background-color: #66CC99;
	font-size: 17px;
	color: #fff;
	float: left;
	text-align: center;
}

div#form1 {
	font-size: 16px;
	color: #fff;
}

div#content {
	width: 100%;
	float: none; padding-left : 20px;
	height: 600px;
	padding-left: 20px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订票统计</title>
</head>
<body>

	
	<div id="content">

		<table id="tb">

			<tr>
				<td width="140px">订单号</td>
				<td width="140px">时间</td>
				<td width="110px">用户</td>
				<td width="130px">身份证</td>
				<td width="130px">起始点</td>
				<td width="130px">降落点</td>
				<td width="130px">票价</td>
			</tr>
			<%
				List<BookTicket> allTickets = MyControls.getAllBookTicketAlready();
				for (int i = 0; i < allTickets.size(); i++) {
					out.print("<tr>");
					out.print("<td width='140px'>" + allTickets.get(i).orderId);
					out.print("<td width='140px'>" + allTickets.get(i).time);
					out.print("<td width='110px'>" + allTickets.get(i).name);
					out.print("<td width='130px'>" + allTickets.get(i).cardId);
					out.print("<td width='130px'>" + allTickets.get(i).start_point);
					out.print("<td width='130px'>" + allTickets.get(i).end_point);
					out.print("<td width='130px'>" + allTickets.get(i).price);
					out.print("</tr>");
					
				}
			%>
			
		</table>
	</div>

</body>
</html>