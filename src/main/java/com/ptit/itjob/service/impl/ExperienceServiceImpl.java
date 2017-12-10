package com.ptit.itjob.service.impl;

import com.ptit.itjob.model.Experience;
import com.ptit.itjob.repository.ExperienceRepository;
import com.ptit.itjob.service.ExperienceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExperienceServiceImpl implements ExperienceService {
    private ExperienceRepository experienceRepository;

    @Autowired
    public ExperienceServiceImpl(ExperienceRepository experienceRepository) {
        this.experienceRepository = experienceRepository;
    }

    @Override
    public Iterable<Experience> findAll() {
        return experienceRepository.findAll();
    }

    @Override
    public Experience findOne(Integer id) {
        return experienceRepository.findOne(id);
    }
}
