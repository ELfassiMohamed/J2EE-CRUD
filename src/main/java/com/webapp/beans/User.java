package com.webapp.beans;

public class User {
	private int id;
	private boolean isdmin;
	private String first_name;
	private String last_name;
	private String email;
	private String password;
	private String craeted_at;
	
	public User() {
		super();
	}

	public User(boolean isdmin, String first_name, String last_name, String email, String password, String craeted_at) {
		super();
		this.isdmin = isdmin;
		this.first_name = first_name;
		this.last_name = last_name;
		this.email = email;
		this.password = password;
		this.craeted_at = craeted_at;
	}
	
	public User( String first_name, String last_name, String email, String password) {
		super();
		this.first_name = first_name;
		this.last_name = last_name;
		this.email = email;
		this.password = password;
		this.craeted_at = craeted_at;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", isdmin=" + isdmin + ", first_name=" + first_name + ", last_name=" + last_name
				+ ", email=" + email + ", password=" + password + ", craeted_at=" + craeted_at + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public boolean isIsdmin() {
		return isdmin;
	}

	public void setIsdmin(boolean isdmin) {
		this.isdmin = isdmin;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCraeted_at() {
		return craeted_at;
	}

	public void setCraeted_at(String craeted_at) {
		this.craeted_at = craeted_at;
	}

}
