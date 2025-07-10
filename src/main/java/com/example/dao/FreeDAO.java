package com.example.dao;

import java.util.List;

import com.example.model.FreeVO;

public interface FreeDAO {
	void insertFree(FreeVO free);
    List<FreeVO> getFreeList();
    List<FreeVO> getListByCategory(String category);
    FreeVO getFreeByKey(Integer fbkey);
    void updateFree(FreeVO free);
    void deleteFree(Integer fbkey);
    void increaseViewCount(int fbkey);
    void increaseLikeCount(int fbkey);
}

