package com.skilldistillery.Contracting.data;

import com.skilldistillery.Contracting.entities.User;

public interface UserDAO {
	
	public User findById(int id); 
	
	public User createUser(User user);
	
	public boolean findByUsername(String username);
	

}
