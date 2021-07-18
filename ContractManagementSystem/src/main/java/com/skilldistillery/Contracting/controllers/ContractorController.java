package com.skilldistillery.Contracting.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	
	@RequestMapping(path = "ContractorForm.do")
	public String contractorSignup(User user, Contractor contractor, int tradeNumber, Model model) {
		
		if (userDAO.findByUsername(user.getUsername())) {
			model.addAttribute("accountCreationFlag", true);
			return "error";
		}
		//Set contractor User/Trade
		contractor.setUser(userDAO.createUser(user)); 
		contractor.setTrade(tradeDAO.findTradeById(tradeNumber));
		//Persist Contractor to DB
		contractorDAO.addContractor(contractor);
		
		//need to build redirect for success
		return "";
	}
	
	
}
