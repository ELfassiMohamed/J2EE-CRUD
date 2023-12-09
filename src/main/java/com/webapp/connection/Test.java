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
		User userT = new User();
		userT.setFirst_name("amin3");
		userT.setLast_name("amin3");
		userT.setEmail("amin3@amin.com");
		userT.setPassword("aqwzsx123456");
		userT.setId(1);
		userd.updateUser(userT);

	}

}
