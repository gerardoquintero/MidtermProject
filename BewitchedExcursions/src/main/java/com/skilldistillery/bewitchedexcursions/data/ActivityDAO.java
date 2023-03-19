package com.skilldistillery.bewitchedexcursions.data;

import java.util.List;

import com.skilldistillery.bewitchedexcursions.entities.Activity;

public interface ActivityDAO {

	public Activity createActivity(Activity activity);

	public Activity findActivityById(int id);

	public List<Activity> findAllActivities();

	public Activity updateActivity(Activity activity);

	public Activity archiveActivity(int id);

}
