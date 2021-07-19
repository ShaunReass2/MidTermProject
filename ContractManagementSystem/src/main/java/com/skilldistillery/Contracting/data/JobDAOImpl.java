package com.skilldistillery.Contracting.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.Contracting.entities.Job;
import com.skilldistillery.Contracting.entities.Message;
import com.skilldistillery.Contracting.entities.Task;

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

	@Override
	public boolean removeJob(int id) {
		boolean removedJob = false;
		Job job = em.find(Job.class, id);
		if (job != null) {
			if (job.getTasks() != null) {
				
		for (Task task : job.getTasks()) {
			em.remove(task);
		}
			}
			if (job.getMessages() != null) {
				
		for (Message message : job.getMessages()) {
			em.remove(message);
		}
			}
		if (em.contains(job)) {
			em.remove(job);
		}
		removedJob = (!em.contains(job));
		}
		return removedJob;
	}

	@Override
	public Job updateJob(Job job) {
//		boolean updatedJob = false;
		Job managedJob = em.find(Job.class, job.getId());
		managedJob.setJobName(job.getJobName());
		managedJob.setLocation(job.getLocation());
		managedJob.setStartDate(job.getStartDate().toString());
		managedJob.setEndDate(job.getEndDate().toString());
		managedJob.setJobDescription(job.getJobDescription());
		managedJob.setAuthorizedOvertime(job.isAuthorizedOvertime());
		managedJob.setTotalManHours(job.getTotalManHours());
		managedJob.setHoursOfOperation(job.getHoursOfOperation());
		managedJob.setMiscellaneous(job.getMiscellaneous());
		return managedJob ;
	}

}
