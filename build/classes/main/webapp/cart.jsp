<%@page import="java.sql.ResultSet"%>
<%@page import="com.databaseconnection.DBConnectionManger"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.databaseconnection.*" %>
<%@ page import="com.databaseoperate.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.Items"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>购物车</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<style type="text/css">
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
</style>
<script>
	function showtime() {
		var myDate = new Date();
		document.getElementById("time").innerHTML = myDate.getHours() + "点"
				+ myDate.getMinutes() + "分" + myDate.getSeconds() + "秒";
		setTimeout("showtime()", 1000);
	}
	function remove(){
	var Otext = document.getElementById("stext");
	Otext.value="";
	
	}
</script>
</head>
<%
	
	//out.print(buylist);
%>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp"><i class="fa fa-shopping-cart fa-lg"></i>电子商务购物平台</a>
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
			<div style="float:right">
				<ul class="nav navbar-nav">
					<li><a href="indexPerson.jsp">返回首页</a></li>
				</ul>
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
					<li><a href="index.jsp">退出</a></li>
				</ul>
			</div>
			</div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

	<div style="margin-top: 70px;margin-left: 50px;margin-right: 50px;">
		<div class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading">我的交易记录</div>

			<!-- Table -->
			<table class="table table-hover">
				<thead>
					<tr>
						<th>产品图片</th>
						<th>产品名称</th>
						<th>价格</th>
						<th>购买数量</th>
						<th>￥ 总金额</th>
						<th>联系方式</th>
						
					</tr>
				</thead>
				<tbody>
					
					<tr height="">
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="float:right">
					   <ul class="nav navbar-nav">
					   <li><a href="indexPerson.jsp">继续淘淘宝贝</a></li>
				       </ul>
				       </div>
					</tr>
					<%
					DBConnectionManger dbconn = new DBConnectionManger();
	                DataBaseOperate data = new DataBaseOperate();
	                String name = (String)session.getAttribute("name1");
	                String sql = "select*from purchaseRecord where userName='"+name+"'";
	                ResultSet resultSet1 = null;
	                resultSet1 = data.query(sql);
	                while(resultSet1.next()) {
	                 String path2 = resultSet1.getString(1);
	                 String shopName = resultSet1.getString(2);
	                 String shopNum = resultSet1.getString(3);
	                 String price = resultSet1.getString(4);
	                 String sum = resultSet1.getString(5);
	                 String phoneNum = resultSet1.getString(6);
					 %>
					<tr>
						<th><img src="images/<%=path2%>"></th>
						<th><%=shopName %></th>
						<th><%=price %></th>
						<th><%=shopNum %></th>
						<th><%=sum %></th>
						<th><%=phoneNum %></th>
					</tr>
					
					<%
					}
					%>
					
				</tbody>
			</table>
		</div>
	</div>

		<hr>

		<hr>
		<!-- Footer -->
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
