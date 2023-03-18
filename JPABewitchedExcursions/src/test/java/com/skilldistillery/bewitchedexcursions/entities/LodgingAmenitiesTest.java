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

class LodgingAmenitiesTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private LodgingAmenities lodgingAmenities;

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
		lodgingAmenities = em.find(LodgingAmenities.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		lodgingAmenities = null;
	}

	@Test
	void test_lodgingAmenities_mapping() {
		assertNotNull(lodgingAmenities);
		assertEquals("pool", lodgingAmenities.getName());

	}

}
