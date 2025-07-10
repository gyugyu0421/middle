package com.example.service;

import java.util.List;
import java.util.Map;

import com.example.model.RecruitmentVO;

public interface RecruitmentService {

    List<RecruitmentVO> getAllRecruitments();
    
    void deactivateRecruit(int rckey);
    void activateRecruit(int rckey);
    
    boolean deleteRecruit(int rckey);
    
    RecruitmentVO getRecruitmentByKey(int rckey);
    
    List<RecruitmentVO> getRecentRecruitments();
    
    
    int getDomesticRecruitmentCount();              // 국내
    int getOverseasRecruitmentCount();              // 해외
    int getRegularRecruitmentCount();               // 정규직
    int getContractFreelanceRecruitmentCount();     // 계약직 + 프리랜서
    
    
    int getTotalRecruitmentCount();
    
    

}