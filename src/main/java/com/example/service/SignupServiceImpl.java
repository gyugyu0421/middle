package com.example.service;

import com.example.dao.SignupDAO;
import com.example.model.MembersVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SignupServiceImpl implements SignupService {

    @Autowired
    private SignupDAO signupDAO;

    @Override
    public void insertMember(MembersVO vo) {
        signupDAO.insertMember(vo);
    }

    @Override
    public int getNextMkey() {
        return signupDAO.getNextMkey();
    }
    
    @Override
    public boolean checkIdExists(String id) {
        return signupDAO.countById(id) > 0;
    }
}