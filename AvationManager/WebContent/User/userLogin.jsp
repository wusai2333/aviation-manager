<%@page import="control.MyControls"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
	background-color:#FF6666;
}
p{
background-color: #FF6666
}
h1{
background-color: #FF6666
}
</style>
<link rel="stylesheet" href="../css/login.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登陆</title>

</head>
<body>
	<div id="bg">
		<div id="container">
			<form name="form1" action="userLogin.jsp" method="post"
				onsubmit="return checkInput()">
				<div id="header">
					<h1>用户登录</h1>
				</div>
				<br /> 用户名:<input type="text" name="admin_username"
					class="inputStyle"> <br /> <br /></br> 密&nbsp;&nbsp;码&nbsp;:<input
					type="password" name="admin_psd" class="inputPsdStyle"> <br />
				<br /> <br /> <input type="submit" value="登陆" class="btngray">
				<br /> <br /> <input type="reset" value="注册" class="btnreset" onclick="window.location.href='../User/register.jsp';">
			</form>
		</div>
	</div>
	
	<%
		String user_psd = request.getParameter("admin_psd");	
		String user_username = request.getParameter("admin_username");
		if(user_psd!=null&&user_username!=null){
		   if(MyControls.querUser(MyControls.encodingStr(user_username), MyControls.encodingStr(user_psd))){
			   session.setAttribute("username", user_username);
			   response.sendRedirect("UserManager.jsp");
		   }else{
			   out.print("用户名或者密码错误");
		   }
		}
	%>
	<script type="text/javascript">
		function checkInput() {
			if (form1.admin_username.value =="") {
				alert("用户名不能为空");
				return false;

			}
			if (form1.admin_psd.value == "") {
				alert("密码不能为空");
				return false;

			}

		}
	</script>

</body>
</html>