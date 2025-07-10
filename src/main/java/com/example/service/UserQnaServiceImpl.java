package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.UserQnaDAO;
import com.example.model.UserQnaVO;

@Service
public class UserQnaServiceImpl implements UserQnaService {

    @Autowired
    private UserQnaDAO qnaDAO;

    @Override
    public void insertQna(UserQnaVO qna) {
        qnaDAO.insertQna(qna);
    }

    @Override
    public List<UserQnaVO> getQnaList() {
        return qnaDAO.getQnaList();
    }

    @Override
    public UserQnaVO getQnaByKey(Integer qnakey) {
        return qnaDAO.getQnaByKey(qnakey);
    }

    @Override
    public void updateQna(UserQnaVO qna) {
        qnaDAO.updateQna(qna);
    }

    @Override
    public void deleteQna(Integer qnakey) {
        qnaDAO.deleteQna(qnakey);
    }
    
    @Override
    public void answerQna(UserQnaVO vo) {
        qnaDAO.answerQna(vo);
    }
    
    @Override
    public List<UserQnaVO> getQnaListPaged(int start, int end) {
        return qnaDAO.getQnaListPaged(start, end);
    }

    @Override
    public int getTotalQnaCount() {
        return qnaDAO.getTotalQnaCount();
    }
    
    @Override
    public UserQnaVO getUserQnaByKey(Integer qnakey) {
        return qnaDAO.getUserQnaByKey(qnakey);  // qnaDAO에 해당 메서드도 있어야 함
    }

	@Override
	public List<UserQnaVO> getUserQnaList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertUserQna(UserQnaVO vo) {
		// TODO Auto-generated method stub
		
	}
}