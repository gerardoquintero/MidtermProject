package com.skilldistillery.bewitchedexcursions.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.bewitchedexcursions.entities.Activity;

@Transactional
@Service
public class ActivityDAOImple implements ActivityDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Activity createActivity(Activity activity) {
		em.persist(activity);

		return activity;
	}

	@Override
	public Activity findActivityById(int id) {
		return em.find(Activity.class, id);
	}

	@Override
	public List<Activity> findAllActivities() {
		String query = "SELECT activity FROM Activity activity WHERE activity.enabled = 1";
		return em.createQuery(query, Activity.class).getResultList();		
	}

	@Override
	public Activity updateActivity(Activity activity) {
		return em.merge(activity);
	}

	@Override
	public Activity archiveActivity(int id) {
		Activity activity = em.find(Activity.class, id);
		if (em.contains(activity)) {
			activity.setEnabled(false);
		}
		return activity;

	}

}
