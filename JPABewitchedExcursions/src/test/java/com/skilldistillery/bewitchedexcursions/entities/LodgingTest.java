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

class LodgingTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Lodging lodging;

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
		lodging = em.find(Lodging.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		lodging =null;
	}

	@Test
	void test_lodging_mapping() {
		assertNotNull(lodging);
		assertEquals("marriott",lodging.getName());
		
		
	}
	@Test
	void test_lodging_lodgingAmenities_mapping() {
		assertNotNull(lodging.getLodgingAmenities());
		assertTrue(lodging.getLodgingAmenities().size()>0);
		assertEquals("pool",lodging.getLodgingAmenities().get(0).getName());
	
		
		
	}

}
