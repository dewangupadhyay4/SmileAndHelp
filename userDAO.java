package com.dao;

import com.entity.user;

public interface userDAO {
	public boolean userRegister(user us);
	
	public user login(String email,String password);
	
	public boolean checkpassword(int id,String ps);
	
	public boolean upadteprofile(user us);

}
