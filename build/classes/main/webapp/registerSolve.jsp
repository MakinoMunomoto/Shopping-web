<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.databaseconnection.DBConnectionManger" %>
<%@ page import="com.databaseoperate.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'registerSolve.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
    request.setCharacterEncoding("utf-8");
		//获取注册用户名
		String oUsername = request.getParameter("username");
		//获取注册密码
		String oPassword = request.getParameter("password");
		//确认注册密码
		String oConfirm_password = request.getParameter("confirm_password");
		//获取用户真实姓名
		String oRealName = request.getParameter("realName");
		//获取用户手机号
		String oPhone_number = request.getParameter("phone_number");
		//获取用户注册的邮箱地址
		String oEmail = request.getParameter("email");
		//获取用户的收货地址
		String oAddress = request.getParameter("address");
		//连接数据库
		DBConnectionManger jdbc = new DBConnectionManger();
		//对数据库进行插入操作
		//System.out.print("执行");
		String sql1 = "select*from My_users where userName='"+oUsername+"'";
		String sql = "insert into My_users values('"+oUsername+"','"+oPassword+"','"+oRealName+"','"+oPhone_number+"','"+oEmail+"','"+oAddress+"')";
		DataBaseOperate data = new DataBaseOperate();
		ResultSet result = data.query(sql1);
		try {
			if( result.next() == true ) {
				out.print("<script>alert('输入用户名重复，点击确定返回注册页面')</script>");
		out.print("<script>function tiao() {window.location.href='register.jsp';}setTimeout('tiao()',1);</script>");
				//request.getRequestDispatcher("register.jsp").forward(request, response);
				return;
			}
		} catch (SQLException e) {
			
			System.out.println("");
		}
		
		if(oUsername != ""&&oPassword.equals(oConfirm_password)) {
		data.insert(sql);
		out.print("<script>alert('注册成功，点击确定返回登录界面！')</script>");
		//response.sendRedirect("login.jsp");
		out.print("<script>function tiao() {window.location.href='login.jsp';}setTimeout('tiao()',1);</script>");
	}else {
	out.print("<script>alert('注册失败，点击确定返回重新注册！')</script>");
		//response.sendRedirect("login.jsp");
		out.print("<script>function tiao() {window.location.href='register.jsp';}setTimeout('tiao()',1);</script>");
	}
	
	

    
     %>
  </body>
</html>
