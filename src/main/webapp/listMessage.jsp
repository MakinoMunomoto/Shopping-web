<%@page import="java.sql.ResultSet"%>
<%@page import="com.databaseoperate.DataBaseOperate"%>
<%@page import="com.databaseconnection.DBConnectionManger"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'listMessage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
div{
width:1000px;
margin: 0 auto;
background-color: yellow;
}
</style>
  </head>
  
  <body>
   <%
   DBConnectionManger jdbc = new DBConnectionManger();
   DataBaseOperate data = new DataBaseOperate();
   String sql = "select*from test";
   ResultSet result = data.query(sql);
   if(result.next() == false ) {
   out.print("没有留言可查看！");
   } else {
   %>
   <div>
   <table border="1">
   <tr><th width="250">留言人</th><th width="250">留言标题</th><th width="250">留言内容</th><th width="250">留言时间</th></tr>
   </table>
   </div>
<%
while(result.next()) {
 String name = result.getString(1);
 String title = result.getString(2);
 String message = result.getString(3);
 String time = result.getString(4);
 %>
 <div>
<table border="1">
<tr><th width="250"><%=name %></th><th width="250"><%=title %></th><th width="250"><%=message %></th><th width="250"><%=time %></th></tr>
</table>
</div>
 <%
}
}
 %>
 
</body>
</html>
