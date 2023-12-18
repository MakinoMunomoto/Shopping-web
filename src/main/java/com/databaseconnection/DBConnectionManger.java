package com.databaseconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class DBConnectionManger {
	private String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private String url= "jdbc:sqlserver://localhost;encrypt=true;database=master;integratedSecurity=true;";
	private String user = "sa";
	private String password = "123456";
	public String getDriverName() {
		return driverName;
	}
	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public Connection getConnection() {
		try{
			//加载驱动
			Class.forName(driverName);
		}catch (ClassNotFoundException e) {
			System.out.print("j加载驱动类异常");
		}
		try{
			return DriverManager.getConnection(url, user, password);
		}catch (SQLException e) {
			System.out.print("l连接数据库失败");
		}
		return null;
	}
}

