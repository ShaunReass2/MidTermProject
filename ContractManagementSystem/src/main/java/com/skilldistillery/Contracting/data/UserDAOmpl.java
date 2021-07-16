package com.skilldistillery.Contracting.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.contracting.entities.User;

@Service
@Transactional
public class UserDAOmpl implements UserDAO {
	
	@PersistenceContext
	private EntityManager em; 
	

	@Override
	public User findById(int id) {
		return em.find(User.class, id); 
	
	}

}
