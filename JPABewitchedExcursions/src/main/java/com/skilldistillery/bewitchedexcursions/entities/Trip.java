package com.skilldistillery.bewitchedexcursions.entities;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "trip")
public class Trip {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "start_date")
	private LocalDateTime startDate;

	@OneToMany(mappedBy = "trip")
	private List<Review> reviews;

	public List<Review> getReviews() {
		return reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}
 
	public Boolean getEnabled() {
		return enabled;
	}

	@Column(name = "end_date")
	private LocalDateTime endDate;

	private String name;

	private String description;

	private Integer capacity;

	@Column(name = "image")
	private String imageURL;

	private Boolean enabled;

	@ManyToMany
	@JoinTable(name = "user_has_trip", joinColumns = @JoinColumn(name = "trip_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
	private List<User> usersAttendingTrip;

	@ManyToOne
	@JoinColumn(name = "organizer_id")
	private User organizer;

	@OneToMany(mappedBy = "trip")
	private List<Review> tripReviews;

	@OneToMany(mappedBy = "tripActivity")
	private List<Activity> activities;

	@OneToMany(mappedBy = "trip")
	private List<TripMessage> tripMessages;
	
	@OneToMany(mappedBy = "trip")
	private List<Lodging> lodging;


	public Trip() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDateTime getStartDate() {
		return startDate;
	}

	public void setStartDate(LocalDateTime startDate) {
		this.startDate = startDate;
	}

	public LocalDateTime getEndDate() {
		return endDate;
	}

	public void setEndDate(LocalDateTime endDate) {
		this.endDate = endDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getCapacity() {
		return capacity;
	}

	public void setCapacity(Integer capacity) {
		this.capacity = capacity;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public List<User> getUsersAttendingTrip() {
		return usersAttendingTrip;
	}

	public void setUsersAttendingTrip(List<User> usersAttendingTrip) {
		this.usersAttendingTrip = usersAttendingTrip;
	}

	public User getOrganizer() {
		return organizer;
	}

	public void setOrganizer(User organizer) {
		this.organizer = organizer;
	}

	public List<Review> getTripReviews() {
		return tripReviews;
	}

	public void setTripReviews(List<Review> tripReviews) {
		this.tripReviews = tripReviews;
	}

	public List<Activity> getActivities() {
		return activities;
	}

	public void setActivities(List<Activity> activities) {
		this.activities = activities;
	}

	public List<TripMessage> getTripMessages() {
		return tripMessages;
	}

	public void setTripMessages(List<TripMessage> tripMessages) {
		this.tripMessages = tripMessages;
	}

	public List<Lodging> getLodging() {
		return lodging;
	}

	public void setLodging(List<Lodging> lodging) {
		this.lodging = lodging;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Trip other = (Trip) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Trip [id=" + id + ", name=" + name + ", enabled=" + enabled + "]";
	}



}
