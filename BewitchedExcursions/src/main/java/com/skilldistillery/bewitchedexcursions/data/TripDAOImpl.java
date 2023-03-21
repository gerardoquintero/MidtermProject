package com.skilldistillery.bewitchedexcursions.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.bewitchedexcursions.entities.Trip;
import com.skilldistillery.bewitchedexcursions.entities.User;

@Transactional
@Service
public class TripDAOImpl implements TripDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Trip createTrip(Trip trip, int userId) {
		User managedUser=em.find(User.class, userId);
		trip.setOrganizer(managedUser);
		trip.setEnabled(true);
		em.persist(trip);

		return trip;
	}

	@Override
	public Trip findTripById(int id) {
		return em.find(Trip.class, id);
	}

	@Override
	public List<Trip> findAllTrips() {
		String query = "SELECT trip FROM Trip trip WHERE trip.enabled = 1";
		return em.createQuery(query, Trip.class).getResultList();		
	}
	@Override
	public List<Trip> findAllPlusArchive() {
		String query = "SELECT trip FROM Trip trip";
		return em.createQuery(query, Trip.class).getResultList();		
	}

	@Override
	public Trip updateTrip(Trip trip) {
		return em.merge(trip);
	}

	@Override
	public Trip archiveTrip(int id) {
		Trip trip = em.find(Trip.class, id);
		if (em.contains(trip)) {
			trip.setEnabled(false);
		}
		return trip;

	}


}
