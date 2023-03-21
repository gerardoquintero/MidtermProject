package com.skilldistillery.bewitchedexcursions.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.bewitchedexcursions.data.TripDAO;
import com.skilldistillery.bewitchedexcursions.data.UserDAO;
import com.skilldistillery.bewitchedexcursions.entities.User;

@Controller
public class AdminController {

	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private TripDAO tripDao;
	
	
	@RequestMapping(path = {  "admin.do" })
	public String seeAdmin(Model model,HttpSession session,User user) {
		model.addAttribute("trips", tripDao.findAllTrips());
		
		return "admin";
	}
	

	
	
}
