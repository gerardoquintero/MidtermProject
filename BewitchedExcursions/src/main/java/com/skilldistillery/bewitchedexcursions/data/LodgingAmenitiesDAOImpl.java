package com.skilldistillery.bewitchedexcursions.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.bewitchedexcursions.entities.LodgingAmenities;
import com.skilldistillery.bewitchedexcursions.entities.TripMessage;

@Transactional
@Service
public class LodgingAmenitiesDAOImpl implements LodgingAmenitiesDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public LodgingAmenities createLodgingAmenities(LodgingAmenities lodgingAmenities) {
		em.persist(lodgingAmenities);

		return lodgingAmenities;
	}

	@Override
	public LodgingAmenities findLodgingAmentityById(int id) {
		return em.find(LodgingAmenities.class, id);
	}

	@Override
	public List<LodgingAmenities> findAllLodgingAmenities() {
		String query = "SELECT lodgingAmenities FROM LodgingAmenities lodgingAmenities WHERE lodgingAmenities.enabled = 1";
		return em.createQuery(query, LodgingAmenities.class).getResultList();
	}

	@Override
	public LodgingAmenities updateLodgingAmenities(LodgingAmenities lodgingAmenities) {
		return em.merge(lodgingAmenities);
	}

//	@Override
//	public LodgingAmenities archiveLodgingAmenities(int id) {
//		LodgingAmenities lodgingAmenities = em.find(LodgingAmenities.class, id);
//		if (em.contains(lodgingAmenities)) {
//			lodgingAmenities.setEnabled(false);
//		}
//		return lodgingAmenities;
//	}
	@Override
	public boolean deleteLodgingAmenity(int id) {
		boolean amenityDeleted = false;
		LodgingAmenities lodgingAmenity = em.find(LodgingAmenities.class, id);
		if (em.contains(lodgingAmenity)) {
			em.remove(lodgingAmenity);
			amenityDeleted = true;
		} else {
			amenityDeleted = false;
		}
		return amenityDeleted;
	}

}
