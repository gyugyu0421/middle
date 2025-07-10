package com.example.dao;

import java.util.List;

import com.example.model.AdminFreeboardVO;

public interface AdminFreeboardDAO {
	
    List<AdminFreeboardVO> getListByCategory(String fbcategory);
    List<AdminFreeboardVO> getAllList();
    
    void insertPost(AdminFreeboardVO post);
    

    List<AdminFreeboardVO> getRecentNotices();
    List<AdminFreeboardVO> getPopularPosts();
    
    int deletePost(int fbkey);
    
    AdminFreeboardVO getFreeboardDetail(int fbkey);
    
}