package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.AdminFreeboardDAO;
import com.example.model.AdminFreeboardVO;

@Service
public class AdminFreeboardServiceImpl implements AdminFreeboardService {

    @Autowired
    private AdminFreeboardDAO adminfreeboardDAO;

    @Override
    public List<AdminFreeboardVO> getListByCategory(String fbcategory) {
        return adminfreeboardDAO.getListByCategory(fbcategory);
    }
    @Override
    public List<AdminFreeboardVO> getAllList() {
        return adminfreeboardDAO.getAllList();
    }
    @Override
    public void writePost(AdminFreeboardVO post) {
    	adminfreeboardDAO.insertPost(post);
    }
    
    @Override
    public List<AdminFreeboardVO> getRecentNotices() {
        return adminfreeboardDAO.getRecentNotices();
    }

    @Override
    public List<AdminFreeboardVO> getPopularPosts() {
        return adminfreeboardDAO.getPopularPosts();
    }
    @Override
    public int deletePost(int fbkey) {
        return adminfreeboardDAO.deletePost(fbkey);
    }
    
    @Override
    public AdminFreeboardVO getFreeboardDetail(int fbkey) {
        return adminfreeboardDAO.getFreeboardDetail(fbkey);
    }

}