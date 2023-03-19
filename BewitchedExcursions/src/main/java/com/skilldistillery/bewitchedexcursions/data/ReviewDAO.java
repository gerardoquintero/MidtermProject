package com.skilldistillery.bewitchedexcursions.data;

import java.util.List;

import com.skilldistillery.bewitchedexcursions.entities.Review;

public interface ReviewDAO {

	public Review createReview(Review review);

	public Review findReviewById(int id);

	public List<Review> findAllReviews();

	public Review updateReview(Review review);

	public Review archiveReview(int id);
}
