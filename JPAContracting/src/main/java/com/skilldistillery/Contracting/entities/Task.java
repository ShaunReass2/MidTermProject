package com.skilldistillery.Contracting.entities;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

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

	@ManyToOne
	@JoinColumn(name = "job_id")
	private Job job;

	@ManyToOne
	@JoinColumn(name = "trade_id")
	private Trade trade;

	@ManyToOne
	@JoinColumn(name = "contractor_id")
	private Contractor contractor;

	public Task() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public boolean getIsComplete() {
		return isComplete;
	}

	public void setIsComplete(boolean isComplete) {
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
			DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd' 'HH:mm:ss");
			this.beginTime = LocalDateTime.parse(beginTime, format);
		} catch (Exception e) {
			this.beginTime = null;
		}
	}

	public LocalDateTime getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		System.out.println(endTime);
		try {
			DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd' 'HH:mm:ss");
			this.endTime = LocalDateTime.parse(endTime, format);
		} catch (Exception e) {
			this.endTime = null;
		}
	}

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	public Trade getTrade() {
		return trade;
	}

	public void setTrade(Trade trade) {
		this.trade = trade;
	}

	public Contractor getContractor() {
		return contractor;
	}

	public void setContractor(Contractor contractor) {
		this.contractor = contractor;
	}

	@Override
	public String toString() {
		return "Task [id=" + id + ", isComplete=" + isComplete + ", taskName=" + taskName + ", taskDetails="
				+ taskDetails + ", priorityNumber=" + priorityNumber + ", beginTime=" + beginTime + ", endTime="
				+ endTime + ", job=" + job + ", trade=" + trade + ", contractor=" + contractor + "]";
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

}
