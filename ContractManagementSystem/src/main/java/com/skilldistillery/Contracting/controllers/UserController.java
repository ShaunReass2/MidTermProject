package com.skilldistillery.Contracting.controllers;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.Contracting.data.TaskDAO;
import com.skilldistillery.Contracting.data.UserDAO;
import com.skilldistillery.Contracting.entities.Job;
import com.skilldistillery.Contracting.entities.Task;
import com.skilldistillery.Contracting.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private TaskDAO taskDAO;

	@RequestMapping(path = "adminAccountCreation.do", method = RequestMethod.POST)
	public String adminAccountCreation(User user, Model model, RedirectAttributes redir) {

		if (userDAO.findByUsername(user.getUsername())) {
			model.addAttribute("accountCreationFlag", true);
			return "Error";
		}
		user.setRole(true);
		user.setEnabled(true);
		redir.addFlashAttribute("user", userDAO.createUser(user));
		return "redirect:adminAccountCreated.do";
	}

	@RequestMapping(path = "adminAccountCreated.do", method = RequestMethod.GET)
	public String adminAccountCreated() {
		return "Success";
	}

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String login(User user, HttpSession session, RedirectAttributes redir) {

		if (session.getAttribute("user") != null) {
			return "redirect:dashboard.do";
		}
		User sessionUser = userDAO.findUserByUserNameAndPassword(user);
		if (sessionUser == null) {
			redir.addFlashAttribute("loginFailFlag", true);
			redir.addFlashAttribute("sessionUser", sessionUser);
			return "redirect:Error.do";
		}
		session.setAttribute("user", sessionUser);
		return "redirect:dashboard.do";
	}

	@RequestMapping(path = "dashboard.do", method = RequestMethod.GET)
	public String dashboardLogin(Model model, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "redirect:Error.do";
		}
		User sessionUser = (User)session.getAttribute("user");
		model.addAttribute("jobs", userDAO.displayAllJobs(sessionUser.getId()));
		model.addAttribute("adminRole", sessionUser.getRole());
		return "Dashboard";
	}

	@RequestMapping(path = "logout.do", method = RequestMethod.GET)
	public String logoutForm(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:home.do";
	}
	
	@RequestMapping(path = "Error.do", method = RequestMethod.GET)
	public String ErrorPage() {
		return "Error";
	}
	
	@RequestMapping(path = "singleJobView.do", method = RequestMethod.GET)
	public String findSingleJob(HttpSession session, Model model, int id) {
		Job job = userDAO.findJobByJobId(id);
		User sessionUser = (User)session.getAttribute("user");
		model.addAttribute("adminRole", sessionUser.getRole());
		model.addAttribute("job", job);
		model.addAttribute("tasks", job.getTasks());
		model.addAttribute("messages", job.getMessages());
		return "SingleJobTasksView";
	}
	

}
