<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.databaseconnection.DBConnectionManger" %>
<%@ page import="com.databaseoperate.*" %>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'purchase.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script language="javascript">
/*window.onload = function(){
  function openwindow(url,name,iWidth,iHeight)
{
var url; //转向网页的地址;
var name; //网页名称，可为空;
var iWidth; //弹出窗口的宽度;
var iHeight; //弹出窗口的高度;
//window.screen.height获得屏幕的高，window.screen.width获得屏幕的宽
var iTop = (window.screen.height-30-iHeight)/2; //获得窗口的垂直位置;
var iLeft = (window.screen.width-10-iWidth)/2; //获得窗口的水平位置;
window.open(url,name,'height='+iHeight+',,innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
}


 var number;
 var Otext = document.getElementById('text');
 number = prompt("输入你购买的数量");
 if(number != null) {
Otext.value = number;
 openwindow("Image.html","付款","300","300");
 alert('购买成功');
 //window.location.href='goodCarts.jsp';
 } 
 if(number == null){
 alert('购买失败！');
 //window.location.href='goodCarts.jsp';
 }
 }
*/
 </script>
 <style type="text/css">
 div{
width:500px;
height:50px;
margin: 0 auto;
margin-top:200px;

 }
 </style>
  </head>
  
  <body>
 <div>
 <form action="Record.jsp" method="post">
 <table border="1">
 <tr><th colspan="2" width="500px">请输入你要买的数量</th></tr>
 <tr><th>购买数量:</th><th><input type="text"  name="num"></th></tr>
 <tr><th colspan="2"><input type="submit" value="提交">&nbsp;&nbsp;&nbsp;<input type="reset" value="重置"></th></tr>
 </table>
 </form>
 </div>
  
 
 <%
	String Id = request.getParameter("Id");
	session.setAttribute("Id", Id);
 %>
  </body>
</html>
