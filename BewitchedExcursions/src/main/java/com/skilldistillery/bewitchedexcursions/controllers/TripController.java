package com.skilldistillery.bewitchedexcursions.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.bewitchedexcursions.data.TripDAO;
import com.skilldistillery.bewitchedexcursions.entities.Trip;
import com.skilldistillery.bewitchedexcursions.entities.User;

@Controller
public class TripController {

	@Autowired
	private TripDAO tripDao;

	@RequestMapping(path = "createTripForm.do", method = RequestMethod.POST)
	public String createTrip(Trip trip, Model model, HttpSession session) {

		User loggedInUser = (User) session.getAttribute("userLogin");
		if (loggedInUser != null) {
			trip = tripDao.createTrip(trip, loggedInUser.getId());
			return "createATrip";
		}
		return "home";
	}

	@RequestMapping(path = "createTripForm.do", method = RequestMethod.GET)
	public String createATripForm(Trip trip, Model model, HttpSession session) {

		User loggedInUser = (User) session.getAttribute("userLogin");
		if (loggedInUser != null) {
			return "createTripForm";
		}
		return "home";
	}

	@RequestMapping(path = "show.do", method = RequestMethod.GET)
	public String displayUserTrips(Model model, Trip trip, HttpSession session) {
		model.addAttribute("trips", tripDao.findAllTrips());
		Trip showTrip = tripDao.findTripById(trip.getId());
		User loggedInUser = (User) session.getAttribute("userLogin");
		if (loggedInUser != null) {
		model.addAttribute("trip", showTrip);
		return "createATrip";
		}
		return "home";
	}
//
}
