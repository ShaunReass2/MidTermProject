package com.skilldistillery.Contracting.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.Contracting.data.TaskDAO;
import com.skilldistillery.Contracting.data.UserDAO;
import com.skilldistillery.Contracting.entities.Task;

@Controller
public class TaskController {

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private TaskDAO taskDAO;

	@RequestMapping(path = "setTaskComplete.do")
	public String updateTaskComplete(RedirectAttributes redir, int id) {
		
		Task task = taskDAO.updateTaskisComleteByTaskId(id);
		
		if(!task.getIsComplete()) {
			redir.addFlashAttribute("taskCompleteFlag", true);
			return "redirect:Error.do";
		}
		
		return "redirect:singleJobView.do?id=" + task.getJob().getId();
	}

}
