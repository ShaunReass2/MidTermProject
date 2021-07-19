package com.skilldistillery.Contracting.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.Contracting.data.TradeDAO;
import com.skilldistillery.Contracting.data.UserDAO;

@Controller
public class HomeController {
	
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private TradeDAO tradeDAO;

	@RequestMapping(path = {"/", "home.do"})
	public String home(Model model, HttpSession session) {
		if (session.getAttribute("user") != null) {
			return "redirect:dashboard.do";
		}
		//populate trades for creation form
		model.addAttribute("trades", tradeDAO.findAllTrades());
		return "home";
	}
	
	
}
