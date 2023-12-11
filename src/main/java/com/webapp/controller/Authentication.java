package com.webapp.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.webapp.beans.User;
import com.webapp.connection.dbConnection;
import com.webapp.dao.UserDao;

//@WebServlet("/auth")
@WebServlet(urlPatterns = {"*.auth"})
public class Authentication extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Authentication() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String action = request.getServletPath();
			switch(action) {
			case "/SignIn.auth":{
				String email = request.getParameter("email");
				String pswd = request.getParameter("pswd");
				try {
					UserDao userdao = new UserDao(dbConnection.checkConnection());
					User user = userdao.userLogIn(email, pswd);
						if(user != null) {
								request.getSession().setAttribute("auth-session", user);
								response.sendRedirect("Welcome.jsp");
						}else {
							PrintWriter out = response.getWriter();
							out.print("USER NOT FOUND");
						}
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			}
			case "/Register.auth":{
				String fname = request.getParameter("fname");
				String lname = request.getParameter("lname");
				String email = request.getParameter("email");
				String pswd = request.getParameter("pswd");
				
				User user =new User();
				user.setFirst_name(fname);
				user.setLast_name(lname);
				user.setEmail(email);
				user.setPassword(pswd);
				
				try {
					UserDao userdao = new UserDao(dbConnection.checkConnection());
					userdao.insertUser(user);
						
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				 request.setAttribute("myMessage", "Rigesterd Successfully");
				 request.getRequestDispatcher("Confirme.jsp").forward(request, response);
				break;
			}
			case "/Logout.auth":{
				if(request.getSession().getAttribute("userSession") != null) {
					request.getSession().removeAttribute("userSession");
					response.sendRedirect("LoginPage.jsp");
				}else {
					response.sendRedirect("LoginPage.jsp");
				}
				break;
			}
			default : {
				request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
			}
			}
		}
		
}
