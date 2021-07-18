package com.skilldistillery.Contracting.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.Contracting.entities.User;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {
	
	@PersistenceContext
	private EntityManager em; 
	
	

	@Override
	public User findById(int id) {
		return em.find(User.class, id); 
	}

	@Override
	public boolean findByUsername(String username) {
		
		String jpql = "SELECT u FROM User u WHERE u.username = :un";
		List<User> users = em.createQuery(jpql, User.class).setParameter("un", username).getResultList();
		for (User user : users) {
			if (user.getUsername().equals(username)) {
				return true;
			}
		}
		return false;
	}

	@Override
	public User createUser(User user) {
		if (user != null) {
			try {
				em.persist(user);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return user;
	}

	@Override
	public User findUserByUserNameAndPassword(User user) {
		User sessionUser = null;
		String jpql = "SELECT u FROM User u WHERE u.username = :un AND u.password = :pw";
		try {
			sessionUser = em.createQuery(jpql, User.class).setParameter("un", user.getUsername())
								.setParameter("pw", user.getPassword()).getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return sessionUser;
	}
	
	
}