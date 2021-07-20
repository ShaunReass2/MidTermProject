package com.skilldistillery.Contracting.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.Contracting.data.MessageDAO;
import com.skilldistillery.Contracting.entities.Message;

@Controller
public class MessageController {
	
	@Autowired
	private MessageDAO messageDAO;
	

	@RequestMapping(path = "message.do")
	public String addMessage(RedirectAttributes redir, Model model, Message message, int jobId) {
		Message managedMessage = messageDAO.createMessage(message, jobId);
		
		if (managedMessage == null) {
			redir.addFlashAttribute("createMessageFlag", true);
			return "redirect:Error.do";
		}

		return "redirect:singleJobView.do?id=" + jobId;
	}
	@RequestMapping(path = "editMessage.do", method=RequestMethod.POST)
	public String editMessage(Message message, int messageId) {
		Message managedMessage = messageDAO.editMessage(message, messageId);
		
		
		return "redirect:singleJobView.do?id=" + managedMessage.getJob().getId();
	}
	
	
}
