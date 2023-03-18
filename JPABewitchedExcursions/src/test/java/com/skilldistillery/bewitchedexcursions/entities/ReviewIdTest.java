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

class ReviewIdTest {
	

		private static EntityManagerFactory emf;
		private EntityManager em;
		private ReviewId reviewid;
		
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
			ReviewId rid = new ReviewId();
			rid.getUserId();
			reviewid = em.find(ReviewId.class, rid);
			

		}
		
		@AfterEach
		void tearDown() throws Exception {
			em.close();
			reviewid =null;
		}
		@Test
		void test_reviewId_mapping() {
			assertNotNull(reviewid);
	
			
		}
		

	}
	
	
	
	
//	
//	
//	
//	private static EntityManagerFactory emf;
//	private EntityManager em;
//	private ReviewId reviewId;
//
//	@BeforeAll
//	static void setUpBeforeClass() throws Exception {
//		emf = Persistence.createEntityManagerFactory("JPABewitchedExcursions");
//	}
//
//	@AfterAll
//	static void tearDownAfterClass() throws Exception {
//		emf.close();
//	}
//	
//
//	@BeforeEach
//	void setUp() throws Exception {
//		em=emf.createEntityManager();
//		reviewId = em.find(ReviewId.class, 1);
//	}
//
//	@AfterEach
//	void tearDown() throws Exception {
//		em.close();
//		reviewId =null;
//	}
//
//	@Test
//	void test_reviewId_mapping() {
//		assertNotNull(reviewId);
//		assertEquals("Disney World",reviewId);
//		
//	}
//
//}
