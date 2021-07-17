package com.skilldistillery.Contracting.entities;

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
		user = em.find(User.class, 1);
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
		assertEquals("admin", user.getUsername());
	}
	
	@Test
	@DisplayName("testing User entity password mapping")
	void test2() {
		assertNotNull(user);
		assertEquals("contractor1", user.getPassword());
	}
	
	@Test
	@DisplayName("testing User entity enabled mapping")
	void test3() {
		assertNotNull(user);
		assertTrue(user.isEnabled());
	}
	
	@Test
	@DisplayName("testing User entity mapping")
	void test4() {
		assertNotNull(user);
		assertTrue(user.getRole());
	}
	
	

}
