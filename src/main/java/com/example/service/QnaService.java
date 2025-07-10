package com.example.service;

import java.util.List;

import com.example.model.QnaVO;

public interface QnaService {
    List<QnaVO> getAllQna();
    QnaVO getQnaById(int qnakey);
    
    boolean insertAdminReply(QnaVO qna);
    boolean deleteQna(int qnakey);
    
    
    int getUnansweredQnaCount();
    int getAnsweredQnaCount();
    
    List<QnaVO> getRecentQnaList();

}
