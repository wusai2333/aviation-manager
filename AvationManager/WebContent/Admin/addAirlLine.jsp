<%@page import="com.sun.swing.internal.plaf.basic.resources.basic"%>
<%@page import="model.AirScheduled"%>
<%@page import="control.MyControls"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="air_schedule" class="model.AirScheduled" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="air_schedule" />
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
	margin-left: 85px;
	text-align: center;
	vertical-align: middle;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border: 1px solid #339999;
}

div#add {
	position: relative;
	top: 100px;
	left: 200px;;
	height:600px;
	font-size: 17px;
	color: #fff;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加航班信息</title>
</head>
<body>


	<div id="add">
		<form action="addAirlLine.jsp" method="post" name="form1"
			onsubmit="return on_submit()">

			航&nbsp;班&nbsp;号&nbsp;&nbsp;:<input type="text" class="inputStyle"
				name="brandNum"> <br />
			<br /> 航班时间:<input type="text" class="inputStyle" name="times">
			<br />
			<br /> 起&nbsp;始&nbsp;点&nbsp;&nbsp;:<input type="text"
				class="inputStyle" name="start_point"> <br />
			<br /> 降&nbsp;落&nbsp;点&nbsp;&nbsp;:<input type="text"
				class="inputStyle" name="end_point"> <br />
			<br /> 航空公司:<input type="text" class="inputStyle" name="airline">
			<br />
			<br /> 
			起飞时间:<input type="text" class="inputStyle" name="landTime">
			<br /><br/>
			剩余座位:<input type="text" class="inputStyle" name="seat">
			<br /><br/>
			航班票价:<input type="text" class="inputStyle" name="price">
			<br /><br/>
			<br /> <input type="submit" value="提交" class="btngray">
		</form>
		<%
		    String brandNum = request.getParameter("brandNum");
			String times = request.getParameter("times");
			String start_point = request.getParameter("start_point");
			String end_point = request.getParameter("end_point");
			String air_line = request.getParameter("airline");
			String land_time = request.getParameter("landTime");
			String price = request.getParameter("price");
			String seat = request.getParameter("seat");
			if (brandNum!=null&&times!=null&&start_point!=null&&end_point!=null&&air_line!=null
					&&land_time!=null&&price!=null&&seat!=null
					) {
				if(MyControls.insertAirLineInfo(new AirScheduled(times,start_point,end_point,brandNum,air_line,Double.valueOf(price),land_time,Integer.valueOf(seat)))){
					//成功
					out.print(MyControls.encodingStr(air_schedule.airline));
					request.setAttribute("operate", "成功");
					response.sendRedirect("admin_opeart_result.jsp"); 
				}
				
				
			}
			
		%>
		<script type="text/javascript">
			function on_submit() {

				if (form1.brandNum.value == "") {
					alert("航班号不能为空");
					return false;
				}
				if (form1.times.value == "") {
					alert("航班时间不能为空");
					return false;
				}
				if (form1.start_point.value == "") {
					alert("航班起点不能为空");
					return false;
				}
				if (form1.end_point.value == "") {
					alert("航班降落点不能为空");
					return false;
				}
				if(form1.landTime.value==""){
					return false;
				}
				if (form1.airline.value == "") {
					alert("航空公司不能为空");
					return false;
				}

			}
		</script>

	</div>






</body>
</html>