package com.skilldistillery.Contracting.data;

import java.util.List;

import com.skilldistillery.Contracting.entities.Contractor;

public interface ContractorDAO {
	boolean addContractor(Contractor contractor);
	
	List<Contractor> findAllContractors(int id);
}
