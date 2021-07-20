package com.skilldistillery.Contracting.data;

import java.util.List;

import com.skilldistillery.Contracting.entities.Trade;

public interface TradeDAO {
	Trade findTradeById(int id);

	List<Trade> findAllTrades();

}
