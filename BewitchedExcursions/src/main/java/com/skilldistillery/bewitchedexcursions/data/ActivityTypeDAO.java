package com.skilldistillery.bewitchedexcursions.data;

import java.util.List;

import com.skilldistillery.bewitchedexcursions.entities.ActivityType;

public interface ActivityTypeDAO {

	public ActivityType createActivityType(ActivityType activityType);

	public ActivityType findActivityTypeById(int id);

	public List<ActivityType> findAllActivityTypes();

	public ActivityType updateActivityType(ActivityType activityType);

	public boolean deleteActivityType(int id);
	
}
