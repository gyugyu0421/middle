package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.model.UserQnaVO;

public interface UserQnaDAO {
    void insertQna(UserQnaVO qna);
    List<UserQnaVO> getQnaList();         // 전체 목록
    UserQnaVO getQnaByKey(Integer qnakey);  // 특정 글 조회
    void updateQna(UserQnaVO qna);       // 수정
    void deleteQna(Integer qnakey);     // 삭제
    void answerQna(UserQnaVO vo);	//관리자 답변
    List<UserQnaVO> getQnaListPaged(@Param("start") int start, @Param("end") int end);
    int getTotalQnaCount();
    
    public UserQnaVO getUserQnaByKey(Integer qnakey);
}