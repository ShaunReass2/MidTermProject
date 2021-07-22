package com.skilldistillery.Contracting.controllers;

import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.Contracting.data.JobDAO;
import com.skilldistillery.Contracting.data.TradeDAO;
import com.skilldistillery.Contracting.data.UserDAO;
import com.skilldistillery.Contracting.entities.Job;
import com.skilldistillery.Contracting.entities.Message;
import com.skilldistillery.Contracting.entities.Task;
import com.skilldistillery.Contracting.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private TradeDAO tradeDAO;

	@Autowired
	private JobDAO jobDAO;

	@RequestMapping(path = "adminAccountCreation.do", method = RequestMethod.POST)
	public String adminAccountCreation(User user, Model model, RedirectAttributes redir) {

		if (userDAO.findByUsername(user.getUsername())) {
			model.addAttribute("accountCreationFlag", true);
			return "Error";
		}
		user.setRole(true);
		user.setEnabled(true);
		User managedUser = userDAO.createUser(user);
		redir.addAttribute("accountName", managedUser.getUsername());
		return "redirect:adminAccountCreated.do";
	}

	@RequestMapping(path = "adminAccountCreated.do", params = "accountName") // method = RequestMethod.GET,
	public String adminAccountCreated(String accountName, Model model) {
		model.addAttribute("accountName", accountName);
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
	public String dashboardLogin(Model model, HttpSession session, boolean nameIsAscending, boolean nameIsDescending, boolean startIsAscending, boolean startIsDescending, boolean endIsAscending, boolean endIsDescending) {
		if (session.getAttribute("user") == null) {
			return "redirect:Error.do";
		}
		User sessionUser = (User) session.getAttribute("user");

		List<Job> jobs = userDAO.displayAllJobs(sessionUser.getId(), sessionUser.getRole());
		jobsToBeSorted(jobs, nameIsAscending, nameIsDescending, startIsAscending, startIsDescending, endIsAscending, endIsDescending);

		model.addAttribute("jobs", jobs);
		model.addAttribute("adminRole", sessionUser.getRole());
		return "Dashboard";
	}

	@RequestMapping(path = "showCompletedJobs.do", method = RequestMethod.GET)
	public String showCompletedJobs(Model model, HttpSession session, boolean nameIsAscending, boolean nameIsDescending, boolean startIsAscending, boolean startIsDescending, boolean endIsAscending, boolean endIsDescending) {
		if (session.getAttribute("user") == null) {
			return "redirect:Error.do";
		}
		User sessionUser = (User) session.getAttribute("user");

		List<Job> jobs = jobDAO.showCompletedJobs(sessionUser);
		
		jobsToBeSorted(jobs, nameIsAscending, nameIsDescending, startIsAscending, startIsDescending, endIsAscending, endIsDescending);
		model.addAttribute("jobs", jobs);
		model.addAttribute("adminRole", sessionUser.getRole());
		model.addAttribute("completedPage", true);
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
	public String findSingleJob(HttpSession session, Model model, int id, boolean taskPriorityIsAscending, boolean taskPriorityIsDescending,
			                    boolean taskBeginDateIsAscending, boolean taskBeginDateIsDescending, boolean taskEndDateIsAscending, 
			                    boolean taskEndDateIsDescending, boolean taskIsCompleteIsAscending, boolean taskIsCompleteIsDescending) {
		if (session.getAttribute("user") == null) {
			return "redirect:Error.do";
		}
		Job job = userDAO.findJobByJobId(id);
		User sessionUser = (User) session.getAttribute("user");
		job.getMessages().sort(Comparator.comparing(Message::getCreationTime).reversed());
		model.addAttribute("adminRole", sessionUser.getRole());
		model.addAttribute("job", job);
		
		List<Task> tasks = job.getTasks(); 
		tasksToBeSorted(tasks, taskPriorityIsAscending, taskPriorityIsDescending, taskBeginDateIsAscending, taskBeginDateIsDescending, taskEndDateIsAscending, taskEndDateIsDescending, taskIsCompleteIsAscending, taskIsCompleteIsDescending);;
		
		model.addAttribute("tasks", tasks);
		model.addAttribute("messages", job.getMessages());
		model.addAttribute("trades", tradeDAO.findAllTrades());
		return "SingleJobTasksView";
	}

	@RequestMapping(path = "findJobByKeyword.do", method = RequestMethod.GET)
	public String findJobByKeywordSearch(HttpSession session, Model model, String keyword) {
		List<Job> jobs = userDAO.findJobByKeyword(keyword);
		if (session.getAttribute("user") == null) {
			return "redirect:Error.do";
		}
	
		model.addAttribute("jobs", jobs);

		return "Dashboard";
	}
	
	public void jobsToBeSorted(List<Job> jobs, boolean nameIsAscending, boolean nameIsDescending, boolean startIsAscending, boolean startIsDescending, boolean endIsAscending, boolean endIsDescending  ){
		if(nameIsAscending) {
			jobs.sort(Comparator.comparing(Job::getJobName));
		}else if(nameIsDescending) {
			jobs.sort(Comparator.comparing(Job::getJobName).reversed());
		}else if(startIsAscending) {
			jobs.sort(Comparator.comparing(Job::getStartDate));
		}else if(startIsDescending) {
			jobs.sort(Comparator.comparing(Job::getStartDate).reversed());
		}else if(endIsAscending) {
			jobs.sort(Comparator.comparing(Job::getEndDate));
		}else if(endIsDescending) {
			jobs.sort(Comparator.comparing(Job::getEndDate).reversed());
		}
	}
	
	public void tasksToBeSorted(List<Task> tasks, boolean taskPriorityIsAscending, boolean taskPriorityIsDescending,
            boolean taskBeginDateIsAscending, boolean taskBeginDateIsDescending, boolean taskEndDateIsAscending, 
            boolean taskEndDateIsDescending, boolean taskIsCompleteIsAscending, boolean taskIsCompleteIsDescending) {
		
		if(taskPriorityIsAscending) {
			tasks.sort(Comparator.comparing(Task::getPriorityNumber));
		}else if(taskPriorityIsDescending) {
			tasks.sort(Comparator.comparing(Task::getPriorityNumber).reversed());
		}else if(taskBeginDateIsAscending) {
			tasks.sort(Comparator.comparing(Task::getBeginTime));
		}else if(taskBeginDateIsDescending) {
			tasks.sort(Comparator.comparing(Task::getBeginTime).reversed());
		}else if(taskEndDateIsAscending) {
			tasks.sort(Comparator.comparing(Task::getEndTime));
		}else if(taskEndDateIsDescending) {
			tasks.sort(Comparator.comparing(Task::getEndTime).reversed());
		}else if(taskIsCompleteIsAscending) {
			tasks.sort(Comparator.comparing(Task::getIsComplete));
		}else if(taskIsCompleteIsDescending) {
			tasks.sort(Comparator.comparing(Task::getIsComplete).reversed());
		}
	}

}
