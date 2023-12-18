<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.databaseconnection.*" %>
<%@ page import="com.databaseoperate.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import=" java.sql.Statement,java.sql.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@page import="com.dao.ItemsDAO"%>
<%@page import="com.entity.*"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>电子商务购物平台</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/shop-homepage.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">

<script>
	function showtime() {
		var myDate = new Date();
		document.getElementById("time").innerHTML = myDate.getHours() + "点"
				+ myDate.getMinutes() + "分" + myDate.getSeconds() + "秒";
		setTimeout("showtime()", 1000);
	}
	
</script>

<style type="text/css">
#rows{
width:1400px;
}
			
			/**
			footer的css样式
			*/
			footer {
				width: 100%;
				height: 320px;
				position: relative;
				background-color: black;
				
			}
			
			footer .foot_top {
				width: 1215px;
				height: 130px;
				position: relative;
				top: 100px;
				left: 50%;
				transform: translateX(-50%);
				border-bottom: gray solid 1px;
			}
			
			footer .foot_top .foot_text {
				width: 800px;
				height: 90px;
				float: left;
			}
			
			footer .foot_top .foot_text>li {
				display: inline-block;
				list-style: none;
				margin-right: 85px;
			}
			
			footer .foot_top .foot_text>li>ul>li {
				list-style: none;
				font-size: 13px;
				margin-bottom: 5px;
			}
			
			footer .foot_top .foot_text>li:last-child {
				margin: 0;
			}
			
			footer .foot_top .foot_text>li>ul>li>a {
				text-decoration: none;
				color: gray;
			}
			
			footer .foot_top .foot_text>li>ul>li>a:hover {
				color: #008B8B;
			}
			
			footer .foot_top .right_text {
				width: 205px;
				height: 100px;
				position: absolute;
				right: 0;
				top: 0;
			}
			
			footer .foot_top .right_text>p:nth-of-type(1) {
				width: 190px;
				height: 40px;
				color: black;
				font-size: 27px;
				float: right;
			}
			
			footer .foot_top .right_text>p:nth-of-type(2) {
				color: gray;
				width: 240px;
				position: relative;
				top: 0px;
				font-size: 12px;
				transform: translateX(-45px);
			}
			
			footer .foot_top .right_text>div {
				width: 130px;
				height: 30px;
				border-radius: 3px;
				color: midnightblue;
				position: absolute;
				bottom: 0;
				right: 0;
				border: silver solid 1px;
				text-align: center;
				line-height: 30px;
			}
			
			footer .foot_bottom {
				width: 1230px;
				height: 70px;
				font-size: 10px;
				color: darkslategray;
				position: relative;
				top: 120px;
				left: 50%;
				transform: translateX(-50%);
			}
			
			footer .foot_bottom>div {
				width: 700px;
				height: 40px;
				float: left;
			}
			
			footer .foot_bottom>div>p {
				width: 500px;
				float: left;
			}
			
			footer .foot_bottom>div>a {
				text-align: center;
				width: 60px;
				text-decoration: none;
				float: left;
				margin-left: 5px;
				border-left: gainsboro solid 1px;
			}
			
			footer .foot_bottom>div>a:hover {
				color: darkslategray;
			}
			
			footer .foot_bottom>div>a:nth-of-type(4) {
				width: 400px;
				height: 20px;
				border-left: none;
				text-align: initial;
				float: left;
				color: gray;
				padding-top: 10px;
			}
			
			footer .foot_bottom>ul {
				top: 0;
				right: 0;
				width: 115px;
				height: 50px;
				position: absolute;
				top: -70px;
				right: 0;
			}
			
			footer .foot_bottom>ul>li {
				display: block;
				height: 100px;
			}
			
			footer .foot_bottom>ul>li>div {
				width: 115px;
				height: 50px;
				border-radius: 5px;
			}
			
			footer .foot_bottom>ul>li>div>span {
				position: relative;
				top: 20px;
				left: 15px;
			}
			
			footer .foot_bottom>ul>li>div>p {
				position: relative;
				top: 19px;
				left: 18px;
			}
			
			footer .foot_bottom>ul>li>div:nth-child(2)>span {
				display: block;
				width: 20px;
				height: 20px;
				overflow: hidden;
				float: left;
			}
			
			footer .foot_bottom>ul>li>div:nth-child(2)>p,
			footer .foot_bottom>ul>li>div:nth-child(1)>p {
				width: 25px;
				height: 20px;
				float: left;
				margin-left: 10px;
			}
			
			footer .foot_bottom>ul>li>div:nth-child(1) {
				display: none;
			}
			
			footer .foot_bottom>ul>li>div:nth-child(1)>span {
				display: block;
				width: 20px;
				height: 20px;
				overflow: hidden;
				float: left;
			}
			
			footer .foot_bottom>ul>li>div:nth-child(1)>span>img {
				transform: translateY(-30px);
			}
			
			footer .foot_bottom>ul>li:hover {
				border-radius: 5px;
				background-color: white;
				border: 1px solid gainsboro;
			}
			
			footer .foot_bottom>ul>li:hover>div:nth-child(1) {
				display: block;
			}
			#searchFrame{
				font-style: italic;
			}



#container2{
width:250px;
height:10px;
margin: 0 auto;
}
#container3{
width:800px;
margin: 0 auto;
margin-top:40px; 

}
#div1{
width:250px;
margin: 0 auto;
}
</style>

</script>
</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" ><i
					class="fa fa-shopping-cart fa-lg"></i> 电子商务平台
</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<div>
				<ul class="nav navbar-nav">
					<li><a href="https://www.lenovo.com.cn/">电脑</a></li>
				</ul>
				<ul class="nav navbar-nav">
					<li><a href="https://www.vmall.com/honor">手机</a></li>
				</ul>
				<ul class="nav navbar-nav">
					<li><a href="http://www.gree.com.cn/">电器</a></li>
				</ul>
				<ul class="nav navbar-nav">
					<li><a href="http://www.china-pub.com/">书籍</a></li>
				</ul>
				<ul class="nav navbar-nav">
					<li><a href="http://ent.sina.com.cn/">娱乐</a></li>
				</ul>
				<ul class="nav navbar-nav">
					<li><a href="https://www.decathlon.com.cn/zh/">运动</a></li>
				</ul>
			</div>
			<div style="width: 270px;float: left;margin-top: 10px;margin-left: 10px;">
                <div id="searchFrame" style="float: left;">
                    <input type="text" style="width: 120%;" placeholder="天猫  商品/店铺/品牌"  id="stext">
                </div>
                <div style="float: right;background-color: red; width: 70px; height:26px; margin-left: 1px;">
                    <p style="font-size: 13px;margin-top: 4px; margin-left: 18px;">
                    	<a href="#">搜索</a>
                    </p>
                </div>
            </div>
			<div style="float:right">
			
			    <ul class="nav navbar-nav">
					 <li>
					<!--  <a href="cart.jsp">我的交易记录</a> -->
					  <a id="time">
					  <script type="text/javascript">
							showtime();
						</script> </a>
					 </li>
				</ul>
				
				<ul class="nav navbar-nav">
				<%String s = (String)session.getAttribute("name1") ;%>
					<li><a href="lookInformation.jsp">用户:<%=s %></a></li>
				</ul>
				
				<ul class="nav navbar-nav">
					<li><a href="cart.jsp">交易记录</a></li> 
				</ul>
				<ul class="nav navbar-nav">
					<li><a href="indexPerson.jsp">退出</a></li> 
				</ul>
				
			</div>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

<!-- Page Content -->
	<div id="container1">
	<div id="container2">
	<h2><font color="red">欢迎来到购物车</font></h2>
	</div>
	
	<ul id="ul">
	<%!String describe; %>
	<% 
  String name = (String)session.getAttribute("name1");
  String sqlSelect = "select* from carts where userName = '"+name+"'";
  Statement statement = null;
  ResultSet result = null,result1 = null;
  String path1;
  String shopName;
  String decribe;
  String price;
  String color;
  String Id ;
  	
		try{
			//连接数据库
			DBConnectionManger dbconn = new DBConnectionManger();
			//DataBaseOperate data = new DataBaseOperate();
			Connection connection = dbconn.getConnection();
			 statement = connection.createStatement();
			 result = statement.executeQuery(sqlSelect);
			 //result1 = statement.executeQuery(sqlSelect);
			 boolean is = result.next() ;
			 %>
		 	 
			 <div id="container3">
			
			<% 
			if(is == true) {
			Id = result.getString(2);
			path1 = result.getString(3);
			shopName = result.getString(4);
			decribe = result.getString(7);
			price = result.getString(5);
			color = result.getString(6);
			%>
				 <table border="1">
					 <tr>
						 <th width="250px">实物图</th>
						 <th width="250px">商品名字</th>
						 <th width="250px">描述</th>
						 <th width="250px">价格</th>
						 <th width="250px">颜色</th>
						 <th width="250px">删除</th>
						 <th width="250px">购买</th>
					 </tr>
					 
					 <tr>
						<th >
							<img src="images/<%=path1%>" width="100px"/>
						</th>
						<th><%=shopName %></th>
						<td><%=decribe %></td>
						<th><%=price %></th>
						<th><%=color %></th>
						<td>
							<a href="Delete.jsp?Id=<%=Id%>">删除 </a>
						</td>
						<td>
							<a href="purchase.jsp?Id=<%=Id%>">购买 </a>
						</td>
					</tr>
					
					<%
					 while(result.next() == true) {
					 
					 Id = result.getString(2);
					 path1 = result.getString(3);
					 shopName = result.getString(4);
					decribe = result.getString(7);
					price = result.getString(5);
					color = result.getString(6);
					 %>
					
					<tr>
						<th >
							<img src="images/<%=path1%>" width="100px"/>
						</th>
						<th><%=shopName %></th>
						<td><%=decribe %></td>
						<th><%=price %></th>
						<th><%=color %></th>
						<td>
							<a href="Delete.jsp?Id=<%=Id%>">删除 </a>
						</td>
						<td>
							<a href="purchase.jsp?Id=<%=Id%>">购买 </a>
						</td>
					</tr>
				
			
			<% 
			
			} 
			%>
			</table>
			
			<%
			}else {
			out.print("<div id='div1'><h3>你尚未添加商品!</h3></div>");
			}
			%>
			</div>
			<% 
			}catch(SQLException e){
			e.printStackTrace();
		
			}
			%>
	</ul>
	</div>
	

	
	
<hr/>
		
<footer>
<div class="foot_top">
				<ul class="foot_text">
					<li>
						<ul>
							<li>
								<p style="color: white;">订单服务</p>
							</li>
							<li><a href="#">购买指南</a></li>
							<li><a href="#">支付方式</a></li>
							<li><a href="#">送货政策</a></li>
						</ul>
					</li>
					<li>
						<ul>
							<li>
								<p style="color: white;">服务支持</p>
							</li>
							<li><a href="#">售后服务</a></li>
							<li><a href="#">维修门店</a></li>
							<li><a href="#">零售门店</a></li>
						</ul>
					</li>
					<li>
						<ul>
							<li>
								<p style="color: white;">自助服务</p>
							</li>
							<li><a href="#">热点咨询</a></li>
							<li><a href="#">预约购买</a></li>
							<li><a href="#">订单物流</a></li>
						</ul>
					</li>
					<li>
						<ul>
							<li>
								<p style="color: white;">媒体中心</p>
							</li>
							<li><a href="#">新闻动态</a></li>
							<li><a href="#">官方视频</a></li>
							<li><a href="#">图片资源</a></li>
						</ul>
					</li>
					<li>
					<!--  
						<ul>
							<li>
							  	<p>关于公司</p>
							</li>
							<li><a href="#">公司简介</a></li>
							<li><a href="#">加入我们</a></li>
							<li><a href="#">联系我们</a></li>
							
						</ul>
						-->
					</li>
					
				</ul>
				<div class="right_text">
					<p style="color: white;">400-626-5666</p>
					<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 周一至周日 9:00-18:00(仅收市话费)</p>
					<div><span>?</span>在线帮助</div>
				</div>
			</div>
			<div class="foot_bottom">
				<div>
					<p>Copyright ©, Smartisan Digital Co., Ltd. All Rights Reserved.天猫集团</p> <a href="#">法律声明</a> <a href="#"> 隐私条款</a> <a href="#"> 开发者中心</a> <a href="#">京ICP备14041720号-1&nbsp;
京ICP证140622号&nbsp;
京公网安备11010502025474</a> </div>
				<ul>
					<li>
						<div><span><img src="images/09.png"/></span>
							<p>美国</p>
						</div>
						<div> <span><img src="images/09.png"/></span>
							<p>中国</p>
						</div>
					</li>
				</ul>
			</div>
		</footer>

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

</body>

</html>

