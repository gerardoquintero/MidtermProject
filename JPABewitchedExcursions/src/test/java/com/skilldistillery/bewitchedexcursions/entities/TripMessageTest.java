package com.skilldistillery.bewitchedexcursions.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class TripMessageTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private TripMessage tripMessage;

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
		em = emf.createEntityManager();
		tripMessage = em.find(TripMessage.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		tripMessage = null;
	}

	@Test
	void test_tripMessage_mapping() {
		assertNotNull(tripMessage);
		assertEquals("hi", tripMessage.getMessage());

	}
	

	@Test
	void test_trip_OTM_user_tripMessages_mapping() {
		assertNotNull(tripMessage);
		assertNotNull(tripMessage.getUser());
		assertEquals("admin", tripMessage.getUser().getUsername());
	}
	
	@Test
	void test_trip_MTO_tripMessages_mapping() {
		assertNotNull(tripMessage);
		assertNotNull(tripMessage.getMessage());
		assertEquals("admin", tripMessage.getUser().getUsername());
	}

}
