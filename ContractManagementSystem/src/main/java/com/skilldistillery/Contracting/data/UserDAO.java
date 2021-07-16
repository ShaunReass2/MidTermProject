package com.skilldistillery.Contracting.data;

import com.skilldistillery.Contracting.entities.User;

public interface UserDAO {
	
	User findById(int id); 

}
