package com.skilldistillery.bewitchedexcursions.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "lodging_amenities")
public class LodgingAmenities {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	@ManyToMany(mappedBy = "lodgingAmenities")
	private List<Lodging> lodging;

	public LodgingAmenities() {

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

	public List<Lodging> getLodging() {
		return lodging;
	}

	public void setLodging(List<Lodging> lodging) {
		this.lodging = lodging;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "LodgingAmenities [id=" + id + ", name=" + name + "]";
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
		LodgingAmenities other = (LodgingAmenities) obj;
		return id == other.id;
	}

}
