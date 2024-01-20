package com.webapp.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbConnection {
	private static Connection con=null;
	public static Connection checkConnection() throws ClassNotFoundException, SQLException {
		if(con == null) {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_name","username","password");
			//System.out.println("CONNECTION IS WORKING");
		}
		return con;
		
	}
}
