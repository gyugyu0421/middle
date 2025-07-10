package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.LoginDAO;
import com.example.model.MembersVO;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginDAO loginDAO;

    @Override
    public MembersVO login(String id, String pw) {
        return loginDAO.login(id, pw);
    }
}