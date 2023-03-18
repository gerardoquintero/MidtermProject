package com.skilldistillery.bewitchedexcursions.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class TransportationTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Transportation transportation;

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
		transportation = em.find(Transportation.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		transportation =null;
	}

	@Test
	void test_Transportation_mapping() {
		assertNotNull(transportation);
		assertEquals(65,transportation.getCost());
		
	}

}
