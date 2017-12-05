package com.ptit.itjob.service;

import com.ptit.itjob.model.Location;

public interface LocationService {
	Iterable<Location> findAll();

	Location findOne(Integer id);
}
