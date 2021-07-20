package com.skilldistillery.Contracting.controllers;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.Contracting.data.ContractorDAO;
import com.skilldistillery.Contracting.data.TaskDAO;
import com.skilldistillery.Contracting.data.TradeDAO;
import com.skilldistillery.Contracting.entities.Contractor;
import com.skilldistillery.Contracting.entities.Task;

@Controller
public class TaskController {

	@Autowired
	private TaskDAO taskDAO;
	
	@Autowired
	private ContractorDAO contractorDAO;
	
	@Autowired
	private TradeDAO tradeDAO;

	@RequestMapping(path = "setTaskComplete.do")
	public String updateTaskComplete(RedirectAttributes redir, int id) {
		
		Task task = taskDAO.updateTaskisComleteByTaskId(id);
		
		if(!task.getIsComplete()) {
			redir.addFlashAttribute("taskCompleteFlag", true);
			return "redirect:Error.do";
		}
		return "redirect:singleJobView.do?id=" + task.getJob().getId();
	}

	@RequestMapping(path = "createTask.do", method = RequestMethod.POST)
	public String createTask(RedirectAttributes redir, Task task) {
	
		Task managedTask = taskDAO.createTask(task);
		
		if(managedTask == null) {
			redir.addFlashAttribute("taskCreationFlag", true);
			return "redirect:Error.do";
		}
		return "redirect:singleJobView.do?id=" + task.getJob().getId();
	}

	@RequestMapping(path = "deleteTask.do", method = RequestMethod.POST)
	public String deleteTask(RedirectAttributes redir, Task task) {
		
		boolean wasDeleted = taskDAO.deleteTask(task);
		
		if(!wasDeleted) {
			redir.addFlashAttribute("taskDeletionFlag", true);
			return "redirect:Error.do";
		}
		return "redirect:singleJobView.do?id=" + task.getJob().getId();
	}

	@RequestMapping(path = "editTask.do", method = RequestMethod.POST)
	public String updateTask(RedirectAttributes redir, Task task) {
		
		Task managedTask = taskDAO.updateTask(task);
		
		if(managedTask == null) {
			redir.addFlashAttribute("taskUpdateFlag", true);
			return "redirect:Error.do";
		}
		return "redirect:singleJobView.do?id=" + task.getJob().getId();
	}
	
	@RequestMapping(path = "chooseTrade.do", method = RequestMethod.POST)
	public String chooseTradeForCreateTask(Model model, int id) {
		List<Contractor> contractors = contractorDAO.findAllContractors(id);
		model.addAttribute("contractors", contractors);
		return "CreateTaskForm";
	}
	
	

	
}
