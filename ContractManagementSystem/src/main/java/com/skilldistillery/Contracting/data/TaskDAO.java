package com.skilldistillery.Contracting.data;

import java.util.List;

import com.skilldistillery.Contracting.entities.Task;

public interface TaskDAO {

	Task updateTaskisComleteByTaskId(int id);

	Task createTask(Task task, int contractorId, int jobId);

	boolean deleteTask(Task task);

	Task updateTask(Task task);

	List<Task> findAllTasks();

	Task findSingleTask(Task task);
	
	

}
