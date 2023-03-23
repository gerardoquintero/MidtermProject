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
import com.skilldistillery.bewitchedexcursions.entities.Trip;
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
	public String goHome(Model model, HttpSession session, User user) {
		model.addAttribute("trips", tripDao.findAllTrips());

		return "home";
	}
	@RequestMapping(path = "userUpdateProfile.do", method = RequestMethod.GET)
	public String updateUserProfile(User user, Model model, HttpSession session) {
//			user = userDao.getUserById(user.getId());
			User loggedInUser = (User) session.getAttribute("userLogin");
			if (loggedInUser != null) {
				loggedInUser = userDao.getUserById(loggedInUser.getId());
				model.addAttribute("user", loggedInUser);
				return "updateProfile";
			}
			return "error";
	}
	@RequestMapping(path = "updateProfileForm.do", method = RequestMethod.POST)
	public String userUpdateProfileForm(User user, Model model, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("userLogin");
		if (loggedInUser != null && loggedInUser.getId() == user.getId()) {
			user = userDao.updateUser(user);
			session.setAttribute("userLogin", user);
			model.addAttribute("user", user);
			return "redirect:profile.do";
		}
		return "home";
	}


	@RequestMapping(path = "createUserForm.do", method = RequestMethod.GET)
	public String createUserForm(Model model, User user, HttpSession session) {
		return "createUserForm";
	}

	@RequestMapping(path = "register.do", method = RequestMethod.POST)
	public String createUser(User user, Model model, String aString, HttpSession session) {
		
		model.addAttribute("trips", tripDao.findAllTrips());
		user = userDao.createUser(user);
		session.setAttribute("userLogin", user);
		Address address = new Address();
		address.setStreetAddress(aString);
		addressDao.createAddress(address);
		user.setUserAddress(address);
		model.addAttribute("user", userDao.getAllUsers());
		
		return "profile";
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
	public String loginUser(HttpSession session, User user, Model model) {
		if(user!= null) { 
			model.addAttribute("trips", tripDao.findAllTrips());
			user = userDao.login(user);
			session.setAttribute("userLogin", user);
			LocalDateTime lt = LocalDateTime.now();
			session.setAttribute("loginTime", lt);
			return "profile";
		}
		return"error";

	}

	@RequestMapping(path = "profile.do", method = RequestMethod.GET)
	public String profile(HttpSession session, User user, Model model) {
		User loggedInUser = (User) session.getAttribute("userLogin");
		if (loggedInUser != null) {
		model.addAttribute("trips", tripDao.findAllTrips());
		return "profile";
		}
		return "error";

	}
	@RequestMapping(path = "viewFriend.do", method = RequestMethod.GET)
	public String otherProfile( int otherUserId, Model model, User user) {
		user = userDao.getUserById(otherUserId);
		model.addAttribute("user", user);
		model.addAttribute("trips", tripDao.findAllTripsByOrganizer(otherUserId));
		
		return "otherProfile";
		
	}

	@RequestMapping(path = "search.do", method = RequestMethod.GET)
	public String searchUsers(HttpSession session, User user, Model model, String keyword) {
		List<User> users = userDao.searchUsers(keyword);

		model.addAttribute("users", users);

		return "displayUsers";
	}

	@RequestMapping(path = "addFriend.do", method = RequestMethod.GET)
	public String addFriend(HttpSession session, int otherUserId, Model model) {
		User currentUser = (User) session.getAttribute("userLogin");

		userDao.addFriend(currentUser, otherUserId);

		return "displayUsers";
	}

	@RequestMapping(path = "userUpdatesTrip.do", method = RequestMethod.GET)
	public String updateTripForm(Trip trip, Model model, HttpSession session) {
		trip = tripDao.findTripById(trip.getId());
		User loggedInUser = (User) session.getAttribute("userLogin");
		if (loggedInUser != null) {
			model.addAttribute("trip", trip);
			return "userUpdatesTheirTrip";
		}
		return "error";
	}

	@RequestMapping(path = "userUpdateForm.do", method = RequestMethod.POST)
	public String adminUpdateTrip(Trip trip, Model model, HttpSession session) {
		Trip tripUpdate = tripDao.findTripById(trip.getId());
		User loggedInUser = (User) session.getAttribute("userLogin");
		if (loggedInUser != null) {
			tripDao.updateTrip(trip);
			model.addAttribute("trip", tripUpdate);
			return "displayTrip";
		}
		return "home";
	}

}

