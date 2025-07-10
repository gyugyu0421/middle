package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.model.FaqVO;

@Mapper
public interface FaqDAO {
    List<FaqVO> getAllFaqs();
    FaqVO findByQuestion(String question); // 완전 일치 검색
}