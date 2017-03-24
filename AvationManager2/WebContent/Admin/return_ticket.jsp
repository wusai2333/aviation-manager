<%@page import="model.DbUtils"%>
<%@page import="control.MyControls"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="delete_air" class="model.BookTicket" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="delete_air" />
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

div#delete {
	position: relative;
	top: 100px;
	left: 200px;;
	font-size: 17px;
	color: #fff;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>退票</title>
</head>
<body>


	<div id="delete">

		<form action="return_ticket.jsp" method="post" name="form1"
			onsubmit="return on_submit()">
			订单号:<input type="text" class="inputStyle" name="orderId"> <br />
			<br /> 用户名:<input type="text" class="inputStyle" name="name">
			<br /> <br /> <br /> <br /> <input type="submit" value="提交"
				class="btngray">
		</form>
		<%
		    String orderId  = request.getParameter("orderId");	
			String name = request.getParameter("name");
			if(orderId!=null&&name!=null){
				boolean result = MyControls.return_ticket(orderId, MyControls.encodingStr(name));
				if(result){
					response.sendRedirect("admin_opeart_result.jsp");
				}
			}
		%>
		<script type="text/javascript">
			function on_submit() {
				if (form1.orderId.value == "") {
					alert("订单号不能为空");
					return false;
				}
				/*if (form1.name.value == "") {
					alert("用户名不能为空");
					return false;
				}*/

			}
		</script>
	</div>




</body>
</html>