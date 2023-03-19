package com.skilldistillery.bewitchedexcursions.data;

import java.util.List;

import com.skilldistillery.bewitchedexcursions.entities.TransportationType;

public interface TransportationTypeDAO {
	

	public TransportationType createTransportationType(TransportationType transportationType);

	public TransportationType findTransportationTypeById(int id);

	public List<TransportationType> findAllTransportationTypes();

	public TransportationType updateTransportationType(TransportationType transportationType);

	public boolean deleteTransportationType(int id);

}
