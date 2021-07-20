package com.skilldistillery.Contracting.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.Contracting.entities.Contractor;


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

	@Override
	public List<Contractor> findAllContractors(int id) {
//		select * from contractor join trade on contractor.trade_id = trade.id WHERE trade.id = 1;
		String jpql = "SELECT c FROM Contractor c WHERE c.trade.id = :id";
		List<Contractor> contractors;
		try {
			contractors = em.createQuery(jpql, Contractor.class).setParameter("id", id).getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return contractors;
	}
}
