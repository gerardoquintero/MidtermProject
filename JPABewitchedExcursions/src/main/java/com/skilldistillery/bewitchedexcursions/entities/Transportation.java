package com.skilldistillery.bewitchedexcursions.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "transportation")
public class Transportation {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String company;

	@Column(name = "departure_date")
	private LocalDateTime departureDate;

	@Column(name = "arrival_date")
	private LocalDateTime arrivalDate;

	private Double cost;

	@Column(name = "image")
	private String imageURL;

	private String description;

	private boolean enabled;
	
	@ManyToOne
	@JoinColumn(name = "departure_address_id")
	private Address departureAddress;
	
	@ManyToOne
	@JoinColumn(name = "arrival_address_id")
	private Address arrivalAddress;
	
	@ManyToOne
	@JoinColumn(name = "transportation_type_id")
	private TransportationType transportationType;

	public Transportation() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Address getDepartureAddress() {
		return departureAddress;
	}

	public void setDepartureAddress(Address departureAddress) {
		this.departureAddress = departureAddress;
	}

	public Address getArrivalAddress() {
		return arrivalAddress;
	}

	public void setArrivalAddress(Address arrivalAddress) {
		this.arrivalAddress = arrivalAddress;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public TransportationType getTransportationType() {
		return transportationType;
	}

	public void setTransportationType(TransportationType transportationType) {
		this.transportationType = transportationType;
	}

	public LocalDateTime getDepartureDate() {
		return departureDate;
	}

	public void setDepartureDate(LocalDateTime departureDate) {
		this.departureDate = departureDate;
	}

	public LocalDateTime getArrivalDate() {
		return arrivalDate;
	}

	public void setArrivalDate(LocalDateTime arrivalDate) {
		this.arrivalDate = arrivalDate;
	}

	public Double getCost() {
		return cost;
	}

	public void setCost(Double cost) {
		this.cost = cost;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	@Override
	public String toString() {
		return "Transportation [id=" + id + ", company=" + company + ", departureDate=" + departureDate
				+ ", arrivalDate=" + arrivalDate + ", cost=" + cost + ", imageURL=" + imageURL + ", description="
				+ description + ", enabled=" + enabled + "]";
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
		Transportation other = (Transportation) obj;
		return id == other.id;
	}

}
