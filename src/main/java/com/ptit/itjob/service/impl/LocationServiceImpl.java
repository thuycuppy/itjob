package com.ptit.itjob.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ptit.itjob.model.Location;
import com.ptit.itjob.repository.LocationRepository;
import com.ptit.itjob.service.LocationService;

@Service
public class LocationServiceImpl implements LocationService {

	@Autowired
	private LocationRepository locationRepository;
	
	@Override
	@Transactional(readOnly = true)
	public Iterable<Location> findAll() {
		return locationRepository.findAll();
	}

}
