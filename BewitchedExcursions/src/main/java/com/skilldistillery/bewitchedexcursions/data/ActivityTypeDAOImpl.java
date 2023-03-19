package com.skilldistillery.bewitchedexcursions.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.bewitchedexcursions.entities.ActivityType;

@Transactional
@Service
public class ActivityTypeDAOImpl implements ActivityTypeDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public ActivityType createActivityType(ActivityType activityType) {
		em.persist(activityType);

		return activityType;
	}

	@Override
	public ActivityType findActivityTypeById(int id) {
		return em.find(ActivityType.class, id);
	}

	@Override
	public List<ActivityType> findAllActivityTypes() {
		String query = "SELECT activityType FROM ActivityType activityType WHERE activityType.enabled = 1";
		return em.createQuery(query, ActivityType.class).getResultList();
	}

	@Override
	public ActivityType updateActivityType(ActivityType activityType) {
		return em.merge(activityType);
	}

	@Override
	public boolean deleteActivityType(int id) {
		boolean activityTypeDeleted = false;
		ActivityType activityType = em.find(ActivityType.class, id);
		if (em.contains(activityType)) {
			em.remove(activityType);
			activityTypeDeleted = true;
		} else {
			activityTypeDeleted = false;
		}
		return activityTypeDeleted;
	}

}
