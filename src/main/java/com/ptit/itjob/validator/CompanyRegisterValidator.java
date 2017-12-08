package com.ptit.itjob.validator;

import com.ptit.itjob.dto.request.CompanyRegisterReq;
import com.ptit.itjob.model.Company;
import com.ptit.itjob.repository.CompanyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.ptit.itjob.model.Account;
import com.ptit.itjob.repository.AccountRepository;

@Component
public class CompanyRegisterValidator implements Validator {
    private AccountRepository accountRepository;
    private CompanyRepository companyRepository;

    @Autowired
    public CompanyRegisterValidator(AccountRepository accountRepository, CompanyRepository companyRepository) {
        this.accountRepository = accountRepository;
        this.companyRepository = companyRepository;
    }

    @Override
    public boolean supports(Class<?> cls) {
        // TODO Auto-generated method stub
        return CompanyRegisterReq.class.isAssignableFrom(cls);
    }

    @Override
    public void validate(Object o, Errors errors) {
        CompanyRegisterReq dto = (CompanyRegisterReq) o;

        // Unique name
        Company company = companyRepository.findByName(dto.getName());
        if (company != null) {
            errors.rejectValue("name", "Unique.registerDto.name");
        }

        // Unique email
        Account account = accountRepository.findByEmail(dto.getEmail());
        if (account != null) {
            errors.rejectValue("email", "Unique.registerDto.email");
        }

        // Match password
        if (!dto.getConfirmPassword().equals(dto.getPassword())) {
            errors.rejectValue("confirmPassword", "Match.registerDto.confirmPassword");
        }
    }

}
