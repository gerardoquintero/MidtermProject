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

class TripTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Trip trip;

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
		trip = em.find(Trip.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		trip =null;
	}

	@Test
	void test_trip_mapping() {
		assertNotNull(trip);
		
		assertEquals("Jerrys Trip",trip.getName());
		assertEquals(2013,trip.getEndDate().getYear());
		assertTrue(trip.getReviews().size()>0);
		
		
		
	}

}