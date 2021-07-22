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
import com.skilldistillery.Contracting.entities.Message;
import com.skilldistillery.Contracting.entities.Task;
import com.skilldistillery.Contracting.entities.User;

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

	@Override
	public Job markJobComplete(int id) {
		Job managedJob = em.find(Job.class, id);
		managedJob.setComplete(!managedJob.getIsComplete());
		
		return managedJob;
	}

	@Override
	public List<Job> showCompletedJobs(User user){
		List<Job> jobs = null; 
		String jpql = "SELECT j FROM Job j WHERE j.isComplete = 1 AND j.user.id = :id";
		String contractorJpql = "SELECT j FROM Job j JOIN Task t ON t.job.id = j.id JOIN Contractor c ON t.contractor.id = c.id JOIN User u " +
			       "on c.user.id = u.id WHERE u.id = :id AND j.isComplete = 1";
		
				System.out.println("********************");
				System.out.println("********************");
				System.out.println(user.getId());
				System.out.println("********************");
				System.out.println("********************");
				
				try {
					if(user.getRole()) {
						jobs = em.createQuery(jpql, Job.class).setParameter("id", user.getId()).getResultList();
					}else {
						jobs = em.createQuery(contractorJpql, Job.class).setParameter("id", user.getId()).getResultList();
						Set<Job> uniqueJobs = new HashSet<>(jobs);
						jobs = new ArrayList<>(uniqueJobs);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			
		return jobs;
	}
	
}
