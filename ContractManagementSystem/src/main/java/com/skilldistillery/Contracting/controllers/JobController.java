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

	

}
