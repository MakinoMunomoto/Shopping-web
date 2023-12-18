package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
	
	
	private static final String DBDrive="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static final String URL="jdbc:sqlserver://localhost:1433;DatabaseName=fruitMall";
	private static final String USER="sa";
	private static final String PASSWORD="123456";
	private static Connection conn=null;
	
	static{
		try{
			Class.forName(DBDrive);
			
		}
		catch(ClassNotFoundException e){
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws SQLException{
		if(conn==null){
			conn=DriverManager.getConnection(URL,USER,PASSWORD);
			return conn;
		}
		return conn;	
	}

}

