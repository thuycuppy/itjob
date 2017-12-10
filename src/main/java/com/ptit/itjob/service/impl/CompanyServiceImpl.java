package com.ptit.itjob.service.impl;

import com.ptit.itjob.common.Constant;
import com.ptit.itjob.common.FileUtil;
import com.ptit.itjob.common.Session;
import com.ptit.itjob.dto.request.CompanyRegisterReq;
import com.ptit.itjob.dto.response.CompanyDetailRes;
import com.ptit.itjob.dto.response.CompanyListRes;
import com.ptit.itjob.dto.response.CompanySearchRes;
import com.ptit.itjob.model.Account;
import com.ptit.itjob.model.Company;
import com.ptit.itjob.repository.AccountRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ptit.itjob.repository.CompanyRepository;
import com.ptit.itjob.service.CompanyService;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyService {
    private CompanyRepository companyRepository;
    private AccountRepository accountRepository;
    private Session session;
    private ModelMapper modelMapper;
    private PasswordEncoder passwordEncoder;

    @Autowired
    public CompanyServiceImpl(CompanyRepository companyRepository, AccountRepository accountRepository, Session session, ModelMapper modelMapper, PasswordEncoder passwordEncoder) {
        this.companyRepository = companyRepository;
        this.accountRepository = accountRepository;
        this.session = session;
        this.modelMapper = modelMapper;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    @Transactional(readOnly = true)
    public Page<CompanyListRes> findTop() {
        PageRequest pageRequest = new PageRequest(0, Constant.COMPANY_HOME, new Sort(Sort.Direction.DESC, "jobs.size"));
        Page<Company> companies = companyRepository.findAll(pageRequest);
        return companies.map(this::convertToCompanyListDto);
    }

    @Override
    @Transactional(readOnly = true)
    public Page<CompanyListRes> findAll(Integer page) {
        PageRequest pageRequest = new PageRequest(page, Constant.COMPANY_PER_PAGE);
        Page<Company> companies = companyRepository.findAll(pageRequest);
        return companies.map(this::convertToCompanyListDto);
    }

    @Override
    @Transactional(readOnly = true)
    public List<CompanySearchRes> findByName(String name) {
        return companyRepository.findFirst5ByNameContaining(name);
    }

    @Override
    @Transactional(readOnly = true)
    public Company findCurrent() {
        return session.getCurrentCompany();
    }

    @Override
    @Transactional(readOnly = true)
    public CompanyDetailRes findById(Integer id) {
        return convertToCompanyDetailDto(companyRepository.findOneById(id));
    }

    @Override
    @Transactional
    public void create(CompanyRegisterReq registerDto, MultipartFile resume) {
        // Upload logo
        String fileName = FileUtil.upload(resume, Constant.UPLOAD_COMPANY_LOGO_DIRECTORY);
        String filePath = Constant.UPLOAD_COMPANY_LOGO_PATH + fileName;

        // Insert into account table
        Account account = new Account();
        account.setName(registerDto.getName());
        account.setEmail(registerDto.getEmail());
        account.setPassword(passwordEncoder.encode(registerDto.getPassword()));
        account.setImage(filePath);
        account.setRole(Constant.ROLE_COMPANY);
        accountRepository.save(account);

        // Insert into company table
        Company company = modelMapper.map(registerDto, Company.class);
        company.setLogo(filePath);
        company.setAccount(account);
        companyRepository.save(company);
    }

    private CompanyListRes convertToCompanyListDto(Company company) {
        CompanyListRes dto = modelMapper.map(company, CompanyListRes.class);
        dto.setTotalJobs(company.getJobs().size());
        return dto;
    }

    private CompanyDetailRes convertToCompanyDetailDto(Company company) {
        CompanyDetailRes dto = modelMapper.map(company, CompanyDetailRes.class);
        dto.setCompanyType(company.getCompanyType().getName());
        dto.setLocation(company.getLocation().getName());
        return dto;
    }
}
