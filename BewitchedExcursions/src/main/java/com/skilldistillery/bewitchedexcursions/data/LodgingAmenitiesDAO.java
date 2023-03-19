package com.skilldistillery.bewitchedexcursions.data;

import java.util.List;

import com.skilldistillery.bewitchedexcursions.entities.LodgingAmenities;

public interface LodgingAmenitiesDAO {

	public LodgingAmenities createLodgingAmenities(LodgingAmenities lodgingAmenities);

	public LodgingAmenities findLodgingAmentityById(int id);

	public List<LodgingAmenities> findAllLodgingAmenities();

	public LodgingAmenities updateLodgingAmenities(LodgingAmenities lodgingAmenities);

//	public LodgingAmenities archiveLodgingAmenities(int id);

	public boolean deleteLodgingAmenity(int id);
}
