package com.webapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.webapp.beans.User;
import com.webapp.connection.dbConnection;

public class UserDao {
	//sql command
	private static final String INSERT_USER = "insert into users (first_name , last_name , email , password ) values (?,?,?,?)";
	private static final String SELECT_USER = "select * from users where id=?";
	private static final String SHOW_ALL_USERS = "select * from users";
	private static final String UPDATE_USER = "update users set first_name = ?,last_name = ?,email = ?, password= ? where id=?";
	private static final String DELETE_USER = "delete from users where id=?";
	//methods
	private Connection con;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	public UserDao(Connection con) {
		super();
		this.con = con;
	}
	
	public User userLogIn(String email, String password) {
		String query = "select * from users where email=? and password=?";
		User user = null;
		try {
			psmt = this.con.prepareStatement(query);
			psmt.setString(1, email);
			psmt.setString(2, password);
			rs = psmt.executeQuery();
			while(rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setFirst_name(rs.getString("first_name"));
				user.setLast_name(rs.getString("last_name"));
				user.setIsdmin(false);
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
		
	}
	
	public void insertUser(User user) {
		try {
			psmt = this.con.prepareStatement(INSERT_USER);
			psmt.setString(1, user.getFirst_name());
			psmt.setString(2, user.getLast_name());
			psmt.setString(3, user.getEmail());
			psmt.setString(4, user.getPassword());
			psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public User selectUser(int id) {
		User selecteduser = null ;
		try {
			psmt = this.con.prepareStatement(SELECT_USER);
			psmt.setInt(1, id);
			rs = psmt.executeQuery();
			while(rs.next()) {
//				String fname = rs.getString("first_name");
//				String lname = rs.getString("last_name");
//				String email = rs.getString("email");
//				String pswd = rs.getString("password");
//				user = new User(id,fname,lname,email,pswd);
				User user = new User();
				user.setId(id);
				user.setFirst_name(rs.getString("first_name"));
				user.setLast_name(rs.getString("last_name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				selecteduser = user;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return selecteduser;
	}
	
	public void updateUser(User user) {
		try {
			psmt = this.con.prepareStatement(UPDATE_USER);
			psmt.setString(1, user.getFirst_name());
			psmt.setString(2, user.getLast_name());
			psmt.setString(3, user.getEmail());
			psmt.setString(4, user.getPassword());
			psmt.setInt(5, user.getId());
			psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public List<User> showAllUser(){
		List<User> allUsers = new ArrayList<>();
		try {
			psmt = this.con.prepareStatement(SHOW_ALL_USERS);
			rs = psmt.executeQuery();
			while(rs.next()) {
				User users = new User();
				users.setId(rs.getInt("id"));
				users.setFirst_name(rs.getString("first_name"));
				users.setLast_name(rs.getString("last_name"));
				users.setEmail(rs.getString("email"));
				users.setCraeted_at(rs.getString("created_at"));
				allUsers.add(users);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return allUsers;
		
	}
	public void deleteUser(int id) throws Exception {
		try {
			psmt = this.con.prepareStatement(DELETE_USER);
			psmt.setInt(1, id);
			psmt.executeUpdate();
		}catch(SQLException e) {
			throw new Exception("message :"+e.getMessage());
			}
	}

}
