package com.skilldistillery.Contracting.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.Contracting.entities.Contractor;
import com.skilldistillery.Contracting.entities.Job;
import com.skilldistillery.Contracting.entities.Message;
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
	public Task createTask(Task task, int contractorId, int jobId) {
		Contractor contractor = em.find(Contractor.class, contractorId); 
		Job job = em.find(Job.class, jobId); 
		task.setContractor(contractor);
		task.setJob(job);
		task.setTrade(contractor.getTrade());		
		em.persist(task);
		return task;
	}

	@Override
	public boolean deleteTask(Task task) {
		Task managedTask = em.find(Task.class, task.getId());
		
		if (managedTask != null) {			
			managedTask.setJob(null);
			managedTask.setContractor(null);
			managedTask.setTrade(null);
			em.remove(managedTask);
		}
		
		boolean wasDeleted = !em.contains(task) ? true: false;
		return wasDeleted;
	}
	
	@Override
	public Task updateTask(Task task) {
		Task managedTask = null;
		
		managedTask = em.find(Task.class, task.getId());
		managedTask.setTaskName(task.getTaskName());
		managedTask.setTaskDetails(task.getTaskDetails());
		managedTask.setBeginTime(task.getBeginTime().toString());
		managedTask.setEndTime(task.getEndTime().toString());
		managedTask.setPriorityNumber(task.getPriorityNumber());
		managedTask.setIsComplete(task.getIsComplete());		
		
		return managedTask;	
	}

	@Override
	public List<Task> findAllTasks(){
		
		List<Task> tasks = null; 
		
		String jpql = "SELECT t FROM Task t";
		
				try {
					tasks = em.createQuery(jpql, Task.class).getResultList();
				} catch (Exception e) {
					e.printStackTrace();
				}
			
		return tasks;
	}

	@Override
	public Task findSingleTask(Task task){
		
		Task managedTask = null; 
		
		String jpql = "SELECT t FROM Task t WHERE t.id = :tid";
		
		try {
			managedTask = em.createQuery(jpql, Task.class).setParameter("tid", task.getId()).getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return managedTask;
	}

}
