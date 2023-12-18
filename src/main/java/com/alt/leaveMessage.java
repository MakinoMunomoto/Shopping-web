package com.alt;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import javax.xml.crypto.Data;

import com.databaseconnection.DBConnectionManger;
import com.databaseoperate.DataBaseOperate;

/**
 * Servlet implementation class leaveMessage
 */
@WebServlet("/leaveMessage")
public class leaveMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public leaveMessage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("utf-8");
		//获取连接
		Connection connection = null;
		//获取Statement
		Statement statement = null;
		//留言标题
		String title = request.getParameter("title");
		//留言内容
		String message = request.getParameter("textarea");
		//获取留言时间
		Date date = new Date();
		String time = date.toLocaleString();
		HttpSession session = request.getSession();
		//获取留言人
		String name = (String)session.getAttribute("name1");
		DBConnectionManger jdbc = new DBConnectionManger();
		DataBaseOperate data = new DataBaseOperate();
		String sql = "insert into test values('"+name+"','"+title+"','"+message+"','"+time+"')";
		data.insert(sql);
		

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(" <script language='javascript'> alert('留言成功');window.location.href='lookInformation.jsp'</script>");
			out.flush();
			out.close();
	}

}

