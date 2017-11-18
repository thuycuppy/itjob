package com.ptit.itjob.repository;

import org.springframework.data.repository.CrudRepository;

import com.ptit.itjob.model.Location;

public interface LocationRepository extends CrudRepository<Location, Integer> {
}
