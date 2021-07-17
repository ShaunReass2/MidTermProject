package com.skilldistillery.Contracting.entities;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Job {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "job_name")
	private String jobName;
	private String location;
	@Column(name = "start_date")
	private LocalDate startDate;
	@Column(name = "end_date")
	private LocalDate endDate;
	@Column(name = "is_complete")
	private boolean isComplete;
	@Column(name = "job_description")
	private String jobDescription;
	@Column(name = "authorized_overtime")
	private boolean authorizedOvertime;
	@Column(name = "total_man_hours")
	private int totalManHours;
	@Column(name = "hours_of_operation")
	private String hoursOfOperation;
	private String miscellaneous;
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	@OneToMany(mappedBy="job")
	private List<Message> messages;
	@OneToMany(mappedBy="job")
	private List<Task> tasks;

	public Job() {}
	
	public List<Task> getTasks() {
		return tasks;
	}

	public void setTasks(List<Task> tasks) {
		this.tasks = tasks;
	}

	public List<Message> getMessages() {
		return messages;
	}

	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public LocalDate getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		try {
			DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			this.startDate = LocalDate.parse(startDate, format);
		} catch (Exception e) {
			this.startDate = null;
		}
	}

	public LocalDate getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		try {
			DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			this.endDate = LocalDate.parse(endDate, format);
		} catch (Exception e) {
			this.endDate = null;
		}

		
	}

	public boolean isComplete() {
		return isComplete;
	}

	public void setComplete(boolean isComplete) {
		this.isComplete = isComplete;
	}

	public String getJobDescription() {
		return jobDescription;
	}

	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}

	public boolean isAuthorizedOvertime() {
		return authorizedOvertime;
	}

	public void setAuthorizedOvertime(boolean authorizedOvertime) {
		this.authorizedOvertime = authorizedOvertime;
	}

	public int getTotalManHours() {
		return totalManHours;
	}

	public void setTotalManHours(int totalManHours) {
		this.totalManHours = totalManHours;
	}

	public String getHoursOfOperation() {
		return hoursOfOperation;
	}

	public void setHoursOfOperation(String hoursOfOperation) {
		this.hoursOfOperation = hoursOfOperation;
	}

	public String getMiscellaneous() {
		return miscellaneous;
	}

	public void setMiscellaneous(String miscellaneous) {
		this.miscellaneous = miscellaneous;
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
		Job other = (Job) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Job [id=" + id + ", jobName=" + jobName + ", location=" + location + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", isComplete=" + isComplete + ", jobDescription=" + jobDescription
				+ ", authorizedOvertime=" + authorizedOvertime + ", totalManHours=" + totalManHours
				+ ", hoursOfOperation=" + hoursOfOperation + ", miscellaneous=" + miscellaneous + "]";
	}

}
