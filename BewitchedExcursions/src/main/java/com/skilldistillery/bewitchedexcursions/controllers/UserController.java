package com.skilldistillery.bewitchedexcursions.controllers;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.bewitchedexcursions.data.AddressDAO;
import com.skilldistillery.bewitchedexcursions.data.TripDAO;
import com.skilldistillery.bewitchedexcursions.data.UserDAO;
import com.skilldistillery.bewitchedexcursions.entities.Address;
import com.skilldistillery.bewitchedexcursions.entities.User;

@Controller
public class UserController {

	
	
	@Autowired
	private UserDAO userDao;
	@Autowired
	private AddressDAO addressDao;
	@Autowired
	private TripDAO tripDao;
	
//	
	@RequestMapping(path = { "/", "home.do" })
	public String goHome(Model model,HttpSession session,User user) {
		model.addAttribute("trips", tripDao.findAllTrips());

		return "home";
	}
	
	@RequestMapping(path = "createUserForm.do", method = RequestMethod.GET)
	public String createUserForm(Model model, User user,HttpSession session) {
		model.addAttribute("trips", tripDao.findAllTrips());
		session.setAttribute("userLogin", user);
		return "createUserForm";
	}
	
	@RequestMapping(path = "register.do", method = RequestMethod.POST)
	public ModelAndView createUser(User user, Model model, String aString, HttpSession session) {
		model.addAttribute("trips", tripDao.findAllTrips()); 
		user = userDao.createUser(user);
		session.setAttribute("userLogin", user);
		Address address = new Address();
		address.setStreetAddress(aString);
		addressDao.createAddress(address);
		ModelAndView mv = new ModelAndView();
		user.setUserAddress(address);
		model.addAttribute("user", userDao.getAllUsers());

	
		mv.setViewName("profile");
		return mv;
	}
	
	@RequestMapping(path = "userLogin.do", method = RequestMethod.GET)
	public String loginForm(Model model, User user) {
		return "userLogin";
	}
	
	@RequestMapping(path = "logout.do")
	public String logoutForm(HttpSession session) {
		session.removeAttribute("userLogin");
		return "home";
	}
	
	
	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String loginUser(HttpSession session, User user,Model model) {
		model.addAttribute("trips", tripDao.findAllTrips());
		user = userDao.login(user);
		session.setAttribute("userLogin", user);
		 LocalDateTime lt = LocalDateTime.now();
		 session.setAttribute("loginTime", lt);
		 return "profile";
		
	}
	
	@RequestMapping(path = "profile.do", method = RequestMethod.GET)
	public String profile(HttpSession session, User user,Model model) {
		model.addAttribute("trips", tripDao.findAllTrips());
		 return "profile";
		
	}
	@RequestMapping(path = "search.do", method = RequestMethod.GET)
	public String searchUsers(HttpSession session, User user,Model model,String keyword) {
		List<User> users = userDao.searchUsers(keyword);
	
		model.addAttribute("users",users);
	
		return "otherProfile";	
	}
	@RequestMapping(path = "addFriend.do", method = RequestMethod.GET)
	public String addFriend(HttpSession session,int otherUserId,Model model) {
		User currentUser = (User) session.getAttribute("userLogin");
		
		
		userDao.addFriend(currentUser, otherUserId);
	
	
		return "otherProfile";	
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