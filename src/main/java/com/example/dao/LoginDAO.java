package com.example.dao;

import org.apache.ibatis.annotations.Param;

import com.example.model.MembersVO;

public interface LoginDAO {
	//mybatis가 id, pw라는 이름을 인식할수 있도록 @param 추가함
	MembersVO login(@Param("id") String id, @Param("pw") String pw);
}