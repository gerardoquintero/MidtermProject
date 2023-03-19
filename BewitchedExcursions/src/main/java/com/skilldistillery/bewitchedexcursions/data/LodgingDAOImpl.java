package com.skilldistillery.bewitchedexcursions.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.bewitchedexcursions.entities.Lodging;

@Transactional
@Service
public class LodgingDAOImpl implements LodgingDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Lodging createLodging(Lodging lodging) {
		em.persist(lodging);

		return lodging;
	}

	@Override
	public Lodging findLodgingById(int id) {
		return em.find(Lodging.class, id);
	}

	@Override
	public List<Lodging> findAllLodgings() {
		String query = "SELECT lodging FROM Lodging lodging WHERE lodging.enabled = 1";
		return em.createQuery(query, Lodging.class).getResultList();
	}

	@Override
	public Lodging updateLodging(Lodging lodging) {
		return em.merge(lodging);
	}

	@Override
	public Lodging archiveLodging(int id) {
		Lodging lodging = em.find(Lodging.class, id);
		if (em.contains(lodging)) {
			lodging.setEnabled(false);
		}
		return lodging;
	}

}
