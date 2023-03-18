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

class TransportationTypeTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private TransportationType transportationType;

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
		transportationType = em.find(TransportationType.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		transportationType = null;
	}

	@Test
	void test_transportationType_mapping() {
		assertNotNull(transportationType);
		assertEquals("Airplane", transportationType.getType());

	}
	
	@Test
	void test_transportationType_Transportation_mapping() {
		assertNotNull(transportationType);
		assertNotNull(transportationType.getTransportations().get(0).getCost());
		assertEquals("Airplane", transportationType.getType());

	}

}
