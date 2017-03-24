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
<title>管理员登陆</title>

</head>
<body>
	<div id="bg">
		<div id="container">
			<form name="form1" action="login.jsp" method="post"
				onsubmit="return checkInput()">
				<div id="header">
					<h1>管理员登录</h1>
				</div>
				<br /> 用户名:<input type="text" name="admin_username"
					class="inputStyle"> <br /> <br /></br> 密&nbsp;&nbsp;码&nbsp;:<input
					type="password" name="admin_psd" class="inputPsdStyle"> <br />
				<br /> <br /> <input type="submit" value="登陆" class="btngray">
				<br /> <br /> <input type="reset" value="用户登陆" class="btnreset" onclick="window.location.href='../User/userLogin.jsp';">
			</form>
		</div>
	</div>
	
	<%
		String admin_psd = request.getParameter("admin_psd");	
		String admin_username = request.getParameter("admin_username");
		if(admin_psd!=null&&admin_username!=null){
			if(admin_psd.equals("admin")&&admin_username.equals("admin")){
				response.sendRedirect("adminManager.jsp");
				session.setAttribute("admin_username", admin_username);
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