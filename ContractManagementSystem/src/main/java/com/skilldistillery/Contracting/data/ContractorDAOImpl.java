package com.skilldistillery.Contracting.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.Contracting.entities.Contractor;
import com.skilldistillery.Contracting.entities.Trade;


@Service
@Transactional
public class ContractorDAOImpl implements ContractorDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public boolean addContractor(Contractor contractor) {
		try {
			em.persist(contractor);
			return true;
		} catch (Exception e) {
			System.out.println("stuff is broke");
			return false;
		}
	}
}
