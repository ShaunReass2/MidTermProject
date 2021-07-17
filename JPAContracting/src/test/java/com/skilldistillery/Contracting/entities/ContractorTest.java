package com.skilldistillery.Contracting.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class ContractorTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Contractor contractor;
	
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
		contractor = em.find(Contractor.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		contractor = null;
	}

	@Test
	@DisplayName("testing User entity company name mapping")
	void test1() {
		assertNotNull(contractor);
		assertEquals("Sadistic Puppets' Consulting Co.", contractor.getCompanyName());
	}
	
	@Test
	@DisplayName("testing User -> trade entities, @ OneToOne trade name mapping")
	void test2() {
		assertNotNull(contractor);
		assertEquals("Full-stack consultant", contractor.getTrade().getName());
	}
	

}
