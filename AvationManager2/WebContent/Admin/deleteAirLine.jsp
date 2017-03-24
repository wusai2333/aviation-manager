<%@page import="model.DbUtils"%>
<%@page import="control.MyControls"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="delete_air" class="model.AirScheduled" scope="page"></jsp:useBean>
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
<title>删除航班信息</title>
</head>
<body>


	<div id="delete">

		<form action="deleteAirLine.jsp" method="post" name="form1" onsubmit="return on_submit()">
			航&nbsp;班&nbsp;号&nbsp;&nbsp;:<input type="text" class="inputStyle"
				name="brandNum"> <br /> <br /> <br /> <br /> <br /> <input
				type="submit" value="提交" class="btngray">
		</form>
		<%
		    String brandNum = delete_air.getBrandNum();
		    if(brandNum!=null){
		    	if(MyControls.deleteAirlineInfo(brandNum)){
		    		out.print(MyControls.encodingStr("成功"));
		    		response.sendRedirect("admin_opeart_result.jsp");
		    		
		    	}
		    }
		
		%>
         <script type="text/javascript">
           function on_submit(){
        	   if(form1.brandNum.value==""){
        		   alert("航班号不能为空");
        		   return false;
        	   }
        	   
           }
         
         </script>
	</div>




</body>
</html>