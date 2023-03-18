package com.skilldistillery.bewitchedexcursions.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class AddressTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Address address;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPABewitchedExcursions");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}
	

	@BeforeEach
	void setUp() throws Exception {
		em=emf.createEntityManager();
		address = em.find(Address.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		address =null;
	}

	@Test
	void test_address_mapping() {
		assertNotNull(address);
		assertEquals("Twin Peaks",address.getCity());
		
	}
	
	@Test
	void test_address_OTM_mapping() {
		assertNotNull(address);
		assertTrue(address.getUsers().size() > 0);
		assertEquals("admin", address.getUsers().get(0).getUsername());
	}

	@Test
	void test_address_OTM_activity_mapping() {
		assertNotNull(address);
		assertTrue(address.getActivities().size() > 0);
		assertEquals("Disney World", address.getActivities().get(0).getName());
	}
}
