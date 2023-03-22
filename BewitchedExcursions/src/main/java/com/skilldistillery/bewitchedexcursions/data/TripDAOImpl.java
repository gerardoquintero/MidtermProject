package com.skilldistillery.bewitchedexcursions.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
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
	public List<Trip> findAllTripsByOrganizer(int otherUserId) {
	    TypedQuery<Trip> query = em.createQuery(
	        "SELECT t FROM Trip t WHERE t.organizer.id = :organizerId AND t.enabled = 1",
	        Trip.class);
	    query.setParameter("organizerId", otherUserId);
	    List<Trip> trips = query.getResultList();
	    return trips;
	}

	@Override
	public List<Trip> findAllPlusArchive() {
		String query = "SELECT trip FROM Trip trip ORDER BY start_date ASC";
		return em.createQuery(query, Trip.class).getResultList();		
	}

	@Override
	public Trip updateTrip(Trip trip) {
		Trip originalTrip = em.find(Trip.class, trip.getId());
		originalTrip.setName(trip.getName());
		originalTrip.setDescription(trip.getDescription());
		originalTrip.setCapacity(trip.getCapacity());
		originalTrip.setStartDate(trip.getStartDate());
		originalTrip.setEndDate(trip.getEndDate());
		originalTrip.setImageURL(trip.getImageURL());
		return originalTrip;
	}

	@Override
	public Trip archiveTrip(int id) {
		Trip trip = em.find(Trip.class, id);
		if (em.contains(trip)) {
			trip.setEnabled(false);
		}
		return trip;

	}
	@Override
	public Trip unArchiveTrip(int id) {
		Trip trip = em.find(Trip.class, id);
		if (em.contains(trip)) {
			trip.setEnabled(true);
		}
		return trip;
		
	}


}
