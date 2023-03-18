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
import javax.persistence.Table;

@Entity
@Table(name = "lodging")
public class Lodging {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	private String description;

	private Double price;

	@Column(name = "check_in_time")
	private LocalDateTime checkInTime;

	@Column(name = "check_out_time")
	private LocalDateTime checkOutTime;

	@Column(name = "image")
	private String imageURL;

	private boolean enabled;
	
	@ManyToMany
	@JoinTable(name="lodging_has_lodging_amenities",joinColumns=@JoinColumn(name="lodging_id"),
	inverseJoinColumns=@JoinColumn(name="lodging_amenities_id"))
	private List <LodgingAmenities> lodgingAmenities;

	public Lodging() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public LocalDateTime getCheckInTime() {
		return checkInTime;
	}

	public void setCheckInTime(LocalDateTime checkInTime) {
		this.checkInTime = checkInTime;
	}

	public LocalDateTime getCheckOutTime() {
		return checkOutTime;
	}

	public void setCheckOutTime(LocalDateTime checkOutTime) {
		this.checkOutTime = checkOutTime;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	public List<LodgingAmenities> getLodgingAmenities() {
		return lodgingAmenities;
	}
	
	public void setLodgingAmenities(List<LodgingAmenities> lodgingAmenities) {
		this.lodgingAmenities = lodgingAmenities;
	}

	@Override
	public String toString() {
		return "Lodging [id=" + id + ", name=" + name + ", description=" + description + ", price=" + price
				+ ", checkInTime=" + checkInTime + ", checkOutTime=" + checkOutTime + ", imageURL=" + imageURL
				+ ", enabled=" + enabled + "]";
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
		Lodging other = (Lodging) obj;
		return id == other.id;
	}


}
