package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.QnaDAO;
import com.example.model.QnaVO;

@Service
public class QnaServiceImpl implements QnaService {

    @Autowired
    private QnaDAO qnaDAO;

    @Override
    public List<QnaVO> getAllQna() {
        return qnaDAO.getAllQna();
    }

    @Override
    public QnaVO getQnaById(int qnakey) {
        return qnaDAO.getQnaById(qnakey);
    }

    @Override
    public boolean deleteQna(int qnakey) {
        QnaVO qna = qnaDAO.selectQnaByKey(qnakey);
        if (qna == null) {
            return false;
        }
        return qnaDAO.deleteQna(qnakey) > 0;
    }
    
    @Override
    public boolean insertAdminReply(QnaVO qna) {
        // 먼저 해당 qna가 존재하고, 아직 답변이 없는지 확인
        QnaVO original = qnaDAO.selectQnaByKey(qna.getQnakey());
        if (original == null || original.getQna_status().equals("Y")) {
            return false;
        }

        // 답변 등록
        int updated = qnaDAO.insertAdminReply(qna);
        return updated > 0;
    }
    
    
    @Override
    public int getUnansweredQnaCount() {
        return qnaDAO.getUnansweredQnaCount();
    }

    @Override
    public int getAnsweredQnaCount() {
        return qnaDAO.getAnsweredQnaCount();
    }
    
    @Override
    public List<QnaVO> getRecentQnaList() {
        return qnaDAO.getRecentQnaList();
    }
    
}