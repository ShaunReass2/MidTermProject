package com.skilldistillery.Contracting.data;

import java.util.List;

import com.skilldistillery.Contracting.entities.Job;

public interface JobDAO {
	
	Job addJob(Job job);
	
	boolean removeJob(int id);
	
	Job updateJob(Job job);
	
	Job markJobComplete(int id);
	
	List<Job> showCompletedJobs();
	// update (mark complete) methods
	List<Job> sortJobName(boolean isAscending);
	List<Job> sortJobStartDate(boolean isAscending);
	List<Job> sortJobEndDate(boolean isAscending);
}
