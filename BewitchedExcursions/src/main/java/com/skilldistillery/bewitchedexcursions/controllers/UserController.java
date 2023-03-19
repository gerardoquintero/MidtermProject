package com.skilldistillery.bewitchedexcursions.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.bewitchedexcursions.data.AddressDAO;
import com.skilldistillery.bewitchedexcursions.data.UserDAO;
import com.skilldistillery.bewitchedexcursions.entities.Address;
import com.skilldistillery.bewitchedexcursions.entities.User;

@Controller
public class UserController {

	
	
	@Autowired
	private UserDAO userDao;
	private AddressDAO addressDao;
	
//	
	@RequestMapping(path = { "/", "home.do" })
	public String goHome(Model model) {
		
		return "home";
	}
	
	@RequestMapping(path = "createUserForm.do", method = RequestMethod.GET)
	public String createUserForm(Model model, User user) {
		return "createUserForm";
	}
	
	@RequestMapping(path = "register", method = RequestMethod.POST)
	public ModelAndView persistTrail(User user, Model model, String aString) {
		userDao.createUser(user);
		Address address = new Address();
		address.setStreetAddress(aString);
		addressDao.createAddress(address);
		ModelAndView mv = new ModelAndView();
		user.setUserAddress(address);
		model.addAttribute("user", userDao.getAllUsers(user));
//		model.addAttribute("address", userDao.(address));
		
		mv.setViewName("home");
		return mv;
	}
	
	

	
}



//	@RequestMapping(path = {"/", "home.do"} ,method= RequestMethod.POST )
//	public String home(Model model) {
//		////////DEBUG
//		User u = new User();
//		u.setUsername("admin");
//		u.setPassword("admin");
//		u = userDao.createUser(u);
//		model.addAttribute("SMOKETEST", u);
//		/////=
//		
//		return "home";