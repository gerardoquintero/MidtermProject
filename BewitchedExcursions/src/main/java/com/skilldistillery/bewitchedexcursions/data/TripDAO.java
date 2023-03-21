package com.skilldistillery.bewitchedexcursions.data;

import java.util.List;

import com.skilldistillery.bewitchedexcursions.entities.Trip;

public interface TripDAO {

	public Trip createTrip(Trip trip,int userId);

	public Trip findTripById(int id);

	public List<Trip> findAllTrips();

	public Trip updateTrip(Trip trip);

	public Trip archiveTrip(int id);

	List<Trip> findAllPlusArchive();

}
