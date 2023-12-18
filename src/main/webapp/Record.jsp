<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.databaseconnection.DBConnectionManger" %>
<%@ page import="com.databaseoperate.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.math.BigDecimal" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Record.jsp' starting page</title>
    
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
  <%!DBConnectionManger dbconn = new DBConnectionManger();
	DataBaseOperate data = new DataBaseOperate();
				 %>
   <%
                ResultSet result = null;
				
				String Id = (String)session.getAttribute("Id");
				String name = (String)session.getAttribute("name1");
				String num = request.getParameter("num");
				String sqlSel = "select*from carts where Id='"+Id+"' and userName='"+name+"'";
				result = data.query(sqlSel);
	
				try{
					if(result.next() == true) {
					
					String shopName = result.getString(4);
					String path1 = result.getString(3);
					String price = result.getString(5);
					String price1 = price.substring(2);
					BigDecimal num1 = new BigDecimal(price1);
					BigDecimal num2 = new BigDecimal(num);
					String sum1 = num1.multiply(num2).toString();
					String sqlInsert = "insert into purchaseRecord values('"+path1+"','"+shopName+"','"+num+"','"+price+"','"+sum1+"','15765481525','"+name+"')";
				   data.insert(sqlInsert);
				   String sqlDel_1 = "delete from carts where Id='"+Id+"' and userName='"+name+"'";
				    data.delect(sqlDel_1);
				    %>
				    <script language="javascript">
				    alert("购买成功！！");
				    window.location.href="goodCarts.jsp";
				    </script>
				    <%
		}
				} catch (SQLException e) {
					
					System.out.print("插入失败！");
				}
   
   
    %>
  </body>
</html>
