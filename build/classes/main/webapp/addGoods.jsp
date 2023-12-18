<%@page import="javax.sound.midi.SysexMessage"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.databaseconnection.*" %>
<%@ page import="com.databaseoperate.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import=" java.sql.Statement,java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addGoods.jsp' starting page</title>
    
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
    String name = (String)session.getAttribute("name1");
  String path3 =   request.getParameter("path");
  String shopName = request.getParameter("name");
  String  price = request.getParameter("price");
  String color = request.getParameter("color");
  String decribe = request.getParameter("decribe");
  //System.out.print(shopName);
  String Id =  request.getParameter("Id");
 String sql = "insert into carts values('"+name+"','"+Id+"','"+path3+"','"+shopName+"','"+price+"','"+color+"','"+decribe+"')";
 String sqlSelect = "select* from carts where Id = '"+Id+"' and userName = '"+name+"'";
		try{
			//连接数据库
			DBConnectionManger dbconn = new DBConnectionManger();
			//DataBaseOperate data = new DataBaseOperate();
			Connection connection = dbconn.getConnection();
			Statement statement = connection.createStatement();
			ResultSet result = statement.executeQuery(sqlSelect);
			if(result.next() == false) {
			statement.executeUpdate(sql);
			%>
			<script language="javascript">
			alert('加入购物车成功！');
			window.location.href='indexPerson.jsp';
			</script>
			
			<% 
			} else {
			%>
			<script language="javascript">
			alert('购物车已经有该商品！');
			window.location.href='indexPerson.jsp';
			</script>
			<%
			}
			}catch(SQLException e){
			System.out.print("插入失败！");
			
			}
			%>
			




</body>
</html>
