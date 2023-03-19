package com.skilldistillery.bewitchedexcursions.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.bewitchedexcursions.entities.TripMessage;

@Transactional
@Service
public class TripMessageDAOImpl implements TripMessageDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public TripMessage createTripMessage(TripMessage tripMessage) {
		em.persist(tripMessage);

		return tripMessage;
	}

	@Override
	public TripMessage findTripMessageById(int id) {
		return em.find(TripMessage.class, id);
	}

	@Override
	public List<TripMessage> findAllTripMessages() {
		String query = "SELECT tripMessage FROM TripMessage tripMessage WHERE tripMessage.enabled = 1";
		return em.createQuery(query, TripMessage.class).getResultList();
	}

	@Override
	public TripMessage updateTripMessage(TripMessage tripMessage) {
		return em.merge(tripMessage);
	}

	@Override
	public boolean deleteTripMessage(int id) {
		boolean tripMessageDeleted = false;
		TripMessage tripMessage = em.find(TripMessage.class, id);
		if (em.contains(tripMessage)) {
			em.remove(tripMessage);
			tripMessageDeleted = true;
		} else {
			tripMessageDeleted = false;
		}
		return tripMessageDeleted;
	}

}
