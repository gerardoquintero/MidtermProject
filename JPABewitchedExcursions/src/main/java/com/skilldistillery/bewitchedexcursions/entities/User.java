package com.skilldistillery.bewitchedexcursions.entities;

import java.util.List;
import java.util.Objects;
import java.util.Set;

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

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToMany
	@JoinTable(name = "user_has_friend", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "friend_id"))
	private Set<User> friends; // TO DO : Create add and remove method

	@ManyToMany(mappedBy = "usersAttendingTrip")
	private List<Trip> trip;

	@OneToMany(mappedBy = "user")
	private List<Review> reviews;

	@OneToMany(mappedBy = "user")
	private List<TripMessage> messages;

	@OneToMany(mappedBy = "sender")
	private List<PrivateMessage> sentMessages;

	@OneToMany(mappedBy = "reciever")
	private List<PrivateMessage> recievedMessages;

	@ManyToOne
	@JoinColumn(name = "address_id")
	private Address userAddress;

	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;

	@Column(name = "email_address")
	private String emailAddress;

	private String biography;

	@Column(name = "image")
	private String profileImageUrl;

	private String username;

	private String password;

	private boolean enabled;

	private String role;

	public User() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getBiography() {
		return biography;
	}

	public void setBiography(String biography) {
		this.biography = biography;
	}

	public String getProfileImageUrl() {
		return profileImageUrl;
	}

	public void setProfileImageUrl(String profileImageUrl) {
		this.profileImageUrl = profileImageUrl;
	}

	public List<Review> getReviews() {
		return reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Address getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(Address userAddress) {
		this.userAddress = userAddress;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public List<PrivateMessage> getSentMessages() {
		return sentMessages;
	}

	public void setSentMessages(List<PrivateMessage> sentMessages) {
		this.sentMessages = sentMessages;
	}

	public List<PrivateMessage> getRecievedMessages() {
		return recievedMessages;
	}

	public void setRecievedMessages(List<PrivateMessage> recievedMessages) {
		this.recievedMessages = recievedMessages;
	}

	public Set<User> getFriends() {
		return friends;
	}

	public void setFriends(Set<User> friends) {
		this.friends = friends;
	}

	public List<TripMessage> getMessages() {
		return messages;
	}

	public void setMessages(List<TripMessage> messages) {
		this.messages = messages;
	}

	public List<Trip> getTrip() {
		return trip;
	}

	public void setTrip(List<Trip> trip) {
		this.trip = trip;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", enabled=" + enabled
				+ ", role=" + role + "]";
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
		User other = (User) obj;
		return id == other.id;
	}

	public boolean isTheSameUserAs(Object obj) {
		if (obj == this)
			return true;
		if (!(obj instanceof User))
			return false;
		User user = (User) obj;
		return id == user.id;
	}
}
