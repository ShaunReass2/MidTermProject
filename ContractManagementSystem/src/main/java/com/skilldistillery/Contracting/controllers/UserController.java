package com.skilldistillery.Contracting.controllers;

import java.time.Duration;
import java.time.LocalDateTime;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
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
			return "Error";
		}
		redir.addFlashAttribute("user", userDAO.createUser(user));
		return "redirect:adminAccountCreated.do";
	}

	@RequestMapping(path = "adminAccountCreated.do", method = RequestMethod.GET)
	public String adminAccountCreated() {
		return "Success";
	}

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String login(User user, HttpSession session, Model model, RedirectAttributes redir) {

		if (session.getAttribute("user") != null) {
			return "Dashboard";
		}
		User sessionUser = userDAO.findUserByUserNameAndPassword(user);
		if (sessionUser == null) {
			
//			model.addAttribute("loginFailFlag", true);
			redir.addFlashAttribute("sessionUser", sessionUser);
			return "redirect:Error.do";
		}
		session.setAttribute("user", sessionUser);
		return "redirect:dashboard.do";
	}

	@RequestMapping(path = "dashboard.do", method = RequestMethod.GET)
	public String dashboardLogin() {
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
	

}
