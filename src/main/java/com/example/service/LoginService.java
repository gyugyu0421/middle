package com.example.service;

import com.example.model.MembersVO;

public interface LoginService {
    MembersVO login(String id, String pw);
}