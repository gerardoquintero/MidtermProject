package com.skilldistillery.bewitchedexcursions.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class ReviewId implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(name = "user_id")
	private int userId;

	@Column(name = "trip_id")
	private int tripId;

	public ReviewId() {

	}

	public ReviewId(int userId, int tripId) {
		super();
		this.userId = userId;
		this.tripId = tripId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getTripId() {
		return tripId;
	}

	public void setTripId(int tripId) {
		this.tripId = tripId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	

	@Override
	public int hashCode() {
		return Objects.hash(tripId, userId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReviewId other = (ReviewId) obj;
		return tripId == other.tripId && userId == other.userId;
	}

	@Override
	public String toString() {
		return "ReviewId [userId=" + userId + ", tripId=" + tripId + "]";
	}

	
}
// Getters/setters, ctors, toString, equals/hashCode