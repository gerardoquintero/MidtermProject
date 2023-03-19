package com.skilldistillery.bewitchedexcursions.data;

import java.util.List;

import com.skilldistillery.bewitchedexcursions.entities.Lodging;

public interface LodgingDAO {

	public Lodging createLodging(Lodging lodging);

	public Lodging findLodgingById(int id);

	public List<Lodging> findAllLodgings();

	public Lodging updateLodging(Lodging lodging);

	public Lodging archiveLodging(int id);
}
