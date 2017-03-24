<%@page import="com.sun.swing.internal.plaf.basic.resources.basic"%>
<%@page import="control.MyControls"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="model.AirScheduled"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
body {
	background-color: #ff6666
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
	margin-left: 75px;
	text-align: center;
	vertical-align: middle;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border: 1px solid #339999;
}

div#query {
	position: relative;
	top: 50px;
	left: 200px;;
	font-size: 17px;
	color: #fff;
}

table {
	border-collapse: collapse;
	border: 1px solid #fff;
	margin-top: 70px;
	margin-left: 20px;
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

div#content {
	width: 100%;
	float: none;
	padding-left: 20px;
	height: 600px;
	margin-top: 20px;
	padding-left: 20px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>票务信息查询</title>
</head>
<body>


	<div id="query">

		<form action="ticket_query.jsp" method="post" name="form1"
			onsubmit="return on_submit()">
			时&nbsp;&nbsp;&nbsp;间: <input type="text" class="inputStyle"
				name="time" /><br /> <br /> 
			起始点: <input type="text" class="inputStyle" name="start" /> <br /> <br />
			降落点:&nbsp;<input type="text" class="inputStyle" name="end" /> <br />
			<br /> <input type="submit" value="查询" class="btngray">
			<br />
		</form>
		<script type="text/javascript">
			function on_submit() {
				if (form1.start.value == "") {
					alert("起始点不为空");
					return false;
				}
				 if (form1.time.value == "") {
					alert("时间不为空");
					return false;
				} 
				if (form1.end.value == "") {
					alert("降落点不能为空");
					return false;
				}

			}
		</script>
	</div>
	<div id="content">

		<!-- <table>

		<tr>
			<td width="120px">航班号</td>
			<td width="130px">航班时间</td>
			<td width="160px">起始点</td>
			<td width="160px">降落点</td>
			<td width="140px">航空公司</td>
			<td width="110px">航班票价</td>
		</tr>
	</table> -->
		<%
			String start = request.getParameter("start");
			String end = request.getParameter("end");
			String time = request.getParameter("time");
			if (start != null && end != null) {
				List<AirScheduled> alAirScheduleds = MyControls.queryAirInfoByTime(time,MyControls.encodingStr(start),
						MyControls.encodingStr(end));
				if(alAirScheduleds.size()>0){
					out.append("<table>");
					out.print("<tr>");
					out.print("<td width='120px'>航班号</td>");
					out.print("<td width='130px'>航班时间</td>");
					out.print("<td width='130px'>起始点</td>");
					out.print("<td width='130px'>降落点</td>");
					out.print("<td width='140px'>航班公司</td>");
					out.print("<td width='120px'>票价</td>");
					out.print("<td width='110px'>座位</td>");
					out.print("</tr>");
					for (AirScheduled airScheduled : alAirScheduleds) {
						 out.print("<tr>");
						 out.print("<td width='120px'>"+airScheduled.brandNum+"</td>");
							out.print("<td width='130px'>"+airScheduled.times+"</td>");
							out.print("<td width='130px'>"+airScheduled.start_point+"</td>");
							out.print("<td width='130px'>"+airScheduled.end_point+"</td>");
							out.print("<td width='140px'>"+airScheduled.airline+"</td>");
							out.print("<td width='120px'>"+airScheduled.price+"</td>");
							out.print("<td width='110px'>"+airScheduled.seat+"</td>");
						 	out.print("<tr/>");
					}
					 out.print("</table>");
				}else{
					out.print(MyControls.encodingStr("没搜到航班"));
				}
				

			}
		%>

	</div>




</body>
</html>
