<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.databaseconnection.*" %>
<%@ page import="com.databaseoperate.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import=" java.sql.Statement,java.sql.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<head>

</head>

 <body>

	
	<% 
	//连接数据库
	DBConnectionManger dbconn = new DBConnectionManger();
	DataBaseOperate data = new DataBaseOperate();
	String Id = request.getParameter("Id");
	String name = (String)session.getAttribute("name1");
	String sqlDel = "delete from carts where Id='"+Id+"' and userName='"+name+"'";
	data.delect(sqlDel);
 %>
 <script language="javascript">
 window.location.href='goodCarts.jsp';
 </script>
 

</body>
</html>

