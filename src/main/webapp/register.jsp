<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
	<%
  request.setCharacterEncoding("utf-8");
   %>
	<base href="<%=basePath%>">
	<title>注册</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" href="css/style.css">

</head>

<body>

	<div class="register-container">
		<h1>注册</h1>
		<!--  
	<form action="test.jsp" method="post" id="registerForm">
	-->
		<form action="registerSolve.jsp" method="post">
			<!-- 用户名 -->
			<div style="float: left;">
				<input type="text" id="username" name="username" class="username" placeholder="您的用户名(不少于3字符)" autocomplete="off" />
				<div id="usernameNone" style="float: right; margin-top: 30px; width: 30px; display: block;">
				</div>
				<div id="usernameTurePicture" style="float: right; margin-top: 30px; width: 30px; display: none;">
					<img src="images/true.png" alt="" style="width: 30px;">
				</div>
				<div id="usernameFalsePicture" style="float: right; margin-top: 30px;display: none; ">
					<img src="images/false.png" alt="" style="width: 30px;">
				</div>

			</div>
			<!-- 第一次输入密码 -->
			<div>
				<input type="password" id="password" name="password" class="password" placeholder="输入密码" oncontextmenu="return false"
				 onpaste="return false" onfocus="myFocus()" />
				<div id="passwordNone" style="float: right; margin-top: 30px; width: 30px; display: block; ">
				</div>
				<div id="passwordTurePicture" style="float: right; margin-top: 30px; width: 30px; display: none;">
					<img src="images/true.png" alt="" style="width: 30px;">
				</div>
				<div id="passwordFalsePicture" style="float: right; margin-top: 30px;display: none; ">
					<img src="images/false.png" alt="" style="width: 30px;">
				</div>
			</div>
			<div>
				<input type="password" id="confirm_password" name="confirm_password" class="confirm_password" placeholder="再次输入密码"
				 oncontextmenu="return false" onpaste="return false" onfocus="myFocusPassword()" />
				<div id="confirm_passwordNone" style="float: right; margin-top: 30px; width: 30px; display: block; ">
				</div>
				<div id="confirm_passwordTurePicture" style="float: right; margin-top: 30px; width: 30px; display: none;">
					<img src="images/true.png" alt="" style="width: 30px;">
				</div>
				<div id="confirm_passwordFalsePicture" style="float: right; margin-top: 30px;display: none; ">
					<img src="images/false.png" alt="" style="width: 30px;">
				</div>
			</div>
			<div>
				<input type="text" id="realName" name="realName" placeholder="收货人" autocomplete="off" onfocus="confirmPasswordTure()" />
				<div id="none" style="float: right; margin-top: 30px; width: 30px;">

				</div>
			</div>
			<div>
				<input type="text" id="phone_number" name="phone_number" class="phone_number" placeholder="输入手机号码" autocomplete="off"
				  />
				<div id="phone_numberNone" style="float: right; margin-top: 30px; width: 30px; display: block; ">
				</div>
				<div id="phone_numberTurePicture" style="float: right; margin-top: 30px; width: 30px; display: none;">
					<img src="images/true.png" alt="" style="width: 30px;">
				</div>
				<div id="phone_numberFalsePicture" style="float: right; margin-top: 30px;display: none; ">
					<img src="images/false.png" alt="" style="width: 30px;">
				</div>
			</div>
			<div>
				<input type="email" id="email" name="email" class="email" placeholder="输入邮箱地址" oncontextmenu="return false" onpaste="return false" onfocus=" myFocuspeone()" />
				<div style="float: right; margin-top: 30px; width: 30px;">

				</div>
			</div>
			<div>
				<input type="text" id="address" name="address" placeholder="收货地址" autocomplete="off"  />
				<div style="float: right; margin-top: 30px; width: 30px;">

				</div>
			</div>
			<div>
				<div onmousemove="registerFocus()">
					<button type="submit" id="register" style="width: 270px; margin-right: 30px;">注 册</button>
				</div>

				<div style="float: right; margin-top: 30px; width: 30px; display: none;">

				</div>
			</div>

		</form>
		<br>
		<a href="login.jsp">
			<button type="button"  class="register-tis" style="width: 270px;margin-right: 30px;" >已经有账号？</button>
		</a>
	</div>


	<script src="js/jquery.min.js"></script>
	<script src="js/common.js"></script>
	<!--背景图片自动更换-->
	<script src="js/supersized.3.2.7.min.js"></script>
	<script src="js/supersized-init.js"></script>
	<!--表单验证-->
	<script src="js/jquery.validate.min.js?var1.14.0"></script>
	<!-- 验证显示对错号 -->
	<script src="js/verify.js"></script>
</body>

</html>