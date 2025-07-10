package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.model.QnaVO;

public interface QnaDAO {
    List<QnaVO> getAllQna();
    QnaVO getQnaById(int qnakey);
    QnaVO selectQnaByKey(int qnakey);  
    int deleteQna(int qnakey);
    int insertAdminReply(QnaVO qna);   
    
    
    int getUnansweredQnaCount();

    int getAnsweredQnaCount();
    
    List<QnaVO> getRecentQnaList();
    
    
    
}