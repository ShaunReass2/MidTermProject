package com.skilldistillery.Contracting.entities;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Task {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "is_complete")
	private boolean isComplete;
	@Column(name = "task_name")
	private String taskName;
	@Column(name = "task_details")
	private String taskDetails;
	@Column(name = "priority_number")
	private int priorityNumber;
	@Column(name = "begin_time")
	private LocalDateTime beginTime;
	@Column(name = "end_time")
	private LocalDateTime endTime;
	
	public Task() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public boolean isComplete() {
		return isComplete;
	}

	public void setComplete(boolean isComplete) {
		this.isComplete = isComplete;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getTaskDetails() {
		return taskDetails;
	}

	public void setTaskDetails(String taskDetails) {
		this.taskDetails = taskDetails;
	}

	public int getPriorityNumber() {
		return priorityNumber;
	}

	public void setPriorityNumber(int priorityNumber) {
		this.priorityNumber = priorityNumber;
	}



	public LocalDateTime getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(String beginTime) {
		try {
			DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
			this.beginTime = LocalDateTime.parse(beginTime, format);
		} catch (Exception e) {
			this.beginTime = null;
		}
	}

	public LocalDateTime getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		try {
			DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
			this.endTime = LocalDateTime.parse(endTime, format);
		} catch (Exception e) {
			this.endTime = null;
		}
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Task other = (Task) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Task [id=").append(id).append(", isComplete=").append(isComplete).append(", taskName=")
				.append(taskName).append(", taskDetails=").append(taskDetails).append(", priorityNumber=")
				.append(priorityNumber).append(", beginTime=").append(beginTime).append(", endTime=").append(endTime)
				.append("]");
		return builder.toString();
	}
	
	
	
}
