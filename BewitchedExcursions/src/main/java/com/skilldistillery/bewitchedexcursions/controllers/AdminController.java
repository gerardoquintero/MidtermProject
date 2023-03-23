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
import com.skilldistillery.bewitchedexcursions.entities.Trip;
import com.skilldistillery.bewitchedexcursions.entities.User;

@Controller
public class AdminController {

	@Autowired
	private UserDAO userDao;

	@Autowired
	private TripDAO tripDao;

	@RequestMapping(path = { "admin.do" })
	public String seeAdmin(Model model, HttpSession session) {
		model.addAttribute("trips", tripDao.findAllPlusArchive());
		User loggedInUser = (User) session.getAttribute("userLogin");
		if (loggedInUser.getId() == 1) {
			return "admin";
		}

		return "home";
	}
	@RequestMapping(path = { "userAdmin.do" })
	public String seeUsersAdmin(Model model, HttpSession session) {
		model.addAttribute("users", userDao.findAllUsersPlusArchive());
		User loggedInUser = (User) session.getAttribute("userLogin");
		if (loggedInUser.getId() == 1) {
			return "userAdmin";
		}
		
		return "home";
	}

	@RequestMapping(path = "updateThisTrip.do", method = RequestMethod.GET)
	public String updateTripForm(Trip trip, Model model, HttpSession session) {
		 trip = tripDao.findTripById(trip.getId());
		User loggedInUser = (User) session.getAttribute("userLogin");
		if (loggedInUser.getId() == 1) {
			model.addAttribute("trip", trip);
			return "updateTrip";
		}
		return "home";
	}

	@RequestMapping(path = "updateTripForm.do", method = RequestMethod.POST)
	public String adminUpdateTrip(Trip trip, Model model, HttpSession session) {
		Trip tripUpdate = tripDao.findTripById(trip.getId());
		User loggedInUser = (User) session.getAttribute("userLogin");
		if (loggedInUser.getId() == 1) {
			tripDao.updateTrip(trip);
			model.addAttribute("trip", tripUpdate);
			return "redirect:admin.do";
		}
		return "home";
	}

	@RequestMapping(path = "archiveTrip.do", method = RequestMethod.GET)
	public String adminArchive(Trip trip, Model model, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("userLogin");
		if (loggedInUser.getId() == 1) {
			tripDao.archiveTrip(trip.getId());
			return "redirect:admin.do";
		}
		return "home";
	}

	@RequestMapping(path = "unArchiveTrip.do", method = RequestMethod.GET)
	public String adminUnArchive(Trip trip, Model model, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("userLogin");
		if (loggedInUser.getId() == 1) {
			tripDao.unArchiveTrip(trip.getId());
			return "redirect:admin.do";
		}
		return "home";
	}
	
	@RequestMapping(path = "updateProfileByAdmin.do", method = RequestMethod.GET)
	public String updateUserProfile(User user, Model model, HttpSession session) {
		User updateUser = userDao.getUserById(user.getId());
			User loggedInUser = (User) session.getAttribute("userLogin");
			if (loggedInUser != null) {
				model.addAttribute("users", updateUser);
				return "adminUpdateProfile";
			}
			return "error";
	}
	@RequestMapping(path = "adminUpdateUserProfileForm.do", method = RequestMethod.POST)
	public String userUpdateProfileForm(User user, Model model, HttpSession session) {
		User updateUser = userDao.getUserById(user.getId());
		User loggedInUser = (User) session.getAttribute("userLogin");
		if (loggedInUser.getId() == 1) {
			user = userDao.updateUser(user);
			session.setAttribute("users", updateUser);
			return "redirect:userAdmin.do";
		}
		return "home";
	}
	
	@RequestMapping(path = "archiveUser.do", method = RequestMethod.GET)
	public String adminArchiveUser(User user, Model model, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("userLogin");
		if (loggedInUser.getId() == 1) {
			userDao.archiveUser(user.getId());
			return "redirect:userAdmin.do";
		}
		return "home";
	}

	@RequestMapping(path = "unArchiveUser.do", method = RequestMethod.GET)
	public String adminUnArchiveUser(User user, Model model, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("userLogin");
		if (loggedInUser.getId() == 1) {
			userDao.unArchiveUser(user.getId());
			return "redirect:userAdmin.do";
		}
		return "home";
	}
	
	@RequestMapping(path = "showUser.do", method = RequestMethod.GET)
	public String displayUser(Model model, User user, HttpSession session) {
		model.addAttribute("users", userDao.findAllUsersPlusArchive());
		User showUser = userDao.getUserById(user.getId());
		User loggedInUser = (User) session.getAttribute("userLogin");
		if (loggedInUser != null) {
		model.addAttribute("users", showUser);
		return "profile";
		}
		return "home";
	}

	@RequestMapping(path = "showOtherUser.do", method = RequestMethod.GET)
	public String displayOtherUser(Model model, Integer userId, HttpSession session, Trip trip) {
		trip = tripDao.findTripById(trip.getId());
		User showUser = userDao.getUserById(userId);
		User loggedInUser = (User) session.getAttribute("userLogin");
		if (loggedInUser != null) {
			model.addAttribute("user", showUser);
			model.addAttribute("trips", trip);
//			model.addAttribute("trips", tripDao.findTripById(userId));
			return "otherProfile";
		}
		return "home";
	}

} 
