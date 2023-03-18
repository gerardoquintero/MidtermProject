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

class PrivateMessageTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private PrivateMessage privateMessage;

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
		privateMessage = em.find(PrivateMessage.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		privateMessage = null;
	}

	@Test
	void test_privateMessage_mapping() {
		assertNotNull(privateMessage);
		assertEquals("hi bob", privateMessage.getMessage());

	}
	

	@Test
	void test_private_User_Sender_Message_mapping() {
		assertNotNull(privateMessage);
		assertTrue(privateMessage.getSender().getSentMessages().size() > 0);
		assertEquals("hi bob", privateMessage.getSender().getSentMessages().get(0).getMessage());
		assertEquals("admin", privateMessage.getSender().getUsername());

	}
	
	@Test
	void test_private_User_Reciever_Message_mapping() {
		assertNotNull(privateMessage);
		assertTrue(privateMessage.getReciever().getSentMessages().size() > 0);
		assertEquals("hi bob", privateMessage.getReciever().getRecievedMessages().get(0).getMessage());
		assertEquals("admin", privateMessage.getReciever().getUsername());

	}

}
