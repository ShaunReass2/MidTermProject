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

class JobTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Job job;
	
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
		job = em.find(Job.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		job = null;
	}

	@Test
	@DisplayName("testing Job entity mapping")
	void test() {
		assertNotNull(job);
		assertEquals("Skill Distillery Midterm", job.getJobName());
	}
	
	@Test
	@DisplayName("testing Job to User ManyToOne mapping")
	void test2() {
		assertNotNull(job);
		assertEquals("admin", job.getUser().getUsername());
	}
	
	@Test
	@DisplayName("testing Job to Message OneToMany mapping")
	void test3() {
		assertNotNull(job);
		assertEquals("Always be coding!", job.getMessages().get(0).getMessageBody());
	}
	
	@Test
	@DisplayName("testing Job to Task OneToMany mapping")
	void test4() {
		assertNotNull(job);
		assertTrue(!job.getTasks().isEmpty());
		assertEquals("Trello board", job.getTasks().get(0).getTaskName());
	}

}
