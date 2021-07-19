package com.skilldistillery.Contracting.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.Contracting.entities.Task;

@Service
@Transactional
public class TaskDAOImpl implements TaskDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Task updateTaskisComleteByTaskId(int id) {
		Task task = null; 
		
		try {
			task = em.find(Task.class, id);
			task.setIsComplete(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return task;
	}

	@Override
	public Task createTask(Task task) {
		em.persist(task);
		return task;
	}

	@Override
	public boolean deleteTask(Task task) {
		if (task != null) {
			if(em.contains(task)) {
				em.remove(task);				
			}
		}
		
		boolean wasDeleted = !em.contains(task) ? true: false;
		return wasDeleted;
	}
	
	

	
	
	
	
	
	
//	@Override
//	public Job addJob(Job job) {
//		em.persist(job);
//		return job;
//	}
//
//	@Override
//	public boolean removeJob(int id) {
//		boolean removedJob = false;
//		Job job = em.find(Job.class, id);
//		if (job != null) {
//			if (job.getTasks() != null) {
//				
//		for (Task task : job.getTasks()) {
//			em.remove(task);
//		}
//			}
//			if (job.getMessages() != null) {
//				
//		for (Message message : job.getMessages()) {
//			em.remove(message);
//		}
//			}
//		if (em.contains(job)) {
//			em.remove(job);
//		}
//		removedJob = (!em.contains(job));
//		}
//		return removedJob;
//	}
//
//	@Override
//	public Job updateJob(Job job) {
////		boolean updatedJob = false;
//		Job managedJob = em.find(Job.class, job.getId());
//		managedJob.setJobName(job.getJobName());
//		managedJob.setLocation(job.getLocation());
//		managedJob.setStartDate(job.getStartDate().toString());
//		managedJob.setEndDate(job.getEndDate().toString());
//		managedJob.setJobDescription(job.getJobDescription());
//		managedJob.setAuthorizedOvertime(job.isAuthorizedOvertime());
//		managedJob.setTotalManHours(job.getTotalManHours());
//		managedJob.setHoursOfOperation(job.getHoursOfOperation());
//		managedJob.setMiscellaneous(job.getMiscellaneous());
//		return managedJob ;
//	}

}
