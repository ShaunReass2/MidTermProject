package com.skilldistillery.Contracting.data;

import com.skilldistillery.Contracting.entities.Task;

public interface TaskDAO {

	Task updateTaskisComleteByTaskId(int id);

	Task createTask(Task task);

	boolean deleteTask(Task task);

	Task updateTask(Task task);

}
