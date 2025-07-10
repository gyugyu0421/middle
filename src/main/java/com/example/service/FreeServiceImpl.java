package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.FreeDAO;
import com.example.model.FreeVO;

@Service
public class FreeServiceImpl implements FreeService {

    @Autowired
    private FreeDAO freeDAO;

    @Override
    public void insertFree(FreeVO free) {
        freeDAO.insertFree(free);
    }

    @Override
    public List<FreeVO> getFreeList() {
        return freeDAO.getFreeList();
    }

    @Override
    public FreeVO getFreeByKey(Integer fbkey) {
        return freeDAO.getFreeByKey(fbkey);
    }

    @Override
    public void updateFree(FreeVO free) {
        freeDAO.updateFree(free);
    }

    @Override
    public void deleteFree(Integer fbkey) {
        freeDAO.deleteFree(fbkey);
    }
    
    @Override
    public List<FreeVO> getListByCategory(String category) {
        return freeDAO.getListByCategory(category);
    }
    
    @Override
    public void increaseViewCount(int fbkey) {
        freeDAO.increaseViewCount(fbkey);
    }
    
    @Override
    public void increaseLikeCount(int fbkey) {
        freeDAO.increaseLikeCount(fbkey);
    }
}