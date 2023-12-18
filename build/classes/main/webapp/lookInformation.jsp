<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@page import="com.databaseoperate.DataBaseOperate"%>
<%@page import="com.databaseconnection.DBConnectionManger"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'lookInformation.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
body{
background-color:yellow; 
}
#container{
width:500px;
margin: 0 auto;

}
#div1{
background-color: red;
}
#div2{
margin-top:20px; 
background-color: red;
}
a{
text-decoration: none;
}
</style>
</head>
  
  <body>
   <%
   request.setCharacterEncoding("utf-8");
   		//连接数据库
   DBConnectionManger jdbc = new DBConnectionManger();
   		//对数据库进行操作
   	DataBaseOperate data = new DataBaseOperate();
   		//获取查看信息的用户名
   	String userName = (String)session.getAttribute("name1");
   	String sql = "select*from My_users where userName = '"+userName+"'";
   	ResultSet result = data.query(sql);
   	while(result.next()) {
   	String name = result.getString(1);
   	String password = result.getString(2);
   	String realName = result.getString(3);
   	String phoneNum = result.getString(4);
   	String email = result.getString(5);
   	String address = result.getString(6);
   	%>
   	<div id="container">
   <div id="div1">
   <table border="1">
   	<tr><th width="500px;" colspan="2">我的个人信息</th></tr>
   	<tr><th width="250px;">用户名:</th><td width="250px;" > <input type="text"  value="<%=name%> " size="25" ></td></tr>
   	<tr><th>密&nbsp;&nbsp;&nbsp;码:</th><td><input type="text" value="<%=password%>" size="25"></td></tr>
   	<tr><th>收货人:</th><td><input type="text" value="<%=realName%>" size="25"></td></tr>
   	<tr><th>手机号:</th><td><input type="text" value="<%=phoneNum%>" size="25"></td></tr>
   	<tr><th>邮&nbsp;&nbsp;&nbsp;箱:</th><td><input type="email" value="<%=email%>" size="25"></td></tr>
   	<tr><th>地&nbsp;&nbsp;&nbsp;址:</th><td><input type="text" value="<%=address%>" size="25"></td></tr>
   	<tr><th colspan="2"><input type="button" value="修改个人信息" onclick="altInformation()"></th></tr>
   	</table>
   </div>
    <%
   }
    %>
  <!-- 留言板 -->
  <div id="div2">
  <form action="leaveMessage" method="post">
  <table border="1">
  <tr><th colspan="2" width="500px;">留言板</th></tr>
  <tr><th width="150px;"> 标题</th><td><input type="text" name="title" size="40"></td></tr>
  <tr><th colspan="2">
  <textarea  rows="20" cols="70" name="textarea">

  </textarea>
  </th></tr>
  <tr><th colspan="2"><button><a href="listMessage.jsp">查看留言列表</a></button></th></tr>
  <tr><th colspan="2"><button type="submit" size="20">提交</button></th></tr>
  </table>
  <table>
  
  <tr><th width="500px" colspan="2"><button><a href="indexPerson.jsp">退出</a></button></th></tr>
  </table>
  </form>
  </div>
  </div>
   </body>
   
<script language="javascript">

function altInformation() {
window.location.href='alt.jsp';
}
function returnindex() {
window.location.href='indexPerson.jsp';
}
</script>
   </html>
