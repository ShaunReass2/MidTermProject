package com.skilldistillery.Contracting.data;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.Contracting.entities.Job;
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

	@Override
	public List<Job> displayAllJobs(int id) {
		
		List<Job> jobs = null; 
		String jpql = "SELECT j FROM Job j WHERE j.user.id = :id";
		
		try {
			jobs = em.createQuery(jpql, Job.class).setParameter("id", id).getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		for (Job job : jobs) {
			job.getUser().getContractors().size();
		}
		
		return jobs;
	}

	@Override
	public Job findJobByJobId(int id) {
		Job job = null;
		
		try {
			job = em.find(Job.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return job;
	}
	
	
}