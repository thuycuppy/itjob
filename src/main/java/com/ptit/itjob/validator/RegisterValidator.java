package com.ptit.itjob.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.ptit.itjob.dto.request.CandidateRegisterReq;
import com.ptit.itjob.model.Account;
import com.ptit.itjob.repository.AccountRepository;

@Component
public class RegisterValidator implements Validator {
	@Autowired
	private AccountRepository accountRepository;

	@Override
	public boolean supports(Class<?> cls) {
		// TODO Auto-generated method stub
		return CandidateRegisterReq.class.isAssignableFrom(cls);
	}

	@Override
	public void validate(Object o, Errors errors) {
		CandidateRegisterReq dto = (CandidateRegisterReq) o;

		// Match password
		if (!dto.getConfirmPassword().equals(dto.getPassword())) {
			errors.rejectValue("confirmPassword", "Match.registerDto.confirmPassword");
		}

		// Unique email
		Account account = accountRepository.findByEmail(dto.getEmail());
		if (account != null) {
			errors.rejectValue("email", "Unique.registerDto.email");
		}
	}

}
