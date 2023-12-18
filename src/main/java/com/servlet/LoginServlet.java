package com.servlet;
import com.databaseoperate.DataBaseOperate;
import com.databaseconnection.DBConnectionManger;
import com.po.Users;

import java.io.*;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginServlet() {
        super(); 
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		//获取登录名
    	String userName =request.getParameter("username");
    	//获取登录密码
    	String password  =request.getParameter("password");
    	//连接数据库  	
        DBConnectionManger dbjc = new DBConnectionManger();    	
        //从数据库中查找数据，对比用户名和密码
    	DataBaseOperate data= new DataBaseOperate();
		String sql = "select* from My_Users where userName="+"'"+userName+"'";
		//查询结果集
		ResultSet result = data.query(sql);
		try {
			if(result.next() == true) {
				String password1 = result.getString(2);
				
				if(password.equals(password1)) {
					HttpSession session = request.getSession();
					//保存用户登录名
					session.setAttribute("name1", userName);
					request.getRequestDispatcher("indexPerson.jsp").forward(request,response);
				return;
				}else{
					//保存错误信息
					request.setAttribute("mgs", "用户名或密码错误");
					//返回登录界面
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}
				
			}else{
				//保存错误信息
				request.setAttribute("mgs", "用户名不存在，请注册");
				//返回登录界面
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
}
    	
       
}

