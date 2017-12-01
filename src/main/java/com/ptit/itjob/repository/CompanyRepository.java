package com.ptit.itjob.repository;

import com.ptit.itjob.dto.response.CompanySearchRes;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;

import com.ptit.itjob.model.Company;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

public interface CompanyRepository extends PagingAndSortingRepository<Company, Integer> {
    @Query(value = "select c from Company c left join fetch c.jobs", countQuery = "select count(c) from Company c")
    Page<Company> findAll(Pageable pageable);

    List<CompanySearchRes> findFirst5ByNameContaining(String name);

    @Query("select c from Company c left join c.companyType left join c.location where c.id = ?1")
    Company findOneById(Integer id);
}
