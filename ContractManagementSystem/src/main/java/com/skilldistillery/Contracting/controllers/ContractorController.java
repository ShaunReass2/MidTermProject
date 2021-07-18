package com.skilldistillery.Contracting.controllers;

import java.lang.ProcessBuilder.Redirect;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.Contracting.data.ContractorDAO;
import com.skilldistillery.Contracting.data.TradeDAO;
import com.skilldistillery.Contracting.data.UserDAO;
import com.skilldistillery.Contracting.entities.Contractor;
import com.skilldistillery.Contracting.entities.User;

@Controller
public class ContractorController {

	@Autowired
	private ContractorDAO contractorDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private TradeDAO tradeDAO;
	
	
	@RequestMapping(path = "ContractorForm.do", method=RequestMethod.POST)
	public String contractorSignup(User user, Contractor contractor, int tradeNumber, Model model, RedirectAttributes redir) {
		
		if (userDAO.findByUsername(user.getUsername())) {
			model.addAttribute("accountCreationFlag", true);
			return "redirect:error.do";
		}
		//Set contractor User/Trade
		contractor.setUser(userDAO.createUser(user)); 
		contractor.setTrade(tradeDAO.findTradeById(tradeNumber));
		//Persist Contractor to DB
		contractorDAO.addContractor(contractor);
		
		//need to build redirect for success
		redir.addAttribute("accountName", user.getUsername());
		return "redirect:success.do";
	}
	
	@RequestMapping(path="success.do", params="accountName")
	public String contractorSuccess(String accountName, Model model) {
		model.addAttribute("accountName", accountName);
		return "success";
	}
	@RequestMapping(path="error.do", params="accountCreationFlag")
	public String contractorError(Boolean accountCreationFlag, Model model) {
		model.addAttribute("accountCreationFlag", accountCreationFlag);
		return "error";
	}
	
	
}
