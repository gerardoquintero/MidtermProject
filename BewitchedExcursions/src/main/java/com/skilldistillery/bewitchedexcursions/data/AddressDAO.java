package com.skilldistillery.bewitchedexcursions.data;

import java.util.List;

import com.skilldistillery.bewitchedexcursions.entities.Address;

public interface AddressDAO {
	
	public Address createAddress(Address address);
	
	public Address findAddressById(int id);
	
	public List<Address> findAllAddresses();
	
	public Address updateAddress(Address address);
	
	public Address archiveAddress(int id);

}
