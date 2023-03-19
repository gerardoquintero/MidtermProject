package com.skilldistillery.bewitchedexcursions.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.bewitchedexcursions.entities.Review;

@Transactional
@Service
public class ReviewDAOImpl implements ReviewDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Review createReview(Review review) {
		em.persist(review);

		return review;
	}

	@Override
	public Review findReviewById(int id) {
		return em.find(Review.class, id);
	}

	@Override
	public List<Review> findAllReviews() {
		String query = "SELECT review FROM Review review WHERE review.enabled = 1";
		return em.createQuery(query, Review.class).getResultList();
	}

	@Override
	public Review updateReview(Review review) {
		return em.merge(review);
	}

	@Override
	public Review archiveReview(int id) {
		Review review = em.find(Review.class, id);
		if (em.contains(review)) {
			review.setEnabled(false);
		}
		return review;
	}

}
