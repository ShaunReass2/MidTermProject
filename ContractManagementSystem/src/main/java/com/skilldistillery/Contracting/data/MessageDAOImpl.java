package com.skilldistillery.Contracting.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.Contracting.entities.Job;
import com.skilldistillery.Contracting.entities.Message;
import com.skilldistillery.Contracting.entities.User;

@Service
@Transactional
public class MessageDAOImpl implements MessageDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Message createMessage(Message message, int id) {
		Job managedJob = em.find(Job.class, id);
		List<Message> messagesFromJob = managedJob.getMessages();
		messagesFromJob.add(message);
		message.setJob(managedJob);
		managedJob.setMessages(messagesFromJob);
		User managedUser = em.find(User.class, managedJob.getUser().getId());
		List<Message> messagesFromUser = managedUser.getMessages();
		messagesFromUser.add(message);
		message.setUser(managedUser);
		managedUser.setMessages(messagesFromUser);
		em.persist(message);
		return message;
	}


	
	
	
	
	
//	@Override
//	public Task updateTaskisComleteByTaskId(int id) {
//		Task task = null; 
//		
//		try {
//			task = em.find(Task.class, id);
//			task.setIsComplete(true);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		return task;
//	}
//
//	@Override
//	public Task createTask(Task task) {
//		em.persist(task);
//		return task;
//	}
//
//	@Override
//	public boolean deleteTask(Task task) {
//		if (task != null) {
//			if(em.contains(task)) {
//				em.remove(task);				
//			}
//		}
//		
//		boolean wasDeleted = !em.contains(task) ? true: false;
//		return wasDeleted;
//	}
//
//	@Override
//	public Task updateTask(Task task) {
//		Task managedTask = null;
//		
//		managedTask = em.find(Task.class, task);
//		managedTask.setTaskName(task.getTaskName());
//		managedTask.setTaskDetails(task.getTaskDetails());
//		managedTask.setBeginTime(task.getBeginTime().toString());
//		managedTask.setEndTime(task.getEndTime().toString());
//		managedTask.setPriorityNumber(task.getPriorityNumber());
////		managedTask.setIsComplete(task.getIsComplete());		
//		
//		return managedTask;	
//	}

}
