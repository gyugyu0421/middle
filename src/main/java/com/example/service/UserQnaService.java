package com.example.service;

import java.util.List;
import com.example.model.UserQnaVO;

public interface UserQnaService {
    void insertQna(UserQnaVO qna);
    List<UserQnaVO> getQnaList();
    UserQnaVO getQnaByKey(Integer qnakey);
    void updateQna(UserQnaVO qna);
    void deleteQna(Integer qnakey);
    void answerQna(UserQnaVO vo);
    List<UserQnaVO> getQnaListPaged(int start, int end);
    int getTotalQnaCount();

    List<UserQnaVO> getUserQnaList();
    UserQnaVO getUserQnaByKey(Integer qnakey);
    void insertUserQna(UserQnaVO vo);
}