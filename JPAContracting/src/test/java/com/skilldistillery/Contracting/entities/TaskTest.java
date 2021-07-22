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

class TaskTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Task task;
	
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
		task = em.find(Task.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		task = null;
	}

	@Test
	@DisplayName("testing Task entity mapping")
	void test() {
		assertNotNull(task);
		assertEquals(2021, task.getEndTime().getYear());
	}
	
	@Test
	@DisplayName("testing Task to Job ManyToOne entity mapping")
	void test2() {
		assertNotNull(task);
		assertEquals("Skill Distillery Midterm", task.getJob().getJobName());
	}
	
	@Test
	@DisplayName("testing Task to contractor ManyToOne entity mapping")
	void test3() {
		assertNotNull(task);
		assertNotNull(task.getContractor());
		assertEquals("Sadistic Puppets' Developers", task.getContractor().getCompanyName());
	}

}
