package com.example.dao;

import com.example.model.MembersVO;

public interface SignupDAO {
    void insertMember(MembersVO vo);
    int getNextMkey();
    int countById(String id);  // 아이디 중복 확인
}