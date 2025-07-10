package com.example.service;

import com.example.dao.AdminResumeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminResumeServiceImpl implements AdminResumeService {

    private final AdminResumeDao resumeDao;

    @Autowired
    public AdminResumeServiceImpl(AdminResumeDao resumeDao) {
        this.resumeDao = resumeDao;
    }

    @Override
    public int getTotalResumeCount() {
        return resumeDao.getTotalResumeCount();
    }

    @Override
    public int getResumeCountByMkey(Long mkey) {
        return resumeDao.getResumeCountByMkey(mkey);
    }
}