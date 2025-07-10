package com.example.service;

import com.example.model.MembersVO;

public interface SignupService {
	
    void insertMember(MembersVO vo);
    int getNextMkey();
    boolean checkIdExists(String id);
}