package com.webapp.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.webapp.beans.User;
import com.webapp.connection.dbConnection;
import com.webapp.dao.UserDao;


public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private UserDao userdao ;
  
    public UserServlet() { super(); }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		switch(action) {
		case "/delete":{
			int id = Integer.parseInt(request.getParameter("id"));
			try {
				UserDao userdao = new UserDao(dbConnection.checkConnection());
				userdao.deleteUser(id);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("myMessage", "User deleted Successfully");
			 request.getRequestDispatcher("hello.jsp").forward(request, response);
			break;
		
		}
		case "/edit":{
			int id = Integer.parseInt(request.getParameter("id"));
			User userSelected = new User();
			try {
				UserDao userdao = new UserDao(dbConnection.checkConnection());
				userSelected = userdao.selectUser(id);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("user_selected", userSelected);
			 request.getRequestDispatcher("edit.jsp").forward(request, response);
		}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		switch(action) {
		case "/insert":
		{	
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String email = request.getParameter("email");
			String pswd = request.getParameter("pswd");
			
			
			User userIn = new User();
			userIn.setFirst_name(fname);
			userIn.setLast_name(lname);
			userIn.setEmail(email);
			userIn.setPassword(pswd);
			try {
				UserDao userdao = new UserDao(dbConnection.checkConnection());
				userdao.insertUser(userIn);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 request.setAttribute("myMessage", "User Added Successfully");
			 request.getRequestDispatcher("hello.jsp").forward(request, response);
			break;
		}
		case "/update":
		{
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			int id = Integer.parseInt(request.getParameter("id"));
			
			User userUpdated = new User();
			userUpdated .setFirst_name(fname);
			userUpdated .setLast_name(lname);
			userUpdated .setEmail(email);
			userUpdated .setPassword(password);
			userUpdated.setId(id);
			
			try {
				UserDao userdao = new UserDao(dbConnection.checkConnection());
				userdao.updateUser(userUpdated);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 request.setAttribute("myMessage", "User Updated Successfully");
			 request.getRequestDispatcher("hello.jsp").forward(request, response);
			break;
		}
		}
		
	}
	
}
