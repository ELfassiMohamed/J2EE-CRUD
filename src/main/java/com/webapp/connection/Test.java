package com.webapp.connection;

import java.sql.SQLException;

import com.webapp.beans.User;
import com.webapp.dao.UserDao;

public class Test {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		//dbConnection dbTest = new dbConnection();
		//Testing connection with DB
		//System.out.println(dbTest.checkConnection());
		UserDao userd = new UserDao(dbConnection.checkConnection());
		userd.userLogIn("manal@mil.com", "aqw1256");

	}

}
