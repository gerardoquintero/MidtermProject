package com.skilldistillery.bewitchedexcursions.data;

import java.util.List;

import com.skilldistillery.bewitchedexcursions.entities.TripMessage;

public interface TripMessageDAO {

	public TripMessage createTripMessage(TripMessage tripMessage);

	public TripMessage findTripMessageById(int id);

	public List<TripMessage> findAllTripMessages();

	public TripMessage updateTripMessage(TripMessage tripMessage);

	public boolean deleteTripMessage(int id);
	
}
