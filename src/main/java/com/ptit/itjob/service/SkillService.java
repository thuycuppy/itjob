package com.ptit.itjob.service;

import com.ptit.itjob.model.Skill;

public interface SkillService {
    Iterable<Skill> findAll();

    Skill findOne(Integer id);
}
