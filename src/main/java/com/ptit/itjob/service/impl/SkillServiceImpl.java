package com.ptit.itjob.service.impl;

import com.ptit.itjob.model.Skill;
import com.ptit.itjob.repository.SkillRepository;
import com.ptit.itjob.service.SkillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SkillServiceImpl implements SkillService {
    private SkillRepository skillRepository;

    @Autowired
    public SkillServiceImpl(SkillRepository skillRepository) {
        this.skillRepository = skillRepository;
    }

    @Override
    public Iterable<Skill> findAll() {
        return skillRepository.findAll();
    }

    @Override
    public Skill findOne(Integer id) {
        return skillRepository.findOne(id);
    }
}
