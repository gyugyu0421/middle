package com.example.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.RecruitmentDAO;
import com.example.model.RecruitmentVO;

@Service
public class RecruitmentServiceImpl implements RecruitmentService {

    @Autowired
    private RecruitmentDAO recruitmentDAO;
    


    @Override
    public List<RecruitmentVO> getAllRecruitments() {
        return recruitmentDAO.getAllRecruitments();
    }
    
    
    @Override
    public void deactivateRecruit(int rckey) {
        recruitmentDAO.deactivateRecruit(rckey);
    }

    @Override
    public void activateRecruit(int rckey) {
        recruitmentDAO.activateRecruit(rckey);
    }
    

    @Override
    public boolean deleteRecruit(int rckey) {
        int deleted = recruitmentDAO.deleteRecruit(rckey);
        return deleted > 0;
    }
    
    @Override
    public RecruitmentVO getRecruitmentByKey(int rckey) {
        return recruitmentDAO.getRecruitmentByKey(rckey);
    }
    
    @Override
    public List<RecruitmentVO> getRecentRecruitments() {
        return recruitmentDAO.getRecentRecruitments();
    }
    
    @Override
    public int getDomesticRecruitmentCount() {
        return recruitmentDAO.getDomesticRecruitmentCount();
    }

    @Override
    public int getOverseasRecruitmentCount() {
        return recruitmentDAO.getOverseasRecruitmentCount();
    }

    @Override
    public int getRegularRecruitmentCount() {
        return recruitmentDAO.getRegularRecruitmentCount();
    }

    @Override
    public int getContractFreelanceRecruitmentCount() {
        return recruitmentDAO.getContractFreelanceRecruitmentCount();
    }
    
    @Override
    public int getTotalRecruitmentCount() {
        return recruitmentDAO.getTotalRecruitmentCount();
    }
    
}