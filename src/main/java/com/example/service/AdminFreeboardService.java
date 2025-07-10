package com.example.service;

import java.util.List;

import com.example.model.AdminFreeboardVO;

public interface AdminFreeboardService {
    List<AdminFreeboardVO> getListByCategory(String fbcategory);

    List<AdminFreeboardVO> getAllList();
    
    void writePost(AdminFreeboardVO post);

    
    List<AdminFreeboardVO> getRecentNotices();
    List<AdminFreeboardVO> getPopularPosts();
    
    int deletePost(int fbkey);
    
    
    AdminFreeboardVO getFreeboardDetail(int fbkey);
    
    
}

