package com.skilldistillery.bewitchedexcursions.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "address")
public class Address {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String country;

	private String city;

	@Column(name = "postal_code")
	private String postalCode;

	@Column(name = "address")
	private String streetAddress;

	private String phone;

	private String state;

	private boolean enabled;
	
	@OneToMany(mappedBy="userAddress")
	private List<User> users;
	
	@OneToMany(mappedBy="address")
	private List<Activity> activities;
	
	@OneToMany(mappedBy="departureAddress")
	private List<Transportation> departureTransportaion;
	
	@OneToMany(mappedBy="arrivalAddress")
	private List<Transportation> arrivalTransportaion;
	
	public Address() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<Activity> getActivities() {
		return activities;
	}

	public void setActivities(List<Activity> activities) {
		this.activities = activities;
	}

	public String getCountry() {
		return country;
	}

	public List<Transportation> getDepartureTransportaion() {
		return departureTransportaion;
	}

	public void setDepartureTransportaion(List<Transportation> departureTransportaion) {
		this.departureTransportaion = departureTransportaion;
	}

	public List<Transportation> getArrivalTransportaion() {
		return arrivalTransportaion;
	}

	public void setArrivalTransportaion(List<Transportation> arrivalTransportaion) {
		this.arrivalTransportaion = arrivalTransportaion;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getStreetAddress() {
		return streetAddress;
	}

	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	@Override
	public String toString() {
		return "Address [id=" + id + ", country=" + country + ", city=" + city + ", postalCode=" + postalCode
				+ ", streetAddress=" + streetAddress + ", phone=" + phone + ", state=" + state + ", enabled=" + enabled
				+ "]";
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
		Address other = (Address) obj;
		return id == other.id;
	}

}
