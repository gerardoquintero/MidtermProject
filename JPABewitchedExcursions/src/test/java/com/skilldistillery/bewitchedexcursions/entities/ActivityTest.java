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

class ActivityTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Activity activity;


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
		activity = em.find(Activity.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		activity =null;
	}

	@Test
	void test_activity_mapping() {
		assertNotNull(activity);
		assertEquals("Disney World",activity.getName());
	}
	@Test
	void test_activity_activityType_mapping() {
		assertNotNull(activity);
		//Change name maybe????
		assertEquals("Attraction",activity.getActivityType().getActivityType());
	}
	
	@Test
	void test_activity_MTO_trip_mapping() {
		assertNotNull(activity);
		assertEquals("Disney World", activity.getTripActivity().getName());
	}
	
	@Test
	void test_activity_MTO_address_trip_mapping() {
		assertNotNull(activity);
		assertEquals("USA", activity.getAddress().getCountry());
	}


}










