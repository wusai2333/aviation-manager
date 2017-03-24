<%@page import="control.MyControls"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<jsp:useBean id="ticket" class="model.AirScheduled" scope="page"></jsp:useBean>
	<jsp:setProperty property="*" name="ticket"/>
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
	font-size: 17px;
	color: #fff;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>票价管理</title>
</head>
<body>


	<div id="add">

		<form action="ticket_price.jsp" method="post" name="form1" onsubmit="return on_submit()">
			航&nbsp;班&nbsp;号&nbsp;&nbsp;:
			<input type="text" class="inputStyle"
				name="brandNum"/> <br /> <br /> 
		航班票价:&nbsp;<input type="text"
				class="inputStyle" name="price"/> <br />
			<br /> <br /> <input type="submit" value="提交" class="btngray">
		</form>
		<%
		  String brandNum= request.getParameter("brandNum");
		  String price = request.getParameter("price");
		  if(brandNum!=null&&price!=null){
			  if(MyControls.updatePrice(brandNum, Double.valueOf(price)))
			  {
				  out.print(MyControls.encodingStr("成功"));
				  response.sendRedirect("admin_opeart_result.jsp");
			  } 
		  }
		%>
		<script type="text/javascript">
		  function on_submit(){
			 if(form1.brandNum.value==""){
				 alert("航班号不为空");
				 return false;
			 } 
			 if(form1.price.value==""){
				 alert("新票价不能为空");
				 return false;
			 }
			 
		  }
		
		</script>
	</div>


</body>
</html>