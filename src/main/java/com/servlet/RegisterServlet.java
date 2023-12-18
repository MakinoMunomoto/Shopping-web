package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;

import com.databaseconnection.DBConnectionManger;
import com.databaseoperate.DataBaseOperate;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//获取注册用户名
		String oUsername = request.getParameter("username");
		//获取注册密码
		String oPassword = request.getParameter("password");
		//确认注册密码
		String oConfirm_password = request.getParameter("confirm_password");
		//获取用户真实姓名
		String oRealName = request.getParameter("realName");
		//获取用户手机号
		String oPhone_number = request.getParameter("phone_number");
		//获取用户注册的邮箱地址ַ
		String oEmail = request.getParameter("email");
		//获取用户的收货地址ַ
		String oAddress = request.getParameter("address");
		//连接数据库
		DBConnectionManger dbjc = new DBConnectionManger();
		//插入数据库
		String sql1 = "select*from my_users where userName='"+oUsername+"'";
		String sql = "insert into my_users values('"+oUsername+"','"+oPassword+"','"+oRealName+"','"+oPhone_number+"','"+oEmail+"','"+oAddress+"')";
		DataBaseOperate data = new DataBaseOperate();
		ResultSet result = data.query(sql1);
		try {
			if( result.next() == true ) {
				request.setCharacterEncoding("utf-8");
			    response.setContentType("text/html;charset=utf-8");
			    response.setCharacterEncoding("utf-8");
				PrintWriter out = response.getWriter();
				out.println(" <script type='text/javascript'> alert('用户名已存在！')</script>");
				out.println("</HTML>");
				out.flush();
				out.close();
				request.getRequestDispatcher("register.jsp").forward(request, response);
				return;
			}
		} catch (SQLException e) {
			
			System.out.println("注册失败");
		}
		
		if(oUsername != ""&&oPassword.equals(oConfirm_password)) {
		
		data.insert(sql);
		request.setCharacterEncoding("utf-8");
	    response.setContentType("text/html;charset=utf-8");
	    response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.println(" <script type='text/javascript'> alert(ע注册成功')</script>");
		out.println("</HTML>");
		out.flush();
		out.close();
		response.sendRedirect("login.jsp");
	}else {
		request.setCharacterEncoding("utf-8");
	    response.setContentType("text/html;charset=utf-8");
	    response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.println(" <script type='text/javascript'> alert('kong')</script>");
		out.println("</HTML>");
		out.flush();
		out.close();
		
	}
	
	
	
	}

}
