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

class ActivityTypeTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private ActivityType activityType;

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
		activityType = em.find(ActivityType.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		activityType = null;
	}

	@Test
	void test_activityType_mapping() {
		assertNotNull(activityType);
		assertEquals("Attraction", activityType.getActivityType());

	}
	@Test
	void test_activityType_activity_mapping() {
		assertNotNull(activityType.getActivity());
		assertEquals("Disney World",activityType.getActivity().get(0).getName());
		
	}

}
