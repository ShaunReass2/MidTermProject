package com.skilldistillery.Contracting.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.Contracting.data.UserDAO;
import com.skilldistillery.Contracting.entities.User;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(path = "adminAccountCreation.do", method = RequestMethod.POST)
	public String adminAccountCreation(User user, Model model, RedirectAttributes redir) {
		
		if (userDAO.findByUsername(user.getUsername())) {
			model.addAttribute("accountCreationFlag", true);
			return "Error"; // WE NEED THIS JSP !!!
		}
		redir.addFlashAttribute("user", userDAO.createUser(user));
		return "redirect:adminAccountCreated.do";
	}
	
	@RequestMapping(path = "adminAccountCreated.do", method = RequestMethod.GET)
	public String adminAccountCreated() {
		return "Success"; // WE NEED THIS JSP!!!!!
	}

}
