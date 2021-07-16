package com.skilldistillery.Contracting.data;

import com.skilldistillery.contracting.entities.User;

public interface UserDAO {
	
	User findById(int id); 

}
