package com.skilldistillery.Contracting.controllers;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.Contracting.data.JobDAO;
import com.skilldistillery.Contracting.entities.Job;
import com.skilldistillery.Contracting.entities.User;

@Controller
public class JobController {

	@Autowired
	private JobDAO jobDAO;

	@RequestMapping(path = "createJob.do", method = RequestMethod.POST)
	public String adminJobCreation(Job job, HttpSession session, RedirectAttributes redir) {
		User sessionUser = (User) session.getAttribute("user");
		job.setUser(sessionUser);
		jobDAO.addJob(job);
		return "redirect:dashboard.do";
	}
	
	@RequestMapping(path = "deleteJob.do", method = RequestMethod.GET)
	public String deleteJob(int id) {
		jobDAO.removeJob(id);
		return "redirect:dashboard.do";
	}
	
	@RequestMapping(path = "editJob.do", method = RequestMethod.POST)
	public String editJob(Job job) {
		Job managedJob = jobDAO.updateJob(job);
		return "redirect:singleJobView.do?id=" + managedJob.getId();
	}

	@RequestMapping(path = "markJobComplete.do")
	public String markJobComplete(int id) {
		Job managedJob = jobDAO.markJobComplete(id);
		return "redirect:singleJobView.do?id=" + managedJob.getId();
	}
	

}
