package com.ptit.itjob.repository;

import org.springframework.data.repository.CrudRepository;

import com.ptit.itjob.model.Account;

public interface AccountRepository extends CrudRepository<Account, Integer> {
	Account findByEmail(String email);
}
