package com.ptit.itjob.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;

import com.ptit.itjob.model.Company;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface CompanyRepository extends PagingAndSortingRepository<Company, Integer> {
    @Query(value = "select c from Company c left join fetch c.jobs", countQuery = "select count(c) from Company c")
    Page<Company> findAll(Pageable pageable);

    @Query(value = "select c from Company c left join fetch c.jobs where c.name like ?1",
            countQuery = "select count(c) from Company c where c.name like ?1")
    Page<Company> findByName(String name, Pageable pageable);

    @Query("select c from Company c left join c.companyType left join c.location where c.id = ?1")
    Company findOneById(Integer id);
}
