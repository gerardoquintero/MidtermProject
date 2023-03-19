package com.skilldistillery.bewitchedexcursions.data;

import com.skilldistillery.bewitchedexcursions.entities.Trip;

public interface TripDAO {

	public Trip createTrip(Trip trip);

	public Trip updateTrip(Trip trip);

	public Trip archiveTrip(Trip trip);

}
