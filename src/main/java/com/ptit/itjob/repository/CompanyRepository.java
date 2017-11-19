package com.ptit.itjob.repository;

import com.ptit.itjob.dto.response.CompanyDetailDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;

import com.ptit.itjob.model.Company;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface CompanyRepository extends PagingAndSortingRepository<Company, Integer> {
    @Query(value = "select c from Company c left join fetch c.jobs", countQuery = "select count(c) from Company c")
    Page<Company> findAll(Pageable pageable);

    @Query("select c.id, c.companyType.name, c.name, c.quantity, c.website, c.address, c.logo, c.description, c.phone " +
           "from Company c left join c.companyType where c.id = ?1")
    CompanyDetailDto findOneById(Integer id);
}
