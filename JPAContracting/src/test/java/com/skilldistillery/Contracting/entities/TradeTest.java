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

class TradeTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Trade trade;
	
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
		trade = em.find(Trade.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		trade = null;
	}

	@Test
	@DisplayName("testing trade entity name mapping")
	void test1() {
		assertNotNull(trade);
		assertEquals("Full-stack consultant", trade.getName());
	}
	
	@Test
	@DisplayName("testing trade to task OneToMany mapping")
	void test2() {
		assertNotNull(trade);
		assertNotNull(trade.getTasks());
		assertTrue(trade.getTasks().size() > 0);
	}
	
	@Test
	@DisplayName("testing trade to contractor OneToMany mapping")
	void test3() {
		assertNotNull(trade);
		assertNotNull(trade.getContractors());
		assertTrue(!trade.getContractors().isEmpty());
	}
	

}
