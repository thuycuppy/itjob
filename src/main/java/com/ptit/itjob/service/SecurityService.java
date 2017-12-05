package com.ptit.itjob.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface SecurityService {
    void logout(HttpServletRequest request, HttpServletResponse response);
}
