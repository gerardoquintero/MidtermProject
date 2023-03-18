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
@Table(name = "activity_type")
public class ActivityType {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "activity_type")
	private String activityType;
	
	@OneToMany(mappedBy="activityType")
	private List<Activity> activity;
	

	public ActivityType() {
		
	}

	

	public List<Activity> getActivity() {
		return activity;
	}



	public void setActivity(List<Activity> activity) {
		this.activity = activity;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getActivityType() {
		return activityType;
	}

	public void setActivityType(String activityType) {
		this.activityType = activityType;
	}

	@Override
	public String toString() {
		return "ActivityType [id=" + id + ", activityType=" + activityType + "]";
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
		ActivityType other = (ActivityType) obj;
		return id == other.id;
	}
	
}
