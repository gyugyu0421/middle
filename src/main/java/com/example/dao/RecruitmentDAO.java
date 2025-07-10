package com.example.dao;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import com.example.model.RecruitmentVO;

@Mapper
public interface RecruitmentDAO {
	
	List<RecruitmentVO> getAllRecruitments(); // <- 정확히 일치

	int deactivateRecruit(int rckey);
	int activateRecruit(int rckey);
	
	int deleteRecruit(int rckey);
	
	RecruitmentVO getRecruitmentByKey(int rckey);
	
	List<RecruitmentVO> getRecentRecruitments();
	
	RecruitmentVO selectRecruitmentById(int rckey);
	
	
	
	int getDomesticRecruitmentCount();
	int getOverseasRecruitmentCount();
	int getRegularRecruitmentCount();
	int getContractFreelanceRecruitmentCount();
	
	int getTotalRecruitmentCount();
	
	int countRecentRecruitments();
	
	
    int countRecentJobPostings();    // 최근 2주 채용공고 수
    int countPreviousJobPostings();  // 이전 2주 채용공고 수
	
}
