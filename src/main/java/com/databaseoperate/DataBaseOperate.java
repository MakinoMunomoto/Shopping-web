package com.databaseoperate;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.databaseconnection.DBConnectionManger;

public class DataBaseOperate {
	//获取连接
	Connection connection = null;
	//获取Statement
	//Statement statement = null;
	//执行查询语句时获取结果集
	//ResultSet result = null;
public DataBaseOperate(){
	try{
	//连接数据库
	DBConnectionManger dbconn = new DBConnectionManger();
	connection = dbconn.getConnection();
	//statement = connection.createStatement();
	}catch (Exception e) {
		e.printStackTrace();
	}
}


//查询数据库
public ResultSet query(String sql) {
	try {
		Statement statement = null;
		//实例化statement
		statement = connection.createStatement();
		//执行查询语句
		return statement.executeQuery(sql);
	} catch (SQLException e) {
	System.out.print("查询失败");
	   }
	return null;
    }


//插入数据
public void insert(String sql) {
	try {
		Statement statement = null;
		//实例化statement
		statement = connection.createStatement();
		//ִ执行插入语句
		statement.executeUpdate(sql);
	} catch (SQLException e) {
		System.out.print("插入失败");
	}	
}


//删除数据
public void delect(String sql) {
	try {
		Statement statement = null;
		//实例化statement
		statement = connection.createStatement();
	   //ִ执行删除语句
	   statement.executeUpdate(sql);
	} catch (SQLException e) {
		System.out.print("删除失败");
	}
	
}


//修改数据
public void update(String sql) {
	    //实例化statement
	  try {
		  Statement statement = null;
			//实例化statement
			statement = connection.createStatement();
		statement.executeUpdate(sql);
	} catch (SQLException e) {
		System.out.print("更新失败");
	}
	
}
   }
