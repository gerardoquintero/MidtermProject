package com.skilldistillery.bewitchedexcursions.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.bewitchedexcursions.entities.Address;

@Transactional
@Service
public class AddressDaoImpl {

	@PersistenceContext
	private EntityManager em;

	public Address createAddress(Address address) {
		em.persist(address);
		return address;

	}

}
