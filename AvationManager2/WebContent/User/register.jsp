<%@page import="model.User"%>
<%@page import="control.MyControls"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
</style>
<link rel="stylesheet" href="../css/login.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>

</head>
<body>
	<div id="bg">
		<div id="container">
			<form name="form1" action="register.jsp" method="post"
				onsubmit="return checkInput()">
				<div id="header">
					<h1>用户注册</h1>
				</div>
				<br /> 用户名:<input type="text" name="username" class="inputStyle" />
				<br /> <br /> 密&nbsp;&nbsp;&nbsp;码&nbsp;:<input type="password"
					name="psd" class="inputPsdStyle" /> <br />
				<br /> 姓&nbsp;&nbsp;&nbsp;名&nbsp;:<input type="text" name="name"
					class="inputPsdStyle"> <br />
				<br /> 
				身份证:<input type="text" name="cardId"class="inputPsdStyle"/> <br /> <br /> <input type="submit"
					value="注册" class="btngray" /> <br /> <br />

			</form>
		</div>
	</div>
	
	<%
		String cardId = request.getParameter("cardId");
		String name = request.getParameter("name");
		String psd = request.getParameter("psd");
		String username = request.getParameter("username");
		if(cardId!=null&&name!=null&&psd!=null&&username!=null){
			if(MyControls.insertUser(new User(MyControls.encodingStr(username),MyControls.encodingStr(name),MyControls.encodingStr(psd),cardId))){
				out.print(MyControls.encodingStr("成功"));
				response.sendRedirect("userLogin.jsp"); 
			}
		}
	%>
	<script type="text/javascript">
		function checkInput() {
			if (form1.username.value == "") {
				alert("用户名不能为空");
				return false;

			}
			if (form1.name.value == "") {
				alert("姓名不能为空");
				return false;

			}
			if (form1.cardId.value == "") {
				alert("身份证不能为空");
				return false;

			}
			if (form1.psd.value == "") {
				alert("密码不能为空");
				return false;

			}

		}
	</script>

</body>
</html>