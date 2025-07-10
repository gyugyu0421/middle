package com.example.service;

import java.util.List;
import com.example.model.FreeVO;

public interface FreeService {
    void insertFree(FreeVO free);
    List<FreeVO> getFreeList();
    List<FreeVO> getListByCategory(String category); //카테고리 맞게 나오게하기
    FreeVO getFreeByKey(Integer fbkey);
    void updateFree(FreeVO free);
    void deleteFree(Integer fbkey);
    void increaseViewCount(int fbkey);
    void increaseLikeCount(int fbkey);
}