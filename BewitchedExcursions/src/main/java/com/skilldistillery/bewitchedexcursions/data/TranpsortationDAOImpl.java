package com.skilldistillery.bewitchedexcursions.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.bewitchedexcursions.entities.Transportation;

@Transactional
@Service
public class TranpsortationDAOImpl implements TransportationDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Transportation createTransportation(Transportation transportation) {
		em.persist(transportation);

		return transportation;
	}

	@Override
	public Transportation findTransportationById(int id) {
		return em.find(Transportation.class, id);
	}

	@Override
	public List<Transportation> findAllTransportation() {
		String query = "SELECT transportation FROM Transportation transportation WHERE transportation.enabled = 1";
		return em.createQuery(query, Transportation.class).getResultList();
	}

	@Override
	public Transportation updateTransportation(Transportation transportation) {
		return em.merge(transportation);
	}

	@Override
	public Transportation archiveTransportation(int id) {
		Transportation transportation = em.find(Transportation.class, id);
		if (em.contains(transportation)) {
			transportation.setEnabled(false);
		}
		return transportation;
	}

}
