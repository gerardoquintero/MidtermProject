package com.skilldistillery.bewitchedexcursions.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.bewitchedexcursions.entities.TransportationType;

@Transactional
@Service
public class TransportationTypeDAOImpl implements TransportationTypeDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public TransportationType createTransportationType(TransportationType transportationType) {
		em.persist(transportationType);

		return transportationType;
	}

	@Override
	public TransportationType findTransportationTypeById(int id) {
		return em.find(TransportationType.class, id);
	}

	@Override
	public List<TransportationType> findAllTransportationTypes() {
		String query = "SELECT transportationType FROM TransportationType transportationType WHERE transportationType.enabled = 1";
		return em.createQuery(query, TransportationType.class).getResultList();
	}

	@Override
	public TransportationType updateTransportationType(TransportationType transportationType) {
		return em.merge(transportationType);
	}

	@Override
	public boolean deleteTransportationType(int id) {
		boolean transportationTypeDeleted = false;
		TransportationType transportationType = em.find(TransportationType.class, id);
		if (em.contains(transportationType)) {
			em.remove(transportationType);
			transportationTypeDeleted = true;
		} else {
			transportationTypeDeleted = false;
		}
		return transportationTypeDeleted;
	}

}
