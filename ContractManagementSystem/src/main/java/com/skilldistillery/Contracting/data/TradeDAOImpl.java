package com.skilldistillery.Contracting.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.Contracting.entities.Contractor;
import com.skilldistillery.Contracting.entities.Trade;

@Service
@Transactional
public class TradeDAOImpl implements TradeDAO {
	
	@PersistenceContext
	EntityManager em;

	@Override
	public Trade findTradeById(int id) {
		return em.find(Trade.class, id);
	}

	@Override
	public List<Trade> findAllTrades() {
		String jpql = "SELECT t FROM Trade t";
		List<Trade> trades = em.createQuery(jpql, Trade.class).getResultList();
		return trades;
	}


}
