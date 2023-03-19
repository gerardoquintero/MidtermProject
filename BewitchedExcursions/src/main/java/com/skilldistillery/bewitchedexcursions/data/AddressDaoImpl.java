package com.skilldistillery.bewitchedexcursions.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.bewitchedexcursions.entities.Address;

@Transactional
@Service
public class AddressDaoImpl implements AddressDAO{

	@PersistenceContext
	private EntityManager em;

	public Address createAddress(Address address) {
		em.persist(address);
		return address;
	}

	public Address findAddressById(int id) {
		return em.find(Address.class, id);
	} 
 
	public List<Address> findAllAddresses() {
		String query = "SELECT address FROM Address address WHERE address.enabled = 1";
		return em.createQuery(query, Address.class).getResultList();
	}

	public Address updateAddress(Address address) {
		return em.merge(address);
	}

	public Address archiveAddress(int id) {
		Address address = em.find(Address.class, id);
		if (em.contains(address)) {
			address.setEnabled(false);
		}
		return address;

	}

}
