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
	public String seeAdmin(Model model, HttpSession session, Trip trip) {
		model.addAttribute("trips", tripDao.findAllPlusArchive());
		User loggedInUser = (User) session.getAttribute("userLogin");
		if (loggedInUser.getId() == 1) {
			return "admin";
		}

		return "home";
	}

	@RequestMapping(path = "updateThisTrip.do", method = RequestMethod.GET)
	public String updateTripForm(Trip trip, Model model, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("userLogin");
		if (loggedInUser.getId() == 1) {
			return "updateTrip";
		}
		return "home";
	}
	
	@RequestMapping(path = "updateTripForm.do", method = RequestMethod.POST)
	public String adminUpdateTrip(Trip trip, Model model, HttpSession session) {

		User loggedInUser = (User) session.getAttribute("userLogin");
		if (loggedInUser.getId() == 1) {
			Trip updatedTrip = tripDao.updateTrip(trip);
//			model.addAttribute("trip", updatedTrip);
			return "admin";
		}
		return "home";
	}
	
	@RequestMapping(path = "archiveTrip.do", method = RequestMethod.GET)
	public String adminArchive(Trip trip, Model model, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("userLogin");
		if (loggedInUser.getId() == 1) {
			tripDao.archiveTrip(trip.getId());
			return "admin";
		}
		return "home";
	}
	
	@RequestMapping(path = "unArchiveTrip.do", method = RequestMethod.GET)
	public String adminUnArchive(Trip trip, Model model, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("userLogin");
		if (loggedInUser.getId() == 1) {
			tripDao.unArchiveTrip(trip.getId());
			return "admin";
		}
		return "home";
	}

}
