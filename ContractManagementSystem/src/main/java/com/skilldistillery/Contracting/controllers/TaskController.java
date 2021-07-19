package com.skilldistillery.Contracting.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.Contracting.data.TaskDAO;
import com.skilldistillery.Contracting.data.UserDAO;

@Controller
public class TaskController {

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private TaskDAO taskDAO;



}
