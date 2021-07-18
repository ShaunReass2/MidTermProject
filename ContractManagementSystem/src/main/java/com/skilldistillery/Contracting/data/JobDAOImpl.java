package com.skilldistillery.Contracting.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.Contracting.entities.Job;

@Service
@Transactional
public class JobDAOImpl implements JobDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Job addJob(Job job) {
		em.persist(job);
		return job;
	}

}
