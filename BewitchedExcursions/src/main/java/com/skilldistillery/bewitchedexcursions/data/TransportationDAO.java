package com.skilldistillery.bewitchedexcursions.data;

import java.util.List;

import com.skilldistillery.bewitchedexcursions.entities.Transportation;

public interface TransportationDAO {

	public Transportation createTransportation(Transportation transportation);

	public Transportation findTransportationById(int id);

	public List<Transportation> findAllTransportation();

	public Transportation updateTransportation(Transportation transportation);

	public Transportation archiveTransportation(int id);

}
