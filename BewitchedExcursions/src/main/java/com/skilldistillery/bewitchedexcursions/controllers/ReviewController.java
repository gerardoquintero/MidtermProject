package com.skilldistillery.bewitchedexcursions.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.bewitchedexcursions.data.PrivateMessageDAO;
import com.skilldistillery.bewitchedexcursions.data.ReviewDAO;
import com.skilldistillery.bewitchedexcursions.data.TripDAO;
import com.skilldistillery.bewitchedexcursions.data.UserDAO;
import com.skilldistillery.bewitchedexcursions.entities.PrivateMessage;
import com.skilldistillery.bewitchedexcursions.entities.Review;
import com.skilldistillery.bewitchedexcursions.entities.User;

@Controller
public class ReviewController {

	@Autowired
	private UserDAO userDao;
	@Autowired
	private ReviewDAO reviewDao;
	@Autowired
	private TripDAO tripDao;
	@Autowired
	private PrivateMessageDAO pm;

	@RequestMapping(path = "review.do", method = RequestMethod.POST)
	public ModelAndView createReview(Model model, HttpSession session, Review review) {
		model.addAttribute("review", reviewDao.findAllReviews());

		reviewDao.createReview(review);
		ModelAndView mv = new ModelAndView();
		model.addAttribute("trip", tripDao.findTripById(review.getTrip().getId()));
		mv.setViewName("displayTrip");
		return mv;
	}

	@RequestMapping(path = "sendMessage.do", method = RequestMethod.POST)
	public String sendMessage(Model model, HttpSession session, PrivateMessage message, String receiver) {
		User user = (User)session.getAttribute("userLogin");
		User recipient = userDao.searchUsers(receiver).get(0);
		message.setSender(user);
		message.setReciever(recipient);
		message.setEnabled(true);
		pm.createPrivateMessage(message);
		model.addAttribute("messages", pm.findAllPrivateMessages());
		return "messages";
	}

	@RequestMapping(path = "message.do", method = RequestMethod.GET)
	public String sendIt(Model model, HttpSession session) {
		return "sendMessage";
	}
	
	
	

} 
