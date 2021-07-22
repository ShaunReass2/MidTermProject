package com.skilldistillery.Contracting.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class UserTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAContracting");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		user = em.find(User.class, 2);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	@DisplayName("testing User entity username mapping")
	void test1() {
		assertNotNull(user);
		assertEquals("carpenter1", user.getUsername());
	}
	
	@Test
	@DisplayName("testing User entity password mapping")
	void test2() {
		assertNotNull(user);
		assertEquals("b", user.getPassword());
	}
	
	@Test
	@DisplayName("testing User entity enabled mapping")
	void test3() {
		assertNotNull(user);
		assertTrue(user.isEnabled());
	}
	
	@Test
	@DisplayName("testing User entity role mapping")
	void test4() {
		assertNotNull(user);
		assertFalse(user.getRole());
	}
	
	@Test
	@DisplayName("testing User to -> contractor, OneToMany mapping")
	void test5() {
		assertNotNull(user);
		assertNotNull(user.getContractors());
		assertTrue(user.getContractors().size() > 0);
	}
	
	@Test
	@DisplayName("testing User to -> messages, OneToMany mapping")
	void test6() {
		assertNotNull(user);
		assertTrue(user.getMessages().isEmpty());
	}
	
	@Test
	@DisplayName("testing User to -> Job, OneToMany mapping")
	void test7() {
		User user1 = em.find(User.class, 1);
		assertNotNull(user1);
		assertTrue(user1.getJobs().isEmpty());
		user1 = null;
	}
	
	

}
