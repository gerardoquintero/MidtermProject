package com.skilldistillery.bewitchedexcursions.data;

import java.util.List;

import com.skilldistillery.bewitchedexcursions.entities.Trip;
import com.skilldistillery.bewitchedexcursions.entities.User;

public interface TripDAO {

	public Trip createTrip(Trip trip,int userId);

	public Trip findTripById(int id);

	public List<Trip> findAllTrips();

	public Trip updateTrip(Trip trip);

	public Trip archiveTrip(int id);

	public List<Trip> findAllPlusArchive();

	public Trip unArchiveTrip(int id);



	List<Trip> findAllTripsByOrganizer(int otherUserId);



}
