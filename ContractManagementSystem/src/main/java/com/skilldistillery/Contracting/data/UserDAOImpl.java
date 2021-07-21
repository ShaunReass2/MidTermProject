package com.skilldistillery.Contracting.data;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
	public List<Job> displayAllJobs(int id, boolean isAdmin) {
		
		List<Job> jobs = null; 
		String jpql = "SELECT j FROM Job j WHERE j.user.id = :id AND j.isComplete = 0";
		
		String contractorjpql = "SELECT j FROM Job j JOIN Task t ON t.job.id = j.id JOIN Contractor c ON t.contractor.id = c.id JOIN User u " +
	       "on c.user.id = u.id WHERE u.id = :id AND j.isComplete = 0";
		
		try {
			if(isAdmin) {
				jobs = em.createQuery(jpql, Job.class).setParameter("id", id).getResultList();

			}else {
				jobs = em.createQuery(contractorjpql, Job.class).setParameter("id", id).getResultList();
				Set<Job> temp = new HashSet<>(jobs);
				jobs = new ArrayList<>(temp);
			}
			
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

	@Override
	public List<Job> findJobByKeyword(String keyword) {
		List<Job> jobs = null;
//		select * from job where job_name like '%ard%';
		String jpql = "SELECT j FROM Job j WHERE j.jobName LIKE '%:keyword%'";
		try {
			jobs = em.createQuery(jpql, Job.class).setParameter("keyword", keyword).getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return jobs;
	}
	
	
}