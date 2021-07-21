package com.skilldistillery.Contracting.data;

import java.util.List;

import com.skilldistillery.Contracting.entities.Job;
import com.skilldistillery.Contracting.entities.User;

public interface UserDAO {
	
	public User findById(int id); 
	
	public User createUser(User user);
	
	public boolean findByUsername(String username);
	
	public User findUserByUserNameAndPassword(User user);

	public List<Job> displayAllJobs(int id, boolean userStatus);
	
	public Job findJobByJobId(int id);
	
	public List<Job> findJobByKeyword(String keyword);
}
