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

class UserTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

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
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user =null;
	}

	@Test
	void test_User_mapping() {
		assertNotNull(user);
		assertEquals("admin",user.getUsername());
		
	}

	@Test
	void test_User_Trip_mapping() {
		assertNotNull(user);
		assertTrue(user.getTrip().size() > 0);
		
	}
	
	@Test
	void test_User_OTM_review_mapping() {
		assertNotNull(user);
		assertTrue(user.getReviews().size() > 0);
		assertEquals("Great Trip", user.getReviews().get(0).getComment());
		
	}

	@Test
	void test_User_OTM_tripMessage_mapping() {
		assertNotNull(user);
		assertTrue(user.getMessages().size() > 0);
		
	}
	@Test
	void test_User_OTM_address_mapping() {
		assertNotNull(user);
		assertEquals("Twin Peaks", user.getUserAddress().getCity());
		
	}
}
